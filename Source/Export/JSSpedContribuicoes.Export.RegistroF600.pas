unit JSSpedContribuicoes.Export.RegistroF600;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cF600 = '|F600|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF600 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF600: TJSSpedContribuicoesModelRegistroF600;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF600 }

function TJSSpedContribuicoesExportRegistroF600.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF600>(AModel, FRegF600);

  result := Format( cF600,
                    [FRegF600.indNatRet                         ,
                     JSSF.formatData(FRegF600.dtRet)            ,
                     JSSF.formatCurrency(FRegF600.vlBcRet,4)    ,
                     JSSF.formatCurrency(FRegF600.vlRet)        ,
                     FRegF600.codRec                            ,
                     FRegF600.indNatRec                         ,
                     FRegF600.cnpj                              ,
                     JSSF.formatCurrency(FRegF600.vlRetPis)     ,
                     JSSF.formatCurrency(FRegF600.vlRetCofins)  ,
                     FRegF600.indDec]);
end;

end.
