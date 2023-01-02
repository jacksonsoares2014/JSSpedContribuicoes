unit JSSpedContribuicoes.Export.RegistroC870;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC870 = '|C870|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC870 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC870: TJSSpedContribuicoesModelRegistroC870;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC870 }

function TJSSpedContribuicoesExportRegistroC870.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC870>(AModel, FRegC870);

  result := Format( cC870,
                    [FRegC870.codItem,
                     FRegC870.cfop,
                     JSSF.formatCurrency(FRegC870.vlItem)       ,
                     JSSF.formatCurrency(FRegC870.vlDesc)       ,
                     FRegC870.cstPis                            ,
                     JSSF.formatCurrency(FRegC870.vlBcPis)      ,
                     JSSF.formatCurrency(FRegC870.aliqPis,4)    ,
                     JSSF.formatCurrency(FRegC870.vlPis)        ,
                     FRegC870.cstCofins                         ,
                     JSSF.formatCurrency(FRegC870.vlBcCofins)   ,
                     JSSF.formatCurrency(FRegC870.aliqCofins,4) ,
                     JSSF.formatCurrency(FRegC870.vlCofins)     ,
                     FRegC870.codCta]);
end;

end.
