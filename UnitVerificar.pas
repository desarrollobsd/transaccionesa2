unit UnitVerificar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, dbisamtb,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons, frxClass, frxDBSet,
  frxBarcode, frxCellularTextObject, sicm, ShellApi;

type
  TFormVerificar = class(TForm)
    Label2: TLabel;
    sqProducto: TDBISAMQuery;
    Button1: TButton;
    LabelCantidad: TLabel;
    LabCantidad: TLabel;
    LabArticulo: TLabel;
    Timer1: TTimer;
    sqtmporden: TDBISAMQuery;
    sqorden: TDBISAMQuery;
    dsorden: TDataSource;
    tdetorden: TDBISAMTable;
    sqborrar: TDBISAMQuery;
    sqcantidad: TDBISAMQuery;
    squpdate: TDBISAMQuery;
    sqcantidadp: TDBISAMQuery;
    pnl1: TPanel;
    labelDocumento: TLabel;
    lbl4: TLabel;
    labelCliente: TLabel;
    labelProducto: TLabel;
    edtCodigo: TEdit;
    labelAlerta: TLabel;
    label1: TLabel;
    pnl2: TPanel;
    labellbl1: TLabel;
    lblCNTP: TLabel;
    lbl2: TLabel;
    lblCNTV: TLabel;
    pnl3: TPanel;
    lblDIF: TLabel;
    lbl3: TLabel;
    grid1: TDBGrid;
    pnl4: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    pnl5: TPanel;
    rgOpcion: TRadioGroup;
    repetiqueta: TfrxReport;
    rds1: TfrxDBDataset;
    mmo1: TMemo;
    sqCerrar: TDBISAMQuery;
    sqrecorrer: TDBISAMQuery;
    barcode1: TfrxBarCodeObject;
    frxrprtclrtxtbjct1: TfrxReportCellularTextObject;
    sqvendedor: TDBISAMQuery;
    lbl5: TLabel;
    lblVendedor: TLabel;
    lblbultos: TLabel;
    edtbultos: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure edtbultosExit(Sender: TObject);
    procedure edtCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure grid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  FormVerificar: TFormVerificar;
  serv_farmapatria: SicmPortType;
  guia_farmapatria,
  cod_seguridad,
  nro_scim,
  url_guia:string;
  documento,
  direccion,
  cel_vendedor,
  urlwp,
  vendedor: string;
  cantidad,
  cantidaddespachada,
  cantidadpendiente,
  canttemp: Currency;
  nroregistro,
  accion: Integer;
   ClaveSupervisor: string;

implementation

{$R *.dfm}

uses UnitDatos, UnitPrincipal, UnitClave;
function ValidarClaveSupervisor(const ClaveSupervisor: string): Boolean;
begin
  if ClaveSupervisor = '02289106' then
  begin
    Result:=True;
  end
  else
  begin
    Result:=False;
  end;
end;

procedure MostrarMensajeError(const Mensaje: string);
begin
  // Mostrar mensaje de error
  ShowMessage(Mensaje);
end;

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
    Formulario.Height := 160;
    Formulario.Position:=poMainFormCenter;

    // Crear campo de texto para la clave
    ClaveEdit := TEdit.Create(Formulario);
    ClaveEdit.Parent := Formulario;
    ClaveEdit.PasswordChar:='*';
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

function IsFloat(s: string): boolean;
var n: double;
begin
try
 n:=StrToFloat(s);
 result:=True;
 except
 result:=False;
 end;
end;

function IsInteger(s: string): boolean;
var n: integer;
begin
try
 n:=StrToInt(s);
 result:=True;
 except
 result:=False;
 end;
end;
procedure TFormVerificar.btn1Click(Sender: TObject);
begin
Close;
end;

