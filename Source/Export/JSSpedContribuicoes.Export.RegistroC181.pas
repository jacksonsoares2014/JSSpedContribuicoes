unit JSSpedContribuicoes.Export.RegistroC181;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC181 = '|C181|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC181 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC181: TJSSpedContribuicoesModelRegistroC181;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC181 }

function TJSSpedContribuicoesExportRegistroC181.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC181>(AModel, FRegC181);

  result := Format( cC181,
                    [FRegC181.cstPis                              ,
                     FRegC181.cfop                                ,
                     JSSF.formatCurrency(FRegC181.vlItem)         ,
                     JSSF.formatCurrency(FRegC181.vlDesc)         ,
                     JSSF.formatCurrency(FRegC181.vlBcPis)        ,
                     JSSF.formatCurrency(FRegC181.aliqPis,4)      ,
                     JSSF.formatCurrency(FRegC181.quantBcPis,3,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegC181.aliqPisQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegC181.vlPis)          ,
                     FRegC181.codCta]);
end;

end.
