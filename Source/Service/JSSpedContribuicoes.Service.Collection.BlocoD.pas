unit JSSpedContribuicoes.Service.Collection.BlocoD;

interface

uses
  JSSpedContribuicoes.Service.Collection.Base,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.DAO.Interfaces,
  System.Generics.Collections;


type
  TJSSpedContribuicoesServiceCollectionBlocoD = class(TJSSpedContribuicoesServiceCollectionBase, IJSSpedContribuicoesDAOCollectionBlocoD)
  private
    FCollectionDAOD100: TList<IJSSpedContribuicoesDAOD100>;
    FCollectionDAOD200: TList<IJSSpedContribuicoesDAOD200>;
    FCollectionDAOD500: TList<IJSSpedContribuicoesDAOD500>;

    FDAOD010 : IJSSpedContribuicoesDAOD010;

    FDAOD101 : IJSSpedContribuicoesDAOD101;
    FDAOD105 : IJSSpedContribuicoesDAOD105;
    FDAOD111 : IJSSpedContribuicoesDAOD111;

    FDAOD201 : IJSSpedContribuicoesDAOD201;
    FDAOD205 : IJSSpedContribuicoesDAOD205;

    FDAOD501 : IJSSpedContribuicoesDAOD501;
    FDAOD505 : IJSSpedContribuicoesDAOD505;
    FDAOD509 : IJSSpedContribuicoesDAOD509;
  public
    function AddD010(Value: IJSSpedContribuicoesDAOD010): IJSSpedContribuicoesDAOCollectionBlocoD;

    function AddD100(Value: IJSSpedContribuicoesDAOD100): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD101(Value: IJSSpedContribuicoesDAOD101): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD105(Value: IJSSpedContribuicoesDAOD105): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD111(Value: IJSSpedContribuicoesDAOD111): IJSSpedContribuicoesDAOCollectionBlocoD;

    function AddD200(Value: IJSSpedContribuicoesDAOD200): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD201(Value: IJSSpedContribuicoesDAOD201): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD205(Value: IJSSpedContribuicoesDAOD205): IJSSpedContribuicoesDAOCollectionBlocoD;

    function AddD500(Value: IJSSpedContribuicoesDAOD500): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD501(Value: IJSSpedContribuicoesDAOD501): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD505(Value: IJSSpedContribuicoesDAOD505): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD509(Value: IJSSpedContribuicoesDAOD509): IJSSpedContribuicoesDAOCollectionBlocoD;

    function CountD100: Integer;
    function CountD200: Integer;
    function CountD500: Integer;

    function DAOD010: IJSSpedContribuicoesDAOD010;

    function DAOD100(Index: Integer): IJSSpedContribuicoesDAOD100;
    function DAOD101: IJSSpedContribuicoesDAOD101;
    function DAOD105: IJSSpedContribuicoesDAOD105;
    function DAOD111: IJSSpedContribuicoesDAOD111;

    function DAOD200(Index: Integer): IJSSpedContribuicoesDAOD200;
    function DAOD201: IJSSpedContribuicoesDAOD201;
    function DAOD205: IJSSpedContribuicoesDAOD205;

    function DAOD500(Index: Integer): IJSSpedContribuicoesDAOD500;
    function DAOD501: IJSSpedContribuicoesDAOD501;
    function DAOD505: IJSSpedContribuicoesDAOD505;
    function DAOD509: IJSSpedContribuicoesDAOD509;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoD;

    constructor create(DAOCollection: IJSSpedContribuicoesDAOCollection); override;
    class function New(DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoD;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceCollectionBlocoD }

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD010(
  Value: IJSSpedContribuicoesDAOD010): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FDAOD010 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD100(
  Value: IJSSpedContribuicoesDAOD100): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FCollectionDAOD100.Add(Value);
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD101(
  Value: IJSSpedContribuicoesDAOD101): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FDAOD101 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD105(
  Value: IJSSpedContribuicoesDAOD105): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FDAOD105 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD111(
  Value: IJSSpedContribuicoesDAOD111): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FDAOD111 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD200(
  Value: IJSSpedContribuicoesDAOD200): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FCollectionDAOD200.Add(Value);
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD201(
  Value: IJSSpedContribuicoesDAOD201): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FDAOD201 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD205(
  Value: IJSSpedContribuicoesDAOD205): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FDAOD205 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD500(
  Value: IJSSpedContribuicoesDAOD500): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FCollectionDAOD500.Add(Value);
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD501(
  Value: IJSSpedContribuicoesDAOD501): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FDAOD501 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD505(
  Value: IJSSpedContribuicoesDAOD505): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FDAOD505 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.AddD509(
  Value: IJSSpedContribuicoesDAOD509): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result   := Self;
  FDAOD509 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.&Begin: IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result := Self;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.CountD100: Integer;
begin
  result := FCollectionDAOD100.Count;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.CountD200: Integer;
begin
  result := FCollectionDAOD200.Count;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.CountD500: Integer;
begin
  result := FCollectionDAOD500.Count;
end;

constructor TJSSpedContribuicoesServiceCollectionBlocoD.create(
  DAOCollection: IJSSpedContribuicoesDAOCollection);
begin
  inherited;
  FCollectionDAOD100 := TList<IJSSpedContribuicoesDAOD100>.Create;
  FCollectionDAOD200 := TList<IJSSpedContribuicoesDAOD200>.Create;
  FCollectionDAOD500 := TList<IJSSpedContribuicoesDAOD500>.Create;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD010: IJSSpedContribuicoesDAOD010;
begin
  Result := FDAOD010;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD100(
  Index: Integer): IJSSpedContribuicoesDAOD100;
begin
  Result := FCollectionDAOD100[Index];
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD101: IJSSpedContribuicoesDAOD101;
begin
  Result := FDAOD101;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD105: IJSSpedContribuicoesDAOD105;
begin
  Result := FDAOD105;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD111: IJSSpedContribuicoesDAOD111;
begin
  Result := FDAOD111;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD200(
  Index: Integer): IJSSpedContribuicoesDAOD200;
begin
  Result := FCollectionDAOD200[Index];
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD201: IJSSpedContribuicoesDAOD201;
begin
  Result := FDAOD201;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD205: IJSSpedContribuicoesDAOD205;
begin
  Result := FDAOD205;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD500(
  Index: Integer): IJSSpedContribuicoesDAOD500;
begin
  Result := FCollectionDAOD500[Index];
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD501: IJSSpedContribuicoesDAOD501;
begin
  Result := FDAOD501;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD505: IJSSpedContribuicoesDAOD505;
begin
  Result := FDAOD505;
end;

function TJSSpedContribuicoesServiceCollectionBlocoD.DAOD509: IJSSpedContribuicoesDAOD509;
begin
  Result := FDAOD509;
end;

destructor TJSSpedContribuicoesServiceCollectionBlocoD.Destroy;
begin
  FCollectionDAOD100.Free;
  FCollectionDAOD200.Free;
  FCollectionDAOD500.Free;
  inherited;
end;

class function TJSSpedContribuicoesServiceCollectionBlocoD.New(
  DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  result := Self.Create(DAOCollection);
end;

end.

