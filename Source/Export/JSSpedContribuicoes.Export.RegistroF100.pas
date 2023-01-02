unit JSSpedContribuicoes.Export.RegistroF100;

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
  cF100 = '|F100|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF100 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF100: TJSSpedContribuicoesModelRegistroF100;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF100 }

function TJSSpedContribuicoesExportRegistroF100.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF100>(AModel, FRegF100);

  result := Format( cF100,
                    [FRegF100.indOper.toString                   ,
                     FRegF100.codPart                            ,
                     FRegF100.codItem                            ,
                     JSSF.formatData(FRegF100.dtOper)            ,
                     JSSF.formatCurrency(FRegF100.vlOper)        ,
                     FRegF100.cstPis                             ,
                     JSSF.formatCurrency(FRegF100.vlBcPis, 4)    ,
                     JSSF.formatCurrency(FRegF100.aliqPis, 4)    ,
                     JSSF.formatCurrency(FRegF100.vlPis)         ,
                     FRegF100.cstCofins                          ,
                     JSSF.formatCurrency(FRegF100.vlBcCofins, 4) ,
                     JSSF.formatCurrency(FRegF100.aliqCofins, 4) ,
                     JSSF.formatCurrency(FRegF100.vlCofins)      ,
                     FRegF100.natBcCred                          ,
                     FRegF100.indOrigCred.toString               ,
                     FRegF100.codCta                             ,
                     FRegF100.codCcus                            ,
                     FRegF100.descDocOper]);
end;

end.
