unit JSSpedContribuicoes.Model.RegistroF111;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF111 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc: String;
    FindProc: TJSSpedContribuicoesOrigemProcesso;

  public
    property numProc: String                             read FnumProc write FnumProc;
    property indProc: TJSSpedContribuicoesOrigemProcesso read FindProc write FindProc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF111>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF111 }

constructor TJSSpedContribuicoesModelRegistroF111.create;
begin
  inherited;
  reg := 'F111';
end;

destructor TJSSpedContribuicoesModelRegistroF111.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF111.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF111>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF111>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF111): Integer
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
