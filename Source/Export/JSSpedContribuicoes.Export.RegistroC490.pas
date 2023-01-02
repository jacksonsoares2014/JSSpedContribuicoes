unit JSSpedContribuicoes.Export.RegistroC490;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC490 = '|C490|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC490 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC490: TJSSpedContribuicoesModelRegistroC490;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC490 }

function TJSSpedContribuicoesExportRegistroC490.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC490>(AModel, FRegC490);

  result := Format( cC490,
                    [JSSF.formatData(FRegC490.dtDocIni),
                     JSSF.formatData(FRegC490.dtDocFin),
                     FRegC490.codMod]);
end;

end.
