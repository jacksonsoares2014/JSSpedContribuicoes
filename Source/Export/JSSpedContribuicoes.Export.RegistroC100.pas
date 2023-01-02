unit JSSpedContribuicoes.Export.RegistroC100;

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
  cC100SituacaoNormal          = '|C100|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';
  cC100Modelo65SituacaoNormal  = '|C100|%s|%s||%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s||||%s|%s|%s|%s|';

  cC100SituacaoCancelado       = '|C100|%s|%s||%s|%s|%s|%s|%s|||||||||||||||||||||';
  cC100SituacaoDenegado        = '|C100|%s|%s||%s|%s|%s|%s|%s|||||||||||||||||||||';
  cC100SituacaoInutilizado     = '|C100|%s|%s||%s|%s|%s|%s||||||||||||||||||||||';


type
  TJSSpedContribuicoesExportRegistroC100 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC100: TJSSpedContribuicoesModelRegistroC100;

    function linhaSpedModelo65SituacaoNormal : string;
    function linhaSpedSituacaoNormal         : string;
    function linhaSpedSituacaoCancelado      : string;
    function linhaSpedSituacaoDenegado       : string;
    function linhaSpedSituacaoInutilizado    : string;
  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC100 }

function TJSSpedContribuicoesExportRegistroC100.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC100>(AModel, FRegC100);

  case FRegC100.codSit of
    csRegular, csRegularExtemporaneo, csComplementar,
    csComplementarExtemporaneo, csRegimeEspecial
      : begin
          if (FRegC100.codMod = '65') then
            Result := linhaSpedModelo65SituacaoNormal
          else
            Result := linhaSpedSituacaoNormal;
        end;

    csCancelado, csCanceladoExtemporaneo
      : Result := linhaSpedSituacaoCancelado;

    csDenegado
      : Result := linhaSpedSituacaoDenegado;

    csInutilizado
      : Result := linhaSpedSituacaoInutilizado;
  end;
end;

function TJSSpedContribuicoesExportRegistroC100.linhaSpedModelo65SituacaoNormal: string;
begin
  Result := Format( cC100Modelo65SituacaoNormal,
                    [FRegC100.indOper.toString                 ,
                     FRegC100.indEmit.toString                 ,
                     FRegC100.codMod                           ,
                     FRegC100.codSit.toString                  ,
                     FRegC100.serie                            ,
                     FRegC100.numDoc                           ,
                     FRegC100.chvNFe                           ,
                     JSSF.formatData(FRegC100.dtDoc)           ,
                     JSSF.formatData(FRegC100.dtEs)            ,
                     JSSF.formatCurrency(FRegC100.vlDoc)       ,
                     FRegC100.indPgto.toString                 ,
                     JSSF.formatCurrency(FRegC100.vlDesc)      ,
                     JSSF.formatCurrency(FRegC100.vlAbatNt)    ,
                     JSSF.formatCurrency(FRegC100.vlMerc)      ,
                     FRegC100.indFrt.toString                  ,
                     JSSF.formatCurrency(FRegC100.vlFrt)       ,
                     JSSF.formatCurrency(FRegC100.vlSeg)       ,
                     JSSF.formatCurrency(FRegC100.vlOutDA)     ,
                     JSSF.formatCurrency(FRegC100.vlBcIcms)    ,
                     JSSF.formatCurrency(FRegC100.vlIcms)      ,
                     JSSF.formatCurrency(FRegC100.vlPis)       ,
                     JSSF.formatCurrency(FRegC100.vlCofins)    ,
                     JSSF.formatCurrency(FRegC100.vlPisSt)     ,
                     JSSF.formatCurrency(FRegC100.vlCofinsSt)]);
end;

function TJSSpedContribuicoesExportRegistroC100.linhaSpedSituacaoCancelado: string;
begin
  Result := Format( cC100SituacaoCancelado,
                    [FRegC100.indOper.toString                 ,
                     FRegC100.indEmit.toString                 ,
                     FRegC100.codMod                           ,
                     FRegC100.codSit.toString                  ,
                     FRegC100.serie                            ,
                     FRegC100.numDoc                           ,
                     FRegC100.chvNFe]);
end;

function TJSSpedContribuicoesExportRegistroC100.linhaSpedSituacaoDenegado: string;
begin
  Result := Format( cC100SituacaoDenegado,
                    [FRegC100.indOper.toString                 ,
                     FRegC100.indEmit.toString                 ,
                     FRegC100.codMod                           ,
                     FRegC100.codSit.toString                  ,
                     FRegC100.serie                            ,
                     FRegC100.numDoc                           ,
                     FRegC100.chvNFe]);
end;

function TJSSpedContribuicoesExportRegistroC100.linhaSpedSituacaoInutilizado: string;
begin
  Result := Format( cC100SituacaoInutilizado,
                    [FRegC100.indOper.toString                 ,
                     FRegC100.indEmit.toString                 ,
                     FRegC100.codMod                           ,
                     FRegC100.codSit.toString                  ,
                     FRegC100.serie                            ,
                     FRegC100.numDoc]);
end;

function TJSSpedContribuicoesExportRegistroC100.linhaSpedSituacaoNormal: string;
begin
  Result := Format( cC100SituacaoNormal,
                    [FRegC100.indOper.toString                 ,
                     FRegC100.indEmit.toString                 ,
                     FRegC100.codPart                          ,
                     FRegC100.codMod                           ,
                     FRegC100.codSit.toString                  ,
                     FRegC100.serie                            ,
                     FRegC100.numDoc                           ,
                     FRegC100.chvNFe                           ,
                     JSSF.formatData(FRegC100.dtDoc)           ,
                     JSSF.formatData(FRegC100.dtEs)            ,
                     JSSF.formatCurrency(FRegC100.vlDoc)       ,
                     FRegC100.indPgto.toString                 ,
                     JSSF.formatCurrency(FRegC100.vlDesc)      ,
                     JSSF.formatCurrency(FRegC100.vlAbatNt)    ,
                     JSSF.formatCurrency(FRegC100.vlMerc)      ,
                     FRegC100.indFrt.toString                  ,
                     JSSF.formatCurrency(FRegC100.vlFrt)       ,
                     JSSF.formatCurrency(FRegC100.vlSeg)       ,
                     JSSF.formatCurrency(FRegC100.vlOutDA)     ,
                     JSSF.formatCurrency(FRegC100.vlBcIcms)    ,
                     JSSF.formatCurrency(FRegC100.vlIcms)      ,
                     JSSF.formatCurrency(FRegC100.vlBcIcmsSt)  ,
                     JSSF.formatCurrency(FRegC100.vlIcmsSt)    ,
                     JSSF.formatCurrency(FRegC100.vlIpi)       ,
                     JSSF.formatCurrency(FRegC100.vlPis)       ,
                     JSSF.formatCurrency(FRegC100.vlCofins)    ,
                     JSSF.formatCurrency(FRegC100.vlPisSt)     ,
                     JSSF.formatCurrency(FRegC100.vlCofinsSt)]);
end;

end.
