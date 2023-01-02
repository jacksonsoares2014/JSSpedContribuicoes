unit JSSpedContribuicoes.Export.RegistroP200;

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
  cP200 = '|P200|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroP200 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegP200: TJSSpedContribuicoesModelRegistroP200;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroP200 }

function TJSSpedContribuicoesExportRegistroP200.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroP200>(AModel, FRegP200);

  result := Format( cP200,
                    [FRegP200.perRef                            ,
                     JSSF.formatCurrency(FRegP200.vlTotContApu) ,
                     JSSF.formatCurrency(FRegP200.vlTotAjReduc) ,
                     JSSF.formatCurrency(FRegP200.vlTotAjAcres) ,
                     JSSF.formatCurrency(FRegP200.vlTotContDev) ,
                     FRegP200.codRec]);
end;

end.

