unit JSSpedContribuicoes.Model.RegistroC111;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC111 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc: String;
    FindProc: TJSSpedContribuicoesOrigemProcesso;

  public
    property numProc: String                             read FnumProc write FnumProc;
    property indProc: TJSSpedContribuicoesOrigemProcesso read FindProc write FindProc;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC111 }

constructor TJSSpedContribuicoesModelRegistroC111.create;
begin
  inherited;
  reg := 'C111';
end;

destructor TJSSpedContribuicoesModelRegistroC111.Destroy;
begin
  inherited;
end;

end.