procedure TFormVerificar.btn2Click(Sender: TObject);
var
cantrestante:Currency;
i, n: Integer;
begin

    case rgOpcion.ItemIndex of
      0: begin
       if edtbultos.Text='' then
          BEGIN
            edtbultos.Text:='1';
          END;

      if Trim(lblCNTV.Caption) < Trim(lblCNTP.Caption)  then
               begin
                 if not MostrarFormularioClaveSupervisor(ClaveSupervisor) then
            Exit; // Cancelar el proceso si se cancela el formulario

          // Validar la clave del supervisor
          if not ValidarClaveSupervisor(ClaveSupervisor) then
          begin
            MostrarMensajeError('Clave del supervisor incorrecta');
            Exit; // Cancelar el proceso si la clave es incorrecta
          end;
           with sqrecorrer do
        begin
        Close;
        ParamByName('pdocumento').AsString:=documento;
        Open;
        end;
        if not sqrecorrer.IsEmpty then
        begin
          sqrecorrer.First;
          while not sqrecorrer.Eof do
            begin

            with sqCerrar do
              begin
                Close;
                SQL.Clear;
                SQL.Add('UPDATE  SDETALLEVENTA SET FDI_CANTIDADPENDIENTE = :pCantPendiente');
                SQL.Add('WHERE  FDI_CODIGO = :pCodigo');
                SQL.Add('AND FDI_OPERACION_AUTOINCREMENT = :pnroregistro');
                ParamByName('pCantPendiente').AsCurrency:=sqrecorrer.FieldByName('OM_CANTPENDIENTE').AsCurrency;
                ParamByName('pCodigo').AsString:=sqrecorrer.FieldByName('OM_CODIGO').AsString;
                ParamByName('pnroregistro').AsInteger:=nroregistro;
                ExecSQL;
               sqrecorrer.Next;
              end;

            end;
        end;
         //Imprimimos la Etiqueta
       //  i:=StrToInt(edtbultos.Text);
             for i := 1 to StrToInt(edtbultos.Text) do
                begin
                  // Aqu� puedes establecer los par�metros del informe si es necesario.
                    with repetiqueta do
                     begin
                       urlwp:='https://wa.me/'+cel_vendedor+'?text=Escribo%20de%20'+labelCliente.Caption+'%2C%20Relacionado%20al%20Documento%20Nro%20'+documento;
                       Variables['empresa']:=QuotedStr(empresa);
                       Variables['factura']:=QuotedStr(documento);
                       Variables['cliente']:=QuotedStr(labelCLIENTE.Caption);
                       Variables['direccion']:=QuotedStr(mmo1.Text);
                       Variables['rif_empresa']:=QuotedStr('J500726856');
                       Variables['url']:=QuotedStr(urlwp);
                       Variables['copia']:=IntToStr(i);
                       Variables['nrocopias']:=QuotedStr(edtbultos.Text);
                       PrintOptions.ShowDialog:=False;
                       PrepareReport(True);
                       Print;
                     end;
                end;




         Close;
               end
               else
               begin
                  with sqrecorrer do
        begin
        Close;
        ParamByName('pdocumento').AsString:=documento;
        Open;
        end;
        if not sqrecorrer.IsEmpty then
        begin
          sqrecorrer.First;
          while not sqrecorrer.Eof do
            begin

            with sqCerrar do
              begin
                Close;
                SQL.Clear;
                SQL.Add('UPDATE  SDETALLEVENTA SET FDI_CANTIDADPENDIENTE = :pCantPendiente');
                SQL.Add('WHERE  FDI_CODIGO = :pCodigo');
                SQL.Add('AND FDI_OPERACION_AUTOINCREMENT = :pnroregistro');
                ParamByName('pCantPendiente').AsCurrency:=sqrecorrer.FieldByName('OM_CANTPENDIENTE').AsCurrency;
                ParamByName('pCodigo').AsString:=sqrecorrer.FieldByName('OM_CODIGO').AsString;
                ParamByName('pnroregistro').AsInteger:=nroregistro;
                ExecSQL;
               sqrecorrer.Next;
              end;

            end;
        end;
         //Imprimimos la Etiqueta
       //  i:=StrToInt(edtbultos.Text);
             for i := 1 to StrToInt(edtbultos.Text) do
                begin
                  // Aqu� puedes establecer los par�metros del informe si es necesario.
                    with repetiqueta do
                     begin
                       urlwp:='https://wa.me/'+cel_vendedor+'?text=Escribo%20de%20'+labelCliente.Caption+'%2C%20Relacionado%20al%20Documento%20Nro%20'+documento;
                       Variables['empresa']:=QuotedStr(empresa);
                       Variables['factura']:=QuotedStr(documento);
                       Variables['cliente']:=QuotedStr(labelCLIENTE.Caption);
                       Variables['direccion']:=QuotedStr(mmo1.Text);
                       Variables['rif_empresa']:=QuotedStr('J500726856');
                       Variables['url']:=QuotedStr(urlwp);
                       Variables['copia']:=IntToStr(i);
                       Variables['nrocopias']:=QuotedStr(edtbultos.Text);
                       PrintOptions.ShowDialog:=False;
                       PrepareReport(True);
                       Print;
                     end;
                end;




         Close;
               end;
                //Abrimos la consulta

         end;
      1: begin
          If IsInteger(edtbultos.text) then
          begin
              try
             //Inicializamos la Guia
             serv_farmapatria:=GetSicmPortType;
             guia_farmapatria:= serv_farmapatria.inicializar_guia(cod_seguridad, StrToInt(nro_scim), StrToInt(edtbultos.Text), documento);
                //Agregamos el Detalle a la Guia
                 with sqrecorrer do
                 begin
                  Close;
                  ParamByName('pdocumento').AsString:=documento;
                  Open;
                  end;
            if not sqrecorrer.IsEmpty then
            begin
              sqrecorrer.First;
              while not sqrecorrer.Eof do
                begin
                serv_farmapatria.guia_detalle_desc(cod_seguridad,StrToInt(guia_farmapatria), sqrecorrer.FieldByName('OM_MOLECULA').AsString, sqrecorrer.FieldByName('OM_LOTE').AsString,0, sqrecorrer.FieldByName('OM_CANT').AsInteger, sqrecorrer.FieldByName('OM_MOLECULA').AsString );
                sqrecorrer.Next;
                end;

            end;
            serv_farmapatria.guia_validar(cod_seguridad, StrToInt(guia_farmapatria));
            ShowMessage('Se ha Creado la Guia Nro: '+ guia_farmapatria);
            url_guia:='http://www.sicm.gob.ve/g_4cguia.php?id_guia='+guia_farmapatria;

            ShellExecute (0, 'open', PChar (url_guia), '', '', SW_SHOWNORMAL);

            except
              On E: Exception do
              begin
                showmessage('Error: ' + E.ClassName + ' ' + E.Message);
              end;

            end;

         end
         else
         begin
           ShowMessage('El Numero de Bultos debe ser un Numero Entero');
           edtbultos.SetFocus;
         end;
      end;

