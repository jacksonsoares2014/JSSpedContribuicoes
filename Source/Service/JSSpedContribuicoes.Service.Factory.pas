unit JSSpedContribuicoes.Service.Factory;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Service.Base;

type
  TJSSpedContribuicoesServiceFactory = class(TInterfacedObject, IJSSpedContribuicoesServiceFactory)
  public
    function createService: IJSSpedContribuicoesService;

    class function New: IJSSpedContribuicoesServiceFactory;
  end;

implementation

{ TJSSpedContribuicoesServiceFactory }

function TJSSpedContribuicoesServiceFactory.createService: IJSSpedContribuicoesService;
begin
  result := TJSSpedContribuicoesService.New;
end;

class function TJSSpedContribuicoesServiceFactory.New: IJSSpedContribuicoesServiceFactory;
begin
  result := Self.Create;
end;

end.
