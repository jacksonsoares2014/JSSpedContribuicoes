unit JSSpedContribuicoes.Export.RegistroF990;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroF990 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF990: TJSSpedContribuicoesModelRegistroF990;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF990 }

function TJSSpedContribuicoesExportRegistroF990.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF990>(AModel, FRegF990);

  result := Format('|F990|%d|',[FRegF990.qtdLinF]);
end;

end.
