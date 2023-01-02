unit JSSpedContribuicoes.Export.RegistroD501;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cD501 = '|D501|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroD501 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD501: TJSSpedContribuicoesModelRegistroD501;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD501 }

function TJSSpedContribuicoesExportRegistroD501.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD501>(AModel, FRegD501);

  result := Format( cD501,
                    [FRegD501.cstPis                          ,
                     JSSF.formatCurrency(FRegD501.vlItem)     ,
                     FRegD501.natBcCred                       ,
                     JSSF.formatCurrency(FRegD501.vlBcPis)    ,
                     JSSF.formatCurrency(FRegD501.aliqPis,4)  ,
                     JSSF.formatCurrency(FRegD501.vlPis)      ,
                     FRegD501.codCta]);
end;

end.
