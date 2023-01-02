unit JSSpedContribuicoes.Export.Registro1501;

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
  c1501 = '|1501|%s|%s|%s|%s|%s|%d|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';

type
  TJSSpedContribuicoesExportRegistro1501 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1501: TJSSpedContribuicoesModelRegistro1501;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1501 }

function TJSSpedContribuicoesExportRegistro1501.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1501>(AModel, FReg1501);

  result := Format( c1501,
                    [FReg1501.codPart                           ,
                     FReg1501.codItem                           ,
                     FReg1501.codMod                            ,
                     FReg1501.serie                             ,
                     FReg1501.subserie                          ,
                     FReg1501.numDoc                            ,
                     JSSF.formatData(FReg1501.dtOper)           ,
                     FReg1501.chvNfe                            ,
                     JSSF.formatCurrency(FReg1501.vlOper)       ,
                     FReg1501.cfop                              ,
                     FReg1501.natBcCred                         ,
                     FReg1501.indOrigCred                       ,
                     FReg1501.cstCofins                         ,
                     JSSF.formatCurrency(FReg1501.vlBcCofins,3) ,
                     JSSF.formatCurrency(FReg1501.aliqCofins,4) ,
                     JSSF.formatCurrency(FReg1501.vlCofins)     ,
                     FReg1501.codCta                            ,
                     FReg1501.codCcus                           ,
                     FReg1501.descCompl                         ,
                     FReg1501.perEscrit                         ,
                     FReg1501.cnpj]);
end;

end.
