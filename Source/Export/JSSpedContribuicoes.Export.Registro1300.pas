unit JSSpedContribuicoes.Export.Registro1300;

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
  c1300 = '|1300|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro1300 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1300: TJSSpedContribuicoesModelRegistro1300;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1300 }

function TJSSpedContribuicoesExportRegistro1300.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1300>(AModel, FReg1300);

  result := Format( c1300,
                    [FReg1300.indNatRet                       ,
                     FReg1300.prRecRet                        ,
                     JSSF.formatCurrency(FReg1300.vlRetApu)   ,
                     JSSF.formatCurrency(FReg1300.vlRetDed)   ,
                     JSSF.formatCurrency(FReg1300.vlRetPer)   ,
                     JSSF.formatCurrency(FReg1300.vlRetDcomp) ,
                     JSSF.formatCurrency(FReg1300.sldRet)]);
end;

end.
