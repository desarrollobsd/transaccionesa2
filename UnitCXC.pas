unit UnitCXC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Buttons,
  Data.DB, dbisamtb, frxClass, frxDBSet;

type
  TformComisiones = class(TForm)
    grp1: TGroupBox;
    dtinicio: TDateTimePicker;
    dtfinal: TDateTimePicker;
    lbl1: TLabel;
    lbl2: TLabel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    frCOmisiones: TfrxReport;
    fsqFacturas: TfrxDBDataset;
    fsqVendedores: TfrxDBDataset;
    dtconteo: TDateTimePicker;
    lbl3: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formComisiones: TformComisiones;

implementation

uses
  UnitDatos;

{$R *.dfm}

procedure TformComisiones.btn1Click(Sender: TObject);
begin
close;
end;

procedure TformComisiones.btn2Click(Sender: TObject);
var
fechainio,
fechafinal : string;
begin
  with d.sqFacturas  do
  begin
    Close;
    ParamByName('FECHA1').AsDate:= dtinicio.Date;
    ParamByName('FECHA2').AsDate:=dtfinal.Date;
    Open;
  end;

  With d.sqVendedores do
  begin
    Close;
    ParamByName('FECHA1').AsDate:= dtinicio.Date;
    ParamByName('FECHA2').AsDate:=dtfinal.Date;
    ParamByName('status').AsBoolean:=True;
    Open;
  end;
  fechainio:= FormatDateTime('dd/mm/yyyy',dtinicio.DateTime);
  fechafinal:= FormatDateTime('dd/mm/yyyy',dtfinal.DateTime);

  with frCOmisiones do
  begin
     Variables['fechainicio']:=QuotedStr(fechainio);
     Variables['fechafinal']:=QuotedStr(fechafinal);
     ShowReport;
  end;
end;

end.
