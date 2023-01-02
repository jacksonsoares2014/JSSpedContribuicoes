unit JSSpedContribuicoes.Export.RegistroD100;

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
  cD100 = '|D100|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroD100 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD100: TJSSpedContribuicoesModelRegistroD100;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD100 }

function TJSSpedContribuicoesExportRegistroD100.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD100>(AModel, FRegD100);

  result := Format( cD100,
                    [FRegD100.indOper.toString                 ,
                     FRegD100.indEmit.toString                 ,
                     FRegD100.codPart                          ,
                     FRegD100.codMod                           ,
                     FRegD100.codSit.toString                  ,
                     FRegD100.serie                            ,
                     FRegD100.subserie                         ,
                     FRegD100.numDoc                           ,
                     FRegD100.chvCTe                           ,
                     JSSF.formatData(FRegD100.dtDoc)           ,
                     JSSF.formatData(FRegD100.dtAp)            ,
                     FRegD100.tpCte                            ,
                     FRegD100.chvCTeRef                        ,
                     JSSF.formatCurrency(FRegD100.vlDoc)       ,
                     JSSF.formatCurrency(FRegD100.vlDesc)      ,
                     FRegD100.indFrt.toString                  ,
                     JSSF.formatCurrency(FRegD100.vlServ)      ,
                     JSSF.formatCurrency(FRegD100.vlBcIcms)    ,
                     JSSF.formatCurrency(FRegD100.vlIcms)      ,
                     JSSF.formatCurrency(FRegD100.vlNt)        ,
                     FRegD100.codInf                           ,
                     FRegD100.codCta]);
end;

end.
