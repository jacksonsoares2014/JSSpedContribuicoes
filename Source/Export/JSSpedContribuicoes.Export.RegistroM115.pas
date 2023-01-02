unit JSSpedContribuicoes.Export.RegistroM115;

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
  cM115 = '|M115|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM115 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM115: TJSSpedContribuicoesModelRegistroM115;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM115 }

function TJSSpedContribuicoesExportRegistroM115.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM115>(AModel, FRegM115);

  result := Format( cM115,
                    [JSSF.formatCurrency(FRegM115.detValorAj)  ,
                     FRegM115.cstPis                           ,
                     JSSF.formatCurrency(FRegM115.detBcCred,3) ,
                     JSSF.formatCurrency(FRegM115.detAliq,4)   ,
                     JSSF.formatData(FRegM115.dtOperAj)        ,
                     FRegM115.descAj                           ,
                     FRegM115.codCta                           ,
                     FRegM115.infoCompl]);
end;

end.
