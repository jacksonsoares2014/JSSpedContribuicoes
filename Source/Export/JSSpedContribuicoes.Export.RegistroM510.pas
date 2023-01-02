unit JSSpedContribuicoes.Export.RegistroM510;

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
  cM510 = '|M510|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM510 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM510: TJSSpedContribuicoesModelRegistroM510;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM510 }

function TJSSpedContribuicoesExportRegistroM510.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM510>(AModel, FRegM510);

  result := Format( cM510,
                    [FRegM510.indAj.toString            ,
                     JSSF.formatCurrency(FRegM510.vlAj) ,
                     FRegM510.codAj                     ,
                     FRegM510.numDoc                    ,
                     FRegM510.descrAj                   ,
                     JSSF.formatData(FRegM510.dtRef)]);
end;

end.
