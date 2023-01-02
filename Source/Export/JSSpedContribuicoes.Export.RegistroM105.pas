unit JSSpedContribuicoes.Export.RegistroM105;

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
  cM105 = '|M105|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroM105 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegM105: TJSSpedContribuicoesModelRegistroM105;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroM105 }

function TJSSpedContribuicoesExportRegistroM105.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel, FRegM105);

  result := Format( cM105,
                    [FRegM105.natBcCred                        ,
                     FRegM105.cstPis                           ,
                     JSSF.formatCurrency(FRegM105.vlBcPisTot)  ,
                     JSSF.formatCurrency(FRegM105.vlBcPisCum)  ,
                     JSSF.formatCurrency(FRegM105.vlBcPisNC)   ,
                     JSSF.formatCurrency(FRegM105.vlBcPis)     ,
                     JSSF.formatCurrency(FRegM105.quantBcPisTot, 3, fzNullIfZero) ,
                     JSSF.formatCurrency(FRegM105.quantBcPis, 3, fzNullIfZero)    ,
                     Copy(FRegM105.descCred,1,60)]);
end;

end.
