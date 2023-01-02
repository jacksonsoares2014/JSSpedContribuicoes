unit JSSpedContribuicoes.Service.BlocoD;

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
  TJSSpedContribuicoesServiceBlocoD = class(TInterfacedObject, IJSSpedContribuicoesServiceBlocoD)
  private
    [Weak]
    FSpedContribuicoesService: IJSSpedContribuicoesService;

    [Weak]
    FBloco0: IJSSpedContribuicoesServiceBloco0;

    [Weak]
    FBlocoM: IJSSpedContribuicoesServiceBlocoM;

    FStatus     : IJSSpedContribuicoesServiceStatus;
    FacadeExport: IJSSpedContribuicoesExportFacade;
    FArquivo    : TStrings;

    procedure OnAddRegistro(Registro: TJSSpedContribuicoesModelRegistro);
    procedure OnLogErro(ALogErro: String);

    procedure AdicionaLinhaSped(ARegistro: TJSSpedContribuicoesModelRegistro; AIndex: Integer = -1);

    procedure gerarD010; overload;
    procedure gerarD010(ARegD010: TJSSpedContribuicoesModelRegistroD010); overload;
    procedure gerarD100(ARegD010: TJSSpedContribuicoesModelRegistroD010); overload;
    procedure gerarD100(ARegD010: TJSSpedContribuicoesModelRegistroD010; ARegD100: TJSSpedContribuicoesModelRegistroD100); overload;
    procedure gerarD101(ARegD100: TJSSpedContribuicoesModelRegistroD100);
    procedure gerarD105(ARegD100: TJSSpedContribuicoesModelRegistroD100);
    procedure gerarD111(ARegD100: TJSSpedContribuicoesModelRegistroD100);

    procedure gerarD200(ARegD010: TJSSpedContribuicoesModelRegistroD010); overload;
    procedure gerarD200(ARegD010: TJSSpedContribuicoesModelRegistroD010; ARegD200: TJSSpedContribuicoesModelRegistroD200); overload;
    procedure gerarD201(ARegD200: TJSSpedContribuicoesModelRegistroD200);
    procedure gerarD205(ARegD200: TJSSpedContribuicoesModelRegistroD200);

    procedure gerarD500(ARegD010: TJSSpedContribuicoesModelRegistroD010); overload;
    procedure gerarD500(ARegD010: TJSSpedContribuicoesModelRegistroD010; ARegD500: TJSSpedContribuicoesModelRegistroD500); overload;
    procedure gerarD501(ARegD500: TJSSpedContribuicoesModelRegistroD500);
    procedure gerarD505(ARegD500: TJSSpedContribuicoesModelRegistroD500);
    procedure gerarD509(ARegD500: TJSSpedContribuicoesModelRegistroD500);

  protected
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoD;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoD;

    function &End: IJSSpedContribuicoesService;
  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoD;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceBlocoD }

