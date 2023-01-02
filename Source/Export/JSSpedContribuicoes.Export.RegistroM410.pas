unit JSSpedContribuicoes.Export.RegistroM410;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils,
  System.DateUtils;

const
  cM410 = '|M410|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM410 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM410: TJSSpedContribuicoesModelRegistroM410;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM410 }

function TJSSpedContribuicoesExportRegistroM410.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM410>(AModel, FRegM410);

  result := Format( cM410,
                    [FRegM410.natRec                     ,
                     JSSF.formatCurrency(FRegM410.vlRec) ,
                     FRegM410.codCta                     ,
                     FRegM410.descCompl]);
end;

end.
