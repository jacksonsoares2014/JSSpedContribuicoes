unit JSSpedContribuicoes.Export.RegistroF139;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cF139 = '|F139|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF139 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF139: TJSSpedContribuicoesModelRegistroF139;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF139 }

function TJSSpedContribuicoesExportRegistroF139.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF139>(AModel, FRegF139);

  result := Format( cF139, [FRegF139.numProc, FRegF139.indProc.toString]);
end;

end.

