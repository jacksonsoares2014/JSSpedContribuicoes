unit JSSpedContribuicoes.Export.RegistroF500;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cF500 = '|F500|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF500 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF500: TJSSpedContribuicoesModelRegistroF500;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF500 }

function TJSSpedContribuicoesExportRegistroF500.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF500>(AModel, FRegF500);

  result := Format( cF500,
                    [JSSF.formatCurrency(FRegF500.vlRecCaixa)   ,
                     FRegF500.cstPis                            ,
                     JSSF.formatCurrency(FRegF500.vlDescPis)    ,
                     JSSF.formatCurrency(FRegF500.vlBcPis)      ,
                     JSSF.formatCurrency(FRegF500.aliqPis,4)    ,
                     JSSF.formatCurrency(FRegF500.vlPis)        ,
                     FRegF500.cstCofins                         ,
                     JSSF.formatCurrency(FRegF500.vlDescCofins) ,
                     JSSF.formatCurrency(FRegF500.vlBcCofins)   ,
                     JSSF.formatCurrency(FRegF500.aliqCofins,4) ,
                     JSSF.formatCurrency(FRegF500.vlCofins)     ,
                     FRegF500.codMod                            ,
                     FRegF500.cfop                              ,
                     FRegF500.codCta                            ,
                     FRegF500.infCompl]);
end;

end.