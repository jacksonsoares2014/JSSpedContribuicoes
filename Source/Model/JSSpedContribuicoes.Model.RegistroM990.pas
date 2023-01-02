unit JSSpedContribuicoes.Model.RegistroM990;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistroM990 = class(TJSSpedContribuicoesModelRegistro)
  private
    FqtdLinM: Integer;
  public
    property qtdLinM: Integer read FqtdLinM write FqtdLinM;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM990 }

constructor TJSSpedContribuicoesModelRegistroM990.create;
begin
  inherited;
  reg := 'M990';
  qtdLinM := 1;
end;

end.
