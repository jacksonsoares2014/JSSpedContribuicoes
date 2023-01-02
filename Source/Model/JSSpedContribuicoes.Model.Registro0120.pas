unit JSSpedContribuicoes.Model.Registro0120;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type
  TJSSpedContribuicoesModelRegistro0120 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodScp : String;
    FinfComp: String;

  public
    property mesRefer : String read FcodScp  write FcodScp;
    property infComp  : String read FinfComp write FinfComp;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0120 }

constructor TJSSpedContribuicoesModelRegistro0120.create;
begin
  inherited;
  reg := '0120';
end;

end.
