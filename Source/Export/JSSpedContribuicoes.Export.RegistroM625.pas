unit JSSpedContribuicoes.Export.RegistroM625;

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
  cM625 = '|M625|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM625 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM625: TJSSpedContribuicoesModelRegistroM625;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM625 }

function TJSSpedContribuicoesExportRegistroM625.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM625>(AModel, FRegM625);

  result := Format( cM625,
                    [JSSF.formatCurrency(FRegM625.detValorAj)  ,
                     FRegM625.cstCofins                        ,
                     JSSF.formatCurrency(FRegM625.detBcCred,3) ,
                     JSSF.formatCurrency(FRegM625.detAliq,4)   ,
                     JSSF.formatData(FRegM625.dtOperAj)        ,
                     FRegM625.descAj                           ,
                     FRegM625.codCta                           ,
                     FRegM625.infoCompl]);
end;

end.
