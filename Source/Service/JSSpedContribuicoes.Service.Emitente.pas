unit JSSpedContribuicoes.Service.Emitente;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  System.SysUtils;

type
  TJSSpedContribuicoesEmitente = class(TInterfacedObject, IJSSpedContribuicoesEmitente)
  private
    [Weak]
    FParent: IJSSpedContribuicoesService;
    FCNPJ: string;
    FCodigo: string;
    FUF: string;

  protected
    function CNPJ  (Value: String): IJSSpedContribuicoesEmitente; overload;
    function Codigo(Value: String): IJSSpedContribuicoesEmitente; overload;
    function UF    (Value: string): IJSSpedContribuicoesEmitente; overload;

    function CNPJ  : string; overload;
    function Codigo: string; overload;
    function UF    : string; overload;

    function &End: IJSSpedContribuicoesService;

  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesEmitente;
  end;

implementation

{ TJSSpedContribuicoesEmitente }

function TJSSpedContribuicoesEmitente.CNPJ(
  Value: String): IJSSpedContribuicoesEmitente;
begin
  result := Self;
  FCNPJ := Value;
end;

function TJSSpedContribuicoesEmitente.CNPJ: string;
begin
  Result := FCNPJ;
end;

function TJSSpedContribuicoesEmitente.Codigo: string;
begin
  Result := FCodigo;
end;

function TJSSpedContribuicoesEmitente.Codigo(
  Value: String): IJSSpedContribuicoesEmitente;
begin
  result := Self;
  FCodigo := Value;
end;

constructor TJSSpedContribuicoesEmitente.create(
  Parent: IJSSpedContribuicoesService);
begin
  FParent := Parent;
end;

function TJSSpedContribuicoesEmitente.&End: IJSSpedContribuicoesService;
begin
  Result := FParent;
end;

class function TJSSpedContribuicoesEmitente.New(
  Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesEmitente;
begin
  result := Self.Create(Parent);
end;

function TJSSpedContribuicoesEmitente.UF(
  Value: string): IJSSpedContribuicoesEmitente;
begin
  result := Self;
  FUF := Value;
end;

function TJSSpedContribuicoesEmitente.UF: string;
begin
  Result := FUF;
end;

end.