end;
end;

procedure TFormVerificar.Button1Click(Sender: TObject);
begin
with sqProducto do
begin
  close;
  ParamByname('pCodigo').AsString:=EdtCodigo.Text;
  ParamByname('pDocumento').AsString:=labeldocumento.Caption;
  ParamByname('pTipo').Asinteger:=11;
  open;
  if sqproducto.IsEmpty then
   begin
     labelAlerta.Caption:='NO EXISTE';
     labcantidad.Visible:=false;
     labArticulo.Visible:=false;
     labelcantidad.Visible:=false;
     labelProducto.Caption:='';

   end
   else
   begin
     labcantidad.Visible:=true;
     labArticulo.Visible:=true;
     labelcantidad.Visible:=true;
     labelcantidad.caption:=sqproducto.FieldByName('FDI_CANTIDAD').AsString;
     labelProducto.Caption:=sqproducto.FieldByName('FI_DESCRIPCION').AsString;
     timer1.enabled:=true;
   end;
end;
end;

procedure TFormVerificar.edtbultosExit(Sender: TObject);
begin
   case accion of
   1:begin
     if edtbultos.Text = '' then
     begin
       ShowMessage('Debe Indicar la Canntidad de Bultos');
       edtbultos.SetFocus;
     end
     else
     if edtbultos.Text = '0' then
     begin
       ShowMessage('La Cantidad de Bultos debe ser mayor a 0');
     end;
   end;
   end;

end;

procedure TFormVerificar.edtCodigoClick(Sender: TObject);
begin
labelAlerta.Caption:='';
labelProducto.Caption:='';
labcantidad.Visible:=false;
     labArticulo.Visible:=false;
     labelcantidad.Visible:=false;
     edtCodigo.Clear;
//Timer1.Enabled:=False;

end;

procedure TFormVerificar.edtCodigoExit(Sender: TObject);
begin
if edtCodigo.Text <> '' then
  begin
    with sqProducto do
begin
  close;
  ParamByname('pCodigo').AsString:=EdtCodigo.Text;
  ParamByname('pDocumento').AsString:=labeldocumento.Caption;
  ParamByname('pTipo').Asinteger:=11;
  open;
  if sqproducto.IsEmpty then
   begin
     labelAlerta.Caption:='NO EXISTE';
     labcantidad.Visible:=false;
     labArticulo.Visible:=false;
     labelcantidad.Visible:=false;
     timer1.enabled:=true;
   end
   else
   begin
     labelcantidad.caption:=sqproducto.FieldByName('FDI_CANTIDAD').AsString;
     labelProducto.Caption:=sqproducto.FieldByName('FI_DESCRIPCION').AsString;
     timer1.enabled:=true;
       with sqcantidadp do
       begin
       Close;
       ParamByName('pCodigo').AsString:=EdtCodigo.Text;
       Open;
       canttemp:=sqcantidadp.FieldByName('OM_CANTPENDIENTE').AsCurrency;
       end;

          if canttemp >= 1 then
          begin
            with squpdate do
            begin
              Close;
              ParamByName('pCant').AsCurrency:=canttemp;
              ParamByName('pCodigo').AsString:=EdtCodigo.Text;
              ExecSQL;
            end;
          cantidaddespachada:=cantidaddespachada + 1;
          end
          else
          begin
            ShowMessage('La Cantidad Despachada Supera la Cantidad Pedida');
          end;



   end;
    with sqtmporden do
      begin
        Close;
        ParamByName('pdocumento').AsString:=documento;
        Open;
      end;
      with sqcantidad do
      begin
         Close;
        ParamByName('pdocumento').AsString:=documento;
        Open;
        cantidad:=sqcantidad.FieldByName('CANTIDAD').AsCurrency;
      end;
