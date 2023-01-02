unit JSSpedContribuicoes.Model.RegistroD001;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type TJSSpedContribuicoesModelRegistroD001 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindMov: TJSSpedContribuicoesIndicadorMovimento;

  public
    property indMov: TJSSpedContribuicoesIndicadorMovimento read FindMov write FindMov;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistroD001 }

constructor TJSSpedContribuicoesModelRegistroD001.create;
begin
  inherited;
  reg := 'D001';
  indMov := imSemDadosInformados;
end;

end.

