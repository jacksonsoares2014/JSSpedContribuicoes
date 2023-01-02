unit JSSpedContribuicoes.Export.RegistroC800;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cC800 = '|C800|%s|%s|%d|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC800 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC800: TJSSpedContribuicoesModelRegistroC800;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC800 }

function TJSSpedContribuicoesExportRegistroC800.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC800>(AModel, FRegC800);

  result := Format( cC800,
                    [FRegC800.codMod                         ,
                     FRegC800.codSit.toString                ,
                     FRegC800.numCfe                         ,
                     JSSF.formatData(FRegC800.dtDoc)         ,
                     JSSF.formatCurrency(FRegC800.vlCfe)     ,
                     JSSF.formatCurrency(FRegC800.vlPis)     ,
                     JSSF.formatCurrency(FRegC800.vlCofins)  ,
                     FRegC800.cnpjCpf                        ,
                     FRegC800.nrSat                          ,
                     FRegC800.chvCfe                         ,
                     JSSF.formatCurrency(FRegC800.vlDesc)    ,
                     JSSF.formatCurrency(FRegC800.vlMerc)    ,
                     JSSF.formatCurrency(FRegC800.vlOutDa)   ,
                     JSSF.formatCurrency(FRegC800.vlIcms)    ,
                     JSSF.formatCurrency(FRegC800.vlPisSt)   ,
                     JSSF.formatCurrency(FRegC800.vlCofinsSt)]);
end;

end.
