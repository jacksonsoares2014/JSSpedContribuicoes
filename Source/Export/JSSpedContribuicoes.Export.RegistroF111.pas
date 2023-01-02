unit JSSpedContribuicoes.Export.RegistroF111;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cF111 = '|F111|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF111 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF111: TJSSpedContribuicoesModelRegistroF111;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF111 }

function TJSSpedContribuicoesExportRegistroF111.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF111>(AModel, FRegF111);

  result := Format( cF111, [FRegF111.numProc, FRegF111.indProc.toString]);
end;

end.

