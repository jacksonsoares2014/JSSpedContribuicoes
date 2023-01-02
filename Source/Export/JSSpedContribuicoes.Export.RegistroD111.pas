unit JSSpedContribuicoes.Export.RegistroD111;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;


type
  TJSSpedContribuicoesExportRegistroD111 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD111: TJSSpedContribuicoesModelRegistroD111;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD111 }

function TJSSpedContribuicoesExportRegistroD111.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD111>(AModel, FRegD111);

  result := Format('|D111|%s|%s|',[FRegD111.numProc, FRegD111.indProc.toString]);
end;

end.
