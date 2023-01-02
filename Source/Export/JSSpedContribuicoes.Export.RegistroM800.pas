unit JSSpedContribuicoes.Export.RegistroM800;

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
  cM800 = '|M800|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM800 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM800: TJSSpedContribuicoesModelRegistroM800;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM800 }

function TJSSpedContribuicoesExportRegistroM800.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM800>(AModel, FRegM800);

  result := Format( cM800,
                    [FRegM800.cstCofins                     ,
                     JSSF.formatCurrency(FRegM800.vlTotRec) ,
                     FRegM800.codCta                        ,
                     FRegM800.descCompl]);
end;

end.
