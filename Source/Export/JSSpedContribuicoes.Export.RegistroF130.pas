unit JSSpedContribuicoes.Export.RegistroF130;

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
  cF130 = '|F130|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF130 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF130: TJSSpedContribuicoesModelRegistroF130;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF130 }

function TJSSpedContribuicoesExportRegistroF130.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF130>(AModel, FRegF130);

  result := Format( cF130,
                    [FRegF130.natBcCred                              ,
                     FRegF130.identBemImob.toString                  ,
                     FRegF130.indOrigCred.toString                   ,
                     FRegF130.indUtilBemImob.toString                ,
                     FRegF130.mesOperAquis                           ,
                     JSSF.formatCurrency(FRegF130.vlOperAquis)       ,
                     JSSF.formatCurrency(FRegF130.parcOperNaoBcCred) ,
                     JSSF.formatCurrency(FRegF130.vlBcCred)          ,
                     FRegF130.indNrParc                              ,
                     FRegF130.cstPis                                 ,
                     JSSF.formatCurrency(FRegF130.vlBcPis)           ,
                     JSSF.formatCurrency(FRegF130.aliqPis,4)         ,
                     JSSF.formatCurrency(FRegF130.vlPis)             ,
                     FRegF130.cstCofins                              ,
                     JSSF.formatCurrency(FRegF130.vlBcCofins)        ,
                     JSSF.formatCurrency(FRegF130.aliqCofins,4)      ,
                     JSSF.formatCurrency(FRegF130.vlCofins)          ,
                     FRegF130.codCta                                 ,
                     FRegF130.codCcus                                ,
                     FRegF130.descBemImob]);
end;

end.
