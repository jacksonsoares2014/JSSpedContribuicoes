unit JSSpedContribuicoes.Export.RegistroP990;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroP990 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegP990: TJSSpedContribuicoesModelRegistroP990;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroP990 }

function TJSSpedContribuicoesExportRegistroP990.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroP990>(AModel, FRegP990);

  result := Format('|P990|%d|',[FRegP990.qtdLinP]);
end;

end.
