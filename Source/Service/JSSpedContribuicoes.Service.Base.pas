unit JSSpedContribuicoes.Service.Base;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Service.Emitente,
  JSSpedContribuicoes.Service.Config,
  JSSpedContribuicoes.Service.Collection,
  JSSpedContribuicoes.Service.Counter,
  System.Classes;


type
  TJSSpedContribuicoesService = class(TInterfacedObject, IJSSpedContribuicoesService)
  private
    FBloco0: IJSSpedContribuicoesServiceBloco0;
    FBlocoM: IJSSpedContribuicoesServiceBlocoM;
    FBloco1: IJSSpedContribuicoesServiceBloco1;

    FEmitente       : IJSSpedContribuicoesEmitente;
    FJSDAOCollection: IJSSpedContribuicoesDAOCollection;
    FConfig         : IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>;

    FArqSpedContribuicoes: TStrings;

    procedure gerarBloco0(ABloco0: TStrings);
    procedure gerarBloco1(ABloco1: TStrings);
    procedure gerarBlocoA(ABlocoA: TStrings);
    procedure gerarBlocoC(ABlocoC: TStrings);
    procedure gerarBlocoD(ABlocoD: TStrings);
    procedure gerarBlocoF(ABlocoF: TStrings);
    procedure gerarBlocoM(ABlocoM: TStrings);
    procedure gerarBlocoP(ABlocoP: TStrings);
    procedure gerarBloco9(ABloco9: TStrings);

    procedure SaveToFile;
  public
    function DAO     : IJSSpedContribuicoesDAOCollection;
    function Emitente: IJSSpedContribuicoesEmitente;
    function Config  : IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>;

    function Execute: IJSSpedContribuicoesService;

    constructor create;
    destructor  Destroy; override;
    class function New: IJSSpedContribuicoesService;
end;

implementation

uses
  JSSpedContribuicoes.Service.Bloco0,
  JSSpedContribuicoes.Service.Bloco1,
  JSSpedContribuicoes.Service.BlocoA,
  JSSpedContribuicoes.Service.BlocoC,
  JSSpedContribuicoes.Service.BlocoD,
  JSSpedContribuicoes.Service.BlocoF,
  JSSpedContribuicoes.Service.BlocoM,
  JSSpedContribuicoes.Service.BlocoP,
  JSSpedContribuicoes.Service.Bloco9;


{ TJSSpedContribuicoesService }

function TJSSpedContribuicoesService.Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>;
begin
  if not Assigned(FConfig) then
    FConfig := TJSSpedContribuicoesServiceConfig<IJSSpedContribuicoesService>.New(Self);
  result := FConfig;
end;

constructor TJSSpedContribuicoesService.create;
begin
  FBloco0      := TJSSpedContribuicoesServiceBloco0.New(Self);
  FBlocoM      := TJSSpedContribuicoesServiceBlocoM.New(Self);
  FBloco1      := TJSSpedContribuicoesServiceBloco1.New(Self);
end;

function TJSSpedContribuicoesService.DAO: IJSSpedContribuicoesDAOCollection;
begin
  if not Assigned(FJSDAOCollection) then
    FJSDAOCollection := TJSSpedContribuicoesServiceDAOCollection.New(Self);
  result := FJSDAOCollection;
end;

destructor TJSSpedContribuicoesService.Destroy;
begin

  inherited;
end;

function TJSSpedContribuicoesService.Emitente: IJSSpedContribuicoesEmitente;
begin
  if not Assigned(FEmitente) then
    FEmitente := TJSSpedContribuicoesEmitente.New(Self);
  result := FEmitente;
end;

function TJSSpedContribuicoesService.Execute: IJSSpedContribuicoesService;
var
  bloco0: TStrings;
  bloco1: TStrings;
  blocoA: TStrings;
  blocoC: TStrings;
  blocoD: TStrings;
  blocoF: TStrings;
  blocoM: TStrings;
  blocoP: TStrings;
  bloco9: TStrings;

  procedure addSped(bloco: TStrings);
  var
    j : Integer;
  begin
    if (not Assigned(bloco)) or (bloco.Count = 0) then
      Exit;

    for j := 0 to Pred(bloco.Count) do
      FArqSpedContribuicoes.Add(bloco[j]);
  end;
