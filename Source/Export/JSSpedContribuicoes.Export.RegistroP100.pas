unit JSSpedContribuicoes.Export.RegistroP100;

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
  cP100 = '|P100|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroP100 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegP100: TJSSpedContribuicoesModelRegistroP100;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroP100 }

function TJSSpedContribuicoesExportRegistroP100.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroP100>(AModel, FRegP100);

  result := Format( cP100,
                    [JSSF.formatData(FRegP100.dtIni)              ,
                     JSSF.formatData(FRegP100.dtFin)              ,
                     JSSF.formatCurrency(FRegP100.vlRecTotEst)    ,
                     FRegP100.codAtivEcon                         ,
                     JSSF.formatCurrency(FRegP100.vlRecAtivEstab) ,
                     JSSF.formatCurrency(FRegP100.vlExc)          ,
                     JSSF.formatCurrency(FRegP100.vlBcCont)       ,
                     JSSF.formatCurrency(FRegP100.aliqCont, 4)    ,
                     JSSF.formatCurrency(FRegP100.vlContApu)      ,
                     FRegP100.codCta                              ,
                     FRegP100.infoCompl]);
end;

end.
