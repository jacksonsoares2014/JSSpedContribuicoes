unit JSSpedContribuicoes.Model.RegistroA001;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type TJSSpedContribuicoesModelRegistroA001 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindMov: TJSSpedContribuicoesIndicadorMovimento;

  public
    property indMov: TJSSpedContribuicoesIndicadorMovimento read FindMov write FindMov;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistroA001 }

constructor TJSSpedContribuicoesModelRegistroA001.create;
begin
  inherited;
  reg := 'A001';
  indMov := imSemDadosInformados;
end;

end.
