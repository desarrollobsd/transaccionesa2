﻿unit UnitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, SYSTEM.IniFiles,

  Vcl.StdCtrls, UnitMD5,System.hash,cifrado, Vcl.ComCtrls, Vcl.AppEvnts,
  frxClass, frxDBSet, frxExportBaseDialog, frxExportXLS, frxExportXLSX;

type
  TForm2 = class(TForm)
    pnl1: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    edt3: TEdit;
    edt1: TEdit;
    mmoprelicencia: TMemo;
    mmolicencia: TMemo;
    mmo1: TMemo;
    stat1: TStatusBar;
    ApplicationEvents1: TApplicationEvents;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    btn6: TSpeedButton;
    frLista: TfrxReport;
    fsqPrecios: TfrxDBDataset;
    EXCLISTA: TfrxXLSExport;
    expListaPrecios: TfrxXLSXExport;
    btn7: TSpeedButton;
    btn8: TSpeedButton;
    btn9: TSpeedButton;

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn9Click(Sender: TObject);
  private
    { Private declarations }
  public


       //   function LeerConfiguracion(const Section, Ident, Default: String): String; override;
  end;

var
  Form2: TForm2;
  empresa:string;
  licencia: string;
  directorioa2,
  directoriolocal : string;
  directorio_datos: string;
  lica2,
  licmia,

  serial,
  version:string;

implementation

uses
  UnitDatos, UnitProceso, Unit_VER_FACTURA, UnitCXC, UnitEditFactura, UnitProductos, UnitEtiquetas, UnitCambiarCodigo, UnitELiminar, UnitLicores, UnitpProductosVendidos, unitvariables;

{$R *.dfm}
function MostrarFormularioClaveSupervisor(var ClaveSupervisor: string): Boolean;
var
  Formulario: TForm;
  ClaveEdit: TEdit;
  ValidarBtn: TButton;
  CancelarBtn: TButton;
begin
  // Crear formulario
  Formulario := TForm.Create(nil);
  try
    Formulario.Caption := 'Ingrese la clave del supervisor';
    Formulario.Width := 300;
    Formulario.Height := 150;

    // Crear campo de texto para la clave
    ClaveEdit := TEdit.Create(Formulario);
    ClaveEdit.Parent := Formulario;
    ClaveEdit.Top := 50;
    ClaveEdit.Left := 50;
    ClaveEdit.Width := 200;

    // Crear bot�n para validar
    ValidarBtn := TButton.Create(Formulario);
    ValidarBtn.Parent := Formulario;
    ValidarBtn.Top := 80;
    ValidarBtn.Left := 50;
    ValidarBtn.Width := 80;
    ValidarBtn.Caption := 'Validar';
    ValidarBtn.ModalResult := mrOk;

    // Crear bot�n para cancelar
    CancelarBtn := TButton.Create(Formulario);
    CancelarBtn.Parent := Formulario;
    CancelarBtn.Top := 80;
    CancelarBtn.Left := 150;
    CancelarBtn.Width := 80;
    CancelarBtn.Caption := 'Cancelar';
    CancelarBtn.ModalResult := mrCancel;

    // Mostrar formulario y esperar respuesta
    if Formulario.ShowModal = mrOk then
    begin
      ClaveSupervisor := ClaveEdit.Text;
      Result := True;
    end
    else
    begin
      Result := False;
    end;
  finally
    Formulario.Free;
  end;
end;
procedure CambiarENTERporTAB (var Mensaje:tagMSG) ;
begin
  if Mensaje.message = WM_KEYDOWN then
     if Mensaje.wParam = VK_RETURN then
        begin
        // Poner todos los tipos de componente donde NO se quiera este efecto
        if NOT (Screen.ActiveControl is TMemo) then
              Mensaje.wParam := VK_TAB;
        end;
end;
function GetFileHashMD5(FileName: WideString): String;
var
  HashMD5: THashMD5;
  Stream: TStream;
  Readed: Integer;
  Buffer: PByte;
  BufLen: Integer;
