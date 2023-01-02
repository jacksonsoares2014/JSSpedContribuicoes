unit JSSpedContribuicoes.Export.RegistroC120;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cC120 = '|C120|%d|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC120 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC120: TJSSpedContribuicoesModelRegistroC120;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC120 }

function TJSSpedContribuicoesExportRegistroC120.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC120>(AModel, FRegC120);

  result := Format( cC120,
                    [Integer(FRegC120.codDocImp)               ,
                     FRegC120.numDocImp                        ,
                     JSSF.formatCurrency(FRegC120.vlPisImp)    ,
                     JSSF.formatCurrency(FRegC120.vlCofinsImp) ,
                     FRegC120.numAcdRaw]);
end;

end.
