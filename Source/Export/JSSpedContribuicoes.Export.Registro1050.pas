unit JSSpedContribuicoes.Export.Registro1050;

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
  c1050 = '|1050|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro1050 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1050: TJSSpedContribuicoesModelRegistro1050;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1050 }

function TJSSpedContribuicoesExportRegistro1050.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1050>(AModel, FReg1050);

  result := Format( c1050,
                    [JSSF.formatData(FReg1050.dtRef)         ,
                     FReg1050.indAjBc                        ,
                     FReg1050.cnpj                           ,
                     JSSF.formatCurrency(FReg1050.vlAjTot)   ,
                     JSSF.formatCurrency(FReg1050.vlAjCst01) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst02) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst03) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst04) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst05) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst06) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst07) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst08) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst09) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst49) ,
                     JSSF.formatCurrency(FReg1050.vlAjCst99) ,
                     FReg1050.indAprop                       ,
                     FReg1050.numRec                         ,
                     FReg1050.infoCompl]);
end;

end.
