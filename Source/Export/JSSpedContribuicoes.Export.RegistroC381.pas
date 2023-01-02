unit JSSpedContribuicoes.Export.RegistroC381;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC381 = '|C381|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC381 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC381: TJSSpedContribuicoesModelRegistroC381;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC381 }

function TJSSpedContribuicoesExportRegistroC381.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC381>(AModel, FRegC381);

  result := Format( cC381,
                    [FRegC381.cstPis                              ,
                     FRegC381.codItem                             ,
                     JSSF.formatCurrency(FRegC381.vlItem)         ,
                     JSSF.formatCurrency(FRegC381.vlBcPis)        ,
                     JSSF.formatCurrency(FRegC381.aliqPis,4)      ,
                     JSSF.formatCurrency(FRegC381.quantBcPis,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC381.aliqPisQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegC381.vlPis)          ,
                     FRegC381.codCta]);
end;

end.
