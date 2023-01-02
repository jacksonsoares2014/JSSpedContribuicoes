unit JSSpedContribuicoes.Export.RegistroM110;

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
  cM110 = '|M110|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM110 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM110: TJSSpedContribuicoesModelRegistroM110;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM110 }

function TJSSpedContribuicoesExportRegistroM110.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM110>(AModel, FRegM110);

  result := Format( cM110,
                    [FRegM110.indAj.toString            ,
                     JSSF.formatCurrency(FRegM110.vlAj) ,
                     FRegM110.codAj                     ,
                     FRegM110.numDoc                    ,
                     FRegM110.descrAj                   ,
                     JSSF.formatData(FRegM110.dtRef)]);
end;

end.
