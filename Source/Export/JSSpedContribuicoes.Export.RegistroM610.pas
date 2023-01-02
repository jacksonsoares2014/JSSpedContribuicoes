unit JSSpedContribuicoes.Export.RegistroM610;

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
  cM610Atual         = '|M610|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';
  cM610Anterior2019  = '|M610|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM610 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM610: TJSSpedContribuicoesModelRegistroM610;

    function linhaSpedAtual        : string;
    function linhaSpedAnterior2019 : string;
  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM610 }

function TJSSpedContribuicoesExportRegistroM610.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM610>(AModel, FRegM610);

  if FConfig.DataInicial >= EncodeDate(2019,1,1) then
    Result := linhaSpedAtual
  else
    Result := linhaSpedAnterior2019;
end;

function TJSSpedContribuicoesExportRegistroM610.linhaSpedAnterior2019: string;
begin
  result := Format( cM610Anterior2019,
                    [FRegM610.codCont                                             ,
                     JSSF.formatCurrency(FRegM610.vlRecBrt)                       ,
                     JSSF.formatCurrency(FRegM610.vlBcCont)                       ,
                     JSSF.formatCurrency(FRegM610.aliqCofins,4)                   ,
                     JSSF.formatCurrency(FRegM610.quantBcCofins,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegM610.aliqCofinsQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegM610.vlContApur)                     ,
                     JSSF.formatCurrency(FRegM610.vlAjusAcres)                    ,
                     JSSF.formatCurrency(FRegM610.vlAjusReduc)                    ,
                     JSSF.formatCurrency(FRegM610.vlContDifer)                    ,
                     JSSF.formatCurrency(FRegM610.vlContDiferAnt)                 ,
                     JSSF.formatCurrency(FRegM610.vlContPer)]);
end;

function TJSSpedContribuicoesExportRegistroM610.linhaSpedAtual: string;
begin
  result := Format( cM610Atual,
                    [FRegM610.codCont                                             ,
                     JSSF.formatCurrency(FRegM610.vlRecBrt)                       ,
                     JSSF.formatCurrency(FRegM610.vlBcCont)                       ,
                     JSSF.formatCurrency(FRegM610.vlAjusAcresBcCofins)            ,
                     JSSF.formatCurrency(FRegM610.vlAjusReducBcCofins)            ,
                     JSSF.formatCurrency(FRegM610.vlBcContAjus)                   ,
                     JSSF.formatCurrency(FRegM610.aliqCofins,4)                   ,
                     JSSF.formatCurrency(FRegM610.quantBcCofins,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegM610.aliqCofinsQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegM610.vlContApur)                     ,
                     JSSF.formatCurrency(FRegM610.vlAjusAcres)                    ,
                     JSSF.formatCurrency(FRegM610.vlAjusReduc)                    ,
                     JSSF.formatCurrency(FRegM610.vlContDifer)                    ,
                     JSSF.formatCurrency(FRegM610.vlContDiferAnt)                 ,
                     JSSF.formatCurrency(FRegM610.vlContPer)]);
end;

end.
