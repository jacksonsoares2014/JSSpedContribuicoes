unit JSSpedContribuicoes.Export.RegistroM225;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils,
  System.DateUtils;

const
  cM225 = '|M225|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM225 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM225: TJSSpedContribuicoesModelRegistroM225;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM225 }

function TJSSpedContribuicoesExportRegistroM225.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM225>(AModel, FRegM225);

  result := Format( cM225,
                    [JSSF.formatCurrency(FRegM225.detValorAj)  ,
                     FRegM225.cstPis                           ,
                     JSSF.formatCurrency(FRegM225.detBcCred,3) ,
                     JSSF.formatCurrency(FRegM225.detAliq,4)   ,
                     JSSF.formatData(FRegM225.dtOperAj)        ,
                     FRegM225.descAj                           ,
                     FRegM225.codCta                           ,
                     FRegM225.infoCompl]);
end;

end.
