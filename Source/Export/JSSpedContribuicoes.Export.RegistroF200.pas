unit JSSpedContribuicoes.Export.RegistroF200;

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
  cF200 = '|F200|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF200 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF200: TJSSpedContribuicoesModelRegistroF200;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF200 }

function TJSSpedContribuicoesExportRegistroF200.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF200>(AModel, FRegF200);

  result := Format( cF200,
                    [FRegF200.indOper.toString                  ,
                     FRegF200.unidImob.toString                 ,
                     FRegF200.identEmp                          ,
                     FRegF200.descUnidImob                      ,
                     FRegF200.numCont                           ,
                     FRegF200.cpfCnpjAdqu                       ,
                     JSSF.formatData(FRegF200.dtOper)           ,
                     JSSF.formatCurrency(FRegF200.vlTotVend)    ,
                     JSSF.formatCurrency(FRegF200.vlRecAcum)    ,
                     JSSF.formatCurrency(FRegF200.vlTotRec)     ,
                     FRegF200.cstPis                            ,
                     JSSF.formatCurrency(FRegF200.vlBcPis)      ,
                     JSSF.formatCurrency(FRegF200.aliqPis,4)    ,
                     JSSF.formatCurrency(FRegF200.vlPis)        ,
                     FRegF200.cstCofins                         ,
                     JSSF.formatCurrency(FRegF200.vlBcCofins)   ,
                     JSSF.formatCurrency(FRegF200.aliqCofins,4) ,
                     JSSF.formatCurrency(FRegF200.vlCofins)     ,
                     JSSF.formatCurrency(FRegF200.percRecReceb) ,
                     FRegF200.indNatEmp                         ,
                     FRegF200.infComp]);
end;

end.
