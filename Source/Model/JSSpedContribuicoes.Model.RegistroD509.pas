unit JSSpedContribuicoes.Model.RegistroD509;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD509 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc: String;
    FindProc: TJSSpedContribuicoesOrigemProcesso;

  public
    property numProc: String                             read FnumProc write FnumProc;
    property indProc: TJSSpedContribuicoesOrigemProcesso read FindProc write FindProc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD509>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD509 }

constructor TJSSpedContribuicoesModelRegistroD509.create;
begin
  inherited;
  reg := 'D509';
end;

destructor TJSSpedContribuicoesModelRegistroD509.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD509.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD509>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD509>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD509): Integer
    var LChave, RChave: string;
    begin
      LChave := '';

      RChave := '';

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
