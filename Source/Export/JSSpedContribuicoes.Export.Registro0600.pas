unit JSSpedContribuicoes.Export.Registro0600;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

type
  TJSSpedContribuicoesExportRegistro0600 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0600: TJSSpedContribuicoesModelRegistro0600;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0600 }

function TJSSpedContribuicoesExportRegistro0600.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0600>(AModel, FReg0600);

  result := Format('|0600|%s|%s|%s|',
                    [JSSF.formatData(FReg0600.dtAlt),
                     FReg0600.codCCus               ,
                     FReg0600.cCus]);
end;

end.
