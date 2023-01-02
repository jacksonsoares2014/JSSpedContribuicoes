unit JSSpedContribuicoes.Service.BlocoF;

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
  TJSSpedContribuicoesServiceBlocoF = class(TInterfacedObject, IJSSpedContribuicoesServiceBlocoF)
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

    procedure gerarF010; overload;
    procedure gerarF010(ARegF010: TJSSpedContribuicoesModelRegistroF010); overload;
    procedure gerarF100(ARegF010: TJSSpedContribuicoesModelRegistroF010); overload;
    procedure gerarF100(ARegF010: TJSSpedContribuicoesModelRegistroF010; ARegF100: TJSSpedContribuicoesModelRegistroF100); overload;
    procedure gerarF111(ARegF100: TJSSpedContribuicoesModelRegistroF100);
    procedure gerarF120(ARegF010: TJSSpedContribuicoesModelRegistroF010);
    procedure gerarF129(ARegF120: TJSSpedContribuicoesModelRegistroF120);
    procedure gerarF130(ARegF010: TJSSpedContribuicoesModelRegistroF010);
    procedure gerarF139(ARegF130: TJSSpedContribuicoesModelRegistroF130);

    procedure gerarF200(ARegF010: TJSSpedContribuicoesModelRegistroF010);
    procedure gerarF205(ARegF200: TJSSpedContribuicoesModelRegistroF200);
    procedure gerarF210(ARegF200: TJSSpedContribuicoesModelRegistroF200);
    procedure gerarF211(ARegF200: TJSSpedContribuicoesModelRegistroF200);

    procedure gerarF500(ARegF010: TJSSpedContribuicoesModelRegistroF010);
    procedure gerarF525(ARegF010: TJSSpedContribuicoesModelRegistroF010);
    procedure gerarF550(ARegF010: TJSSpedContribuicoesModelRegistroF010);

    procedure gerarF600(ARegF010: TJSSpedContribuicoesModelRegistroF010);
  protected
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoF;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoF;

    function &End: IJSSpedContribuicoesService;
  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoF;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceBlocoF }

