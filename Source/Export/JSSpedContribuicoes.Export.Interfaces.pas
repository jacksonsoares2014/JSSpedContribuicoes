unit JSSpedContribuicoes.Export.Interfaces;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Model.Classes;

type
  IJSSpedContribuicoesExport = interface
    ['{F85FCAC5-0EEE-499D-9388-82DFA0011BBE}']
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string;
  end;

  IJSSpedContribuicoesExportFacade = interface
    ['{014DBEBA-4020-4A02-BA8D-0062CD4CC87C}']
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string;
  end;

function FacadeExport(Emitente: IJSSpedContribuicoesEmitente; Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>): IJSSpedContribuicoesExportFacade;

implementation

uses
  JSSpedContribuicoes.Export.Facade;

function FacadeExport(Emitente: IJSSpedContribuicoesEmitente; Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>): IJSSpedContribuicoesExportFacade;
begin
  result := TJSSpedContribuicoesExportFacade.New(Emitente, Config);
end;

end.
