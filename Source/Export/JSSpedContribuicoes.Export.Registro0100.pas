unit JSSpedContribuicoes.Export.Registro0100;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

const
  c0100 = '|0100|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';

type TJSSpedContribuicoesExportRegistro0100 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)

  private
    FReg0100: TJSSpedContribuicoesModelRegistro0100;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;

end;

implementation

{ TJSSpedContribuicoesExportRegistro0100 }

function TJSSpedContribuicoesExportRegistro0100.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0100>(AModel, FReg0100);

  result := Format(c0100,
                   [FReg0100.nome                  ,
                    FReg0100.cpf.Trim              ,
                    FReg0100.crc.Trim              ,
                    FReg0100.cnpj.Trim             ,
                    FReg0100.cep                   ,
                    FReg0100.ender                 ,
                    FReg0100.numero                ,
                    FReg0100.compl                 ,
                    FReg0100.bairro                ,
                    FReg0100.fone                  ,
                    FReg0100.fax                   ,
                    FReg0100.email                 ,
                    FReg0100.codMun]);

end;

end.
