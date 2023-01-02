unit JSSpedContribuicoes.Export.RegistroC385;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC385 = '|C385|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC385 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC385: TJSSpedContribuicoesModelRegistroC385;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC385 }

function TJSSpedContribuicoesExportRegistroC385.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC385>(AModel, FRegC385);

  result := Format( cC385,
                    [FRegC385.cstCofins                              ,
                     FRegC385.codItem                                ,
                     JSSF.formatCurrency(FRegC385.vlItem)            ,
                     JSSF.formatCurrency(FRegC385.vlBcCofins)        ,
                     JSSF.formatCurrency(FRegC385.aliqCofins,4)      ,
                     JSSF.formatCurrency(FRegC385.quantBcCofins,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC385.aliqCofinsQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegC385.vlCofins)          ,
                     FRegC385.codCta]);
end;

end.
