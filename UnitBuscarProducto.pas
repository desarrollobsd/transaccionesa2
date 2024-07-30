unit UnitBuscarProducto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait,
  dbisamtb;

type
  TformbuscarProducto = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    grid1: TDBGrid;
    rg1: TRadioGroup;
    sqProducto: TFDQuery;
    dsqProductos: TDataSource;
    sqbuscarProductos: TFDQuery;
    sqfactor: TFDQuery;
    edtpalabraClave: TEdit;
    sqbuscarproducto: TDBISAMQuery;
    procedure rg1Click(Sender: TObject);
    procedure grid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtpalabraClaveKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    codigoproducto:string;
    costoproducto: Currency;
    nombreproducto : string;
  end;

var
  formbuscarProducto: TformbuscarProducto;
  productoSeleccionado: string;

implementation

uses
   funciones, UnitDatos;

{$R *.dfm}

procedure TformbuscarProducto.edtpalabraClaveKeyPress(Sender: TObject;
  var Key: Char);
  var
  consulta:string;
begin
consulta:='Select *';

  with sqbuscarProducto do
  begin
    Close;
    sql.Clear;
    SQL.Add(consulta);
    SQL.Add('FROM Sinventario');
    SQL.Add('WHERE FI_CODIGO like :palabraclave');
    SQL.Add('ORDER BY FI_DESCRIPCION asc');
    ParamByName('palabraclave').AsString:='%'+edtpalabraClave.Text+'%';
    Open;

  end;
end;

procedure TformbuscarProducto.FormShow(Sender: TObject);
begin
sqbuscarProducto.Close;
sqProducto.Close;
edtpalabraClave.Clear;
edtpalabraClave.Visible:=False;
end;

procedure TformbuscarProducto.grid1DblClick(Sender: TObject);
var
  factor,
  precioOferta,
  precioOfertame,
  impuesto1,
  montoimpuesto:Currency;
begin
  codigoproducto:=sqbuscarProducto.FieldByName('FI_CODIGO').AsString;

  nombreproducto := sqbuscarProducto.FieldByName('FI_DESCRIPCION').AsString;
  Close;
end;

procedure TformbuscarProducto.rg1Click(Sender: TObject);
var
consulta:string;
begin
case rg1.ItemIndex of
0:begin
consulta:='Select *';
edtpalabraClave.Visible:=False;
  with sqbuscarProducto do
  begin
    Close;
    sql.Clear;
    SQL.Add(consulta);
    SQL.Add('FROM Sinventario');
    SQL.Add('ORDER BY FI_DESCRIPCION');
    Open;

  end;
end;

1:begin

  sqbuscarProducto.Close;
  edtpalabraClave.Clear;
  edtpalabraClave.Visible:=True;
  edtpalabraClave.SetFocus;
end;

end;
end;

end.
