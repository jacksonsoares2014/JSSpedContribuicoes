unit JSSpedContribuicoes.Export.RegistroM220;

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
  cM220 = '|M220|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM220 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM220: TJSSpedContribuicoesModelRegistroM220;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM220 }

function TJSSpedContribuicoesExportRegistroM220.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM220>(AModel, FRegM220);

  result := Format( cM220,
                    [FRegM220.indAj.toString            ,
                     JSSF.formatCurrency(FRegM220.vlAj) ,
                     FRegM220.codAj                     ,
                     FRegM220.numDoc                    ,
                     FRegM220.descrAj                   ,
                     JSSF.formatData(FRegM220.dtRef)]);
end;

end.