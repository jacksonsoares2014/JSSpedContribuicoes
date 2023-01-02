unit JSSpedContribuicoes.Export.Registro1101;

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
  c1101 = '|1101|%s|%s|%s|%s|%s|%d|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';

type
  TJSSpedContribuicoesExportRegistro1101 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1101: TJSSpedContribuicoesModelRegistro1101;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1101 }

function TJSSpedContribuicoesExportRegistro1101.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1101>(AModel, FReg1101);

  result := Format( c1101,
                    [FReg1101.codPart                        ,
                     FReg1101.codItem                        ,
                     FReg1101.codMod                         ,
                     FReg1101.serie                          ,
                     FReg1101.subserie                       ,
                     FReg1101.numDoc                         ,
                     JSSF.formatData(FReg1101.dtOper)        ,
                     FReg1101.chvNfe                         ,
                     JSSF.formatCurrency(FReg1101.vlOper)    ,
                     FReg1101.cfop                           ,
                     FReg1101.natBcCred                      ,
                     FReg1101.indOrigCred                    ,
                     FReg1101.cstPis                         ,
                     JSSF.formatCurrency(FReg1101.vlBcPis,3) ,
                     JSSF.formatCurrency(FReg1101.aliqPis,4) ,
                     JSSF.formatCurrency(FReg1101.vlPis)     ,
                     FReg1101.codCta                         ,
                     FReg1101.codCcus                        ,
                     FReg1101.descCompl                      ,
                     FReg1101.perEscrit                      ,
                     FReg1101.cnpj]);
end;

end.
