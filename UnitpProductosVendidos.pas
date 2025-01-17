unit UnitpProductosVendidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Data.DB, dbisamtb, frxClass, frxDBSet, Vcl.DBCtrls;

type



  TformProductosVendidos = class(TForm)
    pnl1: TPanel;
    rgProductos: TRadioGroup;
    grp1: TGroupBox;
    fechadesde: TDateTimePicker;
    fechahasta: TDateTimePicker;
    et1: TLabel;
    et2: TLabel;
    pnl2: TPanel;
    btn1: TButton;
    btn2: TButton;
    sqProductos: TDBISAMQuery;
    repProductos1: TfrxReport;
    fsqProdutos: TfrxDBDataset;
    fieldProductosFDI_DOCUMENTO: TStringField;
    intgrfldProductosFDI_OPERACION_AUTOINCREMENT: TIntegerField;
    crncyfldProductosFDI_COSTO: TCurrencyField;
    crncyfldProductosFDI_COSTOOPERACION: TCurrencyField;
    crncyfldProductosFDI_MONTOIMPUESTO1: TCurrencyField;
    crncyfldProductosFDI_PRECIOSINDESCUENTO: TCurrencyField;
    crncyfldProductosFDI_PRECIOCONDESCUENTO: TCurrencyField;
    crncyfldProductosFDI_COSTODEVENTAS: TCurrencyField;
    crncyfldProductosFDI_PRECIODEVENTA: TCurrencyField;
    intgrfldProductosFDI_TIPOOPERACION: TIntegerField;
    fieldProductosFDI_CODIGO: TStringField;
    fieldProductosFDI_CLIENTEPROVEEDOR: TStringField;
    fieldProductosFI_CATEGORIA: TStringField;
    fieldProductosFI_SUBCATEGORIA: TStringField;
    crncyfldProductosFDI_DESCUENTOPARCIAL: TCurrencyField;
    crncyfldProductosFDI_PORCENTDESCUENTO1: TCurrencyField;
    intgrfldProductosFDI_STATUS: TIntegerField;
    fieldProductosFI_MARCA: TStringField;
    fieldProductosFI_CODIGO: TStringField;
    fieldProductosFI_DESCRIPCION: TStringField;
    fieldProductosTOTALCANTIDAD: TFloatField;
    fieldProductosCANTIDADPENDIENTE: TFloatField;
    sqProductosFDI_FECHAOPERACION: TDateField;
    rgFiltros: TRadioGroup;
    sqDepartamento: TDBISAMQuery;
    dsDepartamento: TDataSource;
    lkDepartamento: TDBLookupComboBox;
    edtItems: TEdit;
    et3: TLabel;
    crncyfldProductosTotalExistencia: TCurrencyField;
    repProductos: TfrxReport;
    repFallas: TfrxReport;
    sqFallas: TDBISAMQuery;
    fsqFallas: TfrxDBDataset;
    crncyfldFallasTotalExistencia: TCurrencyField;
    fieldFallasFDI_DOCUMENTO: TStringField;
    intgrfldFallasFDI_OPERACION_AUTOINCREMENT: TIntegerField;
    crncyfldFallasFDI_COSTO: TCurrencyField;
    crncyfldFallasFDI_COSTOOPERACION: TCurrencyField;
    crncyfldFallasFDI_MONTOIMPUESTO1: TCurrencyField;
    crncyfldFallasFDI_PRECIOSINDESCUENTO: TCurrencyField;
    crncyfldFallasFDI_PRECIOCONDESCUENTO: TCurrencyField;
    crncyfldFallasFDI_COSTODEVENTAS: TCurrencyField;
    crncyfldFallasFDI_PRECIODEVENTA: TCurrencyField;
    intgrfldFallasFDI_TIPOOPERACION: TIntegerField;
    fieldFallasFDI_CODIGO: TStringField;
    fieldFallasFDI_CLIENTEPROVEEDOR: TStringField;
    fieldFallasFI_CATEGORIA: TStringField;
    fieldFallasFI_SUBCATEGORIA: TStringField;
    crncyfldFallasFDI_DESCUENTOPARCIAL: TCurrencyField;
    crncyfldFallasFDI_PORCENTDESCUENTO1: TCurrencyField;
    intgrfldFallasFDI_STATUS: TIntegerField;
    crncyfldFallasFX_EXISTENCIAMINIMA: TCurrencyField;
    crncyfldFallasFX_EXISTENCIAMAXIMA: TCurrencyField;
    fieldFallasFI_MARCA: TStringField;
    fieldFallasFI_CODIGO: TStringField;
    fieldFallasFI_DESCRIPCION: TStringField;
    fieldFallasTOTALCANTIDAD: TFloatField;
    fieldFallasCANTIDADPENDIENTE: TFloatField;
    sqFallasFDI_FECHAOPERACION: TDateField;
    lkProveedor: TDBLookupComboBox;
    sqProveedor: TDBISAMQuery;
    sqProdProveedor: TDBISAMQuery;
    fieldProdProveedorFTP_CODEPRODUCTO: TStringField;
    fieldProdProveedorFTP_CODPROVEEDOR: TStringField;
    fieldProdProveedorFI_CODIGO: TStringField;
    fieldProdProveedorFI_DESCRIPCION: TStringField;
    crncyfldProdProveedorFT_EXISTENCIA: TCurrencyField;
    repProdProveedor: TfrxReport;
    fsqProdProveedor: TfrxDBDataset;
    dsProveedor: TDataSource;
    fieldProveedorFP_CODIGO: TStringField;
    fieldProveedorFP_DESCRIPCION: TStringField;
    pb1: TProgressBar;
    procedure btn1Click(Sender: TObject);
    procedure rgFiltrosClick(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgProductosClick(Sender: TObject);

  private
    { Private declarations }
    procedure MostrarProductosMasVendidos;
    procedure UpdateProgress(Progress: Integer);
  public
    { Public declarations }
    type
  TProductosVendidosThread = class(TThread)
        private
          FForm: TformProductosVendidos;
        protected
          procedure Execute; override;
        public
          constructor Create(AForm: TformProductosVendidos);
        end;
end;


var
  formProductosVendidos: TformProductosVendidos;

implementation

uses
  UnitDatos, funciones, unitVariables;

{$R *.dfm}
constructor TformProductosVendidos.TProductosVendidosThread.Create(AForm: TformProductosVendidos);
begin
  inherited Create(True); // Create suspended
  FForm := AForm;
  FreeOnTerminate := True; // Automatically free the thread when done
end;

procedure TformProductosVendidos.TProductosVendidosThread.Execute;
var
  i: Integer;
begin
  // Simula un proceso largo y actualiza la barra de progreso
  for i := 1 to 100 do
  begin
    Sleep(50); // Simula trabajo
    Synchronize(procedure begin
      FForm.UpdateProgress(i);
    end);
  end;
  // Llama al m�todo para mostrar los productos m�s vendidos
  Synchronize(FForm.MostrarProductosMasVendidos);
end;


procedure TformProductosVendidos.btn2Click(Sender: TObject);

begin
  Close;
end;
procedure TformProductosVendidos.btn1Click(Sender: TObject);
var
  Thread: TProductosVendidosThread;
begin
  pb1.Visible:=True;
  Pb1.Position := 0; // Reinicia la barra de progreso
  Thread := TProductosVendidosThread.Create(Self);
  Thread.Start;
end;

procedure TformProductosVendidos.FormShow(Sender: TObject);
begin
pb1.Visible:=False;
end;

procedure TformProductosVendidos.MostrarProductosMasVendidos;
Var
  FechaInicio,
  FechaFin         : TDateTime;
  TablePrefix,
  strPeriodoActual,

  DefaultDateFormat : String;
  Precio,
  Dscto,
  PrecioNeto,
  Costo,
  PorcUtilidad     : Double;
begin
DefaultDateFormat:='yyyy"-"mm"-"dd';
case rgProductos.ItemIndex of
0:begin
  //iNICIO MAS VENDIDOS
   //INICIO FILTRO
   case rgFiltros.ItemIndex of
     0:begin
         sqProductos.Close;
          sqProductos.SQL.Clear;
          sqProductos.SQL.Add('SELECT S.FDI_DOCUMENTO, S.FDI_OPERACION_AUTOINCREMENT, S.FDI_COSTO, S.FDI_COSTOOPERACION, S.FDI_MONTOIMPUESTO1, S.FDI_PRECIOSINDESCUENTO, S.FDI_PRECIOCONDESCUENTO,');
          sqProductos.SQL.Add('SUM(S3.FT_EXISTENCIA) AS TotalExistencia, S.FDI_COSTODEVENTAS, S.FDI_PRECIODEVENTA, S.FDI_TIPOOPERACION, S.FDI_CODIGO, S.FDI_CLIENTEPROVEEDOR, S1.FI_CATEGORIA, S1.FI_SUBCATEGORIA,');
          sqProductos.SQL.Add('S.FDI_DESCUENTOPARCIAL, S.FDI_PORCENTDESCUENTO1, S.FDI_STATUS,');
          sqProductos.SQL.Add('S1.FI_MARCA, S1.FI_CODIGO, S1.FI_DESCRIPCION, S.FDI_CANTIDAD AS TOTALCANTIDAD, FDI_CANTIDADPENDIENTE AS CANTIDADPENDIENTE, S.FDI_FECHAOPERACION');
          sqProductos.SQL.Add('FROM '+TablePrefix+'SDetalleVenta S');
          sqProductos.SQL.Add('INNER JOIN "'+strPeriodoActual+'sInventario.dat" S1 ON (S.FDI_CODIGO=S1.FI_CODIGO)');
          //sqProductos.SQL.Add('INNER JOIN "'+strPeriodoActual+'sClientes.dat" S2 ON (S.FDI_CLIENTEPROVEEDOR=S2.FC_CODIGO)');
          sqProductos.SQL.Add('INNER JOIN "'+strPeriodoActual+'SInvDep" S3 ON S1.FI_CODIGO=S3.FT_CODIGOPRODUCTO');
          sqProductos.SQL.Add('WHERE ((S.FDI_TIPOOPERACION=11)AND(S.FDI_STATUS=1))AND((S.FDI_FECHAOPERACION>='''+FormatDateTime(DefaultDateFormat,fechadesde.date)+''')AND(S.FDI_FECHAOPERACION<='''+FormatDateTime(DefaultDateFormat,fechahasta.Date)+'''))');
          sqProductos.SQL.Add('group by S.FDI_CODIGO');
          sqProductos.SQL.Add('ORDER BY S.FDI_CANTIDAD DESC');
          sqProductos.SQL.Add('TOP '+edtItems.Text);
          //sqProductos.ParamByName('CATEGORIA').AsString:=VarToStr(lkDepartamento.KeyValue);
          sqProductos.Open;
           with repProductos do
          begin
            Variables.Variables['Empresa']:=QuotedStr(unitVariables.empresa);
            Variables.Variables['Departamento']:=QuotedStr('Todos');
            Variables.Variables['FechaInicio']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechadesde.Date));
            Variables.Variables['FechaFin']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechahasta.Date));
            Variables.Variables['Usuario']:=QuotedStr(unitVariables.Usuario);
            Variables.Variables['FechaHora']:=QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now));
            showreport;
          end;
     end;
     1:begin
           sqProductos.Close;
            sqProductos.SQL.Clear;
            sqProductos.SQL.Add('SELECT S.FDI_DOCUMENTO, S.FDI_OPERACION_AUTOINCREMENT, S.FDI_COSTO, S.FDI_COSTOOPERACION, S.FDI_MONTOIMPUESTO1, S.FDI_PRECIOSINDESCUENTO, S.FDI_PRECIOCONDESCUENTO,');
            sqProductos.SQL.Add('       SUM(S3.FT_EXISTENCIA) AS TotalExistencia, S.FDI_COSTODEVENTAS, S.FDI_PRECIODEVENTA, S.FDI_TIPOOPERACION, S.FDI_CODIGO, S.FDI_CLIENTEPROVEEDOR, S1.FI_CATEGORIA, S1.FI_SUBCATEGORIA,');
            sqProductos.SQL.Add('       S.FDI_DESCUENTOPARCIAL, S.FDI_PORCENTDESCUENTO1, S.FDI_STATUS,');
            sqProductos.SQL.Add('       S1.FI_MARCA, S1.FI_CODIGO, S1.FI_DESCRIPCION, S.FDI_CANTIDAD AS TOTALCANTIDAD, FDI_CANTIDADPENDIENTE AS CANTIDADPENDIENTE, S.FDI_FECHAOPERACION');
            sqProductos.SQL.Add('FROM '+TablePrefix+'SDetalleVenta S');
            sqProductos.SQL.Add('INNER JOIN "'+strPeriodoActual+'sInventario.dat" S1 ON (S.FDI_CODIGO=S1.FI_CODIGO)');
            //sqProductos.SQL.Add('INNER JOIN "'+strPeriodoActual+'sClientes.dat" S2 ON (S.FDI_CLIENTEPROVEEDOR=S2.FC_CODIGO)');
            sqProductos.SQL.Add('INNER JOIN "'+strPeriodoActual+'SInvDep" S3 ON S1.FI_CODIGO=S3.FT_CODIGOPRODUCTO');
            sqProductos.SQL.Add('WHERE S1.FI_CATEGORIA=:CATEGORIA AND((S.FDI_TIPOOPERACION=11)AND(S.FDI_STATUS=1))AND((S.FDI_FECHAOPERACION>='''+FormatDateTime(DefaultDateFormat,fechadesde.date)+''')AND(S.FDI_FECHAOPERACION<='''+FormatDateTime(DefaultDateFormat,fechahasta.Date)+'''))');
            sqProductos.SQL.Add('group by S.FDI_CODIGO');
            sqProductos.SQL.Add('ORDER BY S.FDI_CANTIDAD DESC');
            sqProductos.SQL.Add('TOP '+edtItems.Text);
            sqProductos.ParamByName('CATEGORIA').AsString:=VarToStr(lkDepartamento.KeyValue);
            sqProductos.Open;

            //LLAMAMOS EL rEPORTE
              with repProductos do
            begin
              Variables.Variables['Empresa']:=QuotedStr(unitVariables.empresa);
              Variables.Variables['Departamento']:=QuotedStr(lkDepartamento.Text);
              Variables.Variables['FechaInicio']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechadesde.Date));
              Variables.Variables['FechaFin']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechahasta.Date));
              Variables.Variables['Usuario']:=QuotedStr(unitVariables.Usuario);
              Variables.Variables['FechaHora']:=QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now));
              showreport;
              Close;
            end;
     end;
     2:begin
       ShowMessage('ATENCION SOLO EL REPORTE DE FALLA SALE PRO PROVEEDOR, EL REPORTE DE MAS VENDIDOS POR PROVEEDOR ESTA EN DESARROLLO');
     end;
   end;
   end;
   //FINAL FILTRO
  //Final mas Vendidos


1:begin
  //iNICIO Fallas
  //INICIO FILTRO
   case rgFiltros.ItemIndex of
     0:begin
          sqFallas.Close;
          sqFallas.SQL.Clear;
          sqFallas.SQL.Add('SELECT S.FDI_DOCUMENTO, S.FDI_OPERACION_AUTOINCREMENT, S.FDI_COSTO, S.FDI_COSTOOPERACION, S.FDI_MONTOIMPUESTO1, S.FDI_PRECIOSINDESCUENTO, S.FDI_PRECIOCONDESCUENTO,');
          sqFallas.SQL.Add('SUM(S3.FT_EXISTENCIA) AS TotalExistencia, S.FDI_COSTODEVENTAS, S.FDI_PRECIODEVENTA, S.FDI_TIPOOPERACION, S.FDI_CODIGO, S.FDI_CLIENTEPROVEEDOR, S1.FI_CATEGORIA, S1.FI_SUBCATEGORIA,');
          sqFallas.SQL.Add('S.FDI_DESCUENTOPARCIAL, S.FDI_PORCENTDESCUENTO1, S.FDI_STATUS,  S.FDI_STATUS, S2.FX_EXISTENCIAMINIMA, S2.FX_EXISTENCIAMAXIMA,');
          sqFallas.SQL.Add('S1.FI_MARCA, S1.FI_CODIGO, S1.FI_DESCRIPCION, S.FDI_CANTIDAD AS TOTALCANTIDAD, FDI_CANTIDADPENDIENTE AS CANTIDADPENDIENTE, S.FDI_FECHAOPERACION');
          sqFallas.SQL.Add('FROM '+TablePrefix+'SDetalleVenta S');
          sqFallas.SQL.Add('INNER JOIN "'+strPeriodoActual+'sInventario.dat" S1 ON (S.FDI_CODIGO=S1.FI_CODIGO)');
          sqFallas.SQL.Add('INNER JOIN sFixed S2 ON S.FDI_CODIGO=S2.FX_CODIGO ');
          sqFallas.SQL.Add('INNER JOIN "'+strPeriodoActual+'SInvDep" S3 ON S1.FI_CODIGO=S3.FT_CODIGOPRODUCTO');
          sqFallas.SQL.Add('WHERE ((S.FDI_TIPOOPERACION=11)AND(S.FDI_STATUS=1))AND((S.FDI_FECHAOPERACION>='''+FormatDateTime(DefaultDateFormat,fechadesde.date)+''')AND(S.FDI_FECHAOPERACION<='''+FormatDateTime(DefaultDateFormat,fechahasta.Date)+'''))');
          sqFallas.SQL.Add('group by S.FDI_CODIGO');
          sqFallas.SQL.Add('ORDER BY S.FDI_CANTIDAD DESC');
          sqFallas.SQL.Add('TOP '+edtItems.Text);
          //sqProductos.ParamByName('CATEGORIA').AsString:=VarToStr(lkDepartamento.KeyValue);
          sqFallas.Open;
           with repFallas do
          begin
            Variables.Variables['Empresa']:=QuotedStr(unitVariables.empresa);
            Variables.Variables['Departamento']:=QuotedStr('Todos');
            Variables.Variables['FechaInicio']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechadesde.Date));
            Variables.Variables['FechaFin']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechahasta.Date));
            Variables.Variables['Usuario']:=QuotedStr(unitVariables.Usuario);
            Variables.Variables['FechaHora']:=QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now));
            showreport;
          end;
     end;
     1:begin
            sqFallas.Close;
            sqFallas.SQL.Clear;
            sqFallas.SQL.Add('SELECT S.FDI_DOCUMENTO, S.FDI_OPERACION_AUTOINCREMENT, S.FDI_COSTO, S.FDI_COSTOOPERACION, S.FDI_MONTOIMPUESTO1, S.FDI_PRECIOSINDESCUENTO, S.FDI_PRECIOCONDESCUENTO,');
            sqFallas.SQL.Add('SUM(S3.FT_EXISTENCIA) AS TotalExistencia, S.FDI_COSTODEVENTAS, S.FDI_PRECIODEVENTA, S.FDI_TIPOOPERACION, S.FDI_CODIGO, S.FDI_CLIENTEPROVEEDOR, S1.FI_CATEGORIA, S1.FI_SUBCATEGORIA,');
            sqFallas.SQL.Add('S.FDI_DESCUENTOPARCIAL, S.FDI_PORCENTDESCUENTO1, S.FDI_STATUS,  S.FDI_STATUS, S2.FX_EXISTENCIAMINIMA, S2.FX_EXISTENCIAMAXIMA,');
            sqFallas.SQL.Add('S1.FI_MARCA, S1.FI_CODIGO, S1.FI_DESCRIPCION, S.FDI_CANTIDAD AS TOTALCANTIDAD, FDI_CANTIDADPENDIENTE AS CANTIDADPENDIENTE, S.FDI_FECHAOPERACION');
            sqFallas.SQL.Add('FROM '+TablePrefix+'SDetalleVenta S');
            sqFallas.SQL.Add('INNER JOIN "'+strPeriodoActual+'sInventario.dat" S1 ON (S.FDI_CODIGO=S1.FI_CODIGO)');
            sqFallas.SQL.Add('INNER JOIN sFixed S2 ON S.FDI_CODIGO=S2.FX_CODIGO ');
            sqFallas.SQL.Add('INNER JOIN "'+strPeriodoActual+'SInvDep" S3 ON S1.FI_CODIGO=S3.FT_CODIGOPRODUCTO');
            sqFallas.SQL.Add('WHERE S1.FI_CATEGORIA=:CATEGORIA AND((S.FDI_TIPOOPERACION=11)AND(S.FDI_STATUS=1))AND((S.FDI_FECHAOPERACION>='''+FormatDateTime(DefaultDateFormat,fechadesde.date)+''')AND(S.FDI_FECHAOPERACION<='''+FormatDateTime(DefaultDateFormat,fechahasta.Date)+'''))');
            sqFallas.SQL.Add('group by S.FDI_CODIGO');
            sqFallas.SQL.Add('ORDER BY S.FDI_CANTIDAD DESC');
            sqFallas.SQL.Add('TOP '+edtItems.Text);
            sqFallas.ParamByName('CATEGORIA').AsString:=VarToStr(lkDepartamento.KeyValue);
            sqFallas.Open;

            //LLAMAMOS EL rEPORTE
              with repFallas do
            begin
              Variables.Variables['Empresa']:=QuotedStr(unitVariables.empresa);
              Variables.Variables['Departamento']:=QuotedStr(lkDepartamento.Text);
              Variables.Variables['FechaInicio']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechadesde.Date));
              Variables.Variables['FechaFin']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechahasta.Date));
              Variables.Variables['Usuario']:=QuotedStr(unitVariables.Usuario);
              Variables.Variables['FechaHora']:=QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now));
              showreport;
              Close;
            end;
     end;
     2:begin
       sqProdProveedor.Close;
     sqProdProveedor.SQL.Clear;
     sqProdProveedor.SQL.Add('SELECT S.FTP_CODEPRODUCTO, S.FTP_CODPROVEEDOR, S1.FI_CODIGO, S1.FI_DESCRIPCION, S3.FT_EXISTENCIA, S3.FT_EXISTENCIA FROM SPROVINVENT AS S ');
     sqProdProveedor.SQL.Add('INNER JOIN Sinventario as S1 ON (S.FTP_CODEPRODUCTO = S1.FI_CODIGO)');
     sqProdProveedor.SQL.Add('INNER JOIN SInvDep as S3 ON (S.FTP_CODEPRODUCTO = S3.FT_CODIGOPRODUCTO)');
  //   sqProdProveedor.SQL.Add('INNER JOIN Sfixed as S2 ON (S.FTP_CODEPRODUCTO = S2.FX_CODIGO)');
     sqProdProveedor.SQL.Add('WHERE S.FTP_CODPROVEEDOR = :PROVEEDOR AND S3.FT_EXISTENCIA <= :EXISTMINIMA' );
     sqProdProveedor.SQL.Add('ORDER BY S1.FI_DESCRIPCION asc');
     sqProdProveedor.ParamByName('PROVEEDOR').AsString:=VarToStr(lkProveedor.KeyValue);
     sqProdProveedor.ParamByName('EXISTMINIMA').AsFloat:=StrToFloat(edtItems.Text);
     sqProdProveedor.Open;
     with repProdProveedor do
            begin
              Variables.Variables['Empresa']:=QuotedStr(unitVariables.empresa);
              Variables.Variables['Departamento']:=QuotedStr(lkProveedor.Text);
              Variables.Variables['FechaInicio']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechadesde.Date));
              Variables.Variables['FechaFin']:=QuotedStr(FormatDateTime('dd/mm/yyyy',fechahasta.Date));
              Variables.Variables['Usuario']:=QuotedStr(unitVariables.Usuario);
              Variables.Variables['FechaHora']:=QuotedStr(FormatDateTime('dd/mm/yyyy hh:mm:ss',Now));
              showreport;
              Close;
            end;
     end;
   end;
   end;

   //FINAL FILTRO
  //Final Fallas
end;
Close;
end;
procedure TformProductosVendidos.UpdateProgress(Progress: Integer);
begin
  pb1.Position := Progress;
end;







//procedure TformProductosVendidos.btn2Click(Sender: TObject);
//begin
////aqui probamos
////ShowMessage(lkDepartamento.KeyValue);
//
//end;

procedure TformProductosVendidos.rgFiltrosClick(Sender: TObject);
begin
case rgFiltros.ItemIndex of
0: begin
    lkDepartamento.Enabled:=False;
    lkProveedor.Enabled:=False;
    sqDepartamento.Close;
    sqProveedor.Close;
    et3.Caption:='Cant Item';
    lkProveedor.Enabled:=False;
  end;
1: begin
    lkDepartamento.Enabled:=True;
    lkProveedor.Enabled:=False;
    sqDepartamento.Close;
    sqDepartamento.Open;
    sqProveedor.Close;
    et3.Caption:='Cant Item';
    lkProveedor.Enabled:=False;
end;
2:begin
    lkDepartamento.Enabled:=False;
    lkProveedor.Enabled:=True;
    sqDepartamento.Close;
    sqProveedor.Close;
    sqProveedor.Open;
    case rgProductos.ItemIndex of
    0:begin
      et3.Caption:='Cant Item';
      grp1.Visible:=True;
    end;
    1:begin
      et3.Caption:='Cant Item';
      grp1.Visible:=True;
    end;
    2:begin
      et3.Caption:='Exist Minima';
      grp1.Visible:=False;
    end;

    end;

end;

end;
end;

procedure TformProductosVendidos.rgProductosClick(Sender: TObject);
begin
case rgProductos.ItemIndex of
0:begin
  et3.Caption:='Cant Item';
  grp1.Visible:=True;
end;
1:begin
  case rgFiltros.ItemIndex of
  0:begin
    et3.Caption:='Cant Item';
    grp1.Visible:=True;
  end;
  1:begin
   et3.Caption:='Cant Item';
   grp1.Visible:=True;
  end;
  2:begin
   et3.Caption:='Exist Min.';
   grp1.Visible:=False;
  end;
  end;

end;
end;
end;

end.
