unit JSSpedContribuicoes.Export.RegistroM001;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroM001 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM001: TJSSpedContribuicoesModelRegistroM001;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM001 }

function TJSSpedContribuicoesExportRegistroM001.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM001>(AModel, FRegM001);

  result := Format('|M001|%d|', [Integer(FRegM001.indMov)]);
end;

end.
