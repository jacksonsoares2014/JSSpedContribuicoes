unit JSSpedContribuicoes.Model.RegistroF129;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF129 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc: String;
    FindProc: TJSSpedContribuicoesOrigemProcesso;

  public
    property numProc: String                             read FnumProc write FnumProc;
    property indProc: TJSSpedContribuicoesOrigemProcesso read FindProc write FindProc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF129>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF129 }

constructor TJSSpedContribuicoesModelRegistroF129.create;
begin
  inherited;
  reg := 'F129';
end;

destructor TJSSpedContribuicoesModelRegistroF129.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF129.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF129>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF129>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF129): Integer
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
