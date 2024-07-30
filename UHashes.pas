unit UHashes;

interface

uses
  SysUtils, Classes;

const
  DEFAULT_KBBUFFER = 10240;

type
  EUknowAlgorithmException = class( Exception );
  THashAlgorithm = ( haMD5, haSHA1, haSHA256, haSHA384, haSHA512, haUnknow );
  TOnWork = procedure( sender : TObject; progress : int64 ) of object;
  TOnWorkBegin = procedure( sender : TObject; maxProgress : int64 ) of object;

type
  THashes = class( TObject )
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
  public
    procedure Abort();
    constructor Create();
    function CalcStringHash( str: string; algorithm : THashAlgorithm ) : string;
    function CalcFileHash( filePath : string; algorithm : THashAlgorithm ) : string;
    function CalcStreamHash( stream: TStream; algorithm : THashAlgorithm ) : string;
  public
    property Working: boolean read FWorking;
  public
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
  HP_HASHVAL = $0002;
  HP_HASHSIZE = $0004;
  CALG_MD5 = $00008003;
  CALG_MD4 = $00008002;
  CALG_SHA1  = $00008004;
  CALG_SHA_256 = $0000800c;
  CALG_SHA_384 = $0000800d;
  CALG_SHA_512 = $0000800e;
  CRYPT_NEWKEYSET = $00000008;

function CryptAcquireContext(
    phProv: PHCRYPTPROV;
    pszContainer: LPAWSTR;
    pszProvider: LPAWSTR;
    dwProvType: DWORD;
    dwFlags: DWORD
  ): BOOL; stdcall;
  external ADVAPI32 name 'CryptAcquireContextA';

function CryptCreateHash(
    hProv: HCRYPTPROV;
    Algid: ALG_ID;
    hKey: HCRYPTKEY;
    dwFlags: DWORD;
    phHash: PHCRYPTHASH
  ): BOOL; stdcall;
  external ADVAPI32 name 'CryptCreateHash';

function CryptHashData(
    hHash: HCRYPTHASH;
    const pbData: PBYTE;
    dwDataLen: DWORD;
    dwFlags: DWORD
  ): BOOL; stdcall;
  external ADVAPI32 name 'CryptHashData';

function CryptGetHashParam(
    hHash: HCRYPTHASH;
    dwParam: DWORD;
    pbData: PBYTE;
    pdwDataLen: PDWORD;
    dwFlags: DWORD
  ): BOOL; stdcall;
  external ADVAPI32 name 'CryptGetHashParam';

function CryptDestroyHash(
    hHash: HCRYPTHASH
  ): BOOL; stdcall;
  external ADVAPI32 name 'CryptDestroyHash';

function CryptReleaseContext(
    hProv: HCRYPTPROV;
    dwFlags: DWORD
  ): BOOL; stdcall;
  external ADVAPI32 name 'CryptReleaseContext';

{ THashes }

constructor THashes.Create();
begin
  inherited Create();
  FAbort := false;
  FWorking := false;
  FKBBuffer := DEFAULT_KBBUFFER;
end;

procedure THashes.Abort();
begin
  FAbort := true;
  FWorking := false;
end;

procedure THashes.SetKBBuffer( value : integer );
begin
  if value <> FKBBuffer then
  begin
    if value >= 0 then
      FKBBuffer := value
    else
      FKBBuffer := DEFAULT_KBBUFFER;
  end;
end;

function THashes.CalcStringHash( str: string; algorithm : THashAlgorithm ) : string;
var
  stream : TStringStream;
begin
  FAbort := false;
  FWorking := true;
  result := EmptyStr;
  stream := TStringStream.Create( str );
  try
    result := CalcStreamHash( stream, algorithm );
  finally
    stream.Free();
  end;
end;

function THashes.CalcFileHash( filePath : string; algorithm : THashAlgorithm ) : string;
var
  stream : TFileStream;
begin
  FAbort := false;
  FWorking := true;
  result := EmptyStr;
  if FileExists( filePath ) then
  begin
    stream:= TFileStream.Create( filePath, fmOpenRead or fmShareDenyWrite );
    try
      result:= CalcStreamHash( stream, algorithm );
    finally
      stream.Free();
    end;
  end;
end;

{
  I get crazy with dinamyc array of byte, so I second the solution
  found at http://ktop.no-ip.org/topic.asp?TOPIC_ID=75388, that work
  like a charm.
}
function THashes.CalcStreamHash( stream: TStream; algorithm : THashAlgorithm ) : string;
var
  i: integer;
  hashLen : DWORD;
  bytesRead: DWORD;
  hashAlgId: ALG_ID;
  readBuffer: PByte;
  successQuery: BOOL;
  hashLenSize : DWORD;
  readPosition: int64;
  hProvider: HCRYPTPROV;
  hashAddress: HCRYPTHASH;
  hashDataPointer: ^ShortInt;
  hashBytesArray : array of Byte;
begin
  FAbort := false;
  FWorking := true;
  readPosition := 0;
  result:= EmptyStr;
  hashDataPointer := nil;
  hashLenSize := SizeOf( DWORD );

  successQuery := CryptAcquireContext( @hProvider, nil, nil, PROV_RSA_AES, 0 );

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
      raise EUknowAlgorithmException.Create( 'Unknow algorithm' );
    end;

    if CryptCreateHash( hProvider, hashAlgId, 0, 0, @hashAddress ) then
    begin

      if Assigned(FOnWorkBegin) then
        FOnWorkBegin(self, stream.Size);

      GetMem( readBuffer, FKBBuffer * 1024 );

      try
        if CryptGetHashParam( hashAddress, HP_HASHSIZE, @hashLen, @hashLenSize, 0 ) then
        begin
          GetMem( hashDataPointer, hashLen );

          while not FAbort do
          begin
            bytesRead := stream.Read( readBuffer^, FKBBuffer * 1024 );

            Inc( readPosition, bytesRead );

            if bytesRead = 0 then
            begin
              if CryptGetHashParam( hashAddress, HP_HASHVAL, PByte( hashDataPointer ), @hashLen, 0 ) then
              begin

                SetLength( hashBytesArray, hashLen );
                Move( hashDataPointer^, Pointer( hashBytesArray )^, hashLen );

                for i := 0 to hashLen - 1 do
                  result := result + LowerCase( IntToHex( Integer( hashBytesArray[ i ] ), 2 ) );

                break;
              end;
            end;

            if not CryptHashData( hashAddress, readBuffer, bytesRead, 0 ) then
              break;

            if Assigned( FOnWork ) then
              FOnWork( Self, readPosition );
          end;

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
      finally
        FreeMem( readBuffer );
        FreeMem( hashDataPointer );
      end;

      CryptDestroyHash( hashAddress );
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
