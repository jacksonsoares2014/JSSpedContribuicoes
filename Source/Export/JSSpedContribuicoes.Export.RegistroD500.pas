unit JSSpedContribuicoes.Export.RegistroD500;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

const
  cD500 = '|D500|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroD500 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD500: TJSSpedContribuicoesModelRegistroD500;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD500 }

function TJSSpedContribuicoesExportRegistroD500.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD500>(AModel, FRegD500);

  result := Format( cD500,
                    [FRegD500.indOper.toString,
                     FRegD500.indEmit.toString,
                     FRegD500.codPart,
                     FRegD500.codMod,
                     FRegD500.codSit.toString,
                     FRegD500.serie,
                     FRegD500.subserie,
                     FRegD500.numDoc,
                     JSSF.formatData(FRegD500.dtDoc),
                     JSSF.formatData(FRegD500.dtAp),
                     JSSF.formatCurrency(FRegD500.vlDoc),
                     JSSF.formatCurrency(FRegD500.vlDesc),
                     JSSF.formatCurrency(FRegD500.vlServ),
                     JSSF.formatCurrency(FRegD500.vlServNt),
                     JSSF.formatCurrency(FRegD500.vlTerc),
                     JSSF.formatCurrency(FRegD500.vlDa),
                     JSSF.formatCurrency(FRegD500.vlBcIcms),
                     JSSF.formatCurrency(FRegD500.vlIcms),
                     FRegD500.codInf,
                     JSSF.formatCurrency(FRegD500.vlPis),
                     JSSF.formatCurrency(FRegD500.vlCofins)]);
end;

end.
