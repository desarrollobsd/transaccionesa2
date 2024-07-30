unit UnitEditFactura;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Data.DB, dbisamtb, JvExControls, JvDBLookup;

type
  TformEditFactura = class(TForm)
    btn1: TSpeedButton;
    edtFactura: TEdit;
    edtCLIENTE: TEdit;
    dtconteo: TDateTimePicker;
    edtmonto: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    edtsaldo: TEdit;
    lbl6: TLabel;
    sqFac: TDBISAMQuery;
    crncyfldFacturasFCC_SALDODOCUMENTO: TCurrencyField;
    crncyfldFacturasFCC_MONTOMONEDAEXT: TCurrencyField;
    dtmfldFacturasFCC_ULTFECHAABONO: TDateTimeField;
    mfldFacturasFCC_DESCRIPCIONMOV: TMemoField;
    intgrfldFacturasFCC_TIPOTRANSACCION: TIntegerField;
    fieldFacturasFCC_NUMERO: TStringField;
    fieldFacturasFCC_CODIGO: TStringField;
    fieldFacturasFCC_NROVENDEDOR: TStringField;
    fieldFacturasFC_DESCRIPCION: TStringField;
    sqEdt: TDBISAMQuery;
    fieldFacFCC_FACTORCAMBIO: TFloatField;
    edtcbbserie: TJvDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure edtFacturaExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formEditFactura: TformEditFactura;

implementation

uses
  UnitDatos;

{$R *.dfm}

procedure TformEditFactura.btn1Click(Sender: TObject);
begin
  with sqEdt do
  begin
    Close;
    ParamByName('NUMERO').AsString:=edtFactura.Text;
    ParamByName('SALDO').AsFloat:=StrToFloat(edtsaldo.Text);
    ParamByName('FECHAABONO').AsDate:=dtconteo.Date;
    ParamByName('PSERIE').AsString:=edtcbbserie.Text;
    ExecSQL;
    ShowMessage('Factura Editada');
    FormShow(nil);

  end;
end;

procedure TformEditFactura.edtFacturaExit(Sender: TObject);
var
saldodivisas : Currency;
begin
  with sqFac do
  begin
    Close;
    ParamByName('NUMERO').AsString:=edtFactura.Text;
    ParamByName('PSERIE').AsString:=edtcbbserie.Text;
    Open;
    if not sqFac.IsEmpty then
    begin
    saldodivisas:= sqFac.FieldByName('FCC_SALDODOCUMENTO').AsFloat / sqFac.FieldByName('FCC_FACTORCAMBIO').AsFloat;
    edtCLIENTE.Text:=sqFac.fieldByName('FC_DESCRIPCION').AsString;
    edtmonto.Text:=formatfloat(',0.00',sqFac.FieldByName('FCC_MONTOMONEDAEXT').AsFloat);
    edtsaldo.Text:=formatfloat(',0.00',saldodivisas);
    dtconteo.Date:=sqFac.FieldByName('FCC_ULTFECHAABONO').AsDateTime;
    end
    else
    begin
      ShowMessage('La factura No Existe');
    end;
  end;
end;

procedure TformEditFactura.FormShow(Sender: TObject);
begin
edtFactura.Clear;

edtCLIENTE.Clear;
edtmonto.Text:='0,00';
edtsaldo.Text:='0,00';
dtconteo.Date:=Now;
with d.sqserie do
begin
  Close;
  Open;
end;
edtcbbserie.SetFocus;
end;

end.
