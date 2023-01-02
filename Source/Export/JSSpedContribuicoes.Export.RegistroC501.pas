unit JSSpedContribuicoes.Export.RegistroC501;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC501 = '|C501|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC501 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC501: TJSSpedContribuicoesModelRegistroC501;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC501 }

function TJSSpedContribuicoesExportRegistroC501.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC501>(AModel, FRegC501);

  result := Format( cC501,
                    [FRegC501.cstPis                         ,
                     JSSF.formatCurrency(FRegC501.vlItem)    ,
                     FRegC501.natBcCred                      ,
                     JSSF.formatCurrency(FRegC501.vlBcPis)   ,
                     JSSF.formatCurrency(FRegC501.aliqPis,4) ,
                     JSSF.formatCurrency(FRegC501.vlPis)     ,
                     FRegC501.codCta]);
end;

end.
