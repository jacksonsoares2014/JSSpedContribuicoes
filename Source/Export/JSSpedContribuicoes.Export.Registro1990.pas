unit JSSpedContribuicoes.Export.Registro1990;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistro1990 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1990 }

function TJSSpedContribuicoesExportRegistro1990.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
var
  reg1990 : TJSSpedContribuicoesModelRegistro1990;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1990>(AModel, reg1990);
  Result := Format('|1990|%d|',[reg1990.qtdlin1]);
end;

end.
