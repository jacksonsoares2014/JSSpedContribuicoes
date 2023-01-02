unit JSSpedContribuicoes.Export.Registro0150;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

const
  c0150 = '|0150|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';

type
  TJSSpedContribuicoesExportRegistro0150 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0150: TJSSpedContribuicoesModelRegistro0150;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0150 }

function TJSSpedContribuicoesExportRegistro0150.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0150>(AModel, FReg0150);

  result := Format( c0150,
                    [FReg0150.codPart,
                     FReg0150.nome,
                     FReg0150.codPais,
                     FReg0150.cnpj.Trim,
                     FReg0150.cpf.Trim,
                     FReg0150.ie.Trim,
                     FReg0150.codMun,
                     FReg0150.suframa,
                     FReg0150.endereco.Trim,
                     FReg0150.numero,
                     FReg0150.compl.Trim,
                     FReg0150.bairro.Trim]);

end;

end.
