unit JSSpedContribuicoes.Export.RegistroC170;

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
  cC170 = '|C170|%d|%s|%s|%s|%s|%s|%s|%d|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';

type
  TJSSpedContribuicoesExportRegistroC170 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC170: TJSSpedContribuicoesModelRegistroC170;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC170 }

function TJSSpedContribuicoesExportRegistroC170.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC170>(AModel, FRegC170);

  result := Format( cC170,
                    [FRegC170.numItem                               ,
                     FRegC170.codItem                               ,
                     FRegC170.descrCompl                            ,
                     JSSF.formatCurrency(FRegC170.qtd,5)            ,
                     FRegC170.unid                                  ,
                     JSSF.formatCurrency(FRegC170.vlItem)           ,
                     JSSF.formatCurrency(FRegC170.vlDesc)           ,
                     Integer(FRegC170.indMov)                       ,
                     FRegC170.cstIcms                               ,
                     FRegC170.cfop                                  ,
                     FRegC170.codNat                                ,
                     JSSF.formatCurrency(FRegC170.vlBcIcms)         ,
                     JSSF.formatCurrency(FRegC170.aliqIcms)         ,
                     JSSF.formatCurrency(FRegC170.vlIcms)           ,
                     JSSF.formatCurrency(FRegC170.vlBcIcmsSt)       ,
                     JSSF.formatCurrency(FRegC170.aliqSt)           ,
                     JSSF.formatCurrency(FRegC170.vlIcmsSt)         ,
                     FRegC170.indApur                               ,
                     FRegC170.cstIpi                                ,
                     FRegC170.codEnq                                ,
                     JSSF.formatCurrency(FRegC170.vlBcIpi)          ,
                     JSSF.formatCurrency(FRegC170.aliqIpi)          ,
                     JSSF.formatCurrency(FRegC170.vlIpi)            ,
                     FRegC170.cstPis                                ,
                     JSSF.formatCurrency(FRegC170.vlBcPis)          ,
                     JSSF.formatCurrency(FRegC170.aliqPis,4)        ,
                     JSSF.formatCurrency(FRegC170.quantBcPis,3,fzNullIfZero)     ,
                     JSSF.formatCurrency(FRegC170.aliqPisQuant,4,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC170.vlPis)            ,
                     FRegC170.cstCofins                             ,
                     JSSF.formatCurrency(FRegC170.vlBcCofins)       ,
                     JSSF.formatCurrency(FRegC170.aliqCofins,4)     ,
                     JSSF.formatCurrency(FRegC170.quantBcCofins,3,fzNullIfZero)  ,
                     JSSF.formatCurrency(FRegC170.aliqPisQuant,4,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC170.vlCofins)         ,
                     FRegC170.codCta]);
end;

end.
