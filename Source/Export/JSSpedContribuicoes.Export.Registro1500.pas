unit JSSpedContribuicoes.Export.Registro1500;

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
  c1500 = '|1500|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro1500 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1500: TJSSpedContribuicoesModelRegistro1500;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1500 }

function TJSSpedContribuicoesExportRegistro1500.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1500>(AModel, FReg1500);

  result := Format( c1500,
                    [FReg1500.perApuCred                            ,
                     FReg1500.origCred                              ,
                     FReg1500.cnpjSuc                               ,
                     FReg1500.codCred                               ,
                     JSSF.formatCurrency(FReg1500.vlCredApu)        ,
                     JSSF.formatCurrency(FReg1500.vlCredExtApu)     ,
                     JSSF.formatCurrency(FReg1500.vlTotCredApu)     ,
                     JSSF.formatCurrency(FReg1500.vlCredDescPaAnt)  ,
                     JSSF.formatCurrency(FReg1500.vlCredPerPaAnt)   ,
                     JSSF.formatCurrency(FReg1500.vlCredDcompPaAnt) ,
                     JSSF.formatCurrency(FReg1500.sdCredDispEfd)    ,
                     JSSF.formatCurrency(FReg1500.vlCredDescEfd)    ,
                     JSSF.formatCurrency(FReg1500.vlCredPerEfd)     ,
                     JSSF.formatCurrency(FReg1500.vlCredDcompEfd)   ,
                     JSSF.formatCurrency(FReg1500.vlCredTrans)      ,
                     JSSF.formatCurrency(FReg1500.vlCredOut)        ,
                     JSSF.formatCurrency(FReg1500.sldCredFim)]);
end;

end.
