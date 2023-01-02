unit JSSpedContribuicoes.Export.RegistroM620;

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
  cM620 = '|M620|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM620 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM620: TJSSpedContribuicoesModelRegistroM620;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM620 }

function TJSSpedContribuicoesExportRegistroM620.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM620>(AModel, FRegM620);

  result := Format( cM620,
                    [FRegM620.indAj.toString            ,
                     JSSF.formatCurrency(FRegM620.vlAj) ,
                     FRegM620.codAj                     ,
                     FRegM620.numDoc                    ,
                     FRegM620.descrAj                   ,
                     JSSF.formatData(FRegM620.dtRef)]);
end;

end.
