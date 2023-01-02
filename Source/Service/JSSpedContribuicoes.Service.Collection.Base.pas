unit JSSpedContribuicoes.Service.Collection.Base;

interface

uses
  JSSpedContribuicoes.Service.Interfaces;

type
  TJSSpedContribuicoesServiceCollectionBase = class(TInterfacedObject)
  protected
    [weak]
    FDAOCollection: IJSSpedContribuicoesDAOCollection;

  public
    function &End: IJSSpedContribuicoesDAOCollection; virtual;

    constructor create(DAOCollection: IJSSpedContribuicoesDAOCollection); virtual;
    destructor  Destroy; override;
end;


implementation

{ TJSSpedContribuicoesServiceCollectionBase }

constructor TJSSpedContribuicoesServiceCollectionBase.create(
  DAOCollection: IJSSpedContribuicoesDAOCollection);
begin
  FDAOCollection := DAOCollection;
end;

destructor TJSSpedContribuicoesServiceCollectionBase.Destroy;
begin
  inherited;
end;

function TJSSpedContribuicoesServiceCollectionBase.&End: IJSSpedContribuicoesDAOCollection;
begin
  Result := FDAOCollection;
end;

end.
