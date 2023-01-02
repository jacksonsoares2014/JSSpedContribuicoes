unit JSSpedContribuicoes.Export.Registro1900;

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
  c1900 = '|1900|%s|%s|%s|%s|%s|%s|%d|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro1900 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1900: TJSSpedContribuicoesModelRegistro1900;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1900 }

function TJSSpedContribuicoesExportRegistro1900.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1900>(AModel, FReg1900);

  result := Format( c1900,
                    [FReg1900.cnpj                          ,
                     FReg1900.codMod                        ,
                     FReg1900.serie                         ,
                     FReg1900.subserie                      ,
                     FReg1900.codSit                        ,
                     JSSF.formatCurrency(FReg1900.vlTotRec) ,
                     FReg1900.quantDoc                      ,
                     FReg1900.cstPis                        ,
                     FReg1900.cstCofins                     ,
                     FReg1900.cfop                          ,
                     FReg1900.infCompl                      ,
                     FReg1900.codCta]);
end;

end.
