unit JSSpedContribuicoes.Export.Registro0450;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistro0450 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0450: TJSSpedContribuicoesModelRegistro0450;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0450 }

function TJSSpedContribuicoesExportRegistro0450.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0450>(AModel, FReg0450);

  result := Format('|0450|%s|%s|', [FReg0450.codInf, FReg0450.txt]);
end;

end.
