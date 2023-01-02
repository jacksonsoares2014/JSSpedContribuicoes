unit JSSpedContribuicoes.Export.Base;

interface

uses
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Model.Classes,
  System.SysUtils;

type
  TJSSpedContribuicoesExportBase = class(TInterfacedObject, IJSSpedContribuicoesExport)
  protected
    [Weak]
    FEmitente: IJSSpedContribuicoesEmitente;

    [Weak]
    FConfig: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>;

    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string; virtual; abstract;

    procedure validateInstance<T: TJSSpedContribuicoesModelRegistro, constructor>(AModel: TJSSpedContribuicoesModelRegistro; var Reference: T);
  public
    constructor create(Emitente: IJSSpedContribuicoesEmitente; Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>);
    class function New(Emitente: IJSSpedContribuicoesEmitente; Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>): IJSSpedContribuicoesExport;
end;

implementation

{ TJSSpedContribuicoesExportBase }

constructor TJSSpedContribuicoesExportBase.create(Emitente: IJSSpedContribuicoesEmitente;
  Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>);
begin
  FEmitente := Emitente;
  FConfig   := Config;
end;

class function TJSSpedContribuicoesExportBase.New(Emitente: IJSSpedContribuicoesEmitente;
  Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>): IJSSpedContribuicoesExport;
begin
  result := Self.create(Emitente, Config);
end;

procedure TJSSpedContribuicoesExportBase.validateInstance<T>(AModel: TJSSpedContribuicoesModelRegistro; var Reference: T);
var
  model: T;
begin
  model := T.create;
  try
    if not (AModel is T) then
      raise Exception.CreateFmt('Invalid Instance %s, expected is %s', [AModel.reg, model.reg]);

    Reference := T(AModel);
  finally
    model.free;
  end;
end;

end.