lblCNTV.Caption:=CurrToStr(cantidaddespachada);
cantidadpendiente:=cantidad - cantidaddespachada;
lblDIF.Caption:=CurrToStr(cantidadpendiente);
EdtCodigo.SetFocus;
end;
  end;
end;

procedure TFormVerificar.edtCodigoKeyPress(Sender: TObject; var Key: Char);
begin
Timer1.Enabled:=True;

end;

procedure TFormVerificar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with sqborrar do
      begin
        Close;
        ParamByName('pdocumento').AsString:=documento;
        ExecSQL;
      end;
end;

procedure TFormVerificar.FormShow(Sender: TObject);
var
cant_pendiente,
cant_actual:Currency;
begin
// edtCodigo.ReadOnly:=True;
cantidaddespachada:=0;
cod_seguridad:='56ptNLPLZuTNIGOFs019FQhhWd6KCNIQf1z1N9QYgOU2z/OxmNsO4/rfup+uxpUQWTyLmLiW4b7gMed7VzyQJk';

 case accion of
 0: begin
      Caption:='VERIFICAR DOCUMENTO '+documento;
      labelAlerta.Caption:='';
      lblCNTV.Caption:='0';
      lblCNTP.Caption:='0';
      lblDIF.Caption:='0';
      labelProducto.Caption:='';
      labcantidad.Visible:=false;
      labArticulo.Visible:=false;
      labelcantidad.Visible:=false;
      edtCodigo.Visible:=True;
      lblbultos.Visible:=true;
      edtbultos.Visible:=True;
      with sqorden do
        begin
          close;
          ParamByname('pDocumento').AsString:=documento;
          ParamByname('pTipo').Asinteger:=11;
           ParamByName('pnroregistro').AsInteger:=nroregistro;
          open;
        end;
if not sqorden.IsEmpty then
begin
    sqorden.First;
    while not sqorden.Eof do
      begin
        cant_pendiente:=sqorden.FieldByName('FDI_CANTIDADPENDIENTE').AsCurrency;
        cant_actual:=sqorden.FieldByName('FDI_CANTIDAD').AsCurrency;
        if cant_pendiente > cant_actual then
        begin
          cant_pendiente:= cant_actual;
        end;
        tdetorden.Close;
        tdetorden.Open;
        tdetorden.Insert;
        tdetorden.Append;
        tdetorden.FieldByName('OM_CODIGO').AsString:=sqorden.FieldByName('FDI_CODIGO').AsString;
        tdetorden.FieldByName('OM_DESCRIPCION').AsString:=sqorden.FieldByName('FI_DESCRIPCIONDETALLADA').AsString;
        tdetorden.FieldByName('OM_CANT').AsString:=sqorden.FieldByName('FDI_CANTIDAD').AsString;
        tdetorden.FieldByName('OM_CANTPENDIENTE').AsCurrency:=cant_pendiente;
        tdetorden.FieldByName('OM_LOTE').AsString:=sqorden.FieldByName('FDI_LOTE').AsString;
        tdetorden.FieldByName('OM_DOCUMENTO').AsString:=documento;
        tdetorden.FieldByName('OM_MOLECULA').AsString:=sqorden.FieldByName('FI_DESCRIPCIONDETALLADA').AsString;
        tdetorden.Post;
        sqorden.Next;
      end;
      with sqtmporden do
      begin
        Close;
        ParamByName('pdocumento').AsString:=documento;
        Open;
      end;
      with sqcantidad do
      begin
         Close;
        ParamByName('pdocumento').AsString:=documento;
        Open;
        cantidad:=sqcantidad.FieldByName('CANTIDAD').AsCurrency;
      end;
end
else
begin
  ShowMessage('ESTA FACTURA NO TIENE DETALLE');
