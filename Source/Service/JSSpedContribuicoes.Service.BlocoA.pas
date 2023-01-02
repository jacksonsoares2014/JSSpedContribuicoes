unit JSSpedContribuicoes.Service.BlocoA;

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
  TJSSpedContribuicoesServiceBlocoA = class(TInterfacedObject, IJSSpedContribuicoesServiceBlocoA)
  private
    [Weak]
    FSpedContribuicoesService: IJSSpedContribuicoesService;

    [Weak]
    FBloco0: IJSSpedContribuicoesServiceBloco0;

    [Weak]
    FBloco1: IJSSpedContribuicoesServiceBloco1;

    [Weak]
    FBlocoM: IJSSpedContribuicoesServiceBlocoM;

    FStatus     : IJSSpedContribuicoesServiceStatus;
    FacadeExport: IJSSpedContribuicoesExportFacade;
    FArquivo    : TStrings;

    procedure OnAddRegistro(Registro: TJSSpedContribuicoesModelRegistro);
    procedure OnLogErro(ALogErro: String);

    procedure AdicionaLinhaSped(ARegistro: TJSSpedContribuicoesModelRegistro; AIndex: Integer = -1);

    procedure gerarA010;
    procedure gerarA100(ARegA010: TJSSpedContribuicoesModelRegistroA010); overload;
    procedure gerarA100(ARegA010: TJSSpedContribuicoesModelRegistroA010; ARegA100: TJSSpedContribuicoesModelRegistroA100); overload;
    procedure gerarA110(ARegA010: TJSSpedContribuicoesModelRegistroA010; ARegA100: TJSSpedContribuicoesModelRegistroA100);
    procedure gerarA111(ARegA010: TJSSpedContribuicoesModelRegistroA010; ARegA100: TJSSpedContribuicoesModelRegistroA100);
    procedure gerarA170(ARegA010: TJSSpedContribuicoesModelRegistroA010; ARegA100: TJSSpedContribuicoesModelRegistroA100; AA170List: TObjectList<TJSSpedContribuicoesModelRegistroA170>);

  protected
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoA;
    function ServiceBloco1(Value: IJSSpedContribuicoesServiceBloco1): IJSSpedContribuicoesServiceBlocoA;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoA;

    function &End: IJSSpedContribuicoesService;
  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoA;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceBlocoA }

