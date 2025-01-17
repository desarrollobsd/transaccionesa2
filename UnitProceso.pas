unit UnitProceso;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  JvExControls, JvDBLookup;

type
  TFormProcesos = class(TForm)
    pnl1: TPanel;
    rg1: TRadioGroup;
    btn1: TSpeedButton;
    cbbserie: TJvDBLookupCombo;
    procedure btn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rg1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProcesos: TFormProcesos;

implementation

uses
  UnitDatos, funciones;

{$R *.dfm}

procedure TFormProcesos.btn1Click(Sender: TObject);
var
factura:string;
begin

    case rg1.ItemIndex of
    0: begin
        with d.sqoperacioninv do
         begin
         close;
         sql.Clear;
         SQL.Add('Update SoperacionInv');
         SQL.Add('SET FTI_STATUS = :STATUS, FTI_VISIBLE = :VISIBLE');
         SQL.Add('WHERE (FTI_TIPO = :TIPO OR FTI_TIPO = :TIPO2) AND FTI_SERIE = :PSERIE ');
         ParamByName('STATUS').AsInteger:=0;
         ParamByName('VISIBLE').AsBoolean:=False;
         ParamByName('TIPO').AsInteger:=11;
         ParamByName('TIPO2').AsInteger:=12;
         ParamByName('PSERIE').AsString:=cbbserie.Text;
         ExecSQL;
         end;
         ShowMessage('Proceso Concluido');
         Close;
    end;
    1: begin
       with d.sqoperacioninv do
       begin
       Close;
       SQL.Clear;
       sql.Add('SELECT * FROM soperacioninv');
       SQL.Add('WHERE (FTI_TIPO = :TIPO OR FTI_TIPO = :TIPO2) AND FTI_SERIE = :PSERIE ');
       ParamByName('VISIBLE').AsBoolean:=true;
       ParamByName('TIPO').AsInteger:=11;
       ParamByName('TIPO2').AsInteger:=12;
       ParamByName('PSERIE').AsString:=' ';
       ExecSQL;
       end;

        begin

//           d.sqoperacioninv.First;
//           while not d.sqoperacioninv.Eof do
//             begin
//             factura:=d.sqoperacioninv.FieldByName('FTI_DOCUMENTO').AsString;
//                with d.sqborrarproductos do
//                begin
//                  Close;
//                  SQL.Clear;
//                  sql.Add('DELETE FROM SDETALLEVENTA');
//                  SQL.Add('WHERE FDI_DOCUMENTO= :PFACTURA AND FDI_TIPOOPERACION = :PTIPO');
//                  ParamByName('PFACTURA').AsString:= factura;
//                  ParamByName('PTIPO').AsInteger:=11;
//                  ExecSQL
//                end;
//             Next;
//             end;

         with d.sqoperacioninv do
             begin
             close;
             sql.Clear;
             SQL.Add('Update SoperacionInv');
             SQL.Add('SET FTI_STATUS = :STATUS, FTI_VISIBLE = :VISIBLE');
             SQL.Add('WHERE FTI_TIPO = :TIPO AND FTI_MAQUINAFISCAL = :PSERIE');
             ParamByName('STATUS').AsInteger:=1;
             ParamByName('VISIBLE').AsBoolean:=True;
             ParamByName('TIPO').AsInteger:=11;
             ParamByName('PSERIE').AsString:=' ';
             ExecSQL;
             end;
             ShowMessage('Proceso Concluido');
             Close;
         end;
    end;
    2: begin
        with d.sqoperacioninv do
         begin
         close;
         sql.Clear;
         SQL.Add('Update SoperacionInv');
         SQL.Add('SET FTI_STATUS = :STATUS, FTI_VISIBLE = :VISIBLE');
         SQL.Add('WHERE FTI_TIPO = :TIPO AND FTI_MAQUINAFISCAL = :PSERIE');
         ParamByName('STATUS').AsInteger:=0;
         ParamByName('VISIBLE').AsBoolean:=False;
         ParamByName('TIPO').AsInteger:=13;
         ParamByName('PSERIE').AsString:=' ';
         ExecSQL;
         end;
         ShowMessage('Proceso Concluido');
         Close;
    end;
    end;
end;

procedure TFormProcesos.FormShow(Sender: TObject);
begin
d.sqserie.Close;

end;

procedure TFormProcesos.rg1Click(Sender: TObject);
begin
   case rg1.ItemIndex of
   0:begin            d.sqserie.Close;
     d.sqserie.Close;
     d.sqserie.Open;

   end;

   end;
end;

end.
