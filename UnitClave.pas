unit UnitClave;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TformClave = class(TForm)
    img1: TImage;
    edtClave: TEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formClave: TformClave;

implementation

{$R *.dfm}

procedure TformClave.FormShow(Sender: TObject);
begin
edtClave.Clear;
edtClave.SetFocus;
end;

end.
