unit JSSpedContribuicoes.Export.RegistroD200;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cD200 = '|D200|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroD200 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD200: TJSSpedContribuicoesModelRegistroD200;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD200 }

function TJSSpedContribuicoesExportRegistroD200.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD200>(AModel, FRegD200);

  result := Format( cD200,
                    [FRegD200.codMod                     ,
                     FRegD200.codSit.toString            ,
                     FRegD200.serie                      ,
                     FRegD200.subserie                   ,
                     FRegD200.numDocIni                  ,
                     FRegD200.numDocFin                  ,
                     FRegD200.cfop                       ,
                     JSSF.formatData(FRegD200.dtRef)     ,
                     JSSF.formatCurrency(FRegD200.vlDoc) ,
                     JSSF.formatCurrency(FRegD200.vlDesc)]);
end;

end.
