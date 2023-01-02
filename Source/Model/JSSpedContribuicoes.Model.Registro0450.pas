unit JSSpedContribuicoes.Model.Registro0450;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistro0450 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodInf: String;
    Ftxt: String;

  public
    property codInf: String read FcodInf write FcodInf;
    property txt: String read Ftxt write Ftxt;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro0450 }

constructor TJSSpedContribuicoesModelRegistro0450.create;
begin
  inherited;
  reg := '0450';
end;

destructor TJSSpedContribuicoesModelRegistro0450.Destroy;
begin
  inherited;
end;

end.
