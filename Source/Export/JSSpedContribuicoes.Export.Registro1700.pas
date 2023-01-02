unit JSSpedContribuicoes.Export.Registro1700;

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
  c1700 = '|1700|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro1700 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1700: TJSSpedContribuicoesModelRegistro1700;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1700 }

function TJSSpedContribuicoesExportRegistro1700.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1700>(AModel, FReg1700);

  result := Format( c1700,
                    [FReg1700.indNatRet                       ,
                     FReg1700.prRecRet                        ,
                     JSSF.formatCurrency(FReg1700.vlRetApu)   ,
                     JSSF.formatCurrency(FReg1700.vlRetDed)   ,
                     JSSF.formatCurrency(FReg1700.vlRetPer)   ,
                     JSSF.formatCurrency(FReg1700.vlRetDcomp) ,
                     JSSF.formatCurrency(FReg1700.sldRet)]);
end;

end.
