unit JSSpedContribuicoes.Export.RegistroC495;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC495 = '|C495|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC495 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC495: TJSSpedContribuicoesModelRegistroC495;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC495 }

function TJSSpedContribuicoesExportRegistroC495.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC495>(AModel, FRegC495);

  result := Format( cC495,
                    [FRegC495.codItem                                ,
                     FRegC495.cstCofins                              ,
                     FRegC495.cfop                                   ,
                     JSSF.formatCurrency(FRegC495.vlItem)            ,
                     JSSF.formatCurrency(FRegC495.vlBcCofins)        ,
                     JSSF.formatCurrency(FRegC495.aliqCofins,4)      ,
                     JSSF.formatCurrency(FRegC495.quantBcCofins,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC495.aliqCofinsQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegC495.vlCofins)          ,
                     FRegC495.codCta]);
end;

end.
