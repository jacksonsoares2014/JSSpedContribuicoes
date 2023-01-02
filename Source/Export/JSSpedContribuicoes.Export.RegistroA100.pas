unit JSSpedContribuicoes.Export.RegistroA100;

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
  cA100     = '|A100|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';
  cA100Canc = '|A100|%s|%s|%s|%s|%s|%s|%s||||||||||||||';


type
  TJSSpedContribuicoesExportRegistroA100 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegA100: TJSSpedContribuicoesModelRegistroA100;

    function linhaSpedNormal: string;
    function linhaSpedCanc: string;
  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroA100 }

function TJSSpedContribuicoesExportRegistroA100.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroA100>(AModel, FRegA100);

   case FRegA100.codSit of
     csRegular  : Result := linhaSpedNormal;
     csCancelado,
     csCanceladoExtemporaneo: Result := linhaSpedCanc;
   end;
end;

function TJSSpedContribuicoesExportRegistroA100.linhaSpedCanc: string;
begin
  result := Format( cA100Canc,
                    [FRegA100.indOper.toString                ,
                     FRegA100.indEmit.toString                ,
                     FRegA100.codPart                         ,
                     FRegA100.codSit.toString                 ,
                     FRegA100.serie                           ,
                     FRegA100.subserie                        ,
                     FRegA100.numDoc]);
end;

function TJSSpedContribuicoesExportRegistroA100.linhaSpedNormal: string;
begin
  result := Format( cA100,
                    [FRegA100.indOper.toString                ,
                     FRegA100.indEmit.toString                ,
                     FRegA100.codPart                         ,
                     FRegA100.codSit.toString                 ,
                     FRegA100.serie                           ,
                     FRegA100.subserie                        ,
                     FRegA100.numDoc                          ,
                     FRegA100.chvNfse                         ,
                     JSSF.formatData(FRegA100.dtDoc)          ,
                     JSSF.formatData(FRegA100.dtExeServ)      ,
                     JSSF.formatCurrency(FRegA100.vlDoc)      ,
                     FRegA100.indPgto.toString                ,
                     JSSF.formatCurrency(FRegA100.vlDesc)     ,
                     JSSF.formatCurrency(FRegA100.vlBcPis)    ,
                     JSSF.formatCurrency(FRegA100.vlPis)      ,
                     JSSF.formatCurrency(FRegA100.vlBcCofins) ,
                     JSSF.formatCurrency(FRegA100.vlCofins)   ,
                     JSSF.formatCurrency(FRegA100.vlPisRet)   ,
                     JSSF.formatCurrency(FRegA100.vlCofinsRet),
                     JSSF.formatCurrency(FRegA100.vlIss)]);
end;

end.
