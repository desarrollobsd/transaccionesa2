unit UnitLicores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ComCtrls, Vcl.StdCtrls,
  frxClass, frxDBSet, system.DateUtils, Vcl.Mask, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids;

type
  TformLicores = class(TForm)
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl3: TLabel;
    dtinicio: TDateTimePicker;
    dtconteo: TDateTimePicker;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    cbb1: TComboBox;
    lbl2: TLabel;
    mmo1: TMemo;
    edt1: TEdit;
    frLibroLicores: TfrxReport;
    fsqPrecios: TfrxDBDataset;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    edtCliente: TEdit;
    edtRif: TEdit;
    edtInventario: TEdit;
    fsqentradas: TfrxDBDataset;
    MaskEdit1: TMaskEdit;
    rg1: TRadioGroup;
    frLicores2: TfrxReport;
    mmo2: TMemo;
    pgc1: TPageControl;
    ts1: TTabSheet;
    ts2: TTabSheet;
    dbgrd1: TDBGrid;
    ds1: TDataSource;
    ds2: TDataSource;
    dbgrd2: TDBGrid;
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dtconteoExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure rg1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLicores: TformLicores;

implementation

{$R *.dfm}

uses UnitDatos;

procedure TformLicores.btn1Click(Sender: TObject);
begin
Close;
end;

