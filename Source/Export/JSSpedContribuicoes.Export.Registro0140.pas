unit JSSpedContribuicoes.Export.Registro0140;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

const
  c0140 = '|0140|%s|%s|%s|%s|%s|%s|%s|%s|';

type
  TJSSpedContribuicoesExportRegistro0140 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0140: TJSSpedContribuicoesModelRegistro0140;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0140 }

function TJSSpedContribuicoesExportRegistro0140.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0140>(AModel, FReg0140);

  result := Format(c0140,
                   [FReg0140.codEst,
                    FReg0140.nome  ,
                    FReg0140.cnpj  ,
                    FReg0140.uf    ,
                    FReg0140.ie    ,
                    FReg0140.codMun,
                    FReg0140.im    ,
                    FReg0140.suframa]);

end;

end.
