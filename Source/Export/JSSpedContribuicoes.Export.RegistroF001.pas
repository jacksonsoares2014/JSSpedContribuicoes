unit JSSpedContribuicoes.Export.RegistroF001;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroF001 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF001: TJSSpedContribuicoesModelRegistroF001;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF001 }

function TJSSpedContribuicoesExportRegistroF001.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF001>(AModel, FRegF001);

  result := Format('|F001|%d|', [Integer(FRegF001.indMov)]);
end;

end.
