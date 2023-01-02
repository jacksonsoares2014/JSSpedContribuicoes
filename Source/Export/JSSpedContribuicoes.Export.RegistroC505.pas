unit JSSpedContribuicoes.Export.RegistroC505;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC505 = '|C505|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC505 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC505: TJSSpedContribuicoesModelRegistroC505;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC505 }

function TJSSpedContribuicoesExportRegistroC505.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC505>(AModel, FRegC505);

  result := Format( cC505,
                    [FRegC505.cstCofins                         ,
                     JSSF.formatCurrency(FRegC505.vlItem)       ,
                     FRegC505.natBcCred                         ,
                     JSSF.formatCurrency(FRegC505.vlBcCofins)   ,
                     JSSF.formatCurrency(FRegC505.aliqCofins,4) ,
                     JSSF.formatCurrency(FRegC505.vlCofins)     ,
                     FRegC505.codCta]);
end;

end.
