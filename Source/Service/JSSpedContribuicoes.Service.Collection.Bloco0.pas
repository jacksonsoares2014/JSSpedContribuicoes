unit JSSpedContribuicoes.Service.Collection.Bloco0;

interface

uses
  JSSpedContribuicoes.Service.Collection.Base,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.DAO.Interfaces;

type
  TJSSpedContribuicoesServiceCollectionBloco0 = class(TJSSpedContribuicoesServiceCollectionBase, IJSSpedContribuicoesDAOCollectionBloco0)
  private
    FDAO0000 : IJSSpedContribuicoesDAO0000;
    FDAO0035 : IJSSpedContribuicoesDAO0035;
    FDAO0100 : IJSSpedContribuicoesDAO0100;
    FDAO0140 : IJSSpedContribuicoesDAO0140;
    FDAO0145 : IJSSpedContribuicoesDAO0145;
    FDAO0150 : IJSSpedContribuicoesDAO0150;
    FDAO0190 : IJSSpedContribuicoesDAO0190;
    FDAO0200 : IJSSpedContribuicoesDAO0200;
    FDAO0450 : IJSSpedContribuicoesDAO0450;
    FDAO0500 : IJSSpedContribuicoesDAO0500;

  public
    function Add0000(Value: IJSSpedContribuicoesDAO0000): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0035(Value: IJSSpedContribuicoesDAO0035): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0100(Value: IJSSpedContribuicoesDAO0100): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0140(Value: IJSSpedContribuicoesDAO0140): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0145(Value: IJSSpedContribuicoesDAO0145): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0150(Value: IJSSpedContribuicoesDAO0150): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0190(Value: IJSSpedContribuicoesDAO0190): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0200(Value: IJSSpedContribuicoesDAO0200): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0450(Value: IJSSpedContribuicoesDAO0450): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0500(Value: IJSSpedContribuicoesDAO0500): IJSSpedContribuicoesDAOCollectionBloco0;

    function DAO0000: IJSSpedContribuicoesDAO0000;
    function DAO0035: IJSSpedContribuicoesDAO0035;
    function DAO0100: IJSSpedContribuicoesDAO0100;
    function DAO0140: IJSSpedContribuicoesDAO0140;
    function DAO0145: IJSSpedContribuicoesDAO0145;
    function DAO0150: IJSSpedContribuicoesDAO0150;
    function DAO0190: IJSSpedContribuicoesDAO0190;
    function DAO0200: IJSSpedContribuicoesDAO0200;
    function DAO0450: IJSSpedContribuicoesDAO0450;
    function DAO0500: IJSSpedContribuicoesDAO0500;

    function &Begin: IJSSpedContribuicoesDAOCollectionBloco0;

    constructor create(DAOCollection: IJSSpedContribuicoesDAOCollection); override;
    class function New(DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBloco0;
  end;

implementation

{ TJSSpedContribuicoesServiceCollectionBloco0 }

function TJSSpedContribuicoesServiceCollectionBloco0.Add0035(
  Value: IJSSpedContribuicoesDAO0035): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0035 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.Add0100(
  Value: IJSSpedContribuicoesDAO0100): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0100 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.Add0140(
  Value: IJSSpedContribuicoesDAO0140): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0140 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.Add0145(
  Value: IJSSpedContribuicoesDAO0145): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0145 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.Add0150(
  Value: IJSSpedContribuicoesDAO0150): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0150 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.Add0190(
  Value: IJSSpedContribuicoesDAO0190): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0190 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.Add0200(
  Value: IJSSpedContribuicoesDAO0200): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0200 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.Add0450(
  Value: IJSSpedContribuicoesDAO0450): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0450 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.Add0500(
  Value: IJSSpedContribuicoesDAO0500): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0500 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.&Begin: IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result := Self;
end;

constructor TJSSpedContribuicoesServiceCollectionBloco0.create(
  DAOCollection: IJSSpedContribuicoesDAOCollection);
begin
  inherited;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.Add0000(
  Value: IJSSpedContribuicoesDAO0000): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result   := Self;
  FDAO0000 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0000: IJSSpedContribuicoesDAO0000;
begin
  Result := FDAO0000;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0035: IJSSpedContribuicoesDAO0035;
begin
  Result := FDAO0035;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0100: IJSSpedContribuicoesDAO0100;
begin
  Result := FDAO0100;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0140: IJSSpedContribuicoesDAO0140;
begin
  Result := FDAO0140;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0145: IJSSpedContribuicoesDAO0145;
begin
  Result := FDAO0145;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0150: IJSSpedContribuicoesDAO0150;
begin
  Result := FDAO0150;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0190: IJSSpedContribuicoesDAO0190;
begin
  Result := FDAO0190;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0200: IJSSpedContribuicoesDAO0200;
begin
  Result := FDAO0200;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0450: IJSSpedContribuicoesDAO0450;
begin
  Result := FDAO0450;
end;

function TJSSpedContribuicoesServiceCollectionBloco0.DAO0500: IJSSpedContribuicoesDAO0500;
begin
  Result := FDAO0500;
end;

class function TJSSpedContribuicoesServiceCollectionBloco0.New(
  DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBloco0;
begin
  result := Self.Create(DAOCollection);
end;

end.
