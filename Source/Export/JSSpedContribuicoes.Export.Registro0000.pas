unit JSSpedContribuicoes.Export.Registro0000;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Base,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.SysUtils;

const
  c0000 = '|0000|%s|%d|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|%s|';

type
  TJSSpedContribuicoesExportRegistro0000 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg0000: TJSSpedContribuicoesModelRegistro0000;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro0000 }

function TJSSpedContribuicoesExportRegistro0000.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro0000>(AModel, FReg0000);

  result := Format(c0000,
                   [FReg0000.codVer                ,
                    Integer(FReg0000.tipoEscrit)   ,
                    FReg0000.indSitEsp.toString    ,
                    FReg0000.numRecAnterior        ,
                    JSSF.formatData(FReg0000.dtIni),
                    JSSF.formatData(FReg0000.dtFin),
                    FReg0000.nome                  ,
                    FReg0000.cnpj.Trim             ,
                    FReg0000.uf                    ,
                    FReg0000.codMun                ,
                    FReg0000.suframa.Trim          ,
                    FReg0000.indNatPj.toString     ,
                    FReg0000.indAtiv.toString]);
end;

end.
