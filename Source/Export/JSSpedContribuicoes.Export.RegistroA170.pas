unit JSSpedContribuicoes.Export.RegistroA170;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cA170 = '|A170|%d|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroA170 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegA170: TJSSpedContribuicoesModelRegistroA170;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroA170 }

function TJSSpedContribuicoesExportRegistroA170.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroA170>(AModel, FRegA170);

  result := Format( cA170,
                    [FRegA170.numItem                         ,
                     FRegA170.codItem                         ,
                     FRegA170.descrCompl                      ,
                     JSSF.formatCurrency(FRegA170.vlItem)     ,
                     JSSF.formatCurrency(FRegA170.vlDesc)     ,
                     FRegA170.natBcCred                       ,
                     FRegA170.indOrigCred.toString            ,
                     FRegA170.cstPis                          ,
                     JSSF.formatCurrency(FRegA170.vlBcPis)    ,
                     JSSF.formatCurrency(FRegA170.aliqPis)    ,
                     JSSF.formatCurrency(FRegA170.vlPis)      ,
                     FRegA170.cstCofins                       ,
                     JSSF.formatCurrency(FRegA170.vlBcCofins) ,
                     JSSF.formatCurrency(FRegA170.aliqCofins) ,
                     JSSF.formatCurrency(FRegA170.vlCofins)   ,
                     FRegA170.codCta                          ,
                     FRegA170.codCcus]);
end;

end.
