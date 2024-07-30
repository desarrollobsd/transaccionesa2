unit cifrado;

interface

uses
  SysUtils, Classes;

const
  DEFAULT_KBBUFFER = 10240;

type
  EUknowAlgorithmException = class( Exception );
  TOnWork = procedure( sender : TObject; progress : int64 ) of object;
  THashAlgorithm = ( haMD5, haSHA1, haSHA256, haSHA384, haSHA512, haUnknow );
  TOnWorkBegin = procedure( sender : TObject; maxProgress : int64 ) of object;

type
  TCipher = class( TObject )
  private
    FAbort: boolean;
    FOnWork: TOnWork;
    FWorking: boolean;
    FKBBuffer: integer;
    FOnAbort: TNotifyEvent;
    FOnError: TNotifyEvent;
    FOnWorkEnd: TNotifyEvent;
    FOnWorkBegin: TOnWorkBegin;
  private
    procedure SetKBBuffer( value : integer );
    procedure DoCryptDecryptStream( source, target: TStream;
     password : string; algorithm : THashAlgorithm; toCrypt : boolean );
  public
    procedure Abort();
    constructor Create();
  public
    function EncryptString( const str, password : string; algorithm : THashAlgorithm ) : string;
    function DecryptString( const str, password : string; algorithm : THashAlgorithm ) : string;
    procedure EncryptStream( source, target : TStream; password : string; algorithm : THashAlgorithm );
    procedure DecryptStream( source, target : TStream; password : string; algorithm : THashAlgorithm );
    procedure EncryptFile( const sourcePath, targetPath, password : string; algorithm : THashAlgorithm );
    procedure DecryptFile( const sourcePath, targetPath, password : string; algorithm : THashAlgorithm );
  public
    property Working: boolean read FWorking;
    property OnWork: TOnWork read FOnWork write FOnWork;
    property OnAbort: TNotifyEvent read FOnAbort write FOnAbort;
    property OnError : TNotifyEvent read FOnError write FOnError;
    property OnWorkEnd: TNotifyEvent read FOnWorkEnd write FOnWorkEnd;
    property OnWorkBegin: TOnWorkBegin read FOnWorkBegin write FOnWorkBegin;
    property KBBuffer: integer read FKBBuffer write SetKbBuffer default DEFAULT_KBBUFFER;
  end;

implementation

uses
  Windows;

type
  ALG_ID = ULONG;
  HCRYPTKEY = ULONG;
  HCRYPTHASH = ULONG;
  HCRYPTPROV = ULONG;
  LPAWSTR = PAnsiChar;
  PHCRYPTKEY = ^HCRYPTKEY;
  PHCRYPTPROV = ^HCRYPTPROV;
  PHCRYPTHASH = ^HCRYPTHASH;

const
  PROV_RSA_AES = 24;
  CALG_RC4 = $6801;
  HP_HASHVAL = $0002;
  HP_HASHSIZE = $0004;
  CALG_MD5 = $00008003;
  CALG_MD4 = $00008002;
  CALG_SHA1  = $00008004;
  CALG_SHA_256 = $0000800c;
  CALG_SHA_384 = $0000800d;
  CALG_SHA_512 = $0000800e;
  CRYPT_NEWKEYSET = $00000008;
  CRYPT_VERIFYCONTEXT  = $F0000000;

function CryptAcquireContext
(
  phProv : PHCRYPTPROV;
  pszContainer : LPAWSTR;
  pszProvider : LPAWSTR;
  dwProvType : DWORD;
  dwFlags : DWORD
) : BOOL; stdcall;
external ADVAPI32 name 'CryptAcquireContextA';

function CryptCreateHash
(
  hProv: HCRYPTPROV;
  Algid: ALG_ID;
  hKey: HCRYPTKEY;
  dwFlags: DWORD;
  phHash: PHCRYPTHASH
) : BOOL; stdcall;
external ADVAPI32 name 'CryptCreateHash';

