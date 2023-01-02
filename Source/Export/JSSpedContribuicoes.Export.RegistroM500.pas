unit JSSpedContribuicoes.Export.RegistroM500;

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
  cM500 = '|M500|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM500 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM500: TJSSpedContribuicoesModelRegistroM500;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM500 }

function TJSSpedContribuicoesExportRegistroM500.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM500>(AModel, FRegM500);

  result := Format( cM500,
                    [FRegM500.codCred                                ,
                     FRegM500.indCredOri                             ,
                     JSSF.formatCurrency(FRegM500.vlBcCofins)        ,
                     JSSF.formatCurrency(FRegM500.aliqCofins,4)      ,
                     JSSF.formatCurrency(FRegM500.quantBcCofins,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegM500.aliqCofinsQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegM500.vlCred)            ,
                     JSSF.formatCurrency(FRegM500.vlAjusAcres)       ,
                     JSSF.formatCurrency(FRegM500.vlAjusReduc)       ,
                     JSSF.formatCurrency(FRegM500.vlCredDif)         ,
                     JSSF.formatCurrency(FRegM500.vlCredDisp)        ,
                     FRegM500.indDescCred                            ,
                     JSSF.formatCurrency(FRegM500.vlCredDesc)        ,
                     JSSF.formatCurrency(FRegM500.sldCred)]);
end;

end.
