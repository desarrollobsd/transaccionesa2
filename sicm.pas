// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://www.sicm.gob.ve/sicm.php?wsdl
// Encoding : UTF-8
// Version  : 1.0
// (6/5/2023 8:25:12 AM - - $Rev: 86412 $)
// ************************************************************************ //

unit sicm;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:double          - "http://www.w3.org/2001/XMLSchema"[]
  // !:integer         - "http://www.w3.org/2001/XMLSchema"[]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : urn:sicm
  // soapAction: urn:SicmAction
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : encoded
  // binding   : SicmBinding
  // service   : sicmService
  // port      : SicmPort
  // URL       : http://www.sicm.gob.ve/sicm.php
  // ************************************************************************ //
  SicmPortType = interface(IInvokable)
  ['{E1335F10-0F8A-DE47-EABE-9849395F7CA8}']
    function  holasicm(const val: string): string; stdcall;
    function  cargar_guia(const cod_seguridad: string; const string_xml: string): string; stdcall;
    function  inicializar_guia(const cod_seguridad: string; const sicm_destino: Int64; const bultos: Int64; const documentos: string): string; stdcall;
    function  inicializar_guia_devolucion(const cod_seguridad: string; const cod_guia: Int64; const cod_tipo: Int64; const cod_motivo: Int64): string; stdcall;
    function  inicializar_guia_importacion(const cod_seguridad: string; const id_aduana: Int64; const id_agente_aduanal: Int64; const sicm_destino: Int64; const bultos: Int64; const documentos: string
                                           ): string; stdcall;
    function  guia_detalle(const cod_seguridad: string; const cod_guia: Int64; const cod_producto: string; const lote: string; const precio: Double; const cantidad: Int64
                           ): string; stdcall;
    function  actualizar_guia_precio(const cod_seguridad: string; const cod_guia_detalle: Int64; const precio: Double): string; stdcall;
    function  guia_detalle_desc(const cod_seguridad: string; const cod_guia: Int64; const cod_producto: string; const lote: string; const precio: Double; const cantidad: Int64; 
                                const descripcion: string): string; stdcall;
    function  guia_devolucion_detalle(const cod_seguridad: string; const cod_devolucion: Int64; const cod_producto: string; const lote: string; const precio: Double; const cantidad: Int64; 
                                      const descripcion: string): string; stdcall;
    function  guia_anular(const cod_seguridad: string; const cod_guia: Int64): string; stdcall;
    function  guia_denunciar(const cod_seguridad: string; const cod_guia: Int64): string; stdcall;
    function  guia_detalle_eliminar(const cod_seguridad: string; const cod_guia_detalle: Int64): string; stdcall;
    function  guia_validar(const cod_seguridad: string; const cod_guia: Int64): string; stdcall;
    function  guia_status(const cod_seguridad: string; const cod_guia: Int64): string; stdcall;
    function  guia_recepcion(const cod_seguridad: string; const cod_guia: Int64): string; stdcall;
    function  guia_recepcion_detalle(const cod_seguridad: string; const cod_guia: Int64; const cod_guia_detalle: Int64; const cod_producto: string; const recibido: Int64; const lote: string
                                     ): string; stdcall;
    function  carga_existencia(const cod_seguridad: string; const cod_producto: string; const disponible: Int64; const no_disponible: Int64; const cuarentena: Int64): string; stdcall;
    function  carga_precio_existencia(const cod_seguridad: string; const cod_producto: string; const precio: Double; const disponible: Int64; const no_disponible: Int64; const cuarentena: Int64
                                      ): string; stdcall;
    function  carga_falla(const cod_seguridad: string; const cod_producto: string): string; stdcall;
    function  disponibilidad_diaria(const cod_seguridad: string; const codigo_producto: string; const cantidad_producido: Int64; const id_categoria: Int64; const lote: string): string; stdcall;
    function  rnc(const cod_seguridad: string; const codigo_producto: string; const cantidad: Int64; const lote: string; const rnc: string): string; stdcall;
    function  ventas_farmacia(const cod_seguridad: string; const codigo_producto: string; const lote: string; const cedula: Int64; const cantidad: Int64): string; stdcall;
    function  inventario_farmacia(const cod_seguridad: string; const codigo_producto: string; const lote: string; const cantidad: Int64): string; stdcall;
    function  inicializar_inventario(const cod_seguridad: string): string; stdcall;
    function  carga_precio(const cod_seguridad: string; const cod_producto: string; const precio: Double): string; stdcall;
    function  getproducto(const cod_seguridad: string; const cod_barras: string): string; stdcall;
    function  checkproducto(const cod_seguridad: string; const cod_barras: string): string; stdcall;
    function  getproductos(const cod_seguridad: string; const string_xml: string): string; stdcall;
    function  carga_existencias(const cod_seguridad: string; const string_xml: string): string; stdcall;
    function  getexistencia(const cod_seguridad: string; const string_xml: string): string; stdcall;
    function  check_rif(const cod_seguridad: string; const rif: string): string; stdcall;
  end;

function GetSicmPortType(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): SicmPortType;


implementation
  uses System.SysUtils;

function GetSicmPortType(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): SicmPortType;
const
  defWSDL = 'http://www.sicm.gob.ve/sicm.php?wsdl';
  defURL  = 'http://www.sicm.gob.ve/sicm.php';
  defSvc  = 'sicmService';
  defPrt  = 'SicmPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as SicmPortType);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { SicmPortType }
  InvRegistry.RegisterInterface(TypeInfo(SicmPortType), 'urn:sicm', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(SicmPortType), 'urn:SicmAction');

end.