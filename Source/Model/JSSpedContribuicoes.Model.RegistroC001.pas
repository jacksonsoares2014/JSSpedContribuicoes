unit JSSpedContribuicoes.Model.RegistroC001;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type TJSSpedContribuicoesModelRegistroC001 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindMov: TJSSpedContribuicoesIndicadorMovimento;

  public
    property indMov: TJSSpedContribuicoesIndicadorMovimento read FindMov write FindMov;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistroC001 }

constructor TJSSpedContribuicoesModelRegistroC001.create;
begin
  inherited;
  reg := 'C001';
  indMov := imSemDadosInformados;
end;

end.

