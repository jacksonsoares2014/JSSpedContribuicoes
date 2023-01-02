unit JSSpedContribuicoes.Export.RegistroA110;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroA110 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegA110: TJSSpedContribuicoesModelRegistroA110;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroA110 }

function TJSSpedContribuicoesExportRegistroA110.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroA110>(AModel, FRegA110);

  result := Format('|A110|%s|%s|',[FRegA110.codInf,FRegA110.txtCompl]);
end;

end.
