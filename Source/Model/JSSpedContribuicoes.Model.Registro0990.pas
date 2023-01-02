unit JSSpedContribuicoes.Model.Registro0990;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistro0990 = class(TJSSpedContribuicoesModelRegistro)
  private
    FqtdLin0: Integer;

  public
    property qtdLin0: Integer read FqtdLin0 write FqtdLin0;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0990 }

constructor TJSSpedContribuicoesModelRegistro0990.create;
begin
  inherited;
  reg := '0990';
  qtdlin0 := 1;
end;

end.
