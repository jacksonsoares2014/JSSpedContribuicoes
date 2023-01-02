unit JSSpedContribuicoes.Export.RegistroM505;

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
  cM505 = '|M505|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM505 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM505: TJSSpedContribuicoesModelRegistroM505;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM505 }

function TJSSpedContribuicoesExportRegistroM505.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM505>(AModel, FRegM505);

  result := Format( cM505,
                    [FRegM505.natBcCred                           ,
                     FRegM505.cstCofins                           ,
                     JSSF.formatCurrency(FRegM505.vlBcCofinsTot)  ,
                     JSSF.formatCurrency(FRegM505.vlBcCofinsCum)  ,
                     JSSF.formatCurrency(FRegM505.vlBcCofinsNC)   ,
                     JSSF.formatCurrency(FRegM505.vlBcCofins)     ,
                     JSSF.formatCurrency(FRegM505.quantBcCofinsTot, 3, fzNullIfZero) ,
                     JSSF.formatCurrency(FRegM505.quantBcCofins, 3, fzNullIfZero)    ,
                     Copy(FRegM505.descCred,1,60)]);
end;

end.
