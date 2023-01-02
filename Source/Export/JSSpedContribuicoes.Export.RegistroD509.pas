unit JSSpedContribuicoes.Export.RegistroD509;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroD509 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD509: TJSSpedContribuicoesModelRegistroD509;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD509 }

function TJSSpedContribuicoesExportRegistroD509.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD509>(AModel, FRegD509);

  result := Format('|D509|%s|%s|',[FRegD509.numProc,FRegD509.indProc.toString]);
end;

end.
