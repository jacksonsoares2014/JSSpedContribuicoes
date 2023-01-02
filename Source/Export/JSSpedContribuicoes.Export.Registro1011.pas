unit JSSpedContribuicoes.Export.Registro1011;

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
  c1011 = '|1011|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro1011 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1011: TJSSpedContribuicoesModelRegistro1011;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1011 }

function TJSSpedContribuicoesExportRegistro1011.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1011>(AModel, FReg1011);

  result := Format( c1011,
                    [FReg1011.regRef                                ,
                     FReg1011.chaveDoc                              ,
                     FReg1011.codPart                               ,
                     FReg1011.codItem                               ,
                     JSSF.formatData(FReg1011.dtOper)               ,
                     JSSF.formatCurrency(FReg1011.vlOper)           ,
                     FReg1011.cstPis                                ,
                     JSSF.formatCurrency(FReg1011.vlBcPis,4)        ,
                     JSSF.formatCurrency(FReg1011.aliqPis,4)        ,
                     JSSF.formatCurrency(FReg1011.vlPis)            ,
                     FReg1011.cstCofins                             ,
                     JSSF.formatCurrency(FReg1011.vlBcCofins,4)     ,
                     JSSF.formatCurrency(FReg1011.aliqCofins,4)     ,
                     JSSF.formatCurrency(FReg1011.vlCofins)         ,
                     FReg1011.cstPisSusp                            ,
                     JSSF.formatCurrency(FReg1011.vlBcPisSusp,4)    ,
                     JSSF.formatCurrency(FReg1011.aliqPisSusp,4)    ,
                     JSSF.formatCurrency(FReg1011.vlPisSusp)        ,
                     FReg1011.cstCofinsSusp                         ,
                     JSSF.formatCurrency(FReg1011.vlBcCofinsSusp,4) ,
                     JSSF.formatCurrency(FReg1011.aliqCofinsSusp,4) ,
                     JSSF.formatCurrency(FReg1011.vlCofinsSusp)     ,
                     FReg1011.codCta                                ,
                     FReg1011.codCcus                               ,
                     FReg1011.descDocOper]);
end;

end.
