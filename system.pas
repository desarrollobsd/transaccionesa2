
{**********************************************************************}
{                                                                      }
{                           XML Data Binding                           }
{                                                                      }
{         Generated on: 07/09/2019 11:41:46 p.m.                       }
{       Generated from: C:\Proyectos\ValesPos\Win32\Debug\system.xml   }
{   Settings stored in: C:\Proyectos\ValesPos\Win32\Debug\system.xdb   }
{                                                                      }
{**********************************************************************}

unit system;

interface

uses xmldom, XMLDoc, XMLIntf;

type

{ Forward Decls }

  IXMLRECORDSType = interface;
  IXMLRECORDType = interface;

{ IXMLRECORDSType }

  IXMLRECORDSType = interface(IXMLNode)
    ['{D8D339B7-8F7F-49F8-B974-DE8E5FDD00CE}']
    { Property Accessors }
    function Get_RECORD_: IXMLRECORDType;
    { Methods & Properties }
    property RECORD_: IXMLRECORDType read Get_RECORD_;
  end;

{ IXMLRECORDType }

  IXMLRECORDType = interface(IXMLNode)
    ['{9185470B-A855-4BE6-9DC8-B789AB4B4304}']
    { Property Accessors }
    function Get_Bd_host: UnicodeString;
    function Get_Bd_name: UnicodeString;
    function Get_Bd_user: UnicodeString;
    function Get_Bd_pass: Integer;
    procedure Set_Bd_host(Value: UnicodeString);
    procedure Set_Bd_name(Value: UnicodeString);
    procedure Set_Bd_user(Value: UnicodeString);
    procedure Set_Bd_pass(Value: Integer);
    { Methods & Properties }
    property Bd_host: UnicodeString read Get_Bd_host write Set_Bd_host;
    property Bd_name: UnicodeString read Get_Bd_name write Set_Bd_name;
    property Bd_user: UnicodeString read Get_Bd_user write Set_Bd_user;
    property Bd_pass: Integer read Get_Bd_pass write Set_Bd_pass;
  end;

{ Forward Decls }

  TXMLRECORDSType = class;
  TXMLRECORDType = class;

{ TXMLRECORDSType }

  TXMLRECORDSType = class(TXMLNode, IXMLRECORDSType)
  protected
    { IXMLRECORDSType }
    function Get_RECORD_: IXMLRECORDType;
  public
    procedure AfterConstruction; override;
  end;

{ TXMLRECORDType }

  TXMLRECORDType = class(TXMLNode, IXMLRECORDType)
  protected
    { IXMLRECORDType }
    function Get_Bd_host: UnicodeString;
    function Get_Bd_name: UnicodeString;
    function Get_Bd_user: UnicodeString;
    function Get_Bd_pass: Integer;
    procedure Set_Bd_host(Value: UnicodeString);
    procedure Set_Bd_name(Value: UnicodeString);
    procedure Set_Bd_user(Value: UnicodeString);
    procedure Set_Bd_pass(Value: Integer);
  end;

{ Global Functions }

function GetRECORDS(Doc: IXMLDocument): IXMLRECORDSType;
function LoadRECORDS(const FileName: string): IXMLRECORDSType;
function NewRECORDS: IXMLRECORDSType;

const
  TargetNamespace = '';

implementation

{ Global Functions }

function GetRECORDS(Doc: IXMLDocument): IXMLRECORDSType;
begin
  Result := Doc.GetDocBinding('RECORDS', TXMLRECORDSType, TargetNamespace) as IXMLRECORDSType;
end;

function LoadRECORDS(const FileName: string): IXMLRECORDSType;
begin
  Result := LoadXMLDocument(FileName).GetDocBinding('RECORDS', TXMLRECORDSType, TargetNamespace) as IXMLRECORDSType;
end;

function NewRECORDS: IXMLRECORDSType;
begin
  Result := NewXMLDocument.GetDocBinding('RECORDS', TXMLRECORDSType, TargetNamespace) as IXMLRECORDSType;
end;

{ TXMLRECORDSType }

procedure TXMLRECORDSType.AfterConstruction;
begin
  RegisterChildNode('RECORD', TXMLRECORDType);
  inherited;
end;

function TXMLRECORDSType.Get_RECORD_: IXMLRECORDType;
begin
  Result := ChildNodes['RECORD'] as IXMLRECORDType;
end;

{ TXMLRECORDType }

function TXMLRECORDType.Get_Bd_host: UnicodeString;
begin
  Result := ChildNodes['bd_host'].Text;
end;

procedure TXMLRECORDType.Set_Bd_host(Value: UnicodeString);
begin
  ChildNodes['bd_host'].NodeValue := Value;
end;

function TXMLRECORDType.Get_Bd_name: UnicodeString;
begin
  Result := ChildNodes['bd_name'].Text;
end;

procedure TXMLRECORDType.Set_Bd_name(Value: UnicodeString);
begin
  ChildNodes['bd_name'].NodeValue := Value;
end;

function TXMLRECORDType.Get_Bd_user: UnicodeString;
begin
  Result := ChildNodes['bd_user'].Text;
end;

procedure TXMLRECORDType.Set_Bd_user(Value: UnicodeString);
begin
  ChildNodes['bd_user'].NodeValue := Value;
end;

function TXMLRECORDType.Get_Bd_pass: Integer;
begin
  Result := ChildNodes['bd_pass'].NodeValue;
end;

procedure TXMLRECORDType.Set_Bd_pass(Value: Integer);
begin
  ChildNodes['bd_pass'].NodeValue := Value;
end;

end.