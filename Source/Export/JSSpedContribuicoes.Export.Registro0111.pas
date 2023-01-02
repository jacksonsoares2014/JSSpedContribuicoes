unit JSSpedContribuicoes.Export.Registro0111;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  c0111 = '|0111|%s|%s|%s|%s|%s|';

type TJSSpedContribuicoesExportRegistro0111 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)

  private
    FReg0111: TJSSpedContribuicoesModelRegistro0111;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;

end;

implementation

{ TJSSpedContribuicoesExportRegistro0111 }

function TJSSpedContribuicoesExportRegistro0111.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0111>(AModel, FReg0111);

  result := Format(c0111,
                   [JSSF.formatCurrency(FReg0111.recBruNcumTribMi) ,
                    JSSF.formatCurrency(FReg0111.recBruNcumNtMi)   ,
                    JSSF.formatCurrency(FReg0111.recBruNcumExp)    ,
                    JSSF.formatCurrency(FReg0111.recBruCum)        ,
                    JSSF.formatCurrency(FReg0111.recBruTotal)]);

end;

end.
