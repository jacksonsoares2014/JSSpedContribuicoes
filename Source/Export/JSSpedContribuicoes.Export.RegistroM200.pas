unit JSSpedContribuicoes.Export.RegistroM200;

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
  cM200 = '|M200|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM200 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM200: TJSSpedContribuicoesModelRegistroM200;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
end;

implementation

{ TJSSpedContribuicoesExportRegistroM200 }

function TJSSpedContribuicoesExportRegistroM200.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM200>(AModel, FRegM200);

  result := Format( cM200,
                    [JSSF.formatCurrency(FRegM200.vlTotContNcPer),
                     JSSF.formatCurrency(FRegM200.vlTotCredDesc),
                     JSSF.formatCurrency(FRegM200.vlTotCredDescAnt),
                     JSSF.formatCurrency(FRegM200.vlTotContNcDev),
                     JSSF.formatCurrency(FRegM200.vlRetNc),
                     JSSF.formatCurrency(FRegM200.vlOutDedNc),
                     JSSF.formatCurrency(FRegM200.vlContNcRec),
                     JSSF.formatCurrency(FRegM200.vlTotContCumPer),
                     JSSF.formatCurrency(FRegM200.vlRetCum),
                     JSSF.formatCurrency(FRegM200.vlOutDedCum),
                     JSSF.formatCurrency(FRegM200.vlContCumRec),
                     JSSF.formatCurrency(FRegM200.vlTotContRec)]);
end;

end.
