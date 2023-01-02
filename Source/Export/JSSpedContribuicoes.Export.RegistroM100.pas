unit JSSpedContribuicoes.Export.RegistroM100;

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
  cM100 = '|M100|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM100 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM100: TJSSpedContribuicoesModelRegistroM100;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM100 }

function TJSSpedContribuicoesExportRegistroM100.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM100>(AModel, FRegM100);

  result := Format( cM100,
                    [FRegM100.codCred                             ,
                     FRegM100.indCredOri                          ,
                     JSSF.formatCurrency(FRegM100.vlBcPis)        ,
                     JSSF.formatCurrency(FRegM100.aliqPis,4)      ,
                     JSSF.formatCurrency(FRegM100.quantBcPis,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegM100.aliqPisQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegM100.vlCred)         ,
                     JSSF.formatCurrency(FRegM100.vlAjusAcres)    ,
                     JSSF.formatCurrency(FRegM100.vlAjusReduc)    ,
                     JSSF.formatCurrency(FRegM100.vlCredDif)      ,
                     JSSF.formatCurrency(FRegM100.vlCredDisp)     ,
                     FRegM100.indDescCred                         ,
                     JSSF.formatCurrency(FRegM100.vlCredDesc)     ,
                     JSSF.formatCurrency(FRegM100.sldCred)]);
end;

end.
