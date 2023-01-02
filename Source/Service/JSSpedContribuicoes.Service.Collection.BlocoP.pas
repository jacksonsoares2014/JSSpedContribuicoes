unit JSSpedContribuicoes.Service.Collection.BlocoP;

interface

uses
  JSSpedContribuicoes.Service.Collection.Base,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.DAO.Interfaces,
  System.Generics.Collections;

type
  TJSSpedContribuicoesServiceCollectionBlocoP = class(TJSSpedContribuicoesServiceCollectionBase, IJSSpedContribuicoesDAOCollectionBlocoP)
  private
    FDAOP010 : IJSSpedContribuicoesDAOP010;
    FDAOP100 : IJSSpedContribuicoesDAOP100;
    FDAOP200 : IJSSpedContribuicoesDAOP200;

  public
    function AddP010(Value: IJSSpedContribuicoesDAOP010): IJSSpedContribuicoesDAOCollectionBlocoP;
    function AddP100(Value: IJSSpedContribuicoesDAOP100): IJSSpedContribuicoesDAOCollectionBlocoP;
    function AddP200(Value: IJSSpedContribuicoesDAOP200): IJSSpedContribuicoesDAOCollectionBlocoP;

    function DAOP010: IJSSpedContribuicoesDAOP010;
    function DAOP100: IJSSpedContribuicoesDAOP100;
    function DAOP200: IJSSpedContribuicoesDAOP200;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoP;

    constructor create(DAOCollection: IJSSpedContribuicoesDAOCollection); override;
    class function New(DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoP;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceCollectionBlocoP }

function TJSSpedContribuicoesServiceCollectionBlocoP.AddP010(
  Value: IJSSpedContribuicoesDAOP010): IJSSpedContribuicoesDAOCollectionBlocoP;
begin
  result   := Self;
  FDAOP010 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoP.AddP100(
  Value: IJSSpedContribuicoesDAOP100): IJSSpedContribuicoesDAOCollectionBlocoP;
begin
  result   := Self;
  FDAOP100 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoP.AddP200(
  Value: IJSSpedContribuicoesDAOP200): IJSSpedContribuicoesDAOCollectionBlocoP;
begin
  result   := Self;
  FDAOP200 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoP.&Begin: IJSSpedContribuicoesDAOCollectionBlocoP;
begin
  result := Self;
end;

constructor TJSSpedContribuicoesServiceCollectionBlocoP.create(
  DAOCollection: IJSSpedContribuicoesDAOCollection);
begin
  inherited;

end;

function TJSSpedContribuicoesServiceCollectionBlocoP.DAOP010: IJSSpedContribuicoesDAOP010;
begin
  Result := FDAOP010;
end;

function TJSSpedContribuicoesServiceCollectionBlocoP.DAOP100: IJSSpedContribuicoesDAOP100;
begin
  Result := FDAOP100;
end;

function TJSSpedContribuicoesServiceCollectionBlocoP.DAOP200: IJSSpedContribuicoesDAOP200;
begin
  Result := FDAOP200;
end;

destructor TJSSpedContribuicoesServiceCollectionBlocoP.Destroy;
begin

  inherited;
end;

class function TJSSpedContribuicoesServiceCollectionBlocoP.New(
  DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoP;
begin
  result := Self.Create(DAOCollection);
end;

end.
