unit funciones;

interface

uses
    dialogs,SysUtils, UnitDatos,Windows, Controls, Forms, StdCtrls, Classes;
var
  user,
  serie,
  nom_usuario,
  ape_usuario,
  empresa: String;
                function UsuarioValido(usuario, clave: string): Boolean;


implementation


//encriptar datos


function UsuarioValido(usuario, clave: string): Boolean;
begin
  try
    d.squsuarios.ParamByName('pnombre').AsString := usuario;
    d.squsuarios.ParamByName('pclave').AsString := clave;
    d.squsuarios.ExecSQL;
    result := not d.squsuarios.IsEmpty;

  finally
   d.squsuarios.Close;
  end;
end;

end.
