unit JSSpedContribuicoes.Export.RegistroM400;

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
  cM400 = '|M400|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM400 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM400: TJSSpedContribuicoesModelRegistroM400;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM400 }

function TJSSpedContribuicoesExportRegistroM400.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM400>(AModel, FRegM400);

  result := Format( cM400,
                    [FRegM400.cstPis                        ,
                     JSSF.formatCurrency(FRegM400.vlTotRec) ,
                     FRegM400.codCta                        ,
                     FRegM400.descCompl]);
end;

end.