begin
  HashMD5 := THashMD5.Create;
  BufLen := 16 * 1024;
  Buffer := AllocMem(BufLen);
  try
    Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    try
      while Stream.Position < Stream.Size do
      begin
        Readed := Stream.Read(Buffer^, BufLen);
        if Readed > 0 then
        begin
          HashMD5.update(Buffer^, Readed);
        end;
      end;
    finally
      Stream.Free;
    end;
  finally
    FreeMem(Buffer)
  end;
  result := HashMD5.HashAsString;
end;
function GetFileHashSHA1(FileName: WideString): String;
var
  HashSHA: THashSHA1;
  Stream: TStream;
  Readed: Integer;
  Buffer: PByte;
  BufLen: Integer;
begin
  HashSHA := THashSHA1.Create;
  BufLen := 16 * 1024;
  Buffer := AllocMem(BufLen);
  try
    Stream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
    try
      while Stream.Position < Stream.Size do
      begin
        Readed := Stream.Read(Buffer^, BufLen);
        if Readed > 0 then
        begin
          HashSHA.update(Buffer^, Readed);
        end;
      end;
    finally
      Stream.Free;
    end;
  finally
    FreeMem(Buffer)
  end;
  result := HashSHA.HashAsString;
end;


procedure TForm2.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
CambiarENTERporTAB (Msg);
end;

procedure TForm2.btn1Click(Sender: TObject);
begin
FormVerfactura:= TFormVerfactura.Create(Application);
      try
          with FormVerfactura do
          begin
          Caption:= 'SELECCIONES LA FACTURA A DESPACHAR';
          docProceso:=0;

          ShowModal;
          end;

      finally
       FormVerfactura.Free;

      end;
end;

procedure TForm2.btn2Click(Sender: TObject);
begin

    FormProcesos:= TformProcesos.Create(Application);
      try
          with FormProcesos do
          begin
          Caption:= 'SELECCIONES EL PROCESO A EJECUTAR';

          ShowModal;
          end;

      finally
       FormProcesos.Free;

      end;
      end;


procedure TForm2.btn3Click(Sender: TObject);
begin
//formEliminar:= TformEliminar.Create(Application);
//      try
//          with formEliminar do
//          begin
//          Caption:= 'SELECCIONA EL PRODUCTO A ELIMINAR';
//          docProceso:=1;
//
//          ShowModal;
//          end;
//
//      finally
//       formEliminar.Free;
//
//      end;
FormVerfactura:= TFormVerfactura.Create(Application);
      try
          with FormVerfactura do
          begin
          Caption:= 'SELECCIONES LA FACTURA A DESPACHAR';
          docProceso:=1;

          ShowModal;
          end;

      finally
       FormVerfactura.Free;

      end;
end;

procedure TForm2.btn4Click(Sender: TObject);
begin
    formComisiones:= TformComisiones.Create(Application);
      try
          with formComisiones do
          begin
          Caption:= 'GENERAR COMISIONES';

          ShowModal;
          end;

      finally
       formComisiones.Free;

      end;
end;

procedure TForm2.btn5Click(Sender: TObject);
begin
  CambiarCo:= TCambiarCo.Create(Application);
      try
          with CambiarCo do
          begin
          Caption:= 'CAMBIAR CODIGO';

          ShowModal;
          end;

      finally
       CambiarCo.Free;

      end;
end;

procedure TForm2.btn6Click(Sender: TObject);
var
rutacarpeta, fecha : string;
begin
  formProductos:= TformProductos.Create(Application);
      try
          with formProductos do
          begin
          Caption:= 'VER PRODUCTOS';

          ShowModal;
          end;

      finally
       formProductos.Free;

      end;
//fecha:='';
//rutacarpeta:= 'C:\Lista de Precios\';
// with d.sqLista do
// begin
//   Close;
//   Open;
// end;
//// with frLista do
////  begin
////
////     ShowReport;
////  end;
//
//   with expListaPrecios do
//  begin
//   ShowDialog:=True;
//   FileName:=rutaCarpeta+empresa+' - Lista de Precios'+'.xlsx';
//   frlista.PrepareReport;
//   frLista.Export(expListaPrecios);
//  end;
end;

