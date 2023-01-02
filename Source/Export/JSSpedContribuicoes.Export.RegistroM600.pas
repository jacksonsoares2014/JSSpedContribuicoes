unit JSSpedContribuicoes.Export.RegistroM600;

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
  cM600 = '|M600|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM600 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM600: TJSSpedContribuicoesModelRegistroM600;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM600 }

function TJSSpedContribuicoesExportRegistroM600.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM600>(AModel, FRegM600);

  result := Format( cM600,
                    [JSSF.formatCurrency(FRegM600.vlTotContNcPer),
                     JSSF.formatCurrency(FRegM600.vlTotCredDesc),
                     JSSF.formatCurrency(FRegM600.vlTotCredDescAnt),
                     JSSF.formatCurrency(FRegM600.vlTotContNcDev),
                     JSSF.formatCurrency(FRegM600.vlRetNc),
                     JSSF.formatCurrency(FRegM600.vlOutDedNc),
                     JSSF.formatCurrency(FRegM600.vlContNcRec),
                     JSSF.formatCurrency(FRegM600.vlTotContCumPer),
                     JSSF.formatCurrency(FRegM600.vlRetCum),
                     JSSF.formatCurrency(FRegM600.vlOutDedCum),
                     JSSF.formatCurrency(FRegM600.vlContCumRec),
                     JSSF.formatCurrency(FRegM600.vlTotContRec)]);
end;

end.
