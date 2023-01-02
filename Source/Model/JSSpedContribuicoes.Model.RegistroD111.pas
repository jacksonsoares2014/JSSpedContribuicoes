unit JSSpedContribuicoes.Model.RegistroD111;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD111 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc: String;
    FindProc: TJSSpedContribuicoesOrigemProcesso;

  public
    property numProc: String                             read FnumProc write FnumProc;
    property indProc: TJSSpedContribuicoesOrigemProcesso read FindProc write FindProc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD111>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD111 }

constructor TJSSpedContribuicoesModelRegistroD111.create;
begin
  inherited;
  reg := 'D111';
end;

destructor TJSSpedContribuicoesModelRegistroD111.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD111.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD111>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD111>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD111): Integer
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
