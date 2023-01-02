unit JSSpedContribuicoes.Export.RegistroF211;

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
  cF211 = '|F211|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF211 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF211: TJSSpedContribuicoesModelRegistroF211;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF211 }

function TJSSpedContribuicoesExportRegistroF211.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF211>(AModel, FRegF211);

  result := Format( cF211,
                    [FRegF211.numProc,
                     FRegF211.indProc.toString]);
end;

end.
