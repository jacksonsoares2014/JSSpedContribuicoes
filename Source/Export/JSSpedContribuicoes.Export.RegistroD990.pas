unit JSSpedContribuicoes.Export.RegistroD990;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroD990 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD990: TJSSpedContribuicoesModelRegistroD990;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD990 }

function TJSSpedContribuicoesExportRegistroD990.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD990>(AModel, FRegD990);

  result := Format('|D990|%d|',[FRegD990.qtdLinD]);
end;

end.
