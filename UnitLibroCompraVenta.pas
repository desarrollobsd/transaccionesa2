unit UnitLibroCompraVenta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, frxClass, frxDBSet;

type
  TformImpuestos = class(TForm)
    rg1: TRadioGroup;
    grp1: TGroupBox;
    lbl1: TLabel;
    lbl3: TLabel;
    lbl2: TLabel;
    hastaf: TDateTimePicker;
    desdef: TDateTimePicker;
    cbb1: TComboBox;
    edt1: TEdit;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    chkSerie: TCheckBox;
    edclasificacion: TComboBox;
    lbl4: TLabel;
    fsqCompras: TfrxDBDataset;
    repLibroCompra: TfrxReport;
    fsqVentas: TfrxDBDataset;
    repLibroVenta: TfrxReport;
    procedure btn2Click(Sender: TObject);
    procedure chkSerieClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      TotalMontoRetencion,
  TotalMontoContribuyente,
  TotalIVAContribuyente,
  TotalMontoNoContribuyente,
  TotalIVANoContribuyente,
  TotalDiferenciaImpuesto,
  TotalGeneralNeto,
  TotalBaseImponible,
  TotalDebitoFiscal,
  MontoExento               : Double;
  FechaInicio,
  FechaFin                  : TDateTime;
  TablePrefix,
  strPeriodoActual          : String;
  end;

var
  formImpuestos: TformImpuestos;

implementation

uses
  UnitDatos, funciones;

{$R *.dfm}

procedure TformImpuestos.btn2Click(Sender: TObject);
begin
case rg1.ItemIndex of
0:begin

end;
1:begin
  If chkSerie.Checked  Then Begin
  d.sqVentas.SQL.Clear;
    d.sqVentas.SQL.Add('Select * from '+TablePrefix+'SOPERACIONINV A');
    d.sqVentas.SQL.Add('LEFT OUTER JOIN '+TablePrefix+'SRETENCIONCLIENTE B');
    d.sqVentas.SQL.Add('ON (A.FTI_DOCUMENTO=B.FCC_NUMERO2)AND(B.FCC_CODIGO=A.FTI_RESPONSABLE)AND(B.FCC_MONTORETENCION>0)AND(B.FCC_TIPOOPERACION = '''+edClasificacion.Text+''')');
    d.sqVentas.SQL.Add('Where ((A.FTI_Tipo = 11)OR(A.FTI_Tipo = 12))AND(A.FTI_Status = 1)AND(A.FTI_FechaEmision >= '''+FormatDateTime('yyyy-mm-dd',DesdeF.Date)+''')AND(A.FTI_FechaEmision <= '''+FormatDateTime('yyyy-mm-dd',HastaF.Date)+''') ORDER BY A.FTI_FECHAEMISION, A.FTI_DOCUMENTO');
  End
  Else Begin
  d.sqVentas.SQL.Clear;
    d.sqVentas.SQL.Add('Select * from '+TablePrefix+'SOPERACIONINV A');
    d.sqVentas.SQL.Add('LEFT OUTER JOIN '+TablePrefix+'SRETENCIONCLIENTE B');
    d.sqVentas.SQL.Add('ON (A.FTI_DOCUMENTO=B.FCC_NUMERO2)AND(B.FCC_CODIGO=A.FTI_RESPONSABLE)AND(B.FCC_MONTORETENCION>0)AND(B.FCC_TIPOOPERACION = '''+edClasificacion.Text+''')');
    d.sqVentas.SQL.Add('Where ((A.FTI_Tipo = 11)OR(A.FTI_Tipo = 12))AND(A.FTI_Status = 1)AND(A.FTI_FechaEmision >= '''+FormatDateTime('yyyy-mm-dd',DesdeF.Date)+''')AND(A.FTI_FechaEmision <= '''+FormatDateTime('yyyy-mm-dd',HastaF.Date)+''')AND(A.FTI_SERIE = '''+cbb1.Text+''') ORDER BY A.FTI_FECHAEMISION, A.FTI_DOCUMENTO');
  End;
end;
end;
end;

procedure TformImpuestos.chkSerieClick(Sender: TObject);
begin
if chkSerie.Checked = True then
begin
  cbb1.Enabled:=False;
end
else
begin
  cbb1.Enabled:=True;
end;
end;

end.
