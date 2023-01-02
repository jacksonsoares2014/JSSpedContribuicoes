unit JSSpedContribuicoes.Export.Registro0500;

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
  c0500 = '|0500|%s|%s|%s|%d|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro0500 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0500: TJSSpedContribuicoesModelRegistro0500;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0500 }

function TJSSpedContribuicoesExportRegistro0500.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0500>(AModel, FReg0500);

  if FReg0500.dtAlt > FConfig.DataFinal then
    FReg0500.dtAlt := FConfig.DataFinal;

  result := Format( c0500,
                    [JSSF.formatData(FReg0500.dtAlt),
                     FReg0500.codNatCC.toString     ,
                     FReg0500.indCta.toString       ,
                     FReg0500.nivel                 ,
                     FReg0500.codCta                ,
                     FReg0500.nomeCta               ,
                     FReg0500.codCtaRef             ,
                     FReg0500.cnpjEst]);
end;

end.
