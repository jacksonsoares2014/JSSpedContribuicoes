unit JSSpedContribuicoes.Export.Registro1010;

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
  c1010 = '|1010|%s|%s|%s|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro1010 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1010: TJSSpedContribuicoesModelRegistro1010;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1010 }

function TJSSpedContribuicoesExportRegistro1010.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1010>(AModel, FReg1010);

  result := Format( c1010,
                    [FReg1010.numProc    ,
                     FReg1010.idSecJud   ,
                     FReg1010.idVara     ,
                     FReg1010.indNatAcao ,
                     FReg1010.descDecJud ,
                     JSSF.formatData(FReg1010.dtSentJud)]);
end;

end.
