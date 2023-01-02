unit JSSpedContribuicoes.Export.RegistroC175;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC175 = '|C175|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC175 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC175: TJSSpedContribuicoesModelRegistroC175;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC175 }

function TJSSpedContribuicoesExportRegistroC175.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC175>(AModel, FRegC175);

  result := Format( cC175,
                    [FRegC175.cfop                                     ,
                     JSSF.formatCurrency(FRegC175.vlOpr)               ,
                     JSSF.formatCurrency(FRegC175.vlDesc)              ,
                     FRegC175.cstPis                                   ,
                     JSSF.formatCurrency(FRegC175.vlBcPis)             ,
                     JSSF.formatCurrency(FRegC175.aliqPis,4)           ,
                     JSSF.formatCurrency(FRegC175.quantBcPis,3,fzNullIfZero)        ,
                     JSSF.formatCurrency(FRegC175.aliqPisQuant,4,fzNullIfZero)      ,
                     JSSF.formatCurrency(FRegC175.vlPis)               ,
                     FRegC175.cstCofins                                ,
                     JSSF.formatCurrency(FRegC175.vlBcCofins)          ,
                     JSSF.formatCurrency(FRegC175.aliqCofins,4)        ,
                     JSSF.formatCurrency(FRegC175.quantBcCofins,3,fzNullIfZero)     ,
                     JSSF.formatCurrency(FRegC175.aliqCofinsQuant,4,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC175.vlCofins)            ,
                     FRegC175.codCta                                   ,
                     FRegC175.infoCompl]);
end;

end.