procedure TformLicores.btn2Click(Sender: TObject);
begin
  d.tmemSalidas.Close;
  d.tmemEntradas.Close;
  case rg1.ItemIndex of
  0:begin
    //aqui operaciones para sacar el libro de entradas
     if edtInventario.Text = '' then
  begin
    ShowMessage('Debe indicar el Inventario Anterior');
    edtInventario.SetFocus;
  end
  else
  begin
  d.sqlicores.SQL.Clear;
  d.sqlicores.Close;
  d.sqlicores.SQL.Add('SELECT S1.FTI_RIFCLIENTE, S1.FTI_DOCUMENTO AS DOCUMENTO, S1.FTI_FECHAEMISION, S1.FTI_TIPO, S1.FTI_STATUS, S2.FI_SUBCATEGORIA AS ESPECIE, S1.FTI_PERSONACONTACTO, S1.FTI_ZONAVENTA, S1.FTI_SERIE, S.FDI_CODIGO, S.FDI_DEPOSITOSOURCE,');
  d.sqlicores.SQL.Add('S.FDI_CANTIDAD, S2.FI_DESCRIPCION, S2.FI_CATEGORIA, S2.FI_UNIDAD AS LTS, S2.FI_MARCA, S2.FI_REFERENCIA AS GRADOALCOHOLICO, S2.FI_CAPACIDAD AS CAPACIDAD,');
  d.sqlicores.SQL.Add('S2.FI_MODELO AS NACIONALIMPORTADO, S2.FI_MONTOCOMISION AS COMISION, S4.FZ_DESCRIPCION AS DESTINO');
  d.sqlicores.SQL.Add('FROM SOperacionInv S1');
  d.sqlicores.SQL.Add('INNER JOIN sDetalleventa S ON (S1.FTI_AUTOINCREMENT=S.FDI_OPERACION_AUTOINCREMENT)');
  d.sqlicores.SQL.Add('INNER JOIN SInventario S2 ON (S.FDI_CODIGO=S2.FI_CODIGO)');
  d.sqlicores.SQL.Add('INNER JOIN Scategoria S3 ON (S2.FI_CATEGORIA=S3.FD_CODIGO)');
  d.sqlicores.SQL.Add('LEFT OUTER JOIN SZonas S4 ON (S1.FTI_ZONAVENTA=S4.FZ_CODIGO)');
  d.sqlicores.SQL.Add('WHERE (S2.FI_CATEGORIA = '''+edt1.Text+''') AND (S1.FTI_TIPO=11) AND (S1.FTI_STATUS=1)AND(S1.FTI_FECHAEMISION BETWEEN '''+FormatDateTime('yyyy-mm-dd',dtconteo.Date)+''' AND '''+FormatDateTime('yyyy-mm-dd',dtinicio.Date)+''')AND(S1.FTI_SERIE='''+cbb1.Text+''')AND(S2.FI_UNIDAD <> '''')');
  d.sqlicores.SQL.Add('ORDER BY S1.FTI_FECHAEMISION');
 mmo1.Lines.Add(d.sqlicores.SQL.Text);
  d.sqlicores.Open;
  d.sqLicores.First;
  d.tmemSalidas.Open;
  //recorremos las salidas
    while not d.sqLicores.Eof do // Itera hasta que se llegue al final del dataset
        begin
          with d.tmemSalidas do
          begin

            Insert;
            Append;
            FieldByName('FTI_RIFCLIENTE').AsString:=d.sqLicores.FieldByName('FTI_RIFCLIENTE').AsString;
            FieldByName('DOCUMENTO').AsString:=d.sqLicores.FieldByName('DOCUMENTO').AsString;
            FieldByName('FTI_FECHAEMISION').AsString:=d.sqLicores.FieldByName('FTI_FECHAEMISION').AsString;
            FieldByName('FTI_TIPO').AsString:=d.sqLicores.FieldByName('FTI_TIPO').AsString;
            FieldByName('FTI_STATUS').AsString:=d.sqLicores.FieldByName('FTI_STATUS').AsString;
            FieldByName('ESPECIE').AsString:=d.sqLicores.FieldByName('ESPECIE').AsString;
            FieldByName('FTI_PERSONACONTACTO').AsString:=d.sqLicores.FieldByName('FTI_PERSONACONTACTO').AsString;
            FieldByName('FDI_CODIGO').AsString:=d.sqLicores.FieldByName('FDI_CODIGO').AsString;
            FieldByName('FDI_CANTIDAD').AsString:=d.sqLicores.FieldByName('FDI_CANTIDAD').AsString;
            FieldByName('FI_DESCRIPCION').AsString:=d.sqLicores.FieldByName('FI_DESCRIPCION').AsString;
            FieldByName('GRADOALCOHOLICO').AsString:=d.sqLicores.FieldByName('GRADOALCOHOLICO').AsString;
            FieldByName('CAPACIDAD').AsString:=d.sqLicores.FieldByName('CAPACIDAD').AsString;
            FieldByName('NACIONALIMPORTADO').AsString:=d.sqLicores.FieldByName('NACIONALIMPORTADO').AsString;
            FieldByName('TOTALVENTA').AsFloat:=d.sqLicores.FieldByName('CAPACIDAD').AsFloat * d.sqLicores.FieldByName('FDI_CANTIDAD').AsFloat;
            Post;
          end;

          d.sqLicores.Next; // Mueve el cursor al siguiente registro del dataset
        end;

  //fin de recorrer las salidas

  d.sqlicoresEntrada.SQL.Clear;
  d.sqlicoresEntrada.Close;
  d.sqlicoresEntrada.SQL.Add('SELECT S1.FTI_RIFCLIENTE, S1.FTI_DOCUMENTO AS DOCUMENTO, S1.FTI_FECHAEMISION, S1.FTI_TIPO, S1.FTI_STATUS, S2.FI_SUBCATEGORIA AS ESPECIE, S1.FTI_PERSONACONTACTO, S1.FTI_ZONAVENTA, S1.FTI_SERIE, S.FDI_CODIGO, S.FDI_DEPOSITOSOURCE,');
  d.sqlicoresEntrada.SQL.Add('S.FDI_CANTIDAD, S2.FI_DESCRIPCION, S2.FI_CATEGORIA, S2.FI_UNIDAD AS LTS, S2.FI_MARCA, S2.FI_REFERENCIA AS GRADOALCOHOLICO, S2.FI_CAPACIDAD AS CAPACIDAD,');
  d.sqlicoresEntrada.SQL.Add('S2.FI_MODELO AS NACIONALIMPORTADO, S2.FI_MONTOCOMISION AS COMISION, S4.FZ_DESCRIPCION AS DESTINO');
  d.sqlicoresEntrada.SQL.Add('FROM SOperacionInv S1');
  d.sqlicoresEntrada.SQL.Add('INNER JOIN sDetallecompra S ON (S1.FTI_AUTOINCREMENT=S.FDI_OPERACION_AUTOINCREMENT)');
  d.sqlicoresEntrada.SQL.Add('INNER JOIN SInventario S2 ON (S.FDI_CODIGO=S2.FI_CODIGO)');
  d.sqlicoresEntrada.SQL.Add('INNER JOIN Scategoria S3 ON (S2.FI_CATEGORIA=S3.FD_CODIGO)');
  d.sqlicoresEntrada.SQL.Add('LEFT OUTER JOIN SZonas S4 ON (S1.FTI_ZONAVENTA=S4.FZ_CODIGO)');
  d.sqlicoresEntrada.SQL.Add('WHERE (S2.FI_CATEGORIA = '''+edt1.Text+''') AND (S1.FTI_TIPO=6) AND (S1.FTI_STATUS=1)AND(S1.FTI_FECHAEMISION BETWEEN '''+FormatDateTime('yyyy-mm-dd',dtconteo.Date)+''' AND '''+FormatDateTime('yyyy-mm-dd',dtinicio.Date)+''') ');
  d.sqlicoresEntrada.SQL.Add('ORDER BY S1.FTI_FECHAEMISION');
 mmo2.Lines.Add(d.sqlicoresEntrada.SQL.Text);
  d.sqlicoresEntrada.Open;
  d.sqLicoresEntrada.First;
  d.tmemEntradas.Open;
  while not d.sqlicoresEntrada.Eof do // Itera hasta que se llegue al final del dataset
        begin
          with d.tmemEntradas do
          begin

            Insert;
            Append;
            FieldByName('FTI_RIFCLIENTE').AsString:=d.sqlicoresEntrada.FieldByName('FTI_RIFCLIENTE').AsString;
            FieldByName('DOCUMENTO').AsString:=d.sqlicoresEntrada.FieldByName('DOCUMENTO').AsString;
            FieldByName('FTI_FECHAEMISION').AsString:=d.sqlicoresEntrada.FieldByName('FTI_FECHAEMISION').AsString;
            FieldByName('FTI_TIPO').AsString:=d.sqlicoresEntrada.FieldByName('FTI_TIPO').AsString;
            FieldByName('FTI_STATUS').AsString:=d.sqlicoresEntrada.FieldByName('FTI_STATUS').AsString;
            FieldByName('ESPECIE').AsString:=d.sqlicoresEntrada.FieldByName('ESPECIE').AsString;
            FieldByName('FTI_PERSONACONTACTO').AsString:=d.sqlicoresEntrada.FieldByName('FTI_PERSONACONTACTO').AsString;
            FieldByName('FDI_CODIGO').AsString:=d.sqlicoresEntrada.FieldByName('FDI_CODIGO').AsString;
            FieldByName('FDI_CANTIDAD').AsString:=d.sqlicoresEntrada.FieldByName('FDI_CANTIDAD').AsString;
            FieldByName('FI_DESCRIPCION').AsString:=d.sqlicoresEntrada.FieldByName('FI_DESCRIPCION').AsString;
            FieldByName('GRADOALCOHOLICO').AsString:=d.sqlicoresEntrada.FieldByName('GRADOALCOHOLICO').AsString;
            FieldByName('CAPACIDAD').AsString:=d.sqlicoresEntrada.FieldByName('CAPACIDAD').AsString;
            FieldByName('NACIONALIMPORTADO').AsString:=d.sqlicoresEntrada.FieldByName('NACIONALIMPORTADO').AsString;
            FieldByName('TOTALCOMPRAS').AsFloat:=d.sqlicoresEntrada.FieldByName('CAPACIDAD').AsFloat * d.sqlicoresEntrada.FieldByName('FDI_CANTIDAD').AsFloat;
            Post;
          end;

          d.sqlicoresEntrada.Next; // Mueve el cursor al siguiente registro del dataset
        end;
  frLicores2.Variables.Variables['cliente']:=QuotedStr(edtCliente.Text);
  frLicores2.Variables.Variables['rif']:=QuotedStr(edtRif.Text);
  frLicores2.Variables.Variables['inventario']:=QuotedStr(edtInventario.Text);
  frLicores2.ShowReport;
  //Close;
  end;
  end;
  1:begin

    if edtInventario.Text = '' then
  begin
    ShowMessage('Debe indicar el Inventario Anterior');
    edtInventario.SetFocus;
  end
  else
  begin
  d.sqlicores.SQL.Clear;
  d.sqlicores.Close;
  d.sqlicores.SQL.Add('SELECT S1.FTI_RIFCLIENTE, S1.FTI_DOCUMENTO AS DOCUMENTO, S1.FTI_FECHAEMISION, S1.FTI_TIPO, S1.FTI_STATUS, S2.FI_SUBCATEGORIA AS ESPECIE, S1.FTI_PERSONACONTACTO, S1.FTI_ZONAVENTA, S1.FTI_SERIE, S.FDI_CODIGO, S.FDI_DEPOSITOSOURCE,');
  d.sqlicores.SQL.Add('S.FDI_CANTIDAD, S2.FI_DESCRIPCION, S2.FI_CATEGORIA, S2.FI_UNIDAD AS LTS, S2.FI_MARCA, S2.FI_REFERENCIA AS GRADOALCOHOLICO, S2.FI_CAPACIDAD AS CAPACIDAD,');
  d.sqlicores.SQL.Add('S2.FI_MODELO AS NACIONALIMPORTADO, S2.FI_MONTOCOMISION AS COMISION, S4.FZ_DESCRIPCION AS DESTINO');
  d.sqlicores.SQL.Add('FROM SOperacionInv S1');
  d.sqlicores.SQL.Add('INNER JOIN sDetalleventa S ON (S1.FTI_AUTOINCREMENT=S.FDI_OPERACION_AUTOINCREMENT)');
  d.sqlicores.SQL.Add('INNER JOIN SInventario S2 ON (S.FDI_CODIGO=S2.FI_CODIGO)');
  d.sqlicores.SQL.Add('INNER JOIN Scategoria S3 ON (S2.FI_CATEGORIA=S3.FD_CODIGO)');
  d.sqlicores.SQL.Add('LEFT OUTER JOIN SZonas S4 ON (S1.FTI_ZONAVENTA=S4.FZ_CODIGO)');
  d.sqlicores.SQL.Add('WHERE (S2.FI_CATEGORIA = '''+edt1.Text+''') AND (S1.FTI_TIPO=11) AND (S1.FTI_STATUS=1)AND(S1.FTI_FECHAEMISION BETWEEN '''+FormatDateTime('yyyy-mm-dd',dtconteo.Date)+''' AND '''+FormatDateTime('yyyy-mm-dd',dtinicio.Date)+''')AND(S1.FTI_SERIE='''+cbb1.Text+''')AND(S2.FI_UNIDAD <> '''')');
  d.sqlicores.SQL.Add('ORDER BY S1.FTI_FECHAEMISION');
  mmo1.Lines.Add(d.sqlicores.SQL.Text);
  d.sqlicores.Open;
  d.sqLicores.First;
  d.tmemSalidas.Open;
  //recorremos las salidas
    while not d.sqLicores.Eof do // Itera hasta que se llegue al final del dataset
        begin
          with d.tmemSalidas do
          begin

            Insert;
            Append;
            FieldByName('FTI_RIFCLIENTE').AsString:=d.sqLicores.FieldByName('FTI_RIFCLIENTE').AsString;
            FieldByName('DOCUMENTO').AsString:=d.sqLicores.FieldByName('DOCUMENTO').AsString;
            FieldByName('FTI_FECHAEMISION').AsString:=d.sqLicores.FieldByName('FTI_FECHAEMISION').AsString;
            FieldByName('FTI_TIPO').AsString:=d.sqLicores.FieldByName('FTI_TIPO').AsString;
            FieldByName('FTI_STATUS').AsString:=d.sqLicores.FieldByName('FTI_STATUS').AsString;
            FieldByName('ESPECIE').AsString:=d.sqLicores.FieldByName('ESPECIE').AsString;
            FieldByName('FTI_PERSONACONTACTO').AsString:=d.sqLicores.FieldByName('FTI_PERSONACONTACTO').AsString;
            FieldByName('FDI_CODIGO').AsString:=d.sqLicores.FieldByName('FDI_CODIGO').AsString;
            FieldByName('FDI_CANTIDAD').AsString:=d.sqLicores.FieldByName('FDI_CANTIDAD').AsString;
            FieldByName('FI_DESCRIPCION').AsString:=d.sqLicores.FieldByName('FI_DESCRIPCION').AsString;
            FieldByName('GRADOALCOHOLICO').AsString:=d.sqLicores.FieldByName('GRADOALCOHOLICO').AsString;
            FieldByName('CAPACIDAD').AsString:=d.sqLicores.FieldByName('CAPACIDAD').AsString;
            FieldByName('NACIONALIMPORTADO').AsString:=d.sqLicores.FieldByName('NACIONALIMPORTADO').AsString;
            FieldByName('TOTALVENTA').AsFloat:=d.sqLicores.FieldByName('CAPACIDAD').AsFloat * d.sqLicores.FieldByName('FDI_CANTIDAD').AsFloat;
            Post;
          end;

          d.sqLicores.Next; // Mueve el cursor al siguiente registro del dataset
        end;

  //fin de recorrer las salidas

 d.sqlicoresEntrada.SQL.Clear;
  d.sqlicoresEntrada.Close;
  d.sqlicoresEntrada.SQL.Add('SELECT S1.FTI_RIFCLIENTE, S1.FTI_DOCUMENTO AS DOCUMENTO, S1.FTI_FECHAEMISION, S1.FTI_TIPO, S1.FTI_STATUS, S2.FI_SUBCATEGORIA AS ESPECIE, S1.FTI_PERSONACONTACTO, S1.FTI_ZONAVENTA, S1.FTI_SERIE, S.FDI_CODIGO, S.FDI_DEPOSITOSOURCE,');
  d.sqlicoresEntrada.SQL.Add('S.FDI_CANTIDAD, S2.FI_DESCRIPCION, S2.FI_CATEGORIA, S2.FI_UNIDAD AS LTS, S2.FI_MARCA, S2.FI_REFERENCIA AS GRADOALCOHOLICO, S2.FI_CAPACIDAD AS CAPACIDAD,');
  d.sqlicoresEntrada.SQL.Add('S2.FI_MODELO AS NACIONALIMPORTADO, S2.FI_MONTOCOMISION AS COMISION, S4.FZ_DESCRIPCION AS DESTINO');
  d.sqlicoresEntrada.SQL.Add('FROM SOperacionInv S1');
  d.sqlicoresEntrada.SQL.Add('INNER JOIN sDetallecompra S ON (S1.FTI_AUTOINCREMENT=S.FDI_OPERACION_AUTOINCREMENT)');
  d.sqlicoresEntrada.SQL.Add('INNER JOIN SInventario S2 ON (S.FDI_CODIGO=S2.FI_CODIGO)');
  d.sqlicoresEntrada.SQL.Add('INNER JOIN Scategoria S3 ON (S2.FI_CATEGORIA=S3.FD_CODIGO)');
  d.sqlicoresEntrada.SQL.Add('LEFT OUTER JOIN SZonas S4 ON (S1.FTI_ZONAVENTA=S4.FZ_CODIGO)');
  d.sqlicoresEntrada.SQL.Add('WHERE (S2.FI_CATEGORIA = '''+edt1.Text+''') AND (S1.FTI_TIPO=6) AND (S1.FTI_STATUS=1)AND(S1.FTI_FECHAEMISION BETWEEN '''+FormatDateTime('yyyy-mm-dd',dtconteo.Date)+''' AND '''+FormatDateTime('yyyy-mm-dd',dtinicio.Date)+''') ');
  d.sqlicoresEntrada.SQL.Add('ORDER BY S1.FTI_FECHAEMISION');
 mmo2.Lines.Add(d.sqlicoresEntrada.SQL.Text);
  d.sqlicoresEntrada.Open;
  d.tmemEntradas.Open;
  while not d.sqlicoresEntrada.Eof do // Itera hasta que se llegue al final del dataset
        begin
          with d.tmemEntradas do
          begin

            Insert;
            Append;
            FieldByName('FTI_RIFCLIENTE').AsString:=d.sqlicoresEntrada.FieldByName('FTI_RIFCLIENTE').AsString;
            FieldByName('DOCUMENTO').AsString:=d.sqlicoresEntrada.FieldByName('DOCUMENTO').AsString;
            FieldByName('FTI_FECHAEMISION').AsString:=d.sqlicoresEntrada.FieldByName('FTI_FECHAEMISION').AsString;
            FieldByName('FTI_TIPO').AsString:=d.sqlicoresEntrada.FieldByName('FTI_TIPO').AsString;
            FieldByName('FTI_STATUS').AsString:=d.sqlicoresEntrada.FieldByName('FTI_STATUS').AsString;
            FieldByName('ESPECIE').AsString:=d.sqlicoresEntrada.FieldByName('ESPECIE').AsString;
            FieldByName('FTI_PERSONACONTACTO').AsString:=d.sqlicoresEntrada.FieldByName('FTI_PERSONACONTACTO').AsString;
            FieldByName('FDI_CODIGO').AsString:=d.sqlicoresEntrada.FieldByName('FDI_CODIGO').AsString;
            FieldByName('FDI_CANTIDAD').AsString:=d.sqlicoresEntrada.FieldByName('FDI_CANTIDAD').AsString;
            FieldByName('FI_DESCRIPCION').AsString:=d.sqlicoresEntrada.FieldByName('FI_DESCRIPCION').AsString;
            FieldByName('GRADOALCOHOLICO').AsString:=d.sqlicoresEntrada.FieldByName('GRADOALCOHOLICO').AsString;
            FieldByName('CAPACIDAD').AsString:=d.sqlicoresEntrada.FieldByName('CAPACIDAD').AsString;
            FieldByName('NACIONALIMPORTADO').AsString:=d.sqlicoresEntrada.FieldByName('NACIONALIMPORTADO').AsString;
            FieldByName('TOTALCOMPRAS').AsFloat:=d.sqlicoresEntrada.FieldByName('CAPACIDAD').AsFloat * d.sqlicoresEntrada.FieldByName('FDI_CANTIDAD').AsFloat;
            Post;
          end;

          d.sqlicoresEntrada.Next; // Mueve el cursor al siguiente registro del dataset
        end;
  frLibroLicores.Variables.Variables['cliente']:=QuotedStr(edtCliente.Text);
  frLibroLicores.Variables.Variables['rif']:=QuotedStr(edtRif.Text);
  frLibroLicores.Variables.Variables['inventario']:=QuotedStr(edtInventario.Text);
  frLibroLicores.ShowReport;
  //Close;
  end;
  end;
  end;
end;


procedure TformLicores.dtconteoExit(Sender: TObject);
var
  mes, dia, ano :Word;
begin

dtinicio.Date:=dtconteo.date+  (DaysInMonth(dtconteo.date)-DayOf(dtconteo.date));
end;

procedure TformLicores.FormShow(Sender: TObject);
var
  mes, dia, ano :Word;
begin
decodedate(now, ano, mes, dia);
dtconteo.Date:=encodeDate(ano, mes, 1);
dtinicio.Date:=Now+  (DaysInMonth(now)-DayOf(now));
edtRif.Clear;
edtCliente.Clear;
edtInventario.Clear;
rg1.ItemIndex:=0;
end;

procedure TformLicores.rg1Click(Sender: TObject);
begin
d.tmemSalidas.Close;
d.tmemEntradas.Close;
d.tmemSalidas.Open;
d.tmemEntradas.Open;
end;

end.
