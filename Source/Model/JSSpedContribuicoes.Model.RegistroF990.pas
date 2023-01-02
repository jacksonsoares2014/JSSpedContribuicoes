unit JSSpedContribuicoes.Model.RegistroF990;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistroF990 = class(TJSSpedContribuicoesModelRegistro)
  private
    FqtdLinF: Integer;
  public
    property qtdLinF: Integer read FqtdLinF write FqtdLinF;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF990 }

constructor TJSSpedContribuicoesModelRegistroF990.create;
begin
  inherited;
  reg := 'F990';
  qtdLinF := 1;
end;

end.
