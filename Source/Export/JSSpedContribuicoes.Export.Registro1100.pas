unit JSSpedContribuicoes.Export.Registro1100;

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
  c1100 = '|1100|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro1100 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1100: TJSSpedContribuicoesModelRegistro1100;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1100 }

function TJSSpedContribuicoesExportRegistro1100.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1100>(AModel, FReg1100);

  result := Format( c1100,
                    [FReg1100.perApuCred                            ,
                     FReg1100.origCred                              ,
                     FReg1100.cnpjSuc                               ,
                     FReg1100.codCred                               ,
                     JSSF.formatCurrency(FReg1100.vlCredApu)        ,
                     JSSF.formatCurrency(FReg1100.vlCredExtApu)     ,
                     JSSF.formatCurrency(FReg1100.vlTotCredApu)     ,
                     JSSF.formatCurrency(FReg1100.vlCredDescPaAnt)  ,
                     JSSF.formatCurrency(FReg1100.vlCredPerPaAnt)   ,
                     JSSF.formatCurrency(FReg1100.vlCredDcompPaAnt) ,
                     JSSF.formatCurrency(FReg1100.sdCredDispEfd)    ,
                     JSSF.formatCurrency(FReg1100.vlCredDescEfd)    ,
                     JSSF.formatCurrency(FReg1100.vlCredPerEfd)     ,
                     JSSF.formatCurrency(FReg1100.vlCredDcompEfd)   ,
                     JSSF.formatCurrency(FReg1100.vlCredTrans)      ,
                     JSSF.formatCurrency(FReg1100.vlCredOut)        ,
                     JSSF.formatCurrency(FReg1100.sldCredFim)]);
end;

end.
