unit JSSpedContribuicoes.Model.RegistroF001;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type TJSSpedContribuicoesModelRegistroF001 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindMov: TJSSpedContribuicoesIndicadorMovimento;

  public
    property indMov: TJSSpedContribuicoesIndicadorMovimento read FindMov write FindMov;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistroF001 }

constructor TJSSpedContribuicoesModelRegistroF001.create;
begin
  inherited;
  reg := 'F001';
  indMov := imSemDadosInformados;
end;

end.

