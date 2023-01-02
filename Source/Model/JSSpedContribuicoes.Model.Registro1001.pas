unit JSSpedContribuicoes.Model.Registro1001;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type TJSSpedContribuicoesModelRegistro1001 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindMov: TJSSpedContribuicoesIndicadorMovimento;

  public
    property indMov: TJSSpedContribuicoesIndicadorMovimento read FindMov write FindMov;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro1001 }

constructor TJSSpedContribuicoesModelRegistro1001.create;
begin
  inherited;
  reg := '1001';
  indMov := imSemDadosInformados;
end;

end.

