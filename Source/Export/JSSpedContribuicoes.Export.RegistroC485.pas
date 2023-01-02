unit JSSpedContribuicoes.Export.RegistroC485;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cC485 = '|C485|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroC485 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegC485: TJSSpedContribuicoesModelRegistroC485;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroC485 }

function TJSSpedContribuicoesExportRegistroC485.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroC485>(AModel, FRegC485);

  result := Format( cC485,
                    [FRegC485.cstCofins                              ,
                     JSSF.formatCurrency(FRegC485.vlItem)            ,
                     JSSF.formatCurrency(FRegC485.vlBcCofins)        ,
                     JSSF.formatCurrency(FRegC485.aliqCofins,4)      ,
                     JSSF.formatCurrency(FRegC485.quantBcCofins,3,fzNullIfZero)   ,
                     JSSF.formatCurrency(FRegC485.aliqCofinsQuant,4,fzNullIfZero) ,
                     JSSF.formatCurrency(FRegC485.vlCofins)          ,
                     FRegC485.codItem                                ,
                     FRegC485.codCta]);
end;

end.
