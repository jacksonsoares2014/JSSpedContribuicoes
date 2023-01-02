unit JSSpedContribuicoes.Export.RegistroA010;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroA010 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegA010: TJSSpedContribuicoesModelRegistroA010;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroA010 }

function TJSSpedContribuicoesExportRegistroA010.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroA010>(AModel, FRegA010);

  result := Format('|A010|%s|',[FRegA010.cnpj]);
end;

end.
