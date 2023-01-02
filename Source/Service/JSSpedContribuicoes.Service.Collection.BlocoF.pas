unit JSSpedContribuicoes.Service.Collection.BlocoF;

interface

uses
  JSSpedContribuicoes.Service.Collection.Base,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.DAO.Interfaces,
  System.Generics.Collections;

type
  TJSSpedContribuicoesServiceCollectionBlocoF = class(TJSSpedContribuicoesServiceCollectionBase, IJSSpedContribuicoesDAOCollectionBlocoF)
  private
    FCollectionDAOF100: TList<IJSSpedContribuicoesDAOF100>;

    FDAOF010 : IJSSpedContribuicoesDAOF010;
    FDAOF111 : IJSSpedContribuicoesDAOF111;
    FDAOF120 : IJSSpedContribuicoesDAOF120;
    FDAOF129 : IJSSpedContribuicoesDAOF129;
    FDAOF130 : IJSSpedContribuicoesDAOF130;
    FDAOF139 : IJSSpedContribuicoesDAOF139;
    FDAOF200 : IJSSpedContribuicoesDAOF200;
    FDAOF205 : IJSSpedContribuicoesDAOF205;
    FDAOF210 : IJSSpedContribuicoesDAOF210;
    FDAOF211 : IJSSpedContribuicoesDAOF211;
    FDAOF500 : IJSSpedContribuicoesDAOF500;
    FDAOF525 : IJSSpedContribuicoesDAOF525;
    FDAOF550 : IJSSpedContribuicoesDAOF550;
    FDAOF600 : IJSSpedContribuicoesDAOF600;

  public
    function AddF010(Value: IJSSpedContribuicoesDAOF010): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF100(Value: IJSSpedContribuicoesDAOF100): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF111(Value: IJSSpedContribuicoesDAOF111): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF120(Value: IJSSpedContribuicoesDAOF120): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF129(Value: IJSSpedContribuicoesDAOF129): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF130(Value: IJSSpedContribuicoesDAOF130): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF139(Value: IJSSpedContribuicoesDAOF139): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF200(Value: IJSSpedContribuicoesDAOF200): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF205(Value: IJSSpedContribuicoesDAOF205): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF210(Value: IJSSpedContribuicoesDAOF210): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF211(Value: IJSSpedContribuicoesDAOF211): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF500(Value: IJSSpedContribuicoesDAOF500): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF525(Value: IJSSpedContribuicoesDAOF525): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF550(Value: IJSSpedContribuicoesDAOF550): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF600(Value: IJSSpedContribuicoesDAOF600): IJSSpedContribuicoesDAOCollectionBlocoF;

    function CountF100: Integer;

    function DAOF010: IJSSpedContribuicoesDAOF010;
    function DAOF100(Index: Integer): IJSSpedContribuicoesDAOF100;
    function DAOF111: IJSSpedContribuicoesDAOF111;

    function DAOF120: IJSSpedContribuicoesDAOF120;
    function DAOF129: IJSSpedContribuicoesDAOF129;

    function DAOF130: IJSSpedContribuicoesDAOF130;
    function DAOF139: IJSSpedContribuicoesDAOF139;

    function DAOF200: IJSSpedContribuicoesDAOF200;
    function DAOF205: IJSSpedContribuicoesDAOF205;
    function DAOF210: IJSSpedContribuicoesDAOF210;
    function DAOF211: IJSSpedContribuicoesDAOF211;

    function DAOF500: IJSSpedContribuicoesDAOF500;
    function DAOF525: IJSSpedContribuicoesDAOF525;
    function DAOF550: IJSSpedContribuicoesDAOF550;

    function DAOF600: IJSSpedContribuicoesDAOF600;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoF;

    constructor create(DAOCollection: IJSSpedContribuicoesDAOCollection); override;
    class function New(DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoF;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceCollectionBlocoF }

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF010(
  Value: IJSSpedContribuicoesDAOF010): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF010 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF100(
  Value: IJSSpedContribuicoesDAOF100): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FCollectionDAOF100.Add(Value);
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF111(
  Value: IJSSpedContribuicoesDAOF111): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF111 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF120(
  Value: IJSSpedContribuicoesDAOF120): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF120 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF129(
  Value: IJSSpedContribuicoesDAOF129): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF129 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF130(
  Value: IJSSpedContribuicoesDAOF130): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF130 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF139(
  Value: IJSSpedContribuicoesDAOF139): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF139 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF200(
  Value: IJSSpedContribuicoesDAOF200): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF200 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF205(
  Value: IJSSpedContribuicoesDAOF205): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF205 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF210(
  Value: IJSSpedContribuicoesDAOF210): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF210 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF211(
  Value: IJSSpedContribuicoesDAOF211): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF211 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF500(
  Value: IJSSpedContribuicoesDAOF500): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF500 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF525(
  Value: IJSSpedContribuicoesDAOF525): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF525 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF550(
  Value: IJSSpedContribuicoesDAOF550): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF550 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.AddF600(
  Value: IJSSpedContribuicoesDAOF600): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result   := Self;
  FDAOF600 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.&Begin: IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result := Self;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.CountF100: Integer;
begin
  result := FCollectionDAOF100.Count;
end;

constructor TJSSpedContribuicoesServiceCollectionBlocoF.create(
  DAOCollection: IJSSpedContribuicoesDAOCollection);
begin
  inherited;
  FCollectionDAOF100 := TList<IJSSpedContribuicoesDAOF100>.Create;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF010: IJSSpedContribuicoesDAOF010;
begin
  Result := FDAOF010;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF100(
  Index: Integer): IJSSpedContribuicoesDAOF100;
begin
  Result := FCollectionDAOF100[Index];
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF111: IJSSpedContribuicoesDAOF111;
begin
  Result := FDAOF111;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF120: IJSSpedContribuicoesDAOF120;
begin
  Result := FDAOF120;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF129: IJSSpedContribuicoesDAOF129;
begin
  Result := FDAOF129;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF130: IJSSpedContribuicoesDAOF130;
begin
  Result := FDAOF130;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF139: IJSSpedContribuicoesDAOF139;
begin
  Result := FDAOF139;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF200: IJSSpedContribuicoesDAOF200;
begin
  Result := FDAOF200;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF205: IJSSpedContribuicoesDAOF205;
begin
  Result := FDAOF205;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF210: IJSSpedContribuicoesDAOF210;
begin
  Result := FDAOF210;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF211: IJSSpedContribuicoesDAOF211;
begin
  Result := FDAOF211;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF500: IJSSpedContribuicoesDAOF500;
begin
  Result := FDAOF500;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF525: IJSSpedContribuicoesDAOF525;
begin
  Result := FDAOF525;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF550: IJSSpedContribuicoesDAOF550;
begin
  Result := FDAOF550;
end;

function TJSSpedContribuicoesServiceCollectionBlocoF.DAOF600: IJSSpedContribuicoesDAOF600;
begin
  Result := FDAOF600;
end;

destructor TJSSpedContribuicoesServiceCollectionBlocoF.Destroy;
begin
  FCollectionDAOF100.Free;
  inherited;
end;

class function TJSSpedContribuicoesServiceCollectionBlocoF.New(
  DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  result := Self.Create(DAOCollection);
end;

end.
