unit JSSpedContribuicoes.Model.RegistroF139;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF139 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc: String;
    FindProc: TJSSpedContribuicoesOrigemProcesso;

  public
    property numProc: String                             read FnumProc write FnumProc;
    property indProc: TJSSpedContribuicoesOrigemProcesso read FindProc write FindProc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF139>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF139 }

constructor TJSSpedContribuicoesModelRegistroF139.create;
begin
  inherited;
  reg := 'F139';
end;

destructor TJSSpedContribuicoesModelRegistroF139.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF139.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF139>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF139>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF139): Integer
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
