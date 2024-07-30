unit UnitProductos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  JvExStdCtrls, JvCombobox, JvDBCombobox, Vcl.Mask, JvExMask, JvToolEdit,
  JvDBLookup, JvDBLookupComboEdit, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExControls, Vcl.Imaging.pngimage, Vcl.Buttons, frxClass, dbisamtb;

type
  TformProductos = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    edtCodigo: TEdit;
    edtNombre: TEdit;
    mmoDetalle: TMemo;
    edtPuesto: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    btn3: TButton;
    btn5: TButton;
    sqProducto: TFDQuery;
    edtidLinea: TEdit;
    edtLinea: TEdit;
    btn6: TButton;
    btn7: TButton;
    chk1: TCheckBox;
    lblTipo: TLabel;
    img1: TImage;
    btn4: TSpeedButton;
    btn8: TBitBtn;
    btn1: TSpeedButton;
    franalisis: TfrxReport;
    fdqrmaster: TfrxUserDataSet;
    fdqrdetalle: TfrxUserDataSet;
    fdqrcomisiones: TfrxUserDataSet;
    sqmaster: TFDQuery;
    sqdetalle: TFDQuery;
    sqcomisiones: TFDQuery;
    chkcom: TCheckBox;
    btn2: TButton;
    sqProductos: TDBISAMQuery;
    edtcosto: TEdit;
    lbl6: TLabel;
    edtcostoex: TEdit;
    lbl7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure limpiaredit();
    procedure btn3Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn7Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    accion : string;
    esfracionable : Integer;

   // codigolinea:string;
  end;

var
  formProductos: TformProductos;
  sqSelLinea : TFDQuery;
  sqselTipo : TFDQuery;
  sqActualizar : TFDQuery;
implementation

uses
  UnitBuscarProducto, UnitDatos;

{$R *.dfm}
Procedure TformProductos.LimpiarEdit;
var
i : Integer;
begin
 for i := 0 to ComponentCount -1 do
 if Components[i] is TEdit then
begin
 TEdit(Components[i]).Text := '';


end;
end;
procedure TformProductos.btn1Click(Sender: TObject);

begin
Close
end;

procedure TformProductos.btn3Click(Sender: TObject);
begin
begin

  end
end;

procedure TformProductos.btn5Click(Sender: TObject);
begin
      formbuscarProducto:= TformbuscarProducto.Create(Application);
          try
             formbuscarProducto.Caption:= 'SELECCIONE EL PRODUCTO';
              formbuscarProducto.ShowModal;
          finally
              edtCodigo.Text:=formbuscarProducto.codigoproducto;
              formbuscarProducto.Free;
              edtCodigoExit(nil);

          end;
end;

procedure TformProductos.btn7Click(Sender: TObject);
begin
  limpiaredit;
  mmoDetalle.Clear;
  edtCodigo.Enabled:=True;
  edtCodigo.SetFocus;
  btn3.Visible:=False;
  btn8.Enabled:=False;

  lblTipo.Caption:='';
  chk1.Checked:=False;

  btn4.Enabled:=False;
end;

procedure TformProductos.edtCodigoExit(Sender: TObject);
var
gastosAdm,
otrosGastos,
Costo,
precio1,
precio2 : Double;

begin
with sqProductos do
begin
  Close;
  SQL.Clear;
  sql.Add('SELECT S2.FIC_COSTOACTBOLIVARES, S2.FIC_COSTOACTEXTRANJERO, S1.FI_CODIGO, S1.FI_DESCRIPCION, S1.FI_DESCRIPCIONDETALLADA, S1.FI_PUESTO FROM SINVENTARIO S1');
  SQL.Add('INNER JOIN a2InvCostosPrecios S2 ON (S1.FI_CODIGO = S2.FIC_CODEITEM)');
  SQL.Add('WHERE FI_CODIGO = :PCODIGO');
  ParamByName('PCODIGO').AsString:=edtCodigo.Text;
  Open;
  edtNombre.Text:=sqProductos.FieldByName('FI_DESCRIPCION').AsString;
  mmoDetalle.Text:=sqProductos.FieldByName('FI_DESCRIPCIONDETALLADA').AsString;
  edtPuesto.Text:=sqProductos.FieldByName('FI_PUESTO').AsString;
  edtcosto.Text:=CurrToStr(sqProductos.FieldByName('FIC_COSTOACTBOLIVARES').AsCurrency);
  edtcostoex.Text:=CurrToStr(sqProductos.FieldByName('FIC_COSTOACTEXTRANJERO').AsCurrency);

  btn7.SetFocus;
end;
end;

procedure TformProductos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sqSelLinea.Free;
  sqSelTipo.Free;
end;

procedure TformProductos.FormShow(Sender: TObject);
begin
  limpiaredit;
  mmoDetalle.Clear;
  edtCodigo.Enabled:=True;
  edtCodigo.SetFocus;
  btn3.Visible:=False;

   btn4.Enabled:=False;
   btn8.Enabled:=False;
  //edtLinea.Text:='';
  sqSelLinea := TFDQuery.Create(nil);
  
end;

end.
