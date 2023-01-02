unit JSSpedContribuicoes.Model.RegistroC990;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistroC990 = class(TJSSpedContribuicoesModelRegistro)
  private
    FqtdLinC: Integer;
  public
    property qtdLinC: Integer read FqtdLinC write FqtdLinC;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC990 }

constructor TJSSpedContribuicoesModelRegistroC990.create;
begin
  inherited;
  reg := 'C990';
  qtdLinC := 1;
end;

end.
