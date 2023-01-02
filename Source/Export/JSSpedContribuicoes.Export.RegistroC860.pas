unit JSSpedContribuicoes.Export.RegistroC860;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC860 = '|C860|%s|%s|%s|%d|%d|';


type
  TJSSpedContribuicoesExportRegistroC860 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC860: TJSSpedContribuicoesModelRegistroC860;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC860 }

function TJSSpedContribuicoesExportRegistroC860.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC860>(AModel, FRegC860);

  result := Format( cC860,
                    [FRegC860.codMod                ,
                     FRegC860.nrSat                 ,
                     JSSF.formatData(FRegC860.dtDoc),
                     FRegC860.docIni                ,
                     FRegC860.docFim]);
end;

end.

