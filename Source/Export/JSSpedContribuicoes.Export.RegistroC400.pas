unit JSSpedContribuicoes.Export.RegistroC400;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

const
  cC400 = '|C400|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC400 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC400: TJSSpedContribuicoesModelRegistroC400;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC400 }

function TJSSpedContribuicoesExportRegistroC400.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC400>(AModel, FRegC400);

  result := Format( cC400,
                    [FRegC400.codMod,
                     FRegC400.ecfMod,
                     FRegC400.ecfFab,
                     FRegC400.ecfCx]);
end;

end.
