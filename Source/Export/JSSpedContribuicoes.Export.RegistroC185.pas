unit JSSpedContribuicoes.Export.RegistroC185;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC185 = '|C185|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC185 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC185: TJSSpedContribuicoesModelRegistroC185;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC185 }

function TJSSpedContribuicoesExportRegistroC185.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC185>(AModel, FRegC185);

  result := Format( cC185,
                    [FRegC185.cstCofins                              ,
                     FRegC185.cfop                                   ,
                     JSSF.formatCurrency(FRegC185.vlItem)            ,
                     JSSF.formatCurrency(FRegC185.vlDesc)            ,
                     JSSF.formatCurrency(FRegC185.vlBcCofins)        ,
                     JSSF.formatCurrency(FRegC185.aliqCofins,4)      ,
                     JSSF.formatCurrency(FRegC185.quantBcCofins,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC185.aliqCofinsQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegC185.vlCofins)          ,
                     FRegC185.codCta]);
end;

end.
