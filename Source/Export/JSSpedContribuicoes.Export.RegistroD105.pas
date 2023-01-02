unit JSSpedContribuicoes.Export.RegistroD105;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cD105 = '|D105|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroD105 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD105: TJSSpedContribuicoesModelRegistroD105;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD105 }

function TJSSpedContribuicoesExportRegistroD105.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD105>(AModel, FRegD105);

  result := Format( cD105,
                    [FRegD105.indNatFrt.toString                 ,
                     JSSF.formatCurrency(FRegD105.vlItem)        ,
                     FRegD105.cstCofins                          ,
                     FRegD105.natBcCred                          ,
                     JSSF.formatCurrency(FRegD105.vlBcCofins)    ,
                     JSSF.formatCurrency(FRegD105.aliqCofins,4)  ,
                     JSSF.formatCurrency(FRegD105.vlCofins)      ,
                     FRegD105.codCta]);
end;

end.
