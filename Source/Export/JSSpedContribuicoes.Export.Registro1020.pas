unit JSSpedContribuicoes.Export.Registro1020;

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
  c1020 = '|1020|%s|%s|%s|';


type
  TJSSpedContribuicoesExportRegistro1020 = class(TJSSpedContribuicoesExportBase, IJSSpedContribuicoesExport)
  private
    FReg1020: TJSSpedContribuicoesModelRegistro1020;

  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; override;
  end;

implementation

{ TJSSpedContribuicoesExportRegistro1020 }

function TJSSpedContribuicoesExportRegistro1020.linhaSped(
  AModel: TJSSpedContribuicoesModelRegistro): string;
begin
  validateInstance<TJSSpedContribuicoesModelRegistro1020>(AModel, FReg1020);

  result := Format( c1020,
                    [FReg1020.numProc    ,
                     FReg1020.indNatAcao ,
                     JSSF.formatData(FReg1020.dtDecAdm)]);
end;

end.
