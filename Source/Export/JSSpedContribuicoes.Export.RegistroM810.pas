unit JSSpedContribuicoes.Export.RegistroM810;

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
  cM810 = '|M810|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM810 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM810: TJSSpedContribuicoesModelRegistroM810;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM810 }

function TJSSpedContribuicoesExportRegistroM810.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM810>(AModel, FRegM810);

  result := Format( cM810,
                    [FRegM810.natRec                     ,
                     JSSF.formatCurrency(FRegM810.vlRec) ,
                     FRegM810.codCta                     ,
                     FRegM810.descCompl]);
end;

end.
