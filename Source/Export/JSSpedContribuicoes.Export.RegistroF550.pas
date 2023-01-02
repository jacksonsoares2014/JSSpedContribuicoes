unit JSSpedContribuicoes.Export.RegistroF550;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cF550 = '|F550|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF550 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF550: TJSSpedContribuicoesModelRegistroF550;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF550 }

function TJSSpedContribuicoesExportRegistroF550.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF550>(AModel, FRegF550);

  result := Format( cF550,
                    [JSSF.formatCurrency(FRegF550.vlRecComp)    ,
                     FRegF550.cstPis                            ,
                     JSSF.formatCurrency(FRegF550.vlDescPis)    ,
                     JSSF.formatCurrency(FRegF550.vlBcPis)      ,
                     JSSF.formatCurrency(FRegF550.aliqPis,4)    ,
                     JSSF.formatCurrency(FRegF550.vlPis)        ,
                     FRegF550.cstCofins                         ,
                     JSSF.formatCurrency(FRegF550.vlDescCofins) ,
                     JSSF.formatCurrency(FRegF550.vlBcCofins)   ,
                     JSSF.formatCurrency(FRegF550.aliqCofins,4) ,
                     JSSF.formatCurrency(FRegF550.vlCofins)     ,
                     FRegF550.codMod                            ,
                     FRegF550.cfop                              ,
                     FRegF550.codCta                            ,
                     FRegF550.infCompl]);
end;

end.
