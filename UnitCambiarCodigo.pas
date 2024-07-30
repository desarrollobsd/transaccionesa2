unit UnitCambiarCodigo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TCambiarCo = class(TForm)
    pnl2: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    edtCodigo: TEdit;
    btn2: TButton;
    pnl21: TPanel;
    btn1: TButton;
    edtNCodigo: TEdit;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CambiarCo: TCambiarCo;

implementation

uses
  UnitDatos, UnitBuscarProducto;

{$R *.dfm}

procedure TCambiarCo.btn1Click(Sender: TObject);
begin
if edtCodigo.Text = '' then
begin
  ShowMessage('Debe Seleccionar un Articulo para Cambiar el Codigo');
  edtCodigo.SetFocus;
end
else if edtNCodigo.Text = '' then
     begin
       ShowMessage('El Campo Nuevo Codigo no Puede Quedar en Blanco ');
       edtNCodigo.SetFocus;
     end
     else
     begin
       with d.sqverificarcodigo do
       begin
         Close;
         sql.Clear;
         SQL.Add('SELECT * FROM SINVENTARIO WHERE FI_CODIGO =:CODIGO');
         ParamByName('CODIGO').AsString:=edtNCodigo.Text;
         Open;
       end;
       if d.sqVerificarCodigo.IsEmpty then
       begin
         with d.sqCambiarCodigo do
begin
  Close;
  SQL.Clear;
  SQL.Add('UPDATE Sinventario set FI_CODIGO = :NUEVOCODIGO WHERE FI_CODIGO = :FI_CODIGO');

  ParamByName('FI_CODIGO').AsString:=edtCodigo.Text;
  ParamByName('NUEVOCODIGO').AsString:=edtNCodigo.Text;
  ExecSQL;

end;
//with d.sqCambiarCodigoOfertas do
//begin
//  Close;
//  SQL.Clear;
//  SQL.Add('UPDATE SInvOferta set FO_CODE = :NUEVOCODIGO WHERE FO_CODE = :FI_CODIGO');
//
// ParamByName('FI_CODIGO').AsString:=edtCodigo.Text;
// ParamByName('NUEVOCODIGO').AsString:=edtNCodigo.Text;
// ExecSQL;
//end;

with d.sqCambiarCodigo do
begin
 Close;
  SQL.Clear;
 SQL.Add('UPDATE SinvDep set FT_CODIGOPRODUCTO = :NUEVOCODIGO WHERE FT_CODIGOPRODUCTO = :FI_CODIGO');

 ParamByName('FI_CODIGO').AsString:=edtCodigo.Text;
 ParamByName('NUEVOCODIGO').AsString:=edtNCodigo.Text;
 ExecSQL;
end;

with d.sqCambiarCodigo do
begin
   Close;
  SQL.Clear;
   SQL.Add('UPDATE Sfixed set FX_CODIGO = :NUEVOCODIGO WHERE FX_CODIGO = :FI_CODIGO AND FX_TIPO = :TIPO');

 ParamByName('FI_CODIGO').AsString:=edtCodigo.Text;
 ParamByName('NUEVOCODIGO').AsString:=edtNCodigo.Text;
 ParamByName('TIPO').AsString:='B';
 ExecSQL;
end;

with d.sqCambiarCodigo do
begin
 Close;
  SQL.Clear;
 SQL.Add('UPDATE SDetalleVenta set FDI_CODIGO = :NUEVOCODIGO WHERE FDI_CODIGO = :FI_CODIGO');

 ParamByName('FI_CODIGO').AsString:=edtCodigo.Text;
 ParamByName('NUEVOCODIGO').AsString:=edtNCodigo.Text;
 ExecSQL;
end;
with d.sqCambiarCodigo do
begin
 Close;
  SQL.Clear;
 SQL.Add('UPDATE SDetallePartes set FDC_CODEPRODUCTO = :NUEVOCODIGO WHERE FDC_CODEPRODUCTO = :FI_CODIGO');

 ParamByName('FI_CODIGO').AsString:=edtCodigo.Text;
 ParamByName('NUEVOCODIGO').AsString:=edtNCodigo.Text;
 ExecSQL;
end;
with d.sqCambiarCodigo do
begin
 Close;
  SQL.Clear;
  SQL.Add('UPDATE SDetalleInv set FDI_CODIGO = :NUEVOCODIGO WHERE FDI_CODIGO = :FI_CODIGO');

 ParamByName('FI_CODIGO').AsString:=edtCodigo.Text;
 ParamByName('NUEVOCODIGO').AsString:=edtNCodigo.Text;
 ExecSQL;
end;
with d.sqCambiarCodigo do
begin
 Close;
  SQL.Clear;
 SQL.Add('UPDATE SDetalleCompra set FDI_CODIGO = :NUEVOCODIGO WHERE FDI_CODIGO = :FI_CODIGO');

 ParamByName('FI_CODIGO').AsString:=edtCodigo.Text;
 ParamByName('NUEVOCODIGO').AsString:=edtNCodigo.Text;
 ExecSQL;
end;
with d.sqCambiarCodigo do
begin
 Close;
  SQL.Clear;
 SQL.Add('UPDATE a2InvCostosPrecios set FIC_CODEITEM = :NUEVOCODIGO WHERE FIC_CODEITEM = :FI_CODIGO');
 ParamByName('FI_CODIGO').AsString:=edtCodigo.Text;
 ParamByName('NUEVOCODIGO').AsString:=edtNCodigo.Text;
 ExecSQL;
end;

ShowMessage('CODIGO CAMBIADO EXITOSAMENTE. CODIGO ANTERIOR = '+ edtCodigo.Text+' CODIGO NUEVO = '+edtNCodigo.Text);
  edtCodigo.Clear;
  edtNCodigo.Clear;
  edtCodigo.SetFocus;
       end
       else
       begin
         ShowMessage('ESTE CODIGO NO SE PUEDE USAR PORQUE EXISTE EN LA BASE DE DATOS');
         edtNCodigo.SetFocus;
       end;
     end;
end;

procedure TCambiarCo.btn2Click(Sender: TObject);
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
