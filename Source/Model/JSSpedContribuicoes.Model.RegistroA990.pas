unit JSSpedContribuicoes.Model.RegistroA990;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistroA990 = class(TJSSpedContribuicoesModelRegistro)
  private
    FqtdLinA: Integer;
  public
    property qtdLinA: Integer read FqtdLinA write FqtdLinA;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroA990 }

constructor TJSSpedContribuicoesModelRegistroA990.create;
begin
  inherited;
  reg := 'A990';
  qtdLinA := 1;
end;

end.
