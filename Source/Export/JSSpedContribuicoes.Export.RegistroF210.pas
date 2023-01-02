unit JSSpedContribuicoes.Export.RegistroF210;

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
  cF210 = '|F210|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF210 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF210: TJSSpedContribuicoesModelRegistroF210;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF210 }

function TJSSpedContribuicoesExportRegistroF210.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF210>(AModel, FRegF210);

  result := Format( cF210,
                    [JSSF.formatCurrency(FRegF210.vlCusOrc)      ,
                     JSSF.formatCurrency(FRegF210.vlExc)         ,
                     JSSF.formatCurrency(FRegF210.vlCusOrcAju)   ,
                     JSSF.formatCurrency(FRegF210.vlBcCred)      ,
                     FRegF210.cstPis                             ,
                     JSSF.formatCurrency(FRegF210.aliqPis,4)     ,
                     JSSF.formatCurrency(FRegF210.vlCredPisUtil) ,
                     FRegF210.cstCofins                          ,
                     JSSF.formatCurrency(FRegF210.aliqCofins,4)  ,
                     JSSF.formatCurrency(FRegF210.vlCredCofinsUtil)]);
end;

end.
