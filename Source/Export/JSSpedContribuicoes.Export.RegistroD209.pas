unit JSSpedContribuicoes.Export.RegistroD209;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroD209 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD209: TJSSpedContribuicoesModelRegistroD209;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD209 }

function TJSSpedContribuicoesExportRegistroD209.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD209>(AModel, FRegD209);

  result := Format('|D209|%s|%s|',[FRegD209.numProc,FRegD209.indProc.toString]);
end;

end.