function CryptHashData
(
  hHash : HCRYPTHASH;
  const pbData : PBYTE;
  dwDataLen : DWORD;
  dwFlags : DWORD
) : BOOL; stdcall;
external ADVAPI32 name 'CryptHashData';

function CryptGetHashParam
(
  hHash : HCRYPTHASH;
  dwParam : DWORD;
  pbData : PBYTE;
  pdwDataLen : PDWORD;
  dwFlags : DWORD
) : BOOL; stdcall;
external ADVAPI32 name 'CryptGetHashParam';

function CryptDestroyHash
(
  hHash : HCRYPTHASH
) : BOOL; stdcall;
external ADVAPI32 name 'CryptDestroyHash';

function CryptReleaseContext
(
  hProv : HCRYPTPROV;
  dwFlags : DWORD
) : BOOL; stdcall;
external ADVAPI32 name 'CryptReleaseContext';

function CryptDeriveKey
(
  hProv : HCRYPTPROV;
  Algid : ALG_ID;
  hBaseData : HCRYPTHASH;
  dwFlags : DWORD;
  phKey : PHCRYPTKEY
) : BOOL; stdcall ;
external ADVAPI32 name 'CryptDeriveKey';

function CryptEncrypt
(
  hKey : HCRYPTKEY;
  hHash : HCRYPTHASH;
  Final : BOOL;
  dwFlags : DWORD;
  pbData : PBYTE;
  pdwDataLen : PDWORD;
  dwBufLen : DWORD
) : BOOL; stdcall;
external ADVAPI32 name 'CryptEncrypt';

function CryptDecrypt
(
  hKey : HCRYPTKEY;
  hHash : HCRYPTHASH;
  Final : BOOL;
  dwFlags : DWORD;
  pbData : PBYTE;
  pdwDataLen : PDWORD
) : BOOL; stdcall;
external ADVAPI32 name 'CryptDecrypt';

{ TCipher }

constructor TCipher.Create();
begin
  inherited Create();
  FAbort := false;
  FWorking := false;
  FKBBuffer := DEFAULT_KBBUFFER;
end;

procedure TCipher.Abort();
begin
  FAbort := true;
  FWorking := false;
end;

procedure TCipher.SetKBBuffer( value : integer );
begin
  if value <> FKBBuffer then
  begin
    if value >= 0 then
      FKBBuffer := value
    else
      FKBBuffer := DEFAULT_KBBUFFER;
  end;
end;

procedure TCipher.EncryptFile(const sourcePath, targetPath, password: string; algorithm : THashAlgorithm );
var
  source, target : TFileStream;
begin
  if FileExists( sourcePath ) then
  begin
    source := TFileStream.Create( sourcePath, fmOpenRead );
    target := TFileStream.Create( targetPath, fmCreate );
    try
      DoCryptDecryptStream( source, target, password, algorithm, true );
    finally
      source.Free();
      target.Free();
    end;
  end;
end;

procedure TCipher.DecryptFile(const sourcePath, targetPath, password: string; algorithm : THashAlgorithm);
var
  source, target : TFileStream;
begin
  if FileExists( sourcePath ) then
  begin
    source := TFileStream.Create( sourcePath, fmOpenRead );
    target := TFileStream.Create( targetPath, fmCreate );
    try
      DoCryptDecryptStream( source, target, password, algorithm, false );
    finally
      source.Free();
      target.Free();
    end;
  end;
end;

procedure TCipher.EncryptStream( source, target : TStream; password : string; algorithm : THashAlgorithm );
begin
  DoCryptDecryptStream( source, target, password, algorithm, true );
end;

procedure TCipher.DecryptStream( source, target : TStream; password : string; algorithm : THashAlgorithm );
begin
  DoCryptDecryptStream( source, target, password, algorithm, false );
end;

function TCipher.EncryptString(const str, password: string; algorithm : THashAlgorithm ): string;
var
  source, target : TStringStream;
