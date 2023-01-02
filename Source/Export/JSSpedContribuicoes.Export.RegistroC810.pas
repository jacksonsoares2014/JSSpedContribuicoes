unit JSSpedContribuicoes.Export.RegistroC810;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC810 = '|C810|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC810 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC810: TJSSpedContribuicoesModelRegistroC810;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC810 }

function TJSSpedContribuicoesExportRegistroC810.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC810>(AModel, FRegC810);

  result := Format( cC810,
                    [FRegC810.cfop                              ,
                     JSSF.formatCurrency(FRegC810.vlItem)       ,
                     FRegC810.codItem                           ,
                     FRegC810.cstPis                            ,
                     JSSF.formatCurrency(FRegC810.vlBcPis)      ,
                     JSSF.formatCurrency(FRegC810.aliqPis,4)    ,
                     JSSF.formatCurrency(FRegC810.vlPis)        ,
                     FRegC810.cstCofins                         ,
                     JSSF.formatCurrency(FRegC810.vlBcCofins)   ,
                     JSSF.formatCurrency(FRegC810.aliqCofins,4) ,
                     JSSF.formatCurrency(FRegC810.vlCofins)     ,
                     FRegC810.codCta]);
end;

end.
