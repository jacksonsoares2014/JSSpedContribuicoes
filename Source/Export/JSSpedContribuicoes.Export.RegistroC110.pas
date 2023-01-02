unit JSSpedContribuicoes.Export.RegistroC110;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistroC110 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC110: TJSSpedContribuicoesModelRegistroC110;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC110 }

function TJSSpedContribuicoesExportRegistroC110.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC110>(AModel, FRegC110);

  result := Format('|C110|%s|%s|',[FRegC110.codInf, FRegC110.txtCompl]);
end;

end.