procedure TJSSpedContribuicoesServiceBlocoF.AdicionaLinhaSped(
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

constructor TJSSpedContribuicoesServiceBlocoF.create(
  Parent: IJSSpedContribuicoesService);
begin
  FSpedContribuicoesService := Parent;
  FArquivo     := TStringList.Create;
  FStatus      := TJSSpedContribuicoesServiceStatus.New(Self.FSpedContribuicoesService).Bloco('F');
  FacadeExport := JSSpedContribuicoes.Export.Interfaces
                    .FacadeExport(FSpedContribuicoesService.Emitente, FSpedContribuicoesService.Config);
end;

destructor TJSSpedContribuicoesServiceBlocoF.Destroy;
begin
  if Assigned(FArquivo) then
    FArquivo.Free;

  inherited;
end;

function TJSSpedContribuicoesServiceBlocoF.&End: IJSSpedContribuicoesService;
begin
  result := FSpedContribuicoesService;
end;

function TJSSpedContribuicoesServiceBlocoF.Execute: TStrings;
var
  regF001 : TJSSpedContribuicoesModelRegistroF001;
  regF990 : TJSSpedContribuicoesModelRegistroF990;
begin
  try
    regF001 := TJSSpedContribuicoesModelRegistroF001.create;
    regF990 := TJSSpedContribuicoesModelRegistroF990.create;
    try
      gerarF010;

      if FArquivo.Count > 0 then
        regF001.indMov := imComDadosInformados;
      AdicionaLinhaSped(regF001,0);

      regF990.qtdlinF := regF990.qtdlinF + FArquivo.Count;
      AdicionaLinhaSped(regF990);

      result := FArquivo;
    finally
      regF001.Free;
      regF990.Free;
    end;
  except
    on e: Exception Do
    begin
      FArquivo.Free;
      OnLogErro('Houve erro na geração do blooo F: ' + e.Message);
      Raise;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF010;
var
  i, n     : Integer;
  dao      : IJSSpedContribuicoesDAOF010;
  regF010  : TJSSpedContribuicoesModelRegistroF010;
  f010     : TObjectList<TJSSpedContribuicoesModelRegistroF010>;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa then
    Exit;

  dao := FSpedContribuicoesService.DAO.BlocoF.DAOF010;
  if not Assigned(dao) then
    Exit;

  f010 := dao.list;
  try
    for i := 0 to Pred(f010.Count) do
    begin
      regF010          := f010[i];
      n                := FArquivo.Count;
      gerarF010(regF010);
      if FArquivo.Count > n then
        AdicionaLinhaSped(regF010,n);
    end;
  finally
    f010.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF010(
  ARegF010: TJSSpedContribuicoesModelRegistroF010);
var
  FGeraF500_F525, FGeraF550: Boolean;
begin
  {Gera F500/F525 somente se Apuração for por Regime de Caixa e Enquadramento Lucro Presumido}
  FGeraF500_F525 := (not FSpedContribuicoesService.Config.EmpresaInativa) and (FSpedContribuicoesService.Config.CriterioEscrituracao = iceRegimeCaixa) and (FSpedContribuicoesService.Config.TipoEnquadramento = tePresumido);

  {Gera F550 somente se Apuração for por Regime de Competência F550 e Enquadramento Lucro Presumido}
  FGeraF550 := (not FSpedContribuicoesService.Config.EmpresaInativa) and (FSpedContribuicoesService.Config.CriterioEscrituracao = iceRegimeCompetenciaConsolidada) and (FSpedContribuicoesService.Config.TipoEnquadramento = tePresumido);

  gerarF100(ARegF010);

  if FSpedContribuicoesService.Config.GerarF120_F130 then
  begin
    gerarF120(ARegF010);
    gerarF130(ARegF010);
  end;

  //gerarF200(ARegF010);

  if FGeraF500_F525 then
  begin
    gerarF500(ARegF010);
    gerarF525(ARegF010);
  end;

  if FGeraF550 then
    gerarF550(ARegF010);

  if not FSpedContribuicoesService.Config.EmpresaInativa then
    gerarF600(ARegF010);
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF100(
  ARegF010: TJSSpedContribuicoesModelRegistroF010;
  ARegF100: TJSSpedContribuicoesModelRegistroF100);
begin
  AdicionaLinhaSped(ARegF100);
  gerarF111(ARegF100);
  FBloco0.AddCodPart(ARegF010._id, ARegF100.codPart);
  FBloco0.AddCodItem(ARegF010._id, ARegF100.codItem);
  FBloco0.AddCodConta(ARegF100.codCta);

  if ARegF100.indOper = tofAquisicaoPisCofins then
  begin
    FBlocoM.DetalhaCredBasePis(ARegF100);
    FBlocoM.DetalhaCredBaseCofins(ARegF100);
  end;

  if ARegF100.indOper in [tofReceitaPisCofins, tofReceitaSemPisCofins] then
  begin
    FBlocoM.DetalhaContribPis(ARegF100);
    FBlocoM.DetalhaContribCofins(ARegF100);
    FBloco0.AcumulaReceitaBruta(ARegF100);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF111(
  ARegF100: TJSSpedContribuicoesModelRegistroF100);
var
  i       : Integer;
  regF111 : TJSSpedContribuicoesModelRegistroF111;
  f111    : TObjectList<TJSSpedContribuicoesModelRegistroF111>;
begin
  f111 := FSpedContribuicoesService.DAO.BlocoF.DAOF111.list(ARegF100);
  try
    if (not Assigned(f111)) or (f111.Count = 0) then
      Exit;

    for i := 0 to Pred(f111.Count) do
    begin
      regF111 := f111[i];
      AdicionaLinhaSped(regF111);
    end;
  finally
    f111.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF120(
  ARegF010: TJSSpedContribuicoesModelRegistroF010);
var
  i       : Integer;
  regF120 : TJSSpedContribuicoesModelRegistroF120;
  f120    : TObjectList<TJSSpedContribuicoesModelRegistroF120>;
begin
  f120 := FSpedContribuicoesService.DAO.BlocoF.DAOF120.list(ARegF010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
  try
    if (not Assigned(f120)) or (f120.Count = 0) then
      Exit;

    FStatus
      .Registro('F120')
      .TotalRegistros(f120.Count);

    for i := 0 to Pred(f120.Count) do
    begin
      regF120 := f120[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regF120._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regF120);
      FBloco0.AddCodConta(regF120.codCta);
      FBlocoM.DetalhaCredBasePis(regF120);
      FBlocoM.DetalhaCredBaseCofins(regF120);

      gerarF129(regF120);
    end;
  finally
    f120.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF129(
  ARegF120: TJSSpedContribuicoesModelRegistroF120);
var
  i       : Integer;
  regF129 : TJSSpedContribuicoesModelRegistroF129;
  f129    : TObjectList<TJSSpedContribuicoesModelRegistroF129>;
begin
  f129 := FSpedContribuicoesService.DAO.BlocoF.DAOF129.list(ARegF120);
  try
    if (not Assigned(f129)) or (f129.Count = 0) then
      Exit;

    for i := 0 to Pred(f129.Count) do
    begin
      regF129 := f129[i];
      AdicionaLinhaSped(regF129);
    end;
  finally
    f129.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF130(
  ARegF010: TJSSpedContribuicoesModelRegistroF010);
var
  i       : Integer;
  regF130 : TJSSpedContribuicoesModelRegistroF130;
  f130    : TObjectList<TJSSpedContribuicoesModelRegistroF130>;
begin
  f130 := FSpedContribuicoesService.DAO.BlocoF.DAOF130.list(ARegF010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
  try
    if (not Assigned(f130)) or (f130.Count = 0) then
      Exit;

    FStatus
      .Registro('F130')
      .TotalRegistros(f130.Count);

    for i := 0 to Pred(f130.Count) do
    begin
      regF130 := f130[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regF130._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regF130);
      FBloco0.AddCodConta(regF130.codCta);
      FBlocoM.DetalhaCredBasePis(regF130);
      FBlocoM.DetalhaCredBaseCofins(regF130);

      gerarF139(regF130);
    end;
  finally
    f130.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF139(
  ARegF130: TJSSpedContribuicoesModelRegistroF130);
var
  i       : Integer;
  regF139 : TJSSpedContribuicoesModelRegistroF139;
  f139    : TObjectList<TJSSpedContribuicoesModelRegistroF139>;
begin
  f139 := FSpedContribuicoesService.DAO.BlocoF.DAOF139.list(ARegF130);
  try
    if (not Assigned(f139)) or (f139.Count = 0) then
      Exit;

    for i := 0 to Pred(f139.Count) do
    begin
      regF139 := f139[i];
      AdicionaLinhaSped(regF139);
    end;
  finally
    f139.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF200(
  ARegF010: TJSSpedContribuicoesModelRegistroF010);
var
  i       : Integer;
  regF200 : TJSSpedContribuicoesModelRegistroF200;
  f200    : TObjectList<TJSSpedContribuicoesModelRegistroF200>;
begin
  f200 := FSpedContribuicoesService.DAO.BlocoF.DAOF200.listF200(ARegF010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
  try
    if (not Assigned(f200)) or (f200.Count = 0) then
      Exit;

    FStatus
      .Registro('F200')
      .TotalRegistros(f200.Count);

    for i := 0 to Pred(f200.Count) do
    begin
      regF200 := f200[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regF200._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regF200);
      FBlocoM.DetalhaContribPis(regF200);
      FBlocoM.DetalhaContribCofins(regF200);

      gerarF205(regF200);
      gerarF210(regF200);
      gerarF211(regF200);
    end;
  finally
    f200.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF205(
  ARegF200: TJSSpedContribuicoesModelRegistroF200);
var
  regF205 : TJSSpedContribuicoesModelRegistroF205;
begin
  regF205 := FSpedContribuicoesService.DAO.BlocoF.DAOF205.loadF205(ARegF200);
  if (not Assigned(regF205)) then
    Exit;

  AdicionaLinhaSped(regF205);
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF210(
  ARegF200: TJSSpedContribuicoesModelRegistroF200);
var
  i       : Integer;
  regF210 : TJSSpedContribuicoesModelRegistroF210;
  f210    : TObjectList<TJSSpedContribuicoesModelRegistroF210>;
begin
  f210 := FSpedContribuicoesService.DAO.BlocoF.DAOF210.list(ARegF200);
  try
    if (not Assigned(f210)) or (f210.Count = 0) then
      Exit;

    for i := 0 to Pred(f210.Count) do
    begin
      regF210 := f210[i];
      AdicionaLinhaSped(regF210);
    end;
  finally
    f210.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF211(
  ARegF200: TJSSpedContribuicoesModelRegistroF200);
var
  i       : Integer;
  regF211 : TJSSpedContribuicoesModelRegistroF211;
  f211    : TObjectList<TJSSpedContribuicoesModelRegistroF211>;
begin
  f211 := FSpedContribuicoesService.DAO.BlocoF.DAOF211.list(ARegF200);
  try
    if (not Assigned(f211)) or (f211.Count = 0) then
      Exit;

    for i := 0 to Pred(f211.Count) do
    begin
      regF211 := f211[i];
      AdicionaLinhaSped(regF211);
    end;
  finally
    f211.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF500(
  ARegF010: TJSSpedContribuicoesModelRegistroF010);
var
  i       : Integer;
  regF500 : TJSSpedContribuicoesModelRegistroF500;
  f500    : TObjectList<TJSSpedContribuicoesModelRegistroF500>;
begin
  FStatus
    .Registro('F500')
    .Aguarde(True)
    .ShowStatus;

  f500 := FSpedContribuicoesService.DAO.BlocoF.DAOF500.list(ARegF010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .ShowStatus;

  try

    if (not Assigned(f500)) or (f500.Count = 0) then
      Exit;

    FStatus
      .TotalRegistros(f500.Count);

    for i := 0 to Pred(f500.Count) do
    begin
      regF500 := f500[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regF500._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regF500);
      FBloco0.AddCodConta(regF500.codCta);
      FBloco0.AcumulaReceitaBruta(regF500);

      FBlocoM.DetalhaContribPis(regF500);
      FBlocoM.DetalhaContribCofins(regF500);
    end;
  finally
    f500.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF525(
  ARegF010: TJSSpedContribuicoesModelRegistroF010);
var
  i       : Integer;
  regF525 : TJSSpedContribuicoesModelRegistroF525;
  f525    : TObjectList<TJSSpedContribuicoesModelRegistroF525>;
begin
  FStatus
    .Registro('F525')
    .Aguarde(True)
    .ShowStatus;

  f525 := FSpedContribuicoesService.DAO.BlocoF.DAOF525.list(ARegF010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .ShowStatus;

  try
    if (not Assigned(f525)) or (f525.Count = 0) then
      Exit;

    FStatus
      .TotalRegistros(f525.Count);

    for i := 0 to Pred(f525.Count) do
    begin
      regF525 := f525[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regF525._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regF525);
      FBloco0.AddCodConta(regF525.codCta);
      FBloco0.AddCodConta(regF525.codItem);
    end;
  finally
    f525.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF550(
  ARegF010: TJSSpedContribuicoesModelRegistroF010);
var
  i       : Integer;
  regF550 : TJSSpedContribuicoesModelRegistroF550;
  f550    : TObjectList<TJSSpedContribuicoesModelRegistroF550>;
begin
  FStatus
    .Registro('F550')
    .Aguarde(True)
    .ShowStatus;

  f550 := FSpedContribuicoesService.DAO.BlocoF.DAOF550.list(ARegF010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .ShowStatus;

  try
    if (not Assigned(f550)) or (f550.Count = 0) then
      Exit;

    FStatus
      .TotalRegistros(f550.Count);

    for i := 0 to Pred(f550.Count) do
    begin
      regF550 := f550[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regF550._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regF550);
      FBloco0.AddCodConta(regF550.codCta);
      FBloco0.AcumulaReceitaBruta(regF550);

      FBlocoM.DetalhaContribPis(regF550);
      FBlocoM.DetalhaContribCofins(regF550);
    end;
  finally
    f550.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF600(
  ARegF010: TJSSpedContribuicoesModelRegistroF010);
var
  i       : Integer;
  regF600 : TJSSpedContribuicoesModelRegistroF600;
  f600    : TObjectList<TJSSpedContribuicoesModelRegistroF600>;
begin
  FStatus
    .Registro('F600')
    .Aguarde(True)
    .ShowStatus;

  f600 := FSpedContribuicoesService.DAO.BlocoF.DAOF600.list(ARegF010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .ShowStatus;

  try
    if (not Assigned(f600)) or (f600.Count = 0) then
      Exit;

    FStatus
      .TotalRegistros(f600.Count);

    for i := 0 to Pred(f600.Count) do
    begin
      regF600 := f600[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regF600._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regF600);
    end;
  finally
    f600.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoF.gerarF100(
  ARegF010: TJSSpedContribuicoesModelRegistroF010);
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAOF100;
  regF100 : TJSSpedContribuicoesModelRegistroF100;
  f100    : TObjectList<TJSSpedContribuicoesModelRegistroF100>;
  f100Full: TObjectList<TJSSpedContribuicoesModelRegistroF100>;
begin
  if not FSpedContribuicoesService.Config.PermiteGeracao then
    Exit;

  FStatus
    .Registro('F100')
    .Aguarde(True)
    .ShowStatus;

  f100Full := TObjectList<TJSSpedContribuicoesModelRegistroF100>.create;
  try
    for i := 0 to Pred(FSpedContribuicoesService.DAO.BlocoF.CountF100) do
    begin
      dao  := FSpedContribuicoesService.DAO.BlocoF.DAOF100(i);
      f100 := dao.list(ARegF010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
      try
        f100.OwnsObjects := False;
        f100Full.AddRange(f100.ToArray);
      finally
        f100.Free;
      end;
    end;

    FStatus
      .Aguarde(False)
      .TotalRegistros(f100Full.Count);

    for i := 0 to Pred(f100Full.Count) do
    begin
      regF100 := f100Full[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regF100._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      gerarF100(ARegF010, regF100);
    end;
  finally
    f100Full.Free;
  end;
end;

class function TJSSpedContribuicoesServiceBlocoF.New(
  Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoF;
begin
  result := Self.create(Parent);
end;

procedure TJSSpedContribuicoesServiceBlocoF.OnAddRegistro(
  Registro: TJSSpedContribuicoesModelRegistro);
var
  onAddRegistro: TOnSpedContribuicoesAddRegistro;
begin
  onAddRegistro := FSpedContribuicoesService.Config.OnAddRegistro;

  if Assigned(onAddRegistro) then
    onAddRegistro(Registro);
end;

procedure TJSSpedContribuicoesServiceBlocoF.OnLogErro(ALogErro: String);
var
  onLogErro: TOnSpedContribuicoesLogErro;
begin
  onLogErro := FSpedContribuicoesService.Config.OnLogErro;

  if Assigned(onLogErro) then
    OnLogErro(ALogErro);
end;

function TJSSpedContribuicoesServiceBlocoF.ServiceBloco0(
  Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoF;
begin
  result  := Self;
  FBloco0 := Value;
end;

function TJSSpedContribuicoesServiceBlocoF.ServiceBlocoM(
  Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoF;
begin
  result  := Self;
  FBlocoM := Value;
end;

end.
