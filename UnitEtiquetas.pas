unit UnitEtiquetas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, frxClass,
  frxDBSet;

type
  TformEtiquetas = class(TForm)
    pnl2: TPanel;
    lbl1: TLabel;
    edtCodigo: TEdit;
    pnl21: TPanel;
    btn1: TButton;
    btn2: TButton;
    lbl2: TLabel;
    rg1: TRadioGroup;
    frEtiqueta: TfrxReport;
    fsqEtiqueta: TfrxDBDataset;
    frEtiqueta2: TfrxReport;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEtiquetas: TformEtiquetas;

implementation

uses
  UnitBuscarProducto, UnitDatos;

{$R *.dfm}

procedure TformEtiquetas.btn1Click(Sender: TObject);
var
directorio:string;
begin
directorio:=ExtractFilePath(Application.ExeName);
if edtCodigo.Text = '' then
begin
  ShowMessage('Debe Seleccionar un Articulo');
end
else
begin
    with d.sqbuscarProducto do
     begin
       Close;
       ParamByName('PCODIGO').AsString:=edtCodigo.Text;
       Open;
     end;
     case rg1.ItemIndex of
     0:begin
       with frEtiqueta2 do
     begin
    //   LoadFromFile(directorio+'\REP\ETIQUETAS\cuadrada.fr3');
     //  PrepareReport;
       ShowReport;
     end;
     end;
     1:begin
       with frEtiqueta do
     begin
    //   LoadFromFile(directorio+'\REP\ETIQUETAS\cuadrada.fr3');
     //  PrepareReport;
       ShowReport;
     end;
     end;
     end;
end;




end;

procedure TformEtiquetas.btn2Click(Sender: TObject);
begin
formbuscarProducto:= TformbuscarProducto.Create(Application);
      try
          with formbuscarProducto do
          begin
          Caption:= 'SELECCIONES PRODUCTO';


          ShowModal;
          end;

      finally
       edtCodigo.Text:=formbuscarProducto.codigoproducto;
       formbuscarProducto.Free;
      end;
end;

end.
