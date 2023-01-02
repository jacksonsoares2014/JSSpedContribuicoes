unit JSSpedContribuicoes.Export.Registro0145;

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
  c0145 = '|0145|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro0145 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0145: TJSSpedContribuicoesModelRegistro0145;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0145 }

function TJSSpedContribuicoesExportRegistro0145.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0145>(AModel, FReg0145);

  result := Format( c0145,
                    [FReg0145.codIncTrib.toString                 ,
                     JSSF.formatCurrency(FReg0145.vlRecTot)       ,
                     JSSF.formatCurrency(FReg0145.vlRecAtiv)      ,
                     JSSF.formatCurrency(FReg0145.vlRecDemaisAtiv),
                     FReg0145.infoCompl]);
end;

end.
