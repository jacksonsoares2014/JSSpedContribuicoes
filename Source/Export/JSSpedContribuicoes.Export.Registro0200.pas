unit JSSpedContribuicoes.Export.Registro0200;

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
  c0200 = '|0200|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro0200 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0200: TJSSpedContribuicoesModelRegistro0200;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0200 }

function TJSSpedContribuicoesExportRegistro0200.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0200>(AModel, FReg0200);

  result := Format( c0200,
                    [FReg0200.codItem,
                     FReg0200.descrItem,
                     FReg0200.codBarra,
                     FReg0200.codAntItem,
                     FReg0200.unidInv,
                     FReg0200.tipoItem.toString,
                     FReg0200.codNcm,
                     FReg0200.exIpi,
                     FReg0200.codGen,
                     FReg0200.codLst,
                     JSSF.formatCurrency(FReg0200.aliqIcms)]);
end;

end.
