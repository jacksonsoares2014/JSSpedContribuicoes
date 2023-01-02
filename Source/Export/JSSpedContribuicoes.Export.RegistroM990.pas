unit JSSpedContribuicoes.Export.RegistroM990;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroM990 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM990: TJSSpedContribuicoesModelRegistroM990;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM990 }

function TJSSpedContribuicoesExportRegistroM990.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM990>(AModel, FRegM990);

  result := Format('|M990|%d|',[FRegM990.qtdLinM]);
end;

end.
