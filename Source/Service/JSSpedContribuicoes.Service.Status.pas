unit JSSpedContribuicoes.Service.Status;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  Vcl.Forms,
  System.SysUtils,
  System.Classes,
  System.Threading;

type
  TJSSpedContribuicoesServiceStatus = class(TInterfacedObject, IJSSpedContribuicoesServiceStatus)

  private
    [Weak]
    FService: IJSSpedContribuicoesService;
    FAguarde: Boolean;
    FBloco: string;
    FRegistro: String;
    FIdRegistro: string;
    FTotalRegistros: Integer;
    FRegistroAtual: Integer;

    FRegistroFilho: string;
    FIdRegistroFilho: string;
    FTotalRegistrosFilho: Integer;
    FRegistroFilhoAtual: Integer;

  protected
    function Bloco: string; overload;
    function Aguarde: Boolean; overload;
    function Registro: string; overload;
    function IdRegistro: string; overload;
    function TotalRegistros: Integer; overload;
    function RegistroAtual: Integer; overload;

    function RegistroFilho: string; overload;
    function IdRegistroFilho: String; overload;
    function TotalRegistrosFilho: Integer; overload;
    function RegistroFilhoAtual: Integer; overload;

    function Bloco          (Value: string): IJSSpedContribuicoesServiceStatus; overload;
    function Aguarde        (Value: Boolean): IJSSpedContribuicoesServiceStatus; overload;
    function Registro       (Value: string): IJSSpedContribuicoesServiceStatus; overload;
    function IdRegistro     (Value: String): IJSSpedContribuicoesServiceStatus; overload;
    function TotalRegistros (Value: Integer): IJSSpedContribuicoesServiceStatus; overload;
    function RegistroAtual  (Value: Integer): IJSSpedContribuicoesServiceStatus; overload;

    function RegistroFilho       (Value: string): IJSSpedContribuicoesServiceStatus; overload;
    function IdRegistroFilho     (Value: String): IJSSpedContribuicoesServiceStatus; overload;
    function TotalRegistrosFilho (Value: Integer): IJSSpedContribuicoesServiceStatus; overload;
    function RegistroFilhoAtual  (Value: Integer): IJSSpedContribuicoesServiceStatus; overload;

    function ShowStatus: IJSSpedContribuicoesServiceStatus;
  public
    constructor create(Service: IJSSpedContribuicoesService);
    class function New(Service: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceStatus;
end;

implementation

{ TJSSpedContribuicoesServiceStatus }

function TJSSpedContribuicoesServiceStatus.Bloco: string;
begin
  Result := FBloco;
end;

function TJSSpedContribuicoesServiceStatus.Aguarde(
  Value: Boolean): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FAguarde := Value;
end;

function TJSSpedContribuicoesServiceStatus.Aguarde: Boolean;
begin
  Result := FAguarde;
end;

function TJSSpedContribuicoesServiceStatus.Bloco(Value: string): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FBloco := Value;
end;

constructor TJSSpedContribuicoesServiceStatus.create(Service: IJSSpedContribuicoesService);
begin
  FService := Service;
end;

function TJSSpedContribuicoesServiceStatus.IdRegistro: string;
begin
  result := FIdRegistro;
end;

function TJSSpedContribuicoesServiceStatus.IdRegistro(Value: String): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FIdRegistro := Value;
end;

function TJSSpedContribuicoesServiceStatus.IdRegistroFilho: String;
begin
  result := FIdRegistroFilho;
end;

function TJSSpedContribuicoesServiceStatus.IdRegistroFilho(Value: String): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FIdRegistroFilho := Value;
end;

class function TJSSpedContribuicoesServiceStatus.New(Service: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceStatus;
begin
  result := Self.Create(Service);
end;

function TJSSpedContribuicoesServiceStatus.Registro(Value: string): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FRegistro := Value;
  FRegistroAtual := 0;
  FTotalRegistros := 0;
end;

function TJSSpedContribuicoesServiceStatus.RegistroAtual(Value: Integer): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FRegistroAtual := Value;
end;

function TJSSpedContribuicoesServiceStatus.RegistroAtual: Integer;
begin
  result := FRegistroAtual;
end;

function TJSSpedContribuicoesServiceStatus.RegistroFilho(Value: string): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FRegistroFilho := Value;

  FRegistroFilhoAtual := 0;
  FTotalRegistrosFilho := 0;
end;

function TJSSpedContribuicoesServiceStatus.RegistroFilho: string;
begin
  result := FRegistroFilho;
end;

function TJSSpedContribuicoesServiceStatus.RegistroFilhoAtual: Integer;
begin
  result := FRegistroFilhoAtual;
end;

function TJSSpedContribuicoesServiceStatus.RegistroFilhoAtual(Value: Integer): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FRegistroFilhoAtual := Value;
end;

function TJSSpedContribuicoesServiceStatus.ShowStatus: IJSSpedContribuicoesServiceStatus;
var
  onStatus: TOnSpedContribuicoesStatus;
begin
  Result   := Self;
  onStatus := Self.FService.Config.OnStatus;

  if Assigned(onStatus) then
  begin
    TThread.Synchronize(TThread.CurrentThread,
      procedure
      begin
        onStatus(Self);
      end
    );
  end;
end;

function TJSSpedContribuicoesServiceStatus.TotalRegistros: Integer;
begin
  result := FTotalRegistros;
end;

function TJSSpedContribuicoesServiceStatus.TotalRegistros(Value: Integer): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FTotalRegistros := Value;
end;

function TJSSpedContribuicoesServiceStatus.TotalRegistrosFilho: Integer;
begin
  result := FTotalRegistrosFilho;
end;

function TJSSpedContribuicoesServiceStatus.TotalRegistrosFilho(Value: Integer): IJSSpedContribuicoesServiceStatus;
begin
  result := Self;
  FTotalRegistrosFilho := Value;
end;

function TJSSpedContribuicoesServiceStatus.Registro: string;
begin
  result := FRegistro;
end;

end.
