unit JSSpedContribuicoes.Export.Registro0190;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistro0190 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0190: TJSSpedContribuicoesModelRegistro0190;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0190 }

function TJSSpedContribuicoesExportRegistro0190.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0190>(AModel, FReg0190);

  result := Format('|0190|%s|%s|', [FReg0190.unid, FReg0190.descr]);
end;

end.
