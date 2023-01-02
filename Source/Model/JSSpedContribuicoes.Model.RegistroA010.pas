unit JSSpedContribuicoes.Model.RegistroA010;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroA010 = class(TJSSpedContribuicoesModelRegistro)
  private
    Fcnpj: String;

  public
    property cnpj: String read Fcnpj write Fcnpj;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroA010 }

constructor TJSSpedContribuicoesModelRegistroA010.create;
begin
  inherited;
  reg := 'A010';
end;

destructor TJSSpedContribuicoesModelRegistroA010.Destroy;
begin
  inherited;
end;

end.

