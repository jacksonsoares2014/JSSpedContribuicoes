unit JSSpedContribuicoes.Export.Registro0990;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistro0990 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0990 }

function TJSSpedContribuicoesExportRegistro0990.linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string;
var
  reg0990 : TJSSpedContribuicoesModelRegistro0990;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0990>(AModel, reg0990);
  Result := Format('|0990|%d|',[reg0990.qtdlin0]);
end;

end.
