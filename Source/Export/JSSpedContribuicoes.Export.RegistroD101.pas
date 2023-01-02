unit JSSpedContribuicoes.Export.RegistroD101;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cD101 = '|D101|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroD101 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD101: TJSSpedContribuicoesModelRegistroD101;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD101 }

function TJSSpedContribuicoesExportRegistroD101.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD101>(AModel, FRegD101);

  result := Format( cD101,
                    [FRegD101.indNatFrt.toString              ,
                     JSSF.formatCurrency(FRegD101.vlItem)     ,
                     FRegD101.cstPis                          ,
                     FRegD101.natBcCred                       ,
                     JSSF.formatCurrency(FRegD101.vlBcPis)    ,
                     JSSF.formatCurrency(FRegD101.aliqPis,4)  ,
                     JSSF.formatCurrency(FRegD101.vlPis)      ,
                     FRegD101.codCta]);
end;

end.
