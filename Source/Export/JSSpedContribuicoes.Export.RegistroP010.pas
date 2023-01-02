unit JSSpedContribuicoes.Export.RegistroP010;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroP010 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegP010: TJSSpedContribuicoesModelRegistroP010;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroP010 }

function TJSSpedContribuicoesExportRegistroP010.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroP010>(AModel, FRegP010);

  result := Format('|P010|%s|',[FRegP010.cnpj]);
end;

end.
