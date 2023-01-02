unit JSSpedContribuicoes.Export.RegistroD001;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroD001 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD001: TJSSpedContribuicoesModelRegistroD001;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD001 }

function TJSSpedContribuicoesExportRegistroD001.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD001>(AModel, FRegD001);

  result := Format('|D001|%d|', [Integer(FRegD001.indMov)]);
end;

end.
