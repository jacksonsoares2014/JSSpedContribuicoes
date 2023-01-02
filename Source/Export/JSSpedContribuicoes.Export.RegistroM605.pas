unit JSSpedContribuicoes.Export.RegistroM605;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils,
  System.DateUtils;

const
  cM605 = '|M605|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM605 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM605: TJSSpedContribuicoesModelRegistroM605;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
end;

implementation

{ TJSSpedContribuicoesExportRegistroM605 }

function TJSSpedContribuicoesExportRegistroM605.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM605>(AModel, FRegM605);

  result := Format( cM605,
                    [FRegM605.numCampo,
                     FRegM605.codRec  ,
                     JSSF.formatCurrency(FRegM605.vlDebito)]);
end;

end.
