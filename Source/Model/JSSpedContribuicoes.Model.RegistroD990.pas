unit JSSpedContribuicoes.Model.RegistroD990;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistroD990 = class(TJSSpedContribuicoesModelRegistro)
  private
    FqtdLinD: Integer;
  public
    property qtdLinD: Integer read FqtdLinD write FqtdLinD;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD990 }

constructor TJSSpedContribuicoesModelRegistroD990.create;
begin
  inherited;
  reg := 'D990';
  qtdLinD := 1;
end;

end.
