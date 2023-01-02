unit JSSpedContribuicoes.Export.RegistroC481;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC481 = '|C481|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC481 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC481: TJSSpedContribuicoesModelRegistroC481;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC481 }

function TJSSpedContribuicoesExportRegistroC481.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC481>(AModel, FRegC481);

  result := Format( cC481,
                    [FRegC481.cstPis                              ,
                     JSSF.formatCurrency(FRegC481.vlItem)         ,
                     JSSF.formatCurrency(FRegC481.vlBcPis)        ,
                     JSSF.formatCurrency(FRegC481.aliqPis,4)      ,
                     JSSF.formatCurrency(FRegC481.quantBcPis,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC481.aliqPisQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegC481.vlPis)          ,
                     FRegC481.codItem                             ,
                     FRegC481.codCta]);
end;

end.
