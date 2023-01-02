unit JSSpedContribuicoes.Export.RegistroC405;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils,
  System.DateUtils;

const
  cC405 = '|C405|%s|%d|%d|%d|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC405 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC405: TJSSpedContribuicoesModelRegistroC405;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC405 }

function TJSSpedContribuicoesExportRegistroC405.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC405>(AModel, FRegC405);

  result := Format( cC405,
                    [JSSF.formatData(FRegC405.dtDoc) ,
                     FRegC405.cro,
                     FRegC405.crz,
                     FRegC405.numCooFin,
                     JSSF.formatCurrency(FRegC405.gtFin),
                     JSSF.formatCurrency(FRegC405.vlBrt)]);
end;

end.