procedure TJSSpedContribuicoesServiceBlocoD.AdicionaLinhaSped(
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

constructor TJSSpedContribuicoesServiceBlocoD.create(
  Parent: IJSSpedContribuicoesService);
begin
  FSpedContribuicoesService := Parent;
  FArquivo     := TStringList.Create;
  FStatus      := TJSSpedContribuicoesServiceStatus.New(Self.FSpedContribuicoesService).Bloco('D');
  FacadeExport := JSSpedContribuicoes.Export.Interfaces
                    .FacadeExport(FSpedContribuicoesService.Emitente, FSpedContribuicoesService.Config);
end;

destructor TJSSpedContribuicoesServiceBlocoD.Destroy;
begin
  if Assigned(FArquivo) then
    FArquivo.Free;

  inherited;
end;

function TJSSpedContribuicoesServiceBlocoD.&End: IJSSpedContribuicoesService;
begin
  result := FSpedContribuicoesService;
end;

function TJSSpedContribuicoesServiceBlocoD.Execute: TStrings;
var
  regD001 : TJSSpedContribuicoesModelRegistroD001;
  regD990 : TJSSpedContribuicoesModelRegistroD990;
begin
  try
    regD001 := nil;
    regD990 := nil;
    try
      gerarD010;

      regD001 := TJSSpedContribuicoesModelRegistroD001.create;
      if FArquivo.Count > 0 then
        regD001.indMov := imComDadosInformados;
      AdicionaLinhaSped(regD001,0);

      regD990 := TJSSpedContribuicoesModelRegistroD990.create;
      regD990.qtdlinD := regD990.qtdlinD + FArquivo.Count;
      AdicionaLinhaSped(regD990);

      result := FArquivo;
    finally
      regD001.Free;
      regD990.Free;
    end;
  except
    on e: Exception Do
    begin
      FArquivo.Free;
      OnLogErro('Houve erro na geração do blooo D: ' + e.Message);
      Raise;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD010;
var
  i, n     : Integer;
  dao      : IJSSpedContribuicoesDAOD010;
  regD010  : TJSSpedContribuicoesModelRegistroD010;
  d010     : TObjectList<TJSSpedContribuicoesModelRegistroD010>;
begin
  if not FSpedContribuicoesService.Config.PermiteGeracao then
    Exit;

  dao := FSpedContribuicoesService.DAO.BlocoD.DAOD010;
  if not Assigned(dao) then
    Exit;

  d010 := dao.list;
  try
    for i := 0 to Pred(d010.Count) do
    begin
      regD010          := d010[i];
      n                := FArquivo.Count;
      gerarD010(regD010);
      if FArquivo.Count > n then
        AdicionaLinhaSped(regD010,n);
    end;
  finally
    d010.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD010(
  ARegD010: TJSSpedContribuicoesModelRegistroD010);
begin
  gerarD100(ARegD010);
  gerarD200(ARegD010);
  gerarD500(ARegD010);
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD100(
  ARegD010: TJSSpedContribuicoesModelRegistroD010;
  ARegD100: TJSSpedContribuicoesModelRegistroD100);
begin
  AdicionaLinhaSped(ARegD100);
  gerarD101(ARegD100);
  gerarD105(ARegD100);

  FBloco0.AddCodPart(ARegD010._id, ARegD100.codPart);
  FBloco0.AddCodConta(ARegD100.codCta);
  FBloco0.AddCodInf(ARegD010._id, ARegD100.codInf);
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD101(
  ARegD100: TJSSpedContribuicoesModelRegistroD100);
var
  i       : Integer;
  regD101 : TJSSpedContribuicoesModelRegistroD101;
  d101    : TObjectList<TJSSpedContribuicoesModelRegistroD101>;
begin
  d101 := FSpedContribuicoesService.DAO.BlocoD.DAOD101.listD101(ARegD100);
  try
    if (not Assigned(d101)) or (d101.Count = 0) then
      Exit;

    for i := 0 to Pred(d101.Count) do
    begin
      regD101 := d101[i];
      AdicionaLinhaSped(regD101);
      FBloco0.AddCodConta(regD101.codCta);
      FBlocoM.DetalhaCredBasePis(regD101);
    end;
  finally
    d101.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD105(
  ARegD100: TJSSpedContribuicoesModelRegistroD100);
var
  i       : Integer;
  regD105 : TJSSpedContribuicoesModelRegistroD105;
  d105    : TObjectList<TJSSpedContribuicoesModelRegistroD105>;
begin
  d105 := FSpedContribuicoesService.DAO.BlocoD.DAOD105.listD105(ARegD100);
  try
    if (not Assigned(d105)) or (d105.Count = 0) then
      Exit;

    for i := 0 to Pred(d105.Count) do
    begin
      regD105 := d105[i];
      AdicionaLinhaSped(regD105);
      FBloco0.AddCodConta(regD105.codCta);
      FBlocoM.DetalhaCredBaseCofins(regD105);
    end;
  finally
    d105.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD111(
  ARegD100: TJSSpedContribuicoesModelRegistroD100);
var
  i       : Integer;
  regD111 : TJSSpedContribuicoesModelRegistroD111;
  d111    : TObjectList<TJSSpedContribuicoesModelRegistroD111>;
begin
  d111 := FSpedContribuicoesService.DAO.BlocoD.DAOD111.list(ARegD100);
  try
    if (not Assigned(d111)) or (d111.Count = 0) then
      Exit;

    for i := 0 to Pred(d111.Count) do
    begin
      regD111 := d111[i];
      AdicionaLinhaSped(regD111);
    end;
  finally
    d111.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD200(
  ARegD010: TJSSpedContribuicoesModelRegistroD010;
  ARegD200: TJSSpedContribuicoesModelRegistroD200);
begin
  AdicionaLinhaSped(ARegD200);
  gerarD201(ARegD200);
  gerarD205(ARegD200);
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD201(
  ARegD200: TJSSpedContribuicoesModelRegistroD200);
var
  i       : Integer;
  regD201 : TJSSpedContribuicoesModelRegistroD201;
  d201    : TObjectList<TJSSpedContribuicoesModelRegistroD201>;
begin
  d201 := FSpedContribuicoesService.DAO.BlocoD.DAOD201.listD201(ARegD200);
  try
    if (not Assigned(d201)) or (d201.Count = 0) then
      Exit;

    for i := 0 to Pred(d201.Count) do
    begin
      regD201 := d201[i];
      AdicionaLinhaSped(regD201);
      FBloco0.AddCodConta(regD201.codCta);
      FBlocoM.DetalhaContribPis(regD201);
      FBloco0.AcumulaReceitaBruta(regD201);
    end;
  finally
    d201.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD205(
  ARegD200: TJSSpedContribuicoesModelRegistroD200);
var
  i       : Integer;
  regD205 : TJSSpedContribuicoesModelRegistroD205;
  d205    : TObjectList<TJSSpedContribuicoesModelRegistroD205>;
begin
  d205 := FSpedContribuicoesService.DAO.BlocoD.DAOD205.listD205(ARegD200);
  try
    if (not Assigned(d205)) or (d205.Count = 0) then
      Exit;

    for i := 0 to Pred(d205.Count) do
    begin
      regD205 := d205[i];
      AdicionaLinhaSped(regD205);
      FBloco0.AddCodConta(regD205.codCta);
      FBlocoM.DetalhaContribCofins(regD205);
    end;
  finally
    d205.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD500(
  ARegD010: TJSSpedContribuicoesModelRegistroD010);
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAOD500;
  regD500 : TJSSpedContribuicoesModelRegistroD500;
  d500    : TObjectList<TJSSpedContribuicoesModelRegistroD500>;
  d500Full: TObjectList<TJSSpedContribuicoesModelRegistroD500>;
begin
  d500Full := TObjectList<TJSSpedContribuicoesModelRegistroD500>.create;
  try
    for i := 0 to Pred(FSpedContribuicoesService.DAO.BlocoD.CountD500) do
    begin
      FStatus
        .Registro('D500')
        .Aguarde(True)
        .ShowStatus;

      dao  := FSpedContribuicoesService.DAO.BlocoD.DAOD500(i);
      d500 := dao.list(ARegD010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

      FStatus
        .Aguarde(False)
        .ShowStatus;

      try
        d500.OwnsObjects := False;
        d500Full.AddRange(d500.ToArray);
      finally
        d500.Free;
      end;
    end;

    FStatus
      .TotalRegistros(d500Full.Count);

    for i := 0 to Pred(d500Full.Count) do
    begin
      regD500 := d500Full[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regD500._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      gerarD500(ARegD010, regD500);
    end;
  finally
    d500Full.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD500(
  ARegD010: TJSSpedContribuicoesModelRegistroD010;
  ARegD500: TJSSpedContribuicoesModelRegistroD500);
begin
  AdicionaLinhaSped(ARegD500);
  FBloco0.AddCodPart(ARegD010._id, ARegD500.codPart);
  gerarD501(ARegD500);
  gerarD505(ARegD500);
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD501(
  ARegD500: TJSSpedContribuicoesModelRegistroD500);
var
  i       : Integer;
  regD501 : TJSSpedContribuicoesModelRegistroD501;
  d501    : TObjectList<TJSSpedContribuicoesModelRegistroD501>;
begin
  d501 := FSpedContribuicoesService.DAO.BlocoD.DAOD501.listD501(ARegD500);
  try
    if (not Assigned(d501)) or (d501.Count = 0) then
      Exit;

    for i := 0 to Pred(d501.Count) do
    begin
      regD501 := d501[i];
      AdicionaLinhaSped(regD501);
      FBloco0.AddCodConta(regD501.codCta);
      FBlocoM.DetalhaCredBasePis(regD501);
    end;
  finally
    d501.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD505(
  ARegD500: TJSSpedContribuicoesModelRegistroD500);
var
  i       : Integer;
  regD505 : TJSSpedContribuicoesModelRegistroD505;
  d505    : TObjectList<TJSSpedContribuicoesModelRegistroD505>;
begin
  d505 := FSpedContribuicoesService.DAO.BlocoD.DAOD505.listD505(ARegD500);
  try
    if (not Assigned(d505)) or (d505.Count = 0) then
      Exit;

    for i := 0 to Pred(d505.Count) do
    begin
      regD505 := d505[i];
      AdicionaLinhaSped(regD505);
      FBloco0.AddCodConta(regD505.codCta);
      FBlocoM.DetalhaCredBaseCofins(regD505);
    end;
  finally
    d505.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD509(
  ARegD500: TJSSpedContribuicoesModelRegistroD500);
var
  i       : Integer;
  regD509 : TJSSpedContribuicoesModelRegistroD509;
  d509    : TObjectList<TJSSpedContribuicoesModelRegistroD509>;
begin
  d509 := FSpedContribuicoesService.DAO.BlocoD.DAOD509.list(ARegD500);
  try
    if (not Assigned(d509)) or (d509.Count = 0) then
      Exit;

    for i := 0 to Pred(d509.Count) do
    begin
      regD509 := d509[i];
      AdicionaLinhaSped(regD509);
    end;
  finally
    d509.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD200(
  ARegD010: TJSSpedContribuicoesModelRegistroD010);
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAOD200;
  regD200 : TJSSpedContribuicoesModelRegistroD200;
  d200    : TObjectList<TJSSpedContribuicoesModelRegistroD200>;
  d200Full: TObjectList<TJSSpedContribuicoesModelRegistroD200>;
begin
  d200Full := TObjectList<TJSSpedContribuicoesModelRegistroD200>.create;
  try
    for i := 0 to Pred(FSpedContribuicoesService.DAO.BlocoD.CountD200) do
    begin
      FStatus
        .Registro('D200')
        .Aguarde(True)
        .ShowStatus;

      dao  := FSpedContribuicoesService.DAO.BlocoD.DAOD200(i);
      d200 := dao.list(ARegD010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

      FStatus
        .Aguarde(False)
        .ShowStatus;

      try
        d200.OwnsObjects := False;
        d200Full.AddRange(d200.ToArray);
      finally
        d200.Free;
      end;
    end;

    FStatus
      .TotalRegistros(d200Full.Count);

    for i := 0 to Pred(d200Full.Count) do
    begin
      regD200 := d200Full[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regD200._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      gerarD200(ARegD010, regD200);
    end;
  finally
    d200Full.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoD.gerarD100(
  ARegD010: TJSSpedContribuicoesModelRegistroD010);
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAOD100;
  regD100 : TJSSpedContribuicoesModelRegistroD100;
  d100    : TObjectList<TJSSpedContribuicoesModelRegistroD100>;
  d100Full: TObjectList<TJSSpedContribuicoesModelRegistroD100>;
begin
  d100Full := TObjectList<TJSSpedContribuicoesModelRegistroD100>.create;
  try
    for i := 0 to Pred(FSpedContribuicoesService.DAO.BlocoD.CountD100) do
    begin
      dao  := FSpedContribuicoesService.DAO.BlocoD.DAOD100(i);

      FStatus
        .Registro('D100')
        .Aguarde(True)
        .ShowStatus;

      d100 := dao.list(ARegD010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

      FStatus
        .Aguarde(False)
        .ShowStatus;

      try
        d100.OwnsObjects := False;
        d100Full.AddRange(d100.ToArray);
      finally
        d100.Free;
      end;
    end;

    FStatus
      .TotalRegistros(d100Full.Count);

    for i := 0 to Pred(d100Full.Count) do
    begin
      regD100 := d100Full[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regD100._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      gerarD100(ARegD010, regD100);
    end;
  finally
    d100Full.Free;
  end;
end;

class function TJSSpedContribuicoesServiceBlocoD.New(
  Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoD;
begin
  result := Self.create(Parent);
end;

procedure TJSSpedContribuicoesServiceBlocoD.OnAddRegistro(
  Registro: TJSSpedContribuicoesModelRegistro);
var
  onAddRegistro: TOnSpedContribuicoesAddRegistro;
begin
  onAddRegistro := FSpedContribuicoesService.Config.OnAddRegistro;

  if Assigned(onAddRegistro) then
    onAddRegistro(Registro);
end;

procedure TJSSpedContribuicoesServiceBlocoD.OnLogErro(ALogErro: String);
var
  onLogErro: TOnSpedContribuicoesLogErro;
begin
  onLogErro := FSpedContribuicoesService.Config.OnLogErro;

  if Assigned(onLogErro) then
    OnLogErro(ALogErro);
end;

function TJSSpedContribuicoesServiceBlocoD.ServiceBloco0(
  Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoD;
begin
  result  := Self;
  FBloco0 := Value;
end;

function TJSSpedContribuicoesServiceBlocoD.ServiceBlocoM(
  Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoD;
begin
  result  := Self;
  FBlocoM := Value;
end;

end.
