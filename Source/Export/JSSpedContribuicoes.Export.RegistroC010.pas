unit JSSpedContribuicoes.Export.RegistroC010;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroC010 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC010: TJSSpedContribuicoesModelRegistroC010;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC010 }

function TJSSpedContribuicoesExportRegistroC010.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC010>(AModel, FRegC010);

  result := Format('|C010|%s|%s|',[FRegC010.cnpj, FRegC010.indEscri.toString]);
end;

end.
