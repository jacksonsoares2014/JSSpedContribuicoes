unit JSSpedContribuicoes.Export.RegistroF120;

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
  cF120 = '|F120|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF120 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF120: TJSSpedContribuicoesModelRegistroF120;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF120 }

function TJSSpedContribuicoesExportRegistroF120.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF120>(AModel, FRegF120);

  result := Format( cF120,
                    [FRegF120.natBcCred                              ,
                     FRegF120.identBemImob.toString                  ,
                     FRegF120.indOrigCred.toString                   ,
                     FRegF120.indUtilBemImob.toString                ,
                     JSSF.formatCurrency(FRegF120.vlOperDep)         ,
                     JSSF.formatCurrency(FRegF120.parcOperNaoBcCred) ,
                     FRegF120.cstPis                                 ,
                     JSSF.formatCurrency(FRegF120.vlBcPis)           ,
                     JSSF.formatCurrency(FRegF120.aliqPis,4)         ,
                     JSSF.formatCurrency(FRegF120.vlPis)             ,
                     FRegF120.cstCofins                              ,
                     JSSF.formatCurrency(FRegF120.vlBcCofins)        ,
                     JSSF.formatCurrency(FRegF120.aliqCofins,4)      ,
                     JSSF.formatCurrency(FRegF120.vlCofins)          ,
                     FRegF120.codCta                                 ,
                     FRegF120.codCcus                                ,
                     FRegF120.descBemImob]);
end;

end.
