unit JSSpedContribuicoes.Service.Collection.BlocoA;

interface

uses
  JSSpedContribuicoes.Service.Collection.Base,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.DAO.Interfaces,
  System.Generics.Collections;

type
  TJSSpedContribuicoesServiceCollectionBlocoA = class(TJSSpedContribuicoesServiceCollectionBase, IJSSpedContribuicoesDAOCollectionBlocoA)
  private
    FCollectionDAOA100: TList<IJSSpedContribuicoesDAOA100>;

    FDAOA010 : IJSSpedContribuicoesDAOA010;
    FDAOA110 : IJSSpedContribuicoesDAOA110;
    FDAOA111 : IJSSpedContribuicoesDAOA111;
    FDAOA170 : IJSSpedContribuicoesDAOA170;

  public
    function AddA010(Value: IJSSpedContribuicoesDAOA010): IJSSpedContribuicoesDAOCollectionBlocoA;
    function AddA100(Value: IJSSpedContribuicoesDAOA100): IJSSpedContribuicoesDAOCollectionBlocoA;
    function AddA110(Value: IJSSpedContribuicoesDAOA110): IJSSpedContribuicoesDAOCollectionBlocoA;
    function AddA111(Value: IJSSpedContribuicoesDAOA111): IJSSpedContribuicoesDAOCollectionBlocoA;
    function AddA170(Value: IJSSpedContribuicoesDAOA170): IJSSpedContribuicoesDAOCollectionBlocoA;

    function CountA100: Integer;

    function DAOA010: IJSSpedContribuicoesDAOA010;
    function DAOA100(Index: Integer): IJSSpedContribuicoesDAOA100;
    function DAOA110: IJSSpedContribuicoesDAOA110;
    function DAOA111: IJSSpedContribuicoesDAOA111;
    function DAOA170: IJSSpedContribuicoesDAOA170;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoA;

    constructor create(DAOCollection: IJSSpedContribuicoesDAOCollection); override;
    class function New(DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoA;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceCollectionBlocoA }

function TJSSpedContribuicoesServiceCollectionBlocoA.AddA010(
  Value: IJSSpedContribuicoesDAOA010): IJSSpedContribuicoesDAOCollectionBlocoA;
begin
  result   := Self;
  FDAOA010 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.AddA100(
  Value: IJSSpedContribuicoesDAOA100): IJSSpedContribuicoesDAOCollectionBlocoA;
begin
  result   := Self;
  FCollectionDAOA100.Add(Value);
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.AddA110(
  Value: IJSSpedContribuicoesDAOA110): IJSSpedContribuicoesDAOCollectionBlocoA;
begin
  result   := Self;
  FDAOA110 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.AddA111(
  Value: IJSSpedContribuicoesDAOA111): IJSSpedContribuicoesDAOCollectionBlocoA;
begin
  result   := Self;
  FDAOA111 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.AddA170(
  Value: IJSSpedContribuicoesDAOA170): IJSSpedContribuicoesDAOCollectionBlocoA;
begin
  result   := Self;
  FDAOA170 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.&Begin: IJSSpedContribuicoesDAOCollectionBlocoA;
begin
  result := Self;
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.CountA100: Integer;
begin
  result := FCollectionDAOA100.Count;
end;

constructor TJSSpedContribuicoesServiceCollectionBlocoA.create(
  DAOCollection: IJSSpedContribuicoesDAOCollection);
begin
  inherited;
  FCollectionDAOA100 := TList<IJSSpedContribuicoesDAOA100>.Create;
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.DAOA010: IJSSpedContribuicoesDAOA010;
begin
  Result := FDAOA010;
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.DAOA100(Index: Integer): IJSSpedContribuicoesDAOA100;
begin
  Result := FCollectionDAOA100[Index];
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.DAOA110: IJSSpedContribuicoesDAOA110;
begin
  Result := FDAOA110;
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.DAOA111: IJSSpedContribuicoesDAOA111;
begin
  Result := FDAOA111;
end;

function TJSSpedContribuicoesServiceCollectionBlocoA.DAOA170: IJSSpedContribuicoesDAOA170;
begin
  Result := FDAOA170;
end;

destructor TJSSpedContribuicoesServiceCollectionBlocoA.Destroy;
begin
  FCollectionDAOA100.Free;
  inherited;
end;

class function TJSSpedContribuicoesServiceCollectionBlocoA.New(
  DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoA;
begin
  result := Self.Create(DAOCollection);
end;

end.
