unit JSSpedContribuicoes.Export.RegistroD201;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cD201 = '|D201|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroD201 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD201: TJSSpedContribuicoesModelRegistroD201;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD201 }

function TJSSpedContribuicoesExportRegistroD201.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD201>(AModel, FRegD201);

  result := Format( cD201,
                    [FRegD201.cstPis                          ,
                     JSSF.formatCurrency(FRegD201.vlItem)     ,
                     JSSF.formatCurrency(FRegD201.vlBcPis)    ,
                     JSSF.formatCurrency(FRegD201.aliqPis,4)  ,
                     JSSF.formatCurrency(FRegD201.vlPis)      ,
                     FRegD201.codCta]);
end;

end.
