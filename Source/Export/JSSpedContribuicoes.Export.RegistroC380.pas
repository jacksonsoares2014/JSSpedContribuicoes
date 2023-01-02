unit JSSpedContribuicoes.Export.RegistroC380;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC380 = '|C380|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC380 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC380: TJSSpedContribuicoesModelRegistroC380;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC380 }

function TJSSpedContribuicoesExportRegistroC380.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC380>(AModel, FRegC380);

  result := Format( cC380,
                    [FRegC380.codMod,
                     JSSF.formatData(FRegC380.dtDocIni),
                     JSSF.formatData(FRegC380.dtDocFin),
                     FRegC380.numDocIni,
                     FRegC380.numDocFin,
                     JSSF.formatCurrency(FRegC380.vlDoc),
                     JSSF.formatCurrency(FRegC380.vlDocCanc)]);
end;

end.