begin
  result := Self;
  FArqSpedContribuicoes := TStringList.Create;
  bloco0 := TStringList.Create;
  bloco1 := TStringList.Create;
  blocoA := TStringList.Create;
  blocoC := TStringList.Create;
  blocoD := TStringList.Create;
  blocoF := TStringList.Create;
  blocoM := TStringList.Create;
  blocoP := TStringList.Create;
  bloco9 := TStringList.Create;

  try
    if FConfig.GerarRelatorio then
    begin
      gerarBlocoA(blocoA);
      gerarBlocoC(blocoC);
      gerarBlocoD(blocoD);
      gerarBlocoF(blocoF);
      gerarBloco1(bloco1);
      gerarBlocoM(blocoM);
    end
    else
    begin
      gerarBlocoA(blocoA);
      gerarBlocoC(blocoC);
      gerarBlocoD(blocoD);
      gerarBlocoF(blocoF);
      gerarBlocoP(blocoP);
      gerarBloco1(bloco1);
      gerarBloco0(bloco0);
      gerarBlocoM(blocoM);
      gerarBloco9(bloco9);

      addSped(bloco0);
      addSped(blocoA);
      addSped(blocoC);
      addSped(blocoD);
      addSped(blocoF);
      addSped(blocoM);
      addSped(blocoP);
      addSped(bloco1);
      addSped(bloco9);
    end;

    SaveToFile;
  finally
    blocoA.free;
    blocoC.free;
    blocoD.free;
    blocoF.free;
    blocoM.free;
    blocoP.free;
    bloco0.Free;
    bloco1.Free;
    bloco9.Free;
    FArqSpedContribuicoes.Free;
    Counter.ClearCounter;
  end;
end;

procedure TJSSpedContribuicoesService.gerarBloco0(ABloco0: TStrings);
begin
  ABloco0.AddStrings(FBloco0.Execute);
end;

procedure TJSSpedContribuicoesService.gerarBloco1(ABloco1: TStrings);
begin
  ABloco1.AddStrings(FBloco1
                       .ServiceBloco0(FBloco0)
                       .ServiceBlocoM(FBlocoM)
                       .Execute);
end;

procedure TJSSpedContribuicoesService.gerarBloco9(ABloco9: TStrings);
begin
  ABloco9.AddStrings(TJSSpedContribuicoesServiceBloco9.New(Self).Execute);
end;

procedure TJSSpedContribuicoesService.gerarBlocoA(ABlocoA: TStrings);
var
  blocoA: IJSSpedContribuicoesServiceBlocoA;
begin
  blocoA := TJSSpedContribuicoesServiceBlocoA.New(Self);
  blocoA
    .ServiceBloco0(FBloco0)
    .ServiceBloco1(FBloco1)
    .ServiceBlocoM(FBlocoM);

  ABlocoA.AddStrings(blocoA.Execute);
end;

procedure TJSSpedContribuicoesService.gerarBlocoC(ABlocoC: TStrings);
var
  blocoC: IJSSpedContribuicoesServiceBlocoC;
begin
  blocoC := TJSSpedContribuicoesServiceBlocoC.New(Self);
  blocoC
    .ServiceBloco0(FBloco0)
    .ServiceBloco1(FBloco1)
    .ServiceBlocoM(FBlocoM);

  ABlocoC.AddStrings(blocoC.Execute);
end;

procedure TJSSpedContribuicoesService.gerarBlocoD(ABlocoD: TStrings);
var
  blocoD: IJSSpedContribuicoesServiceBlocoD;
begin
  blocoD := TJSSpedContribuicoesServiceBlocoD.New(Self);
  blocoD
    .ServiceBloco0(FBloco0)
    .ServiceBlocoM(FBlocoM);

  ABlocoD.AddStrings(blocoD.Execute);
end;

procedure TJSSpedContribuicoesService.gerarBlocoF(ABlocoF: TStrings);
var
  blocoF: IJSSpedContribuicoesServiceBlocoF;
begin
  blocoF := TJSSpedContribuicoesServiceBlocoF.New(Self);
  blocoF
    .ServiceBloco0(FBloco0)
    .ServiceBlocoM(FBlocoM);

  ABlocoF.AddStrings(blocoF.Execute);
end;

procedure TJSSpedContribuicoesService.gerarBlocoM(ABlocoM: TStrings);
begin
  ABlocoM.AddStrings(FBlocoM
                       .ServiceBloco0(FBloco0)
                       .Execute);
end;

procedure TJSSpedContribuicoesService.gerarBlocoP(ABlocoP: TStrings);
var
  blocoP: IJSSpedContribuicoesServiceBlocoP;
begin
  blocoP := TJSSpedContribuicoesServiceBlocoP.New(Self);
  blocoP
    .ServiceBloco0(FBloco0);

  ABlocoP.AddStrings(blocoP.Execute);
end;

class function TJSSpedContribuicoesService.New: IJSSpedContribuicoesService;
begin
  result := Self.create;
end;

procedure TJSSpedContribuicoesService.SaveToFile;
begin
  if not FConfig.GerarRelatorio then
    FArqSpedContribuicoes.SaveToFile(FConfig.NomeArquivo);
end;

end.
