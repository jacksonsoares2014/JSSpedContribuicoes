unit JSSpedContribuicoes.Export.RegistroF205;

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
  cF205 = '|F205|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF205 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF205: TJSSpedContribuicoesModelRegistroF205;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF205 }

function TJSSpedContribuicoesExportRegistroF205.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF205>(AModel, FRegF205);

  result := Format( cF205,
                    [JSSF.formatCurrency(FRegF205.vlCusIncAcumAnt)     ,
                     JSSF.formatCurrency(FRegF205.vlCusIncPerEsc)      ,
                     JSSF.formatCurrency(FRegF205.vlCusIncAcum)        ,
                     JSSF.formatCurrency(FRegF205.vlExcBcCusIncAcum)   ,
                     JSSF.formatCurrency(FRegF205.vlBcCusInc)          ,
                     FRegF205.cstPis                                   ,
                     JSSF.formatCurrency(FRegF205.aliqPis,4)           ,
                     JSSF.formatCurrency(FRegF205.vlCredPisAcum)       ,
                     JSSF.formatCurrency(FRegF205.vlCredPisDescAnt)    ,
                     JSSF.formatCurrency(FRegF205.vlCredPisDesc)       ,
                     JSSF.formatCurrency(FRegF205.vlCredPisDescFut)    ,
                     FRegF205.cstCofins                                ,
                     JSSF.formatCurrency(FRegF205.aliqCofins,4)        ,
                     JSSF.formatCurrency(FRegF205.vlCredCofinsAcum)    ,
                     JSSF.formatCurrency(FRegF205.vlCredCofinsDescAnt) ,
                     JSSF.formatCurrency(FRegF205.vlCredCofinsDesc)    ,
                     JSSF.formatCurrency(FRegF205.vlCredCofinsDescFut)]);

end;

end.
