unit JSSpedContribuicoes.Model.RegistroM001;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type TJSSpedContribuicoesModelRegistroM001 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindMov: TJSSpedContribuicoesIndicadorMovimento;

  public
    property indMov: TJSSpedContribuicoesIndicadorMovimento read FindMov write FindMov;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistroM001 }

constructor TJSSpedContribuicoesModelRegistroM001.create;
begin
  inherited;
  reg := 'M001';
  indMov := imSemDadosInformados;
end;

end.