begin
  result := '';

  source := TStringStream.Create( str );
  target := TStringStream.Create( '' );
  try
    DoCryptDecryptStream( source, target, password, algorithm, true );
    result := target.DataString;
  finally
    source.Free();
    target.Free();
  end;
end;

function TCipher.DecryptString(const str, password: string; algorithm : THashAlgorithm ): string;
var
  source, target : TStringStream;
begin
  result := '';

  source := TStringStream.Create( str );
  target := TStringStream.Create( '' );
  try
    DoCryptDecryptStream( source, target, password, algorithm, false );
    result := target.DataString;
  finally
    source.Free();
    target.Free();
  end;
end;

procedure TCipher.DoCryptDecryptStream( source, target: TStream;
 password : string; algorithm : THashAlgorithm; toCrypt : boolean );
var
  buffer : PByte;
  key : HCRYPTKEY;
  bytesRead : dWord;
  hashAlgId : ALG_ID;
  readPosition : longint;
  hProvider : HCRYPTPROV;
  hashAddress : HCRYPTHASH;
  successQuery, endOfStream : boolean;
begin
  successQuery := CryptAcquireContext
  (
    @hProvider,
    nil,
    nil,
    PROV_RSA_AES, CRYPT_VERIFYCONTEXT
  );

  if not successQuery then
  begin
    if GetLastError() = DWORD( NTE_BAD_KEYSET ) then
    begin
      successQuery := CryptAcquireContext
      (
        @hProvider,
        nil,
        nil,
        PROV_RSA_AES,
        CRYPT_NEWKEYSET
      );
    end;
  end;

  if successQuery then
  begin

    case algorithm of
      haMD5 : hashAlgId := CALG_MD5;
      haSHA1 : hashAlgId := CALG_SHA1;
      haSHA256 : hashAlgId := CALG_SHA_256;
      haSHA384 : hashAlgId := CALG_SHA_384;
      haSHA512 : hashAlgId := CALG_SHA_512;
    else
      raise EUknowAlgorithmException.Create( 'Unknow hash algorithm' );
    end;

    if CryptCreateHash( hProvider, hashAlgId, 0, 0, @hashAddress ) then
    begin
      FAbort := false;
      FWorking := true;
      readPosition := 0;

      if Assigned(FOnWorkBegin) then
        FOnWorkBegin( self, source.Size);

      if CryptHashData( hashAddress, @password[ 1 ], Length( password ), 0 ) then
      begin
        if CryptDeriveKey( hProvider, CALG_RC4, hashAddress, 0, @key ) then
        begin
          CryptDestroyHash( hashAddress );

          GetMem( buffer, FKBBuffer );

          repeat
            endOfStream := source.Position >= source.Size;

            if not endOfStream then
            begin
              bytesRead := source.Read( buffer^, FKBBuffer );

              Inc( readPosition, bytesRead );

              if toCrypt then
                CryptEncrypt( key, 0, endOfStream, 0, buffer, @bytesRead, bytesRead )
              else
                CryptDecrypt( key, 0, endOfStream, 0, buffer, @bytesRead );

              target.Write( buffer^, bytesRead );

              if Assigned( FOnWork ) then
                FOnWork( self, readPosition );
            end;

          until FAbort or endOfStream;

          FreeMem( buffer, FKBBuffer );

          if FAbort then
          begin
            if Assigned( FOnAbort )
              then FOnAbort( Self );
          end;

        end
    else
    begin
          if Assigned( FOnError ) then
            FOnError( self );
    end;
      end;
    end
  else
  begin
      if Assigned( FOnError ) then
        FOnError( self );
  end;

    CryptReleaseContext( hProvider, 0 );
  end
  else
  begin
    if Assigned( FOnError ) then
      FOnError( self );
  end;

  FWorking := false;

  if not FAbort and Assigned( FOnWorkEnd ) then
    FOnWorkEnd( self );
end;

end.
