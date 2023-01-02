unit JSSpedContribuicoes.Export.RegistroM205;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils,
  System.DateUtils;

const
  cM205 = '|M205|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM205 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM205: TJSSpedContribuicoesModelRegistroM205;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
end;

implementation

{ TJSSpedContribuicoesExportRegistroM205 }

function TJSSpedContribuicoesExportRegistroM205.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM205>(AModel, FRegM205);

  result := Format( cM205,
                    [FRegM205.numCampo,
                     FRegM205.codRec  ,
                     JSSF.formatCurrency(FRegM205.vlDebito)]);
end;

end.
