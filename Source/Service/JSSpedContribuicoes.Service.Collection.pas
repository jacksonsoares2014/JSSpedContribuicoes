unit JSSpedContribuicoes.Service.Collection;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Service.Collection.Bloco0,
  JSSpedContribuicoes.Service.Collection.Bloco1,
  JSSpedContribuicoes.Service.Collection.BlocoA,
  JSSpedContribuicoes.Service.Collection.BlocoC,
  JSSpedContribuicoes.Service.Collection.BlocoD,
  JSSpedContribuicoes.Service.Collection.BlocoF,
  JSSpedContribuicoes.Service.Collection.BlocoM,
  JSSpedContribuicoes.Service.Collection.BlocoP;

type
  TJSSpedContribuicoesServiceDAOCollection = class(TInterfacedObject, IJSSpedContribuicoesDAOCollection)
  private
    [weak]
    FJSSpedContribuicoesService   : IJSSpedContribuicoesService;

    FCollectionBloco0: IJSSpedContribuicoesDAOCollectionBloco0;
    FCollectionBloco1: IJSSpedContribuicoesDAOCollectionBloco1;
    FCollectionBlocoA: IJSSpedContribuicoesDAOCollectionBlocoA;
    FCollectionBlocoC: IJSSpedContribuicoesDAOCollectionBlocoC;
    FCollectionBlocoD: IJSSpedContribuicoesDAOCollectionBlocoD;
    FCollectionBlocoF: IJSSpedContribuicoesDAOCollectionBlocoF;
    FCollectionBlocoM: IJSSpedContribuicoesDAOCollectionBlocoM;
    FCollectionBlocoP: IJSSpedContribuicoesDAOCollectionBlocoP;

  public
    function Bloco0: IJSSpedContribuicoesDAOCollectionBloco0;
    function Bloco1: IJSSpedContribuicoesDAOCollectionBloco1;
    function BlocoA: IJSSpedContribuicoesDAOCollectionBlocoA;
    function BlocoC: IJSSpedContribuicoesDAOCollectionBlocoC;
    function BlocoD: IJSSpedContribuicoesDAOCollectionBlocoD;
    function BlocoF: IJSSpedContribuicoesDAOCollectionBlocoF;
    function BlocoM: IJSSpedContribuicoesDAOCollectionBlocoM;
    function BlocoP: IJSSpedContribuicoesDAOCollectionBlocoP;

    function &Begin: IJSSpedContribuicoesDAOCollection;
    function &End: IJSSpedContribuicoesService;

    constructor create(JSSpedContribuicoesService: IJSSpedContribuicoesService);
    class function New(JSSpedContribuicoesService: IJSSpedContribuicoesService): IJSSpedContribuicoesDAOCollection;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceDAOCollection }

function TJSSpedContribuicoesServiceDAOCollection.&Begin: IJSSpedContribuicoesDAOCollection;
begin
  Result := Self;
end;

function TJSSpedContribuicoesServiceDAOCollection.Bloco0: IJSSpedContribuicoesDAOCollectionBloco0;
begin
  if not Assigned(FCollectionBloco0) then
    FCollectionBloco0 := TJSSpedContribuicoesServiceCollectionBloco0.New(Self);
  result := FCollectionBloco0;
end;

function TJSSpedContribuicoesServiceDAOCollection.Bloco1: IJSSpedContribuicoesDAOCollectionBloco1;
begin
  if not Assigned(FCollectionBloco1) then
    FCollectionBloco1 := TJSSpedContribuicoesServiceCollectionBloco1.New(Self);
  result := FCollectionBloco1;
end;

function TJSSpedContribuicoesServiceDAOCollection.BlocoA: IJSSpedContribuicoesDAOCollectionBlocoA;
begin
  if not Assigned(FCollectionBlocoA) then
    FCollectionBlocoA := TJSSpedContribuicoesServiceCollectionBlocoA.New(Self);
  result := FCollectionBlocoA;
end;

function TJSSpedContribuicoesServiceDAOCollection.BlocoC: IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  if not Assigned(FCollectionBlocoC) then
    FCollectionBlocoC := TJSSpedContribuicoesServiceCollectionBlocoC.New(Self);
  result := FCollectionBlocoC;
end;

function TJSSpedContribuicoesServiceDAOCollection.BlocoD: IJSSpedContribuicoesDAOCollectionBlocoD;
begin
  if not Assigned(FCollectionBlocoD) then
    FCollectionBlocoD := TJSSpedContribuicoesServiceCollectionBlocoD.New(Self);
  result := FCollectionBlocoD;
end;

function TJSSpedContribuicoesServiceDAOCollection.BlocoF: IJSSpedContribuicoesDAOCollectionBlocoF;
begin
  if not Assigned(FCollectionBlocoF) then
    FCollectionBlocoF := TJSSpedContribuicoesServiceCollectionBlocoF.New(Self);
  result := FCollectionBlocoF;
end;

function TJSSpedContribuicoesServiceDAOCollection.BlocoM: IJSSpedContribuicoesDAOCollectionBlocoM;
begin
  if not Assigned(FCollectionBlocoM) then
    FCollectionBlocoM := TJSSpedContribuicoesServiceCollectionBlocoM.New(Self);
  result := FCollectionBlocoM;
end;

function TJSSpedContribuicoesServiceDAOCollection.BlocoP: IJSSpedContribuicoesDAOCollectionBlocoP;
begin
  if not Assigned(FCollectionBlocoP) then
    FCollectionBlocoP := TJSSpedContribuicoesServiceCollectionBlocoP.New(Self);
  result := FCollectionBlocoP;
end;

constructor TJSSpedContribuicoesServiceDAOCollection.create(JSSpedContribuicoesService: IJSSpedContribuicoesService);
begin
  FJSSpedContribuicoesService := JSSpedContribuicoesService;
end;

destructor TJSSpedContribuicoesServiceDAOCollection.Destroy;
begin
  inherited;
end;

function TJSSpedContribuicoesServiceDAOCollection.&End: IJSSpedContribuicoesService;
begin
  result := FJSSpedContribuicoesService;
end;

class function TJSSpedContribuicoesServiceDAOCollection.New(JSSpedContribuicoesService: IJSSpedContribuicoesService): IJSSpedContribuicoesDAOCollection;
begin
  result := Self.create(JSSpedContribuicoesService);
end;

end.
