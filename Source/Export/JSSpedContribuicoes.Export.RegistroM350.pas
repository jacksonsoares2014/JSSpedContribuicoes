unit JSSpedContribuicoes.Export.RegistroM350;

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
  cM350 = '|M350|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM350 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM350: TJSSpedContribuicoesModelRegistroM350;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM350 }

function TJSSpedContribuicoesExportRegistroM350.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM350>(AModel, FRegM350);

  result := Format( cM350,
                    [JSSF.formatCurrency(FRegM350.vlTotFol)   ,
                     JSSF.formatCurrency(FRegM350.vlExcBc)    ,
                     JSSF.formatCurrency(FRegM350.vlTotBc)    ,
                     JSSF.formatCurrency(FRegM350.aliqPisFol) ,
                     JSSF.formatCurrency(FRegM350.vlTotContFol)]);
end;

end.
