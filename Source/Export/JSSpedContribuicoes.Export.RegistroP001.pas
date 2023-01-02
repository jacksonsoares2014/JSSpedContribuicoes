unit JSSpedContribuicoes.Export.RegistroP001;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroP001 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegP001: TJSSpedContribuicoesModelRegistroP001;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroP001 }

function TJSSpedContribuicoesExportRegistroP001.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroP001>(AModel, FRegP001);

  result := Format('|P001|%d|', [Integer(FRegP001.indMov)]);
end;

end.
