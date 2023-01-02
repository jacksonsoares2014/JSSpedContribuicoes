unit JSSpedContribuicoes.Export.RegistroD010;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroD010 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD010: TJSSpedContribuicoesModelRegistroD010;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD010 }

function TJSSpedContribuicoesExportRegistroD010.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD010>(AModel, FRegD010);

  result := Format('|D010|%s|',[FRegD010.cnpj]);
end;

end.
