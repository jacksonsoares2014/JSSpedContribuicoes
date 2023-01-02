unit JSSpedContribuicoes.Model.Registro0035;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistro0035 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodScp : String;
    FdescScp: String;
    FinfComp: String;

  public
    property codScp : String read FcodScp  write FcodScp;
    property descScp: String read FdescScp write FdescScp;
    property infComp: String read FinfComp write FinfComp;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0035 }

constructor TJSSpedContribuicoesModelRegistro0035.create;
begin
  inherited;
  reg := '0035';
end;

end.
