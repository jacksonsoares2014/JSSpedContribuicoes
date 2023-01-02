unit JSSpedContribuicoes.Export.Registro0900;

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
  c0900 = '|0900|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro0900 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0900: TJSSpedContribuicoesModelRegistro0900;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0900 }

function TJSSpedContribuicoesExportRegistro0900.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0900>(AModel, FReg0900);

  result := Format( c0900,
                    [JSSF.formatCurrency(FReg0900.recTotalBlocoA)  ,
                     JSSF.formatCurrency(FReg0900.recNrbBlocoA)    ,
                     JSSF.formatCurrency(FReg0900.recTotalBlocoC)  ,
                     JSSF.formatCurrency(FReg0900.recNrbBlocoC)    ,
                     JSSF.formatCurrency(FReg0900.recTotalBlocoD)  ,
                     JSSF.formatCurrency(FReg0900.recNrbBlocoD)    ,
                     JSSF.formatCurrency(FReg0900.recTotalBlocoF)  ,
                     JSSF.formatCurrency(FReg0900.recNrbBlocoF)    ,
                     JSSF.formatCurrency(FReg0900.recTotalBlocoI)  ,
                     JSSF.formatCurrency(FReg0900.recNrbBlocoI)    ,
                     JSSF.formatCurrency(FReg0900.recTotalBloco1)  ,
                     JSSF.formatCurrency(FReg0900.recNrbBloco1)    ,
                     JSSF.formatCurrency(FReg0900.recTotalPeriodo) ,
                     JSSF.formatCurrency(FReg0900.recTotalNrbPeriodo)]);
end;

end.
