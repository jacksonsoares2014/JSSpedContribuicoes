unit JSSpedContribuicoes.Service.Counter;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Collections;

type TJSSpedContribuicoesServiceCount = class

  private
    FCounter : TDictionary<string, Integer>;

  public
    procedure AddCounter(ARegistro: TJSSpedContribuicoesModelRegistro); overload;
    procedure AddCounter(ARegistro: String); overload;
    procedure ClearCounter;
    function GetCounter: TDictionary<string, Integer>;

    destructor Destroy; override;
end;

var
  Counter: TJSSpedContribuicoesServiceCount;

implementation

{ TJSSpedContribuicoesServiceCount }

procedure TJSSpedContribuicoesServiceCount.AddCounter(ARegistro: TJSSpedContribuicoesModelRegistro);
begin
  AddCounter(ARegistro.reg);
end;

procedure TJSSpedContribuicoesServiceCount.AddCounter(ARegistro: String);
var
  totalRegistro: Integer;
begin
  if not Assigned(FCounter) then
    FCounter := TDictionary<String, Integer>.create;

  if not FCounter.TryGetValue(ARegistro, totalRegistro) then
    totalRegistro := 0;

  totalRegistro := totalRegistro + 1;
  FCounter.AddOrSetValue(ARegistro, totalRegistro);
end;

procedure TJSSpedContribuicoesServiceCount.ClearCounter;
begin
  FCounter.Clear;
end;

destructor TJSSpedContribuicoesServiceCount.Destroy;
begin
  FCounter.Free;
  inherited;
end;

function TJSSpedContribuicoesServiceCount.GetCounter: TDictionary<string, Integer>;
begin
  result := FCounter;
end;

initialization
  Counter := TJSSpedContribuicoesServiceCount.Create;

finalization
  Counter.Free;

end.
