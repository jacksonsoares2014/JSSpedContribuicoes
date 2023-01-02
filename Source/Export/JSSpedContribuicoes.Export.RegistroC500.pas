unit JSSpedContribuicoes.Export.RegistroC500;

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
  cC500Atual     = '|C500|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';
  cC500Antes2020 = '|C500|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';

type
  TJSSpedContribuicoesExportRegistroC500 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC500: TJSSpedContribuicoesModelRegistroC500;

    function linhaSpedAnterior2020(AModel: TJSSpedContribuicoesModelRegistroC500): string;
    function linhaSpedAtual       (AModel: TJSSpedContribuicoesModelRegistroC500): string;
  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC500 }

function TJSSpedContribuicoesExportRegistroC500.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
var
  anoInicial : Integer;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC500>(AModel, FRegC500);

  anoInicial := YearOf(FConfig.DataInicial);
  if anoInicial < 2020 then
    Result := linhaSpedAnterior2020(FRegC500)
  else
    Result := linhaSpedAtual(FRegC500);
end;

function TJSSpedContribuicoesExportRegistroC500.linhaSpedAnterior2020(
  AModel: TJSSpedContribuicoesModelRegistroC500): string;
begin
  result := Format( cC500Antes2020,
                    [FRegC500.codPart                        ,
                     FRegC500.codMod                         ,
                     FRegC500.codSit.toString                ,
                     FRegC500.ser                            ,
                     FRegC500.sub                            ,
                     FRegC500.numDoc                         ,
                     JSSF.formatData(FRegC500.dtDoc)         ,
                     JSSF.formatData(FRegC500.dtEnt)         ,
                     JSSF.formatCurrency(FRegC500.vlDoc)     ,
                     JSSF.formatCurrency(FRegC500.vlIcms)    ,
                     FRegC500.codInf                         ,
                     JSSF.formatCurrency(FRegC500.vlPis)     ,
                     JSSF.formatCurrency(FRegC500.vlCofins)]);
end;

function TJSSpedContribuicoesExportRegistroC500.linhaSpedAtual(
  AModel: TJSSpedContribuicoesModelRegistroC500): string;
begin
  result := Format( cC500Atual,
                    [FRegC500.codPart                        ,
                     FRegC500.codMod                         ,
                     FRegC500.codSit.toString                ,
                     FRegC500.ser                            ,
                     FRegC500.sub                            ,
                     FRegC500.numDoc                         ,
                     JSSF.formatData(FRegC500.dtDoc)         ,
                     JSSF.formatData(FRegC500.dtEnt)         ,
                     JSSF.formatCurrency(FRegC500.vlDoc)     ,
                     JSSF.formatCurrency(FRegC500.vlIcms)    ,
                     FRegC500.codInf                         ,
                     JSSF.formatCurrency(FRegC500.vlPis)     ,
                     JSSF.formatCurrency(FRegC500.vlCofins)  ,
                     FRegC500.chvDocE]);
end;

end.
