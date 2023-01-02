unit JSSpedContribuicoes.Model.RegistroP001;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type TJSSpedContribuicoesModelRegistroP001 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindMov: TJSSpedContribuicoesIndicadorMovimento;

  public
    property indMov: TJSSpedContribuicoesIndicadorMovimento read FindMov write FindMov;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistroP001 }

constructor TJSSpedContribuicoesModelRegistroP001.create;
begin
  inherited;
  reg := 'P001';
  indMov := imSemDadosInformados;
end;

end.

