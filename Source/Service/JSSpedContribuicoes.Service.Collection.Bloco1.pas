unit JSSpedContribuicoes.Service.Collection.Bloco1;

interface

uses
  JSSpedContribuicoes.Service.Collection.Base,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.DAO.Interfaces;

type
  TJSSpedContribuicoesServiceCollectionBloco1 = class(TJSSpedContribuicoesServiceCollectionBase, IJSSpedContribuicoesDAOCollectionBloco1)
  private
    FDAO1011 : IJSSpedContribuicoesDAO1011;
    FDAO1100 : IJSSpedContribuicoesDAO1100;
    FDAO1101 : IJSSpedContribuicoesDAO1101;
    FDAO1300 : IJSSpedContribuicoesDAO1300;
    FDAO1500 : IJSSpedContribuicoesDAO1500;
    FDAO1501 : IJSSpedContribuicoesDAO1501;
    FDAO1700 : IJSSpedContribuicoesDAO1700;
    FDAO1900 : IJSSpedContribuicoesDAO1900;

  public
    function Add1011(Value: IJSSpedContribuicoesDAO1011): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1100(Value: IJSSpedContribuicoesDAO1100): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1101(Value: IJSSpedContribuicoesDAO1101): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1300(Value: IJSSpedContribuicoesDAO1300): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1500(Value: IJSSpedContribuicoesDAO1500): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1501(Value: IJSSpedContribuicoesDAO1501): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1700(Value: IJSSpedContribuicoesDAO1700): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1900(Value: IJSSpedContribuicoesDAO1900): IJSSpedContribuicoesDAOCollectionBloco1;

    function DAO1011: IJSSpedContribuicoesDAO1011;
    function DAO1100: IJSSpedContribuicoesDAO1100;
    function DAO1101: IJSSpedContribuicoesDAO1101;
    function DAO1300: IJSSpedContribuicoesDAO1300;
    function DAO1500: IJSSpedContribuicoesDAO1500;
    function DAO1501: IJSSpedContribuicoesDAO1501;
    function DAO1700: IJSSpedContribuicoesDAO1700;
    function DAO1900: IJSSpedContribuicoesDAO1900;

    function &Begin: IJSSpedContribuicoesDAOCollectionBloco1;

    constructor create(DAOCollection: IJSSpedContribuicoesDAOCollection); override;
    class function New(DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBloco1;
  end;

implementation

{ TJSSpedContribuicoesServiceCollectionBloco1 }

function TJSSpedContribuicoesServiceCollectionBloco1.Add1011(
  Value: IJSSpedContribuicoesDAO1011): IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result   := Self;
  FDAO1011 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.Add1100(
  Value: IJSSpedContribuicoesDAO1100): IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result   := Self;
  FDAO1100 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.Add1101(
  Value: IJSSpedContribuicoesDAO1101): IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result   := Self;
  FDAO1101 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.Add1300(
  Value: IJSSpedContribuicoesDAO1300): IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result   := Self;
  FDAO1300 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.Add1500(
  Value: IJSSpedContribuicoesDAO1500): IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result   := Self;
  FDAO1500 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.Add1501(
  Value: IJSSpedContribuicoesDAO1501): IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result   := Self;
  FDAO1501 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.Add1700(
  Value: IJSSpedContribuicoesDAO1700): IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result   := Self;
  FDAO1700 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.Add1900(
  Value: IJSSpedContribuicoesDAO1900): IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result   := Self;
  FDAO1900 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.&Begin: IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result := Self;
end;

constructor TJSSpedContribuicoesServiceCollectionBloco1.create(
  DAOCollection: IJSSpedContribuicoesDAOCollection);
begin
  inherited;

end;

function TJSSpedContribuicoesServiceCollectionBloco1.DAO1011: IJSSpedContribuicoesDAO1011;
begin
  Result := FDAO1011;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.DAO1100: IJSSpedContribuicoesDAO1100;
begin
  Result := FDAO1100;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.DAO1101: IJSSpedContribuicoesDAO1101;
begin
  Result := FDAO1101;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.DAO1300: IJSSpedContribuicoesDAO1300;
begin
  Result := FDAO1300;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.DAO1500: IJSSpedContribuicoesDAO1500;
begin
  Result := FDAO1500;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.DAO1501: IJSSpedContribuicoesDAO1501;
begin
  Result := FDAO1501;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.DAO1700: IJSSpedContribuicoesDAO1700;
begin
  Result := FDAO1700;
end;

function TJSSpedContribuicoesServiceCollectionBloco1.DAO1900: IJSSpedContribuicoesDAO1900;
begin
  Result := FDAO1900;
end;

class function TJSSpedContribuicoesServiceCollectionBloco1.New(
  DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBloco1;
begin
  result := Self.Create(DAOCollection);
end;

end.
