unit JSSpedContribuicoes.Export.RegistroC111;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cC111 = '|C111|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC111 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC111: TJSSpedContribuicoesModelRegistroC111;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC111 }

function TJSSpedContribuicoesExportRegistroC111.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC111>(AModel, FRegC111);

  result := Format( cC111, [FRegC111.numProc, FRegC111.indProc.toString]);
end;

end.

