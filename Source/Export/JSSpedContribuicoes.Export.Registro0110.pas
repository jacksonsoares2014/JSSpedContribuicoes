unit JSSpedContribuicoes.Export.Registro0110;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  c0110Atual = '|0110|%s|%s|%s|%s|';
  c0110AnteriorJulho2012 = '|0110|%s|%s|%s|';

type TJSSpedContribuicoesExportRegistro0110 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)

  private
    FReg0110: TJSSpedContribuicoesModelRegistro0110;

    function linhaSpedAtual             : string;
    function linhaSpedAnteriorJulho2012 : string;
  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;

end;

implementation

{ TJSSpedContribuicoesExportRegistro0110 }

function TJSSpedContribuicoesExportRegistro0110.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0110>(AModel, FReg0110);

  if FConfig.DataInicial >= EncodeDate(2012,7,1) then
    Result := linhaSpedAtual
  else
    Result := linhaSpedAnteriorJulho2012;
end;

function TJSSpedContribuicoesExportRegistro0110.linhaSpedAnteriorJulho2012: string;
begin
  result := Format(c0110AnteriorJulho2012,
                   [FReg0110.codIncTrib.toString   ,
                    FReg0110.indAproCred.toString  ,
                    FReg0110.codTipoCont.toString]);
end;

function TJSSpedContribuicoesExportRegistro0110.linhaSpedAtual: string;
var FindRegCum: TJSSpedContribuicoesIndicadorCriterioEscrituracao;
begin
  FindRegCum := FReg0110.indRegCum;
  if FConfig.TipoEnquadramento = teReal then
    FindRegCum := iceNull;

  result := Format(c0110Atual,
                   [FReg0110.codIncTrib.toString   ,
                    FReg0110.indAproCred.toString  ,
                    FReg0110.codTipoCont.toString  ,
                    FindRegCum.toString]);
end;

end.
