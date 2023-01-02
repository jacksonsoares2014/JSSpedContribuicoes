unit JSSpedContribuicoes.Model.Registro;

interface

uses
  System.Generics.Collections,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro = class
  private
    FDados: TDictionary<String, String>;
    Freg: String;
    F_id: String;

  public
    property reg: String read Freg write Freg;
    property _id: String read F_id write F_id;

    procedure AddOrSetValue(Name: String; Value: Double); overload;
    procedure AddOrSetValue(Name: String; Value: Integer); overload;
    procedure AddOrSetValue(Name, Value: String); overload;

    function GetValueDouble(Name: String): Double;
    function GetValueStr(Name: String): string;
    function GetValueInt(Name: string): Integer;

    constructor create; virtual;
    destructor Destroy; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro }

procedure TJSSpedContribuicoesModelRegistro.AddOrSetValue(Name: String;
  Value: Integer);
begin
  AddOrSetValue(Name, IntToStr(Value));
end;

procedure TJSSpedContribuicoesModelRegistro.AddOrSetValue(Name, Value: String);
begin
  FDados.AddOrSetValue(Name, Value.Trim);
end;

procedure TJSSpedContribuicoesModelRegistro.AddOrSetValue(Name: String;
  Value: Double);
begin
  AddOrSetValue(Name, FloatToStr(Value));
end;

constructor TJSSpedContribuicoesModelRegistro.create;
begin
  FDados := TDictionary<string, String>.Create;
end;

destructor TJSSpedContribuicoesModelRegistro.Destroy;
begin
  FDados.Free;
  inherited;
end;

function TJSSpedContribuicoesModelRegistro.GetValueDouble(Name: String): Double;
begin
  result := GetValueStr(Name).ToDouble;
end;

function TJSSpedContribuicoesModelRegistro.GetValueInt(Name: string): Integer;
begin
  result := GetValueStr(Name).ToInteger;
end;

function TJSSpedContribuicoesModelRegistro.GetValueStr(Name: String): string;
begin
  result := FDados.Items[Name];
end;

end.
