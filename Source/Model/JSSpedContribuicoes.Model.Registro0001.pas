unit JSSpedContribuicoes.Model.Registro0001;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type TJSSpedContribuicoesModelRegistro0001 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindMov: TJSSpedContribuicoesIndicadorMovimento;

  public
    property indMov: TJSSpedContribuicoesIndicadorMovimento read FindMov write FindMov;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0001 }

constructor TJSSpedContribuicoesModelRegistro0001.create;
begin
  inherited;
  //Considerando que na escrituração do Bloco '0' deve ser escriturado, no mínimo, os registros 0110 e 0140,
  //deve sempre ser informado, no Campo 02, o indicador '0 – Bloco com dados informados';
  reg := '0001';
  indMov := imComDadosInformados;
end;

end.
