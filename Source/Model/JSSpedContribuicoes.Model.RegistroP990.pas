unit JSSpedContribuicoes.Model.RegistroP990;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistroP990 = class(TJSSpedContribuicoesModelRegistro)
  private
    FqtdLinP: Integer;
  public
    property qtdLinP: Integer read FqtdLinP write FqtdLinP;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroP990 }

constructor TJSSpedContribuicoesModelRegistroP990.create;
begin
  inherited;
  reg := 'P990';
  qtdLinP := 1;
end;

end.