procedure TForm2.btn7Click(Sender: TObject);
begin
formEtiquetas:= TformEtiquetas.Create(Application);
      try
          with formEtiquetas do
          begin
          Caption:= 'IMPRIMIR ETIQUETAS';


          ShowModal;
          end;

      finally
       formEtiquetas.Free;

      end;
end;

procedure TForm2.btn8Click(Sender: TObject);
begin
  formLicores:= TformLicores.Create(Application);
      try
          with formLicores do
          begin
          Caption:= 'LIBRO DE LICORES';

          ShowModal;
          end;

      finally
       formLicores.Free;

      end;
end;

procedure TForm2.btn9Click(Sender: TObject);
begin
formProductosVendidos:= TformProductosVendidos.Create(Application);
      try
          with formProductosVendidos do
          begin
         Caption:= 'ANALISIS DE PRODUCTOS';

          ShowModal;
          end;

      finally
       formProductosVendidos.Free;

      end;
end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
    VK_F12:
    begin
    FormProcesos:= TformProcesos.Create(Application);
      try
          with FormProcesos do
          begin
          Caption:= 'SELECCIONES EL PROCESO A EJECUTAR';

          ShowModal;
          end;

      finally
       FormProcesos.Free;

      end;
               end;
   end;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  F,G: TextFile;
    sLinea, h1,h2,LICA2: String;
    hashmd5:string;
    licencia:TCipher;
    F2: TextFile;
begin
   with d.datprincipal do
        begin
        Connected:=False;
        Directory:='';
        DatabaseName:='datprincipal';
        Directory:='datos';
        Connected:=True;
        end;

         with d.sqconfig do
         begin
         close;
         ExecSQL;
         directorioa2:=FieldByName('ADMIN').AsString;
         directorio_datos:=FieldByName('DATOS').AsString;
         directoriolocal:=FieldByName('TEMPORAL').AsString;
         end;
    with d.data2 do
        begin
        Connected:=False;
        Directory:='';
        DatabaseName:='data2';
        Directory:=directorioa2+'\'+directorio_datos;
        Connected:=True;
        end;

     with d.datlocal do
        begin
        Connected:=False;
        Directory:='';
        DatabaseName:='datlocal';
        Directory:=directoriolocal;
        Connected:=True;
        end;


//Verificar LIC
LICA2:=directorioa2+'\'+'a2admin.A2';
//LICA2:=directorioa2+'\'+'a2Basico.A2';
//ShowMessage(LICA2);
if FileExists('kairos.md') then
  begin
    licencia:= TCipher.Create;
    mmoprelicencia.Lines.LoadFromFile( ExtractFilePath( Application.ExeName ) + 'kairos.md' );
    mmolicencia.Text:=licencia.DecryptString(mmoprelicencia.text,Edt3.Text, cifrado.haMD5);
    h2:=mmolicencia.Lines[0];
    empresa:=mmolicencia.Lines[1];
    serial:=mmolicencia.Lines[2];
    version:=mmolicencia.Lines[3];
    licencia.Free;

    end
  else
  begin
     MessageDlg('NO EXISTE LA LICENCIA', mtCustom, [mbOK], 0);
                Application.Terminate;
  end;
  if FileExists(LICA2) then
  begin
           h1:=GetFileHashMD5(LICA2);
           h1:=UpperCase(h1);

            if   h1 <> h2 then

            begin
                MessageDlg(h1 + h2, mtCustom, [mbOK], 0);
                Application.Terminate;
            end;

  end
  else
  begin
     MessageDlg('NO EXISTE LA LICENCIA DE a2 Asociada', mtCustom, [mbOK], 0);
                Application.Terminate;
  end;
  Caption:='EMPRESA: ' +empresa ;
  unitvariables.empresa:=empresa;
  edt1.Text:= empresa;
  stat1.SimplePanel := True;
  stat1.SimpleText := 'Serial: '+serial;
end;

end.



