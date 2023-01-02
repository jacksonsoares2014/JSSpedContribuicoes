unit JSSpedContribuicoes.Export.RegistroF525;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  cF525 = '|F525|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistroF525 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FRegF525: TJSSpedContribuicoesModelRegistroF525;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistroF525 }

function TJSSpedContribuicoesExportRegistroF525.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistroF525>(AModel, FRegF525);

  result := Format( cF525,
                    [JSSF.formatCurrency(FRegF525.vlRec)    ,
                     FRegF525.indRec                        ,
                     FRegF525.cnpjCpf                       ,
                     FRegF525.numDoc                        ,
                     FRegF525.codItem                       ,
                     JSSF.formatCurrency(FRegF525.vlRecDet) ,
                     FRegF525.cstPis                        ,
                     FRegF525.cstCofins                     ,
                     FRegF525.infCompl                      ,
                     FRegF525.codCta]);
end;

end.
