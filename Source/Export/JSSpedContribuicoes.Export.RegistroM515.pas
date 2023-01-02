unit JSSpedContribuicoes.Export.RegistroM515;

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
  cM515 = '|M515|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM515 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM515: TJSSpedContribuicoesModelRegistroM515;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM515 }

function TJSSpedContribuicoesExportRegistroM515.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM515>(AModel, FRegM515);

  result := Format( cM515,
                    [JSSF.formatCurrency(FRegM515.detValorAj)  ,
                     FRegM515.cstCofins                        ,
                     JSSF.formatCurrency(FRegM515.detBcCred,3) ,
                     JSSF.formatCurrency(FRegM515.detAliq,4)   ,
                     JSSF.formatData(FRegM515.dtOperAj)        ,
                     FRegM515.descAj                           ,
                     FRegM515.codCta                           ,
                     FRegM515.infoCompl]);
end;

end.
