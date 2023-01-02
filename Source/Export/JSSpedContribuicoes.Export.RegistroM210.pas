unit JSSpedContribuicoes.Export.RegistroM210;

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
  cM210Atual         = '|M210|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';
  cM210Anterior2019  = '|M210|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';

type
  TJSSpedContribuicoesExportRegistroM210 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM210: TJSSpedContribuicoesModelRegistroM210;

    function linhaSpedAtual        : string;
    function linhaSpedAnterior2019 : string;
  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM210 }

function TJSSpedContribuicoesExportRegistroM210.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM210>(AModel, FRegM210);

  if FConfig.DataInicial >= EncodeDate(2019,1,1) then
    Result := linhaSpedAtual
  else
    Result := linhaSpedAnterior2019;
end;

function TJSSpedContribuicoesExportRegistroM210.linhaSpedAnterior2019: string;
begin
  result := Format( cM210Anterior2019,
                    [FRegM210.codCont                                          ,
                     JSSF.formatCurrency(FRegM210.vlRecBrt)                    ,
                     JSSF.formatCurrency(FRegM210.vlBcCont)                    ,
                     JSSF.formatCurrency(FRegM210.aliqPis,4)                   ,
                     JSSF.formatCurrency(FRegM210.quantBcPis,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegM210.aliqPisQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegM210.vlContApur)                  ,
                     JSSF.formatCurrency(FRegM210.vlAjusAcres)                 ,
                     JSSF.formatCurrency(FRegM210.vlAjusReduc)                 ,
                     JSSF.formatCurrency(FRegM210.vlContDifer)                 ,
                     JSSF.formatCurrency(FRegM210.vlContDiferAnt)              ,
                     JSSF.formatCurrency(FRegM210.vlContPer)]);
end;

function TJSSpedContribuicoesExportRegistroM210.linhaSpedAtual: string;
begin
  result := Format( cM210Atual,
                    [FRegM210.codCont                                          ,
                     JSSF.formatCurrency(FRegM210.vlRecBrt)                    ,
                     JSSF.formatCurrency(FRegM210.vlBcCont)                    ,
                     JSSF.formatCurrency(FRegM210.vlAjusAcresBcPis)            ,
                     JSSF.formatCurrency(FRegM210.vlAjusReducBcPis)            ,
                     JSSF.formatCurrency(FRegM210.vlBcContAjus)                ,
                     JSSF.formatCurrency(FRegM210.aliqPis,4)                   ,
                     JSSF.formatCurrency(FRegM210.quantBcPis,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegM210.aliqPisQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegM210.vlContApur)                  ,
                     JSSF.formatCurrency(FRegM210.vlAjusAcres)                 ,
                     JSSF.formatCurrency(FRegM210.vlAjusReduc)                 ,
                     JSSF.formatCurrency(FRegM210.vlContDifer)                 ,
                     JSSF.formatCurrency(FRegM210.vlContDiferAnt)              ,
                     JSSF.formatCurrency(FRegM210.vlContPer)]);
end;

end.