procedure TJSSpedContribuicoesServiceBlocoA.AdicionaLinhaSped(
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
  OnAddRegistro(ARegistro);
end;

constructor TJSSpedContribuicoesServiceBlocoA.create(
  Parent: IJSSpedContribuicoesService);
begin
  FSpedContribuicoesService := Parent;
  FArquivo     := TStringList.Create;
  FStatus      := TJSSpedContribuicoesServiceStatus.New(Self.FSpedContribuicoesService).Bloco('A');
  FacadeExport := JSSpedContribuicoes.Export.Interfaces
                    .FacadeExport(FSpedContribuicoesService.Emitente, FSpedContribuicoesService.Config);
end;

destructor TJSSpedContribuicoesServiceBlocoA.Destroy;
begin
  if Assigned(FArquivo) then
    FArquivo.Free;

  inherited;
end;

function TJSSpedContribuicoesServiceBlocoA.&End: IJSSpedContribuicoesService;
begin
  result := FSpedContribuicoesService;
end;

function TJSSpedContribuicoesServiceBlocoA.Execute: TStrings;
var
  regA001 : TJSSpedContribuicoesModelRegistroA001;
  regA990 : TJSSpedContribuicoesModelRegistroA990;
begin
  try
    regA001 := TJSSpedContribuicoesModelRegistroA001.create;
    regA990 := TJSSpedContribuicoesModelRegistroA990.create;
    try
      gerarA010;

      if FArquivo.Count > 0 then
        regA001.indMov := imComDadosInformados;
      AdicionaLinhaSped(regA001,0);

      regA990.qtdlinA := regA990.qtdlinA + FArquivo.Count;
      AdicionaLinhaSped(regA990);

      result := FArquivo;
    finally
      regA001.Free;
      regA990.Free;
    end;
  except
    on e: Exception Do
    begin
      FArquivo.Free;
      OnLogErro('Houve erro na geração do blooo A: ' + e.Message);
      Raise;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoA.gerarA010;
var
  i, n     : Integer;
  dao      : IJSSpedContribuicoesDAOA010;
  regA010  : TJSSpedContribuicoesModelRegistroA010;
  a010     : TObjectList<TJSSpedContribuicoesModelRegistroA010>;
begin
  if not FSpedContribuicoesService.Config.PermiteGeracao then
    Exit;

  dao := FSpedContribuicoesService.DAO.BlocoA.DAOA010;
  if not Assigned(dao) then
    Exit;

  a010 := dao.list;
  try
    for i := 0 to Pred(a010.Count) do
    begin
      regA010          := a010[i];
      n                := FArquivo.Count;
      gerarA100(regA010);
      if FArquivo.Count > n then
        AdicionaLinhaSped(regA010,n);
    end;
  finally
    a010.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoA.gerarA100(
  ARegA010: TJSSpedContribuicoesModelRegistroA010;
  ARegA100: TJSSpedContribuicoesModelRegistroA100);
var
  a170 : TObjectList<TJSSpedContribuicoesModelRegistroA170>;
begin
  if ARegA100.codSit in [csCancelado,
                         csCanceladoExtemporaneo,
                         csDenegado,
                         csInutilizado]
  then
  begin
    AdicionaLinhaSped(ARegA100);
    Exit;
  end;

  a170 := FSpedContribuicoesService.DAO.BlocoA.DAOA170.list(ARegA100);
  try
    AdicionaLinhaSped(ARegA100);
    gerarA110(ARegA010, ARegA100);
    gerarA111(ARegA010, ARegA100);
    gerarA170(ARegA010, ARegA100, a170);
    FBloco0.AddCodPart(ARegA010._id, ARegA100.codPart);
  finally
    a170.Free;
  end;

end;

procedure TJSSpedContribuicoesServiceBlocoA.gerarA110(ARegA010: TJSSpedContribuicoesModelRegistroA010;
  ARegA100: TJSSpedContribuicoesModelRegistroA100);
var
  i       : Integer;
  regA110 : TJSSpedContribuicoesModelRegistroA110;
  a110    : TObjectList<TJSSpedContribuicoesModelRegistroA110>;
begin
  a110 := FSpedContribuicoesService.DAO.BlocoA.DAOA110.list(ARegA100);
  try
    if (not Assigned(a110)) or (a110.Count = 0) then
      Exit;

    for i := 0 to Pred(a110.Count) do
    begin
      regA110 := a110[i];
      AdicionaLinhaSped(regA110);
      FBloco0.AddCodInf(ARegA010._id, regA110.codInf);
    end;
  finally
    a110.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoA.gerarA111(ARegA010: TJSSpedContribuicoesModelRegistroA010;
  ARegA100: TJSSpedContribuicoesModelRegistroA100);
var
  i       : Integer;
  regA111 : TJSSpedContribuicoesModelRegistroA111;
  a111    : TObjectList<TJSSpedContribuicoesModelRegistroA111>;
begin
  a111 := FSpedContribuicoesService.DAO.BlocoA.DAOA111.list(ARegA100);
  try
    if (not Assigned(a111)) or (a111.Count = 0) then
      Exit;

    for i := 0 to Pred(a111.Count) do
    begin
      regA111 := a111[i];
      AdicionaLinhaSped(regA111);
      FBloco1.AddProcJudicial(ARegA010, regA111);
      FBloco1.AddProcADM(regA111);
    end;
  finally
    a111.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoA.gerarA170(ARegA010: TJSSpedContribuicoesModelRegistroA010;
  ARegA100: TJSSpedContribuicoesModelRegistroA100;
  AA170List: TObjectList<TJSSpedContribuicoesModelRegistroA170>);
var
  i       : Integer;
  regA170 : TJSSpedContribuicoesModelRegistroA170;
begin
  if (not Assigned(AA170List)) or (AA170List.Count = 0) then
    Exit;

  for i := 0 to Pred(AA170List.Count) do
  begin
    regA170 := AA170List[i];
    AdicionaLinhaSped(regA170);
    FBloco0.AddCodItem(ARegA010._id, regA170.codItem);
    FBloco0.AddCodConta(regA170.codCta);

    if ARegA100.indOper = tosAquisicao then
    begin
      if (regA170.cstPis <> regA170.cstCofins) then
        raise Exception.Create(Format('O documento número %s de %s, possui CST PIS diferente do CST COFINS.',
                                      [ARegA100.numDoc,ARegA100.indOper.Caption]));

      if (regA170.vlBcPis <> regA170.vlBcCofins) then
        raise Exception.Create(Format('O documento número %s de %s, possui Base de PIS diferente da base de COFINS.',
                                      [ARegA100.numDoc,ARegA100.indOper.Caption]));

      if (RegA170.GetValueDouble('VLBCPISCUM') <> RegA170.GetValueDouble('VLBCCOFINSCUM')) then
        raise Exception.Create(Format('O documento número %s de %s, possui cálculo de proporcional da Base de PIS diferente da base de COFINS.',
                                      [ARegA100.numDoc,ARegA100.indOper.Caption]));

      FBlocoM.DetalhaCredBasePis(regA170);
      FBlocoM.DetalhaCredBaseCofins(regA170);
    end;

    if ARegA100.indOper = tosPrestacao then
    begin
      FBlocoM.DetalhaContribPis(regA170);
      FBlocoM.DetalhaContribCofins(regA170);
      FBloco0.AcumulaReceitaBruta(regA170);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoA.gerarA100(
  ARegA010: TJSSpedContribuicoesModelRegistroA010);
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAOA100;
  regA100 : TJSSpedContribuicoesModelRegistroA100;
  a100    : TObjectList<TJSSpedContribuicoesModelRegistroA100>;
  a100Full: TObjectList<TJSSpedContribuicoesModelRegistroA100>;
begin
  a100Full := TObjectList<TJSSpedContribuicoesModelRegistroA100>.create;
  try

    FStatus
      .Registro('A100')
      .Aguarde(True)
      .ShowStatus;

    for i := 0 to Pred(FSpedContribuicoesService.DAO.BlocoA.CountA100) do
    begin
      dao  := FSpedContribuicoesService.DAO.BlocoA.DAOA100(i);
      a100 := dao.list(ARegA010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
      try
        a100.OwnsObjects := False;
        a100Full.AddRange(a100.ToArray);
      finally
        a100.Free;
      end;
    end;

    FStatus
      .Aguarde(False)
      .TotalRegistros(a100Full.Count);

    for i := 0 to Pred(a100Full.Count) do
    begin
      regA100 := a100Full[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regA100._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      gerarA100(ARegA010, regA100);
    end;
  finally
    a100Full.Free;
  end;
end;

class function TJSSpedContribuicoesServiceBlocoA.New(
  Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoA;
begin
  result := Self.create(Parent);
end;

procedure TJSSpedContribuicoesServiceBlocoA.OnAddRegistro(
  Registro: TJSSpedContribuicoesModelRegistro);
var
  onAddRegistro: TOnSpedContribuicoesAddRegistro;
begin
  onAddRegistro := FSpedContribuicoesService.Config.OnAddRegistro;

  if Assigned(onAddRegistro) then
    onAddRegistro(Registro);
end;

procedure TJSSpedContribuicoesServiceBlocoA.OnLogErro(ALogErro: String);
var
  onLogErro: TOnSpedContribuicoesLogErro;
begin
  onLogErro := FSpedContribuicoesService.Config.OnLogErro;

  if Assigned(onLogErro) then
    OnLogErro(ALogErro);
end;

function TJSSpedContribuicoesServiceBlocoA.ServiceBloco0(
  Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoA;
begin
  result  := Self;
  FBloco0 := Value;
end;

function TJSSpedContribuicoesServiceBlocoA.ServiceBloco1(
  Value: IJSSpedContribuicoesServiceBloco1): IJSSpedContribuicoesServiceBlocoA;
begin
  result  := Self;
  FBloco1 := Value;
end;

function TJSSpedContribuicoesServiceBlocoA.ServiceBlocoM(
  Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoA;
begin
  result  := Self;
  FBlocoM := Value;
end;

end.
