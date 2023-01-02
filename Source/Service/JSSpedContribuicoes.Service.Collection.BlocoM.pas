unit JSSpedContribuicoes.Service.Collection.BlocoM;

interface

uses
  JSSpedContribuicoes.Service.Collection.Base,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.DAO.Interfaces,
  System.Generics.Collections;

type
  TJSSpedContribuicoesServiceCollectionBlocoM = class(TJSSpedContribuicoesServiceCollectionBase, IJSSpedContribuicoesDAOCollectionBlocoM)
  private
    FDAOM110 : IJSSpedContribuicoesDAOM110;
    FDAOM115 : IJSSpedContribuicoesDAOM115;
    FDAOM220 : IJSSpedContribuicoesDAOM220;
    FDAOM225 : IJSSpedContribuicoesDAOM225;
    FDAOM350 : IJSSpedContribuicoesDAOM350;
    FDAOM510 : IJSSpedContribuicoesDAOM510;
    FDAOM515 : IJSSpedContribuicoesDAOM515;
    FDAOM620 : IJSSpedContribuicoesDAOM620;
    FDAOM625 : IJSSpedContribuicoesDAOM625;

  public
    function AddM110(Value: IJSSpedContribuicoesDAOM110): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM115(Value: IJSSpedContribuicoesDAOM115): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM220(Value: IJSSpedContribuicoesDAOM220): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM225(Value: IJSSpedContribuicoesDAOM225): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM350(Value: IJSSpedContribuicoesDAOM350): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM510(Value: IJSSpedContribuicoesDAOM510): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM515(Value: IJSSpedContribuicoesDAOM515): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM620(Value: IJSSpedContribuicoesDAOM620): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM625(Value: IJSSpedContribuicoesDAOM625): IJSSpedContribuicoesDAOCollectionBlocoM;

    function DAOM110: IJSSpedContribuicoesDAOM110;
    function DAOM115: IJSSpedContribuicoesDAOM115;
    function DAOM220: IJSSpedContribuicoesDAOM220;
    function DAOM225: IJSSpedContribuicoesDAOM225;
    function DAOM350: IJSSpedContribuicoesDAOM350;
    function DAOM510: IJSSpedContribuicoesDAOM510;
    function DAOM515: IJSSpedContribuicoesDAOM515;
    function DAOM620: IJSSpedContribuicoesDAOM620;
    function DAOM625: IJSSpedContribuicoesDAOM625;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoM;

    constructor create(DAOCollection: IJSSpedContribuicoesDAOCollection); override;
    class function New(DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoM;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceCollectionBlocoM }

function TJSSpedContribuicoesServiceCollectionBlocoM.AddM110(
  Value: IJSSpedContribuicoesDAOM110): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result   := Self;
  FDAOM110 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.AddM115(
  Value: IJSSpedContribuicoesDAOM115): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result   := Self;
  FDAOM115 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.AddM220(
  Value: IJSSpedContribuicoesDAOM220): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result   := Self;
  FDAOM220 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.AddM225(
  Value: IJSSpedContribuicoesDAOM225): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result   := Self;
  FDAOM225 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.AddM350(
  Value: IJSSpedContribuicoesDAOM350): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result   := Self;
  FDAOM350 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.AddM510(
  Value: IJSSpedContribuicoesDAOM510): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result   := Self;
  FDAOM510 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.AddM515(
  Value: IJSSpedContribuicoesDAOM515): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result   := Self;
  FDAOM515 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.AddM620(
  Value: IJSSpedContribuicoesDAOM620): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result   := Self;
  FDAOM620 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.AddM625(
  Value: IJSSpedContribuicoesDAOM625): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result   := Self;
  FDAOM625 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.&Begin: IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result := Self;
end;

constructor TJSSpedContribuicoesServiceCollectionBlocoM.create(
  DAOCollection: IJSSpedContribuicoesDAOCollection);
begin
  inherited;

end;

function TJSSpedContribuicoesServiceCollectionBlocoM.DAOM110: IJSSpedContribuicoesDAOM110;
begin
  Result := FDAOM110;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.DAOM115: IJSSpedContribuicoesDAOM115;
begin
  Result := FDAOM115;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.DAOM220: IJSSpedContribuicoesDAOM220;
begin
  Result := FDAOM220;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.DAOM225: IJSSpedContribuicoesDAOM225;
begin
  Result := FDAOM225;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.DAOM350: IJSSpedContribuicoesDAOM350;
begin
  Result := FDAOM350;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.DAOM510: IJSSpedContribuicoesDAOM510;
begin
  Result := FDAOM510;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.DAOM515: IJSSpedContribuicoesDAOM515;
begin
  Result := FDAOM515;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.DAOM620: IJSSpedContribuicoesDAOM620;
begin
  Result := FDAOM620;
end;

function TJSSpedContribuicoesServiceCollectionBlocoM.DAOM625: IJSSpedContribuicoesDAOM625;
begin
  Result := FDAOM625;
end;

destructor TJSSpedContribuicoesServiceCollectionBlocoM.Destroy;
begin

  inherited;
end;

class function TJSSpedContribuicoesServiceCollectionBlocoM.New(
  DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  result := Self.Create(DAOCollection);
end;

end.