end;
cantidadpendiente:=cantidad - cantidaddespachada;
lblCNTP.Caption:=CurrToStr(cantidad);
lblDIF.Caption:=CurrToStr(cantidadpendiente);
      rgOpcion.ItemIndex:=accion;
      edtCodigo.SetFocus;

 end;
 1: begin
      Caption:='GENERAR GUIA FARMAPATRIA AL DOCUMENTO '+documento;
      labelAlerta.Caption:='';
      lblCNTV.Caption:='0';
      lblCNTP.Caption:='0';
      lblDIF.Caption:='0';
      labelProducto.Caption:='';
      labcantidad.Visible:=false;
      labArticulo.Visible:=false;
      labelcantidad.Visible:=false;

      LabCantidad.Visible:=False;
      lbl2.Visible:=false;
      lblCNTV.Visible:=False;
      lblbultos.Visible:=True;
      edtbultos.Visible:=True;
      edtCodigo.Enabled:=False;
      with sqorden do
begin
  close;
  ParamByname('pDocumento').AsString:=documento;
  ParamByname('pTipo').Asinteger:=11;
   ParamByName('pnroregistro').AsInteger:=nroregistro;
  open;
end;
if not sqorden.IsEmpty then
begin
    sqorden.First;
    while not sqorden.Eof do
      begin
        cant_pendiente:=sqorden.FieldByName('FDI_CANTIDADPENDIENTE').AsCurrency;
        cant_actual:=sqorden.FieldByName('FDI_CANTIDAD').AsCurrency;
        if cant_pendiente > cant_actual then
        begin
          cant_pendiente:= cant_actual;
        end;
        tdetorden.Close;
        tdetorden.Open;
        tdetorden.Insert;
        tdetorden.Append;
        tdetorden.FieldByName('OM_CODIGO').AsString:=sqorden.FieldByName('FDI_CODIGO').AsString;
        tdetorden.FieldByName('OM_DESCRIPCION').AsString:=sqorden.FieldByName('FI_DESCRIPCIONDETALLADA').AsString;
        tdetorden.FieldByName('OM_CANT').AsString:=sqorden.FieldByName('FDI_CANTIDAD').AsString;
        tdetorden.FieldByName('OM_CANTPENDIENTE').AsCurrency:=cant_pendiente;
        tdetorden.FieldByName('OM_LOTE').AsString:=sqorden.FieldByName('FDI_LOTE').AsString;
        tdetorden.FieldByName('OM_DOCUMENTO').AsString:=documento;
        tdetorden.FieldByName('OM_MOLECULA').AsString:=sqorden.FieldByName('FI_DESCRIPCIONDETALLADA').AsString;
        tdetorden.Post;
        sqorden.Next;
      end;
      with sqtmporden do
      begin
        Close;
        ParamByName('pdocumento').AsString:=documento;
        Open;
      end;
      with sqcantidad do
      begin
         Close;
        ParamByName('pdocumento').AsString:=documento;
        Open;
        cantidad:=sqcantidad.FieldByName('CANTIDAD').AsCurrency;
      end;
end
else
begin
  ShowMessage('ESTA FACTURA NO TIENE DETALLE');
end;
cantidadpendiente:=cantidad - cantidaddespachada;
lblCNTP.Caption:=CurrToStr(cantidad);
lblDIF.Caption:=CurrToStr(cantidadpendiente);
      edtbultos.SetFocus;
      rgOpcion.ItemIndex:=accion;

 end;
 end;

with sqvendedor do
begin
  Close;
  ParamByName('pVendedor').AsString:=vendedor;
  Open;

end;

cel_vendedor:= sqvendedor.FieldByName('FV_TELEFONOS').AsString;
lblVendedor.Caption:=sqvendedor.FieldByName('FV_DESCRIPCION').AsString;

end;

procedure TFormVerificar.grid1DblClick(Sender: TObject);
begin
   if not MostrarFormularioClaveSupervisor(ClaveSupervisor) then
      Exit; // Cancelar el proceso si se cancela el formulario

    // Validar la clave del supervisor
    if not ValidarClaveSupervisor(ClaveSupervisor) then
    begin
      MostrarMensajeError('Clave del supervisor incorrecta');
      Exit; // Cancelar el proceso si la clave es incorrecta
    end;
    edtCodigo.Clear;
    edtCodigo.SetFocus;
    edtCodigo.Text:=sqtmporden.FieldByName('OM_CODIGO').AsString;
    edtCodigoExit(self);
end;

procedure TFormVerificar.Timer1Timer(Sender: TObject);
begin
     labelAlerta.Caption:='';
     labelProducto.Caption:='';
     labcantidad.Visible:=false;
     labArticulo.Visible:=false;
     labelcantidad.Visible:=false;
     edtCodigo.SetFocus;
     edtCodigo.Clear;
     Timer1.Enabled:=false;
end;

end.
