unit JSSpedContribuicoes.Export.RegistroA111;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroA111 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegA111: TJSSpedContribuicoesModelRegistroA111;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroA111 }

function TJSSpedContribuicoesExportRegistroA111.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroA111>(AModel, FRegA111);

  Result := Format('|A111|%s|%s|',[FRegA111.numProc, FRegA111.indProc.toString]);
end;

end.
