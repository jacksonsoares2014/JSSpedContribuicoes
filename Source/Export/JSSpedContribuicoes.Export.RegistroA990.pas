unit JSSpedContribuicoes.Export.RegistroA990;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroA990 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegA990: TJSSpedContribuicoesModelRegistroA990;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroA990 }

function TJSSpedContribuicoesExportRegistroA990.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroA990>(AModel, FRegA990);

  result := Format('|A990|%d|',[FRegA990.qtdLinA]);
end;

end.
