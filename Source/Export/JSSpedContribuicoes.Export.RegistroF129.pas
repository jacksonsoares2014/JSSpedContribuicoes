unit JSSpedContribuicoes.Export.RegistroF129;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cF129 = '|F129|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF129 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF129: TJSSpedContribuicoesModelRegistroF129;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF129 }

function TJSSpedContribuicoesExportRegistroF129.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF129>(AModel, FRegF129);

  result := Format( cF129, [FRegF129.numProc, FRegF129.indProc.toString]);
end;

end.

