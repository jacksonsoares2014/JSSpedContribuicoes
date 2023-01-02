unit JSSpedContribuicoes.Export.RegistroD205;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cD205 = '|D205|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroD205 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD205: TJSSpedContribuicoesModelRegistroD205;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD205 }

function TJSSpedContribuicoesExportRegistroD205.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD205>(AModel, FRegD205);

  result := Format( cD205,
                    [FRegD205.cstCofins                          ,
                     JSSF.formatCurrency(FRegD205.vlItem)        ,
                     JSSF.formatCurrency(FRegD205.vlBcCofins)    ,
                     JSSF.formatCurrency(FRegD205.aliqCofins,4)  ,
                     JSSF.formatCurrency(FRegD205.vlCofins)      ,
                     FRegD205.codCta]);
end;

end.
