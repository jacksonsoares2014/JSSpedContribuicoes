unit JSSpedContribuicoes.Export.RegistroD505;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cD505 = '|D505|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroD505 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegD505: TJSSpedContribuicoesModelRegistroD505;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroD505 }

function TJSSpedContribuicoesExportRegistroD505.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroD505>(AModel, FRegD505);

  result := Format( cD505,
                    [FRegD505.cstCofins                          ,
                     JSSF.formatCurrency(FRegD505.vlItem)        ,
                     FRegD505.natBcCred                          ,
                     JSSF.formatCurrency(FRegD505.vlBcCofins)    ,
                     JSSF.formatCurrency(FRegD505.aliqCofins,4)  ,
                     JSSF.formatCurrency(FRegD505.vlCofins)      ,
                     FRegD505.codCta]);
end;

end.
