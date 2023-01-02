unit JSSpedContribuicoes.Export.Registro0120;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistro0120 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0120: TJSSpedContribuicoesModelRegistro0120;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0120 }

function TJSSpedContribuicoesExportRegistro0120.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0120>(AModel, FReg0120);

  result := Format('|0120|%s|%s|',[FReg0120.mesRefer, FReg0120.infComp]);
end;

end.

