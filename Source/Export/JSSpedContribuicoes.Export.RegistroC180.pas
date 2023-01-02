unit JSSpedContribuicoes.Export.RegistroC180;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC180 = '|C180|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC180 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC180: TJSSpedContribuicoesModelRegistroC180;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC180 }

function TJSSpedContribuicoesExportRegistroC180.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC180>(AModel, FRegC180);

  result := Format( cC180,
                    [FRegC180.codMod,
                     JSSF.formatData(FRegC180.dtDocIni),
                     JSSF.formatData(FRegC180.dtDocFin),
                     FRegC180.codItem,
                     FRegC180.codNcm,
                     FRegC180.exIpi,
                     JSSF.formatCurrency(FRegC180.vlTotItem)]);
end;

end.
