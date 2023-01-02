unit JSSpedContribuicoes.Export.Registro0035;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistro0035 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0035: TJSSpedContribuicoesModelRegistro0035;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0035 }

function TJSSpedContribuicoesExportRegistro0035.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0035>(AModel, FReg0035);

  result := Format('|0035|%s|%s|%s|',[FReg0035.codScp, FReg0035.descScp, FReg0035.infComp]);
end;

end.

