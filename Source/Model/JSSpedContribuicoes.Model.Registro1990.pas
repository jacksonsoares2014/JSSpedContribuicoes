unit JSSpedContribuicoes.Model.Registro1990;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistro1990 = class(TJSSpedContribuicoesModelRegistro)
  private
    FqtdLin1: Integer;
  public
    property qtdLin1: Integer read FqtdLin1 write FqtdLin1;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1990 }

constructor TJSSpedContribuicoesModelRegistro1990.create;
begin
  inherited;
  reg := '1990';
  qtdLin1 := 1;
end;

end.
