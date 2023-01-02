unit JSSpedContribuicoes.Export.RegistroC491;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC491 = '|C491|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC491 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC491: TJSSpedContribuicoesModelRegistroC491;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC491 }

function TJSSpedContribuicoesExportRegistroC491.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC491>(AModel, FRegC491);

  result := Format( cC491,
                    [FRegC491.codItem                             ,
                     FRegC491.cstPis                              ,
                     FRegC491.cfop                                ,
                     JSSF.formatCurrency(FRegC491.vlItem)         ,
                     JSSF.formatCurrency(FRegC491.vlBcPis)        ,
                     JSSF.formatCurrency(FRegC491.aliqPis,4)      ,
                     JSSF.formatCurrency(FRegC491.quantBcPis,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC491.aliqPisQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegC491.vlPis)          ,
                     FRegC491.codCta]);
end;

end.
