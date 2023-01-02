unit JSSpedContribuicoes.Export.Registro0001;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistro0001 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0001: TJSSpedContribuicoesModelRegistro0001;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0001 }

function TJSSpedContribuicoesExportRegistro0001.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0001>(AModel, FReg0001);

  Result := Format('|0001|%d|',[Integer(FReg0001.indMov)]);
end;

end.
