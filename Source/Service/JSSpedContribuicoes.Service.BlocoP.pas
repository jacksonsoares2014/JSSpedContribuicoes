unit JSSpedContribuicoes.Service.BlocoP;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Service.Counter,
  JSSpedContribuicoes.Service.Status,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.DAO.Interfaces,
  JSSpedContribuicoes.Export.Interfaces,
  System.Threading,
  System.Generics.Collections,
  System.DateUtils,
  System.SysUtils,
  System.Classes;

type
  TJSSpedContribuicoesServiceBlocoP = class(TInterfacedObject, IJSSpedContribuicoesServiceBlocoP)
  private
    [Weak]
    FSpedContribuicoesService: IJSSpedContribuicoesService;

    [Weak]
    FBloco0: IJSSpedContribuicoesServiceBloco0;

    FStatus     : IJSSpedContribuicoesServiceStatus;
    FacadeExport: IJSSpedContribuicoesExportFacade;
    FArquivo    : TStrings;

    procedure OnAddRegistro(Registro: TJSSpedContribuicoesModelRegistro);
    procedure OnLogErro(ALogErro: String);

    procedure AdicionaLinhaSped(ARegistro: TJSSpedContribuicoesModelRegistro; AIndex: Integer = -1);

    procedure gerarP010; overload;
    procedure gerarP010(ARegP010: TJSSpedContribuicoesModelRegistroP010); overload;
    procedure gerarP100(ARegP010: TJSSpedContribuicoesModelRegistroP010);
    procedure gerarP200(ARegP010: TJSSpedContribuicoesModelRegistroP010);

  protected
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoP;

    function &End: IJSSpedContribuicoesService;
  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoP;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceBlocoP }

procedure TJSSpedContribuicoesServiceBlocoP.AdicionaLinhaSped(
  ARegistro: TJSSpedContribuicoesModelRegistro; AIndex: Integer);
var
  linhaSped: string;
begin
  linhaSped := FacadeExport.linhaSped(ARegistro);
  if AIndex < 0 then
    FArquivo.Add(linhaSped)
  else
    FArquivo.Insert(AIndex, linhaSped);

  Counter.AddCounter(ARegistro);
//  OnAddRegistro(ARegistro);
end;

constructor TJSSpedContribuicoesServiceBlocoP.create(
  Parent: IJSSpedContribuicoesService);
begin
  FSpedContribuicoesService := Parent;
  FArquivo     := TStringList.Create;
  FStatus      := TJSSpedContribuicoesServiceStatus.New(Self.FSpedContribuicoesService).Bloco('P');
  FacadeExport := JSSpedContribuicoes.Export.Interfaces
                    .FacadeExport(FSpedContribuicoesService.Emitente, FSpedContribuicoesService.Config);
end;

destructor TJSSpedContribuicoesServiceBlocoP.Destroy;
begin
  if Assigned(FArquivo) then
    FArquivo.Free;

  inherited;
end;

function TJSSpedContribuicoesServiceBlocoP.&End: IJSSpedContribuicoesService;
begin
  result := FSpedContribuicoesService;
end;

function TJSSpedContribuicoesServiceBlocoP.Execute: TStrings;
var
  regP001 : TJSSpedContribuicoesModelRegistroP001;
  regP990 : TJSSpedContribuicoesModelRegistroP990;
begin
  try
    regP001 := nil;
    regP990 := nil;
    try
      gerarP010;

      regP001 := TJSSpedContribuicoesModelRegistroP001.create;
      if FArquivo.Count > 0 then
        regP001.indMov := imComDadosInformados;
      AdicionaLinhaSped(regP001,0);

      regP990 := TJSSpedContribuicoesModelRegistroP990.create;
      regP990.qtdlinP := regP990.qtdlinP + FArquivo.Count;
      AdicionaLinhaSped(regP990);

      result := FArquivo;
    finally
      regP001.Free;
      regP990.Free;
    end;
  except
    on e: Exception Do
    begin
      FArquivo.Free;
      OnLogErro('Houve erro na geração do blooo P: ' + e.Message);
      Raise;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoP.gerarP010(
  ARegP010: TJSSpedContribuicoesModelRegistroP010);
begin
  if FSpedContribuicoesService.Config.GerarBlocoP then
  begin
    gerarP100(ARegP010);
    gerarP200(ARegP010);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoP.gerarP010;
var
  i, n     : Integer;
  dao      : IJSSpedContribuicoesDAOP010;
  regP010  : TJSSpedContribuicoesModelRegistroP010;
  p010     : TObjectList<TJSSpedContribuicoesModelRegistroP010>;
begin
  dao := FSpedContribuicoesService.DAO.BlocoP.DAOP010;
  if not Assigned(dao) then
    Exit;

  p010 := dao.list;
  try
    for i := 0 to Pred(p010.Count) do
    begin
      regP010          := p010[i];
      n                := FArquivo.Count;
      gerarP010(regP010);
      if FArquivo.Count > n then
        AdicionaLinhaSped(regP010,n);
    end;
  finally
    p010.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoP.gerarP100(
  ARegP010: TJSSpedContribuicoesModelRegistroP010);
var
  i       : Integer;
  regP100 : TJSSpedContribuicoesModelRegistroP100;
  p100    : TObjectList<TJSSpedContribuicoesModelRegistroP100>;
begin
  p100 := FSpedContribuicoesService.DAO.BlocoP.DAOP100.listP100(ARegP010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
  try
    if (not Assigned(p100)) or (p100.Count = 0) then
      Exit;

    FStatus
      .Registro('P100')
      .TotalRegistros(p100.Count);

    for i := 0 to Pred(p100.Count) do
    begin
      regP100 := p100[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regP100._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regP100);
      FBloco0.AddCodConta(regP100.codCta);
    end;
  finally
    p100.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoP.gerarP200(
  ARegP010: TJSSpedContribuicoesModelRegistroP010);
var
  i       : Integer;
  regP200 : TJSSpedContribuicoesModelRegistroP200;
  p200    : TObjectList<TJSSpedContribuicoesModelRegistroP200>;
begin
  p200 := FSpedContribuicoesService.DAO.BlocoP.DAOP200.listP200(ARegP010, FSpedContribuicoesService.Config.DataInicial);
  try
    if (not Assigned(p200)) or (p200.Count = 0) then
      Exit;

    FStatus
      .Registro('P200')
      .TotalRegistros(p200.Count);

    for i := 0 to Pred(p200.Count) do
    begin
      regP200 := p200[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regP200._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regP200);
    end;
  finally
    p200.Free;
  end;
end;

class function TJSSpedContribuicoesServiceBlocoP.New(
  Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoP;
begin
  result := Self.create(Parent);
end;

procedure TJSSpedContribuicoesServiceBlocoP.OnAddRegistro(
  Registro: TJSSpedContribuicoesModelRegistro);
begin

end;

procedure TJSSpedContribuicoesServiceBlocoP.OnLogErro(ALogErro: String);
var
  onLogErro: TOnSpedContribuicoesLogErro;
begin
  onLogErro := FSpedContribuicoesService.Config.OnLogErro;

  if Assigned(onLogErro) then
    OnLogErro(ALogErro);
end;

function TJSSpedContribuicoesServiceBlocoP.ServiceBloco0(
  Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoP;
begin
  result  := Self;
  FBloco0 := Value;
end;

end.
