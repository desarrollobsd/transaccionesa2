unit UnitAutorizado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  Tformautorizado = class(TForm)
    lbl1: TLabel;
    edtclave: TEdit;
    btn1: TButton;
    procedure FormShow(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
     class function Execute: boolean;
  end;

var
  formautorizado: Tformautorizado;

implementation

uses
  funciones;

{$R *.dfm}

procedure Tformautorizado.FormShow(Sender: TObject);
begin
edtclave.Clear;
edtclave.SetFocus;
end;

procedure Tformautorizado.btn1Click(Sender: TObject);
var
clave:string;
begin
  clave:=edtclave.Text;
  if SupervisorValido(clave) then
    ModalResult := mrOK
  else
    ShowMessage('Clave Errada o No Autorizada')

end;

class function Tformautorizado.Execute: Boolean;

begin
  with Tformautorizado.Create(nil) do
    try
      Result := ShowModal = mrOK;
    finally
      Free;
    end;
end;

end.
