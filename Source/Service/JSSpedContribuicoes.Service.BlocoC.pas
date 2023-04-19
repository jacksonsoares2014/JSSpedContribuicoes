unit JSSpedContribuicoes.Service.BlocoC;

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
  TJSSpedContribuicoesServiceBlocoC = class(TInterfacedObject, IJSSpedContribuicoesServiceBlocoC)
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

    procedure gerarC010; overload;
    procedure gerarC010(ARegC010: TJSSpedContribuicoesModelRegistroC010); overload;
    procedure gerarC100(ARegC010: TJSSpedContribuicoesModelRegistroC010); overload;
    procedure gerarC100(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC100: TJSSpedContribuicoesModelRegistroC100); overload;
    procedure gerarC110(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC100: TJSSpedContribuicoesModelRegistroC100);
    procedure gerarC111(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC110: TJSSpedContribuicoesModelRegistroC110);
    procedure gerarC120(ARegC100: TJSSpedContribuicoesModelRegistroC100);
    procedure gerarC170(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC100: TJSSpedContribuicoesModelRegistroC100; AC170List: TObjectList<TJSSpedContribuicoesModelRegistroC170>);
    procedure gerarC175(AC175List: TObjectList<TJSSpedContribuicoesModelRegistroC175>);

    procedure gerarC180(ARegC010: TJSSpedContribuicoesModelRegistroC010);
    procedure gerarC181(ARegC180: TJSSpedContribuicoesModelRegistroC180);
    procedure gerarC185(ARegC180: TJSSpedContribuicoesModelRegistroC180);

    procedure gerarC380(ARegC010: TJSSpedContribuicoesModelRegistroC010);
    procedure gerarC381(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC380: TJSSpedContribuicoesModelRegistroC380);
    procedure gerarC385(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC380: TJSSpedContribuicoesModelRegistroC380);

    procedure gerarC395(ARegC010: TJSSpedContribuicoesModelRegistroC010);
    procedure gerarC400(ARegC010: TJSSpedContribuicoesModelRegistroC010);
    procedure gerarC405(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC400: TJSSpedContribuicoesModelRegistroC400);
    procedure gerarC481(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC400: TJSSpedContribuicoesModelRegistroC400; ARegC405: TJSSpedContribuicoesModelRegistroC405);
    procedure gerarC485(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC400: TJSSpedContribuicoesModelRegistroC400; ARegC405: TJSSpedContribuicoesModelRegistroC405);
    procedure gerarC490(ARegC010: TJSSpedContribuicoesModelRegistroC010);
    procedure gerarC491(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC490: TJSSpedContribuicoesModelRegistroC490);
    procedure gerarC495(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC490: TJSSpedContribuicoesModelRegistroC490);

    procedure gerarC500(ARegC010: TJSSpedContribuicoesModelRegistroC010); overload;
    procedure gerarC500(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC500: TJSSpedContribuicoesModelRegistroC500); overload;
    procedure gerarC501(ARegC500: TJSSpedContribuicoesModelRegistroC500);
    procedure gerarC505(ARegC500: TJSSpedContribuicoesModelRegistroC500);

    procedure gerarC800(ARegC010: TJSSpedContribuicoesModelRegistroC010);
    procedure gerarC810(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC800: TJSSpedContribuicoesModelRegistroC800);
    procedure gerarC860(ARegC010: TJSSpedContribuicoesModelRegistroC010);
    procedure gerarC870(ARegC010: TJSSpedContribuicoesModelRegistroC010; ARegC860: TJSSpedContribuicoesModelRegistroC860);

  protected
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoC;
    function ServiceBloco1(Value: IJSSpedContribuicoesServiceBloco1): IJSSpedContribuicoesServiceBlocoC;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoC;

    function &End: IJSSpedContribuicoesService;
  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoC;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceBlocoC }

procedure TJSSpedContribuicoesServiceBlocoC.AdicionaLinhaSped(
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

constructor TJSSpedContribuicoesServiceBlocoC.create(
  Parent: IJSSpedContribuicoesService);
begin
  FSpedContribuicoesService := Parent;
  FArquivo     := TStringList.Create;
  FStatus      := TJSSpedContribuicoesServiceStatus.New(Self.FSpedContribuicoesService).Bloco('C');
  FacadeExport := JSSpedContribuicoes.Export.Interfaces
                    .FacadeExport(FSpedContribuicoesService.Emitente, FSpedContribuicoesService.Config);
end;

destructor TJSSpedContribuicoesServiceBlocoC.Destroy;
begin
  if Assigned(FArquivo) then
    FArquivo.Free;

  inherited;
end;

function TJSSpedContribuicoesServiceBlocoC.&End: IJSSpedContribuicoesService;
begin
  result := FSpedContribuicoesService;
end;

function TJSSpedContribuicoesServiceBlocoC.Execute: TStrings;
var
  regC001 : TJSSpedContribuicoesModelRegistroC001;
  regC990 : TJSSpedContribuicoesModelRegistroC990;
begin
  try
    regC001 := TJSSpedContribuicoesModelRegistroC001.create;
    regC990 := TJSSpedContribuicoesModelRegistroC990.create;
    try
      gerarC010;

      if FArquivo.Count > 0 then
        regC001.indMov := imComDadosInformados;
      AdicionaLinhaSped(regC001,0);

      regC990.qtdlinC := regC990.qtdlinC + FArquivo.Count;
      AdicionaLinhaSped(regC990);

      result := FArquivo;
    finally
      regC001.Free;
      regC990.Free;
    end;
  except
    on e: Exception Do
    begin
      FArquivo.Free;
      OnLogErro('Houve erro na geração do blooo C: ' + e.Message);
      Raise;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC100(ARegC010: TJSSpedContribuicoesModelRegistroC010);
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAOC100;
  regC100 : TJSSpedContribuicoesModelRegistroC100;
  c100    : TObjectList<TJSSpedContribuicoesModelRegistroC100>;
  c100Full: TObjectList<TJSSpedContribuicoesModelRegistroC100>;
begin
  c100Full := TObjectList<TJSSpedContribuicoesModelRegistroC100>.create;
  try
    FStatus
      .Registro('C100')
      .Aguarde(True)
      .ShowStatus;

    for i := 0 to Pred(FSpedContribuicoesService.DAO.BlocoC.CountC100) do
    begin
      dao  := FSpedContribuicoesService.DAO.BlocoC.DAOC100(i);
      c100 := dao.list(ARegC010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
      try
        c100.OwnsObjects := False;
        c100Full.AddRange(c100.ToArray);
      finally
        c100.Free;
      end;
    end;

    FStatus
      .Aguarde(False)
      .TotalRegistros(c100Full.Count);

    for i := 0 to Pred(c100Full.Count) do
    begin
      regC100 := c100Full[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regC100._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      gerarC100(ARegC010, regC100);
    end;
  finally
    c100Full.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC100(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC100: TJSSpedContribuicoesModelRegistroC100);
var
  c170 : TObjectList<TJSSpedContribuicoesModelRegistroC170>;
  c175 : TObjectList<TJSSpedContribuicoesModelRegistroC175>;
begin
  c170 := nil;
  c175 := nil;

  if (FSpedContribuicoesService.Config.VersaoPVA = VersaoPva208) and
     (ARegC100.codMod.Equals('65')) then
    Exit;

  if ARegC100.codSit in [csCancelado,
                         csCanceladoExtemporaneo,
                         csDenegado,
                         csInutilizado]
  then
  begin
    AdicionaLinhaSped(ARegC100);
    Exit;
  end;

  if ARegC100.codMod = '65' then
  begin
    c175 := FSpedContribuicoesService.DAO.BlocoC.DAOC175.list(ARegC100);
    try
      AdicionaLinhaSped(ARegC100);
      gerarC175(c175);
    finally
      c175.Free;
    end;
  end
  else
  begin
    c170 := FSpedContribuicoesService.DAO.BlocoC.DAOC170.list(ARegC100);
    try
      AdicionaLinhaSped(ARegC100);
      gerarC110(ARegC010, ARegC100);
      gerarC120(ARegC100);
      gerarC170(ARegC010, ARegC100, c170);
      FBloco0.AddCodPart(ARegC010._id, ARegC100.codPart);
    finally
      c170.Free;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC110(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC100: TJSSpedContribuicoesModelRegistroC100);
var
  i       : Integer;
  regC110 : TJSSpedContribuicoesModelRegistroC110;
  c110    : TObjectList<TJSSpedContribuicoesModelRegistroC110>;
begin
  c110 := FSpedContribuicoesService.DAO.BlocoC.DAOC110.list(ARegC100);
  try
    if (not Assigned(c110)) or (c110.Count = 0) then
      Exit;

    for i := 0 to Pred(c110.Count) do
    begin
      regC110 := c110[i];
      AdicionaLinhaSped(regC110);
      FBloco0.AddCodInf(ARegC010._id, regC110.codInf);

      gerarC111(ARegC010, regC110);
    end;
  finally
    c110.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC111(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC110: TJSSpedContribuicoesModelRegistroC110);
var
  i       : Integer;
  regC111 : TJSSpedContribuicoesModelRegistroC111;
  c111    : TObjectList<TJSSpedContribuicoesModelRegistroC111>;
begin
  c111 := FSpedContribuicoesService.DAO.BlocoC.DAOC111.list(ARegC110);
  try
    if (not Assigned(c111)) or (c111.Count = 0) then
      Exit;

    for i := 0 to Pred(c111.Count) do
    begin
      regC111 := c111[i];
      AdicionaLinhaSped(regC111);
      FBloco1.AddProcJudicial(ARegC010, regC111);
      FBloco1.AddProcADM(regC111);
    end;
  finally
    c111.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC120(
  ARegC100: TJSSpedContribuicoesModelRegistroC100);
var
  i       : Integer;
  regC120 : TJSSpedContribuicoesModelRegistroC120;
  c120    : TObjectList<TJSSpedContribuicoesModelRegistroC120>;
begin
  c120 := FSpedContribuicoesService.DAO.BlocoC.DAOC120.list(ARegC100);
  try
    if (not Assigned(c120)) or (c120.Count = 0) then
      Exit;

    for i := 0 to Pred(c120.Count) do
    begin
      regC120 := c120[i];
      AdicionaLinhaSped(regC120);
    end;
  finally
    c120.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC170(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC100: TJSSpedContribuicoesModelRegistroC100;
  AC170List: TObjectList<TJSSpedContribuicoesModelRegistroC170>);
var
  i       : Integer;
  regC170 : TJSSpedContribuicoesModelRegistroC170;
begin
  if (not Assigned(AC170List)) or (AC170List.Count = 0) then
    Exit;

  for i := 0 to Pred(AC170List.Count) do
  begin
    regC170 := AC170List[i];
    AdicionaLinhaSped(regC170);
    FBloco0.AddCodItem(ARegC010._id, regC170.codItem);
    FBloco0.AddUnid(ARegC010._id, regC170.unid);
    FBloco0.AddCodConta(regC170.codCta);

    if ARegC100.indOper = toEntrada then
    begin
      if (regC170.cstPis <> regC170.cstCofins) then
        raise Exception.Create(Format('O item %s do documento número %s de %s, possui CST PIS diferente do CST COFINS.',
                                      [RegC170.codItem,ARegC100.numDoc,ARegC100.indOper.Caption]));

      if (regC170.vlBcPis <> regC170.vlBcCofins) then
        raise Exception.Create(Format('O item %s do documento número %s de %s, possui Base de PIS diferente da base de COFINS.',
                                      [RegC170.codItem,ARegC100.numDoc,ARegC100.indOper.Caption]));

      if (RegC170.GetValueDouble('VLBCPISCUM') <> RegC170.GetValueDouble('VLBCCOFINSCUM')) then
        raise Exception.Create(Format('O item %s do documento número %s de %s, possui cálculo de proporcional da Base de PIS diferente da base de COFINS.',
                                      [RegC170.codItem,ARegC100.numDoc,ARegC100.indOper.Caption]));

      FBlocoM.DetalhaCredBasePis(RegC170);
      FBlocoM.DetalhaCredBaseCofins(RegC170);
    end;

    if ARegC100.indOper = toSaida then
    begin
      FBlocoM.DetalhaContribPis(RegC170);
      FBlocoM.DetalhaContribCofins(RegC170);
      FBloco0.AcumulaReceitaBruta(RegC170);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC175(AC175List: TObjectList<TJSSpedContribuicoesModelRegistroC175>);
var
  i       : Integer;
  regC175 : TJSSpedContribuicoesModelRegistroC175;
begin
  if (not Assigned(AC175List)) or (AC175List.Count = 0) then
    Exit;

  for i := 0 to Pred(AC175List.Count) do
  begin
    regC175 := AC175List[i];
    AdicionaLinhaSped(regC175);
    FBloco0.AddCodConta(regC175.codCta);

    FBlocoM.DetalhaContribPis(RegC175);
    FBlocoM.DetalhaContribCofins(RegC175);
    FBloco0.AcumulaReceitaBruta(RegC175);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC180(
  ARegC010: TJSSpedContribuicoesModelRegistroC010);
var
  i       : Integer;
  regC180 : TJSSpedContribuicoesModelRegistroC180;
  c180    : TObjectList<TJSSpedContribuicoesModelRegistroC180>;
begin
  c180 := FSpedContribuicoesService.DAO.BlocoC.DAOC180.listC180(ARegC010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
  try
    if (not Assigned(c180)) or (c180.Count = 0) then
      Exit;

    for i := 0 to Pred(c180.Count) do
    begin
      regC180 := c180[i];
      AdicionaLinhaSped(regC180);
      FBloco0.AddCodItem(ARegC010._id, regC180.codItem);

      gerarC181(regC180);
      gerarC185(regC180);
    end;
  finally
    c180.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC181(
  ARegC180: TJSSpedContribuicoesModelRegistroC180);
var
  i       : Integer;
  regC181 : TJSSpedContribuicoesModelRegistroC181;
  c181    : TObjectList<TJSSpedContribuicoesModelRegistroC181>;
begin
  c181 := FSpedContribuicoesService.DAO.BlocoC.DAOC181.listC181(ARegC180);
  try
    if (not Assigned(c181)) or (c181.Count = 0) then
      Exit;

    for i := 0 to Pred(c181.Count) do
    begin
      regC181 := c181[i];
      AdicionaLinhaSped(regC181);
      FBloco0.AddCodConta(regC181.codCta);
      FBlocoM.DetalhaContribPis(regC181);
      FBloco0.AcumulaReceitaBruta(RegC181);
    end;
  finally
    c181.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC185(
  ARegC180: TJSSpedContribuicoesModelRegistroC180);
var
  i       : Integer;
  regC185 : TJSSpedContribuicoesModelRegistroC185;
  c185    : TObjectList<TJSSpedContribuicoesModelRegistroC185>;
begin
  c185 := FSpedContribuicoesService.DAO.BlocoC.DAOC185.listC185(ARegC180);
  try
    if (not Assigned(c185)) or (c185.Count = 0) then
      Exit;

    for i := 0 to Pred(c185.Count) do
    begin
      regC185 := c185[i];
      AdicionaLinhaSped(regC185);
      FBloco0.AddCodConta(regC185.codCta);
      FBlocoM.DetalhaContribCofins(regC185);
    end;
  finally
    c185.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC380(
  ARegC010: TJSSpedContribuicoesModelRegistroC010);
var
  i       : Integer;
  regC380 : TJSSpedContribuicoesModelRegistroC380;
  c380    : TObjectList<TJSSpedContribuicoesModelRegistroC380>;
begin
  c380 := FSpedContribuicoesService.DAO.BlocoC.DAOC380.listC380(ARegC010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
  try
    if (not Assigned(c380)) or (c380.Count = 0) then
      Exit;

    for i := 0 to Pred(c380.Count) do
    begin
      regC380 := c380[i];
      AdicionaLinhaSped(regC380);

      gerarC381(ARegC010, regC380);
      gerarC385(ARegC010, regC380);
    end;
  finally
    c380.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC381(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC380: TJSSpedContribuicoesModelRegistroC380);
var
  i       : Integer;
  regC381 : TJSSpedContribuicoesModelRegistroC381;
  c381    : TObjectList<TJSSpedContribuicoesModelRegistroC381>;
begin
  c381 := FSpedContribuicoesService.DAO.BlocoC.DAOC381.listC381(ARegC380);
  try
    if (not Assigned(c381)) or (c381.Count = 0) then
      Exit;

    for i := 0 to Pred(c381.Count) do
    begin
      regC381 := c381[i];
      AdicionaLinhaSped(regC381);
      FBloco0.AddCodItem(ARegC010._id, regC381.codItem);
      FBloco0.AddCodConta(regC381.codCta);
      FBlocoM.DetalhaContribPis(regC381);
      FBloco0.AcumulaReceitaBruta(RegC381);
    end;
  finally
    c381.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC385(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC380: TJSSpedContribuicoesModelRegistroC380);
var
  i       : Integer;
  regC385 : TJSSpedContribuicoesModelRegistroC385;
  c385    : TObjectList<TJSSpedContribuicoesModelRegistroC385>;
begin
  c385 := FSpedContribuicoesService.DAO.BlocoC.DAOC385.listC385(ARegC380);
  try
    if (not Assigned(c385)) or (c385.Count = 0) then
      Exit;

    for i := 0 to Pred(c385.Count) do
    begin
      regC385 := c385[i];
      AdicionaLinhaSped(regC385);
      FBloco0.AddCodItem(ARegC010._id, regC385.codItem);
      FBloco0.AddCodConta(regC385.codCta);
      FBlocoM.DetalhaContribCofins(regC385);
    end;
  finally
    c385.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC395(
  ARegC010: TJSSpedContribuicoesModelRegistroC010);
begin

end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC400(
  ARegC010: TJSSpedContribuicoesModelRegistroC010);
var
  i       : Integer;
  regC400 : TJSSpedContribuicoesModelRegistroC400;
  c400    : TObjectList<TJSSpedContribuicoesModelRegistroC400>;
begin
  FStatus
    .Registro('C400')
    .Aguarde(True)
    .ShowStatus;

  c400 := FSpedContribuicoesService.DAO.BlocoC.DAOC400.listC400(ARegC010,
                                                                FSpedContribuicoesService.Config.DataInicial,
                                                                FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .ShowStatus;

  try
    if (not Assigned(c400)) or (c400.Count = 0) then
      Exit;

    FStatus
      .TotalRegistros(c400.Count);

    for i := 0 to Pred(c400.Count) do
    begin
      regC400 := c400[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regC400._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regC400);
      gerarC405(ARegC010, regC400);
    end;
  finally
    c400.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC405(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC400: TJSSpedContribuicoesModelRegistroC400);
var
  i       : Integer;
  regC405 : TJSSpedContribuicoesModelRegistroC405;
  c405    : TObjectList<TJSSpedContribuicoesModelRegistroC405>;
begin
  c405 := FSpedContribuicoesService.DAO.BlocoC.DAOC405.listC405(ARegC400);
  try
    if (not Assigned(c405)) or (c405.Count = 0) then
      Exit;

    for i := 0 to Pred(c405.Count) do
    begin
      regC405     := c405[i];
      AdicionaLinhaSped(regC405);

      gerarC481(ARegC010,ARegC400,regC405);
      gerarC485(ARegC010,ARegC400,regC405);
    end;
  finally
    c405.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC481(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC400: TJSSpedContribuicoesModelRegistroC400;
  ARegC405: TJSSpedContribuicoesModelRegistroC405);
var
  i       : Integer;
  regC481 : TJSSpedContribuicoesModelRegistroC481;
  c481    : TObjectList<TJSSpedContribuicoesModelRegistroC481>;
begin
  c481 := FSpedContribuicoesService.DAO.BlocoC.DAOC481.listC481(ARegC400, ARegC405);
  try
    if (not Assigned(c481)) or (c481.Count = 0) then
      Exit;

    for i := 0 to Pred(c481.Count) do
    begin
      regC481     := c481[i];
      AdicionaLinhaSped(regC481);
      FBloco0.AddCodItem(ARegC010._id, regC481.codItem);
      FBloco0.AddCodConta(regC481.codCta);
      FBlocoM.DetalhaContribPis(regC481);
      FBloco0.AcumulaReceitaBruta(regC481);
    end;
  finally
    c481.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC485(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC400: TJSSpedContribuicoesModelRegistroC400;
  ARegC405: TJSSpedContribuicoesModelRegistroC405);
var
  i       : Integer;
  regC485 : TJSSpedContribuicoesModelRegistroC485;
  c485    : TObjectList<TJSSpedContribuicoesModelRegistroC485>;
begin
  c485 := FSpedContribuicoesService.DAO.BlocoC.DAOC485.listC485(ARegC400, ARegC405);
  try
    if (not Assigned(c485)) or (c485.Count = 0) then
      Exit;

    for i := 0 to Pred(c485.Count) do
    begin
      regC485     := c485[i];
      AdicionaLinhaSped(regC485);
      FBloco0.AddCodItem(ARegC010._id, regC485.codItem);
      FBloco0.AddCodConta(regC485.codCta);
      FBlocoM.DetalhaContribCofins(regC485);
    end;
  finally
    c485.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC490(
  ARegC010: TJSSpedContribuicoesModelRegistroC010);
var
  i       : Integer;
  regC490 : TJSSpedContribuicoesModelRegistroC490;
  c490    : TObjectList<TJSSpedContribuicoesModelRegistroC490>;

  function Gera490: Boolean;
  begin
    Result := (RegC490.codMod = '2D') or
              ((RegC490.codMod = '59') and (FSpedContribuicoesService.Config.VersaoPVA = VersaoPva209));
  end;
begin
  FStatus
    .Registro('C490')
    .Aguarde(True)
    .ShowStatus;

  c490 := FSpedContribuicoesService.DAO.BlocoC.DAOC490.listC490(ARegC010,
                                                                FSpedContribuicoesService.Config.DataInicial,
                                                                FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .ShowStatus;

  try
    if (not Assigned(c490)) or (c490.Count = 0) then
      Exit;

    FStatus
      .TotalRegistros(c490.Count);

    for i := 0 to Pred(c490.Count) do
    begin
      regC490 := c490[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regC490._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      if Gera490 then
      begin
        AdicionaLinhaSped(regC490);
        gerarC491(ARegC010, regC490);
        gerarC495(ARegC010, regC490);
      end;
    end;
  finally
    c490.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC491(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC490: TJSSpedContribuicoesModelRegistroC490);
var
  i       : Integer;
  regC491 : TJSSpedContribuicoesModelRegistroC491;
  c491    : TObjectList<TJSSpedContribuicoesModelRegistroC491>;
begin
  c491 := FSpedContribuicoesService.DAO.BlocoC.DAOC491.listC491(ARegC490);
  try
    if (not Assigned(c491)) or (c491.Count = 0) then
      Exit;

    for i := 0 to Pred(c491.Count) do
    begin
      regC491     := c491[i];
      AdicionaLinhaSped(regC491);
      FBloco0.AddCodItem(ARegC010._id, regC491.codItem);
      FBloco0.AddCodConta(regC491.codCta);
      FBlocoM.DetalhaContribPis(regC491);
      FBloco0.AcumulaReceitaBruta(regC491);
    end;
  finally
    c491.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC495(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC490: TJSSpedContribuicoesModelRegistroC490);
var
  i       : Integer;
  regC495 : TJSSpedContribuicoesModelRegistroC495;
  c495    : TObjectList<TJSSpedContribuicoesModelRegistroC495>;
begin
  c495 := FSpedContribuicoesService.DAO.BlocoC.DAOC495.listC495(ARegC490);
  try
    if (not Assigned(c495)) or (c495.Count = 0) then
      Exit;

    for i := 0 to Pred(c495.Count) do
    begin
      regC495     := c495[i];
      AdicionaLinhaSped(regC495);
      FBloco0.AddCodItem(ARegC010._id, regC495.codItem);
      FBloco0.AddCodConta(regC495.codCta);
      FBlocoM.DetalhaContribCofins(regC495);
    end;
  finally
    c495.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC500(
  ARegC010: TJSSpedContribuicoesModelRegistroC010);
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAOC500;
  regC500 : TJSSpedContribuicoesModelRegistroC500;
  c500    : TObjectList<TJSSpedContribuicoesModelRegistroC500>;
  c500Full: TObjectList<TJSSpedContribuicoesModelRegistroC500>;
begin
  c500Full := TObjectList<TJSSpedContribuicoesModelRegistroC500>.create;
  try
    FStatus
      .Registro('C500')
      .Aguarde(True)
      .ShowStatus;

    for i := 0 to Pred(FSpedContribuicoesService.DAO.BlocoC.CountC500) do
    begin
      dao  := FSpedContribuicoesService.DAO.BlocoC.DAOC500(i);
      c500 := dao.list(ARegC010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
      try
        c500.OwnsObjects := False;
        c500Full.AddRange(c500.ToArray);
      finally
        c500.Free;
      end;
    end;

    FStatus
      .Aguarde(False)
      .TotalRegistros(c500Full.Count);

    for i := 0 to Pred(c500Full.Count) do
    begin
      regC500 := c500Full[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regC500._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      gerarC500(ARegC010, regC500);
    end;
  finally
    c500Full.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC500(
  ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC500: TJSSpedContribuicoesModelRegistroC500);
begin
  AdicionaLinhaSped(ARegC500);
  FBloco0.AddCodPart(ARegC010._id, ARegC500.codPart);

  gerarC501(ARegC500);
  gerarC505(ARegC500);
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC501(
  ARegC500: TJSSpedContribuicoesModelRegistroC500);
var
  i       : Integer;
  regC501 : TJSSpedContribuicoesModelRegistroC501;
  c501    : TObjectList<TJSSpedContribuicoesModelRegistroC501>;
begin
  c501 := FSpedContribuicoesService.DAO.BlocoC.DAOC501.listC501(ARegC500);
  try
    if (not Assigned(c501)) or (c501.Count = 0) then
      Exit;

    for i := 0 to Pred(c501.Count) do
    begin
      regC501     := c501[i];
      AdicionaLinhaSped(regC501);
      FBloco0.AddCodConta(regC501.codCta);
      FBlocoM.DetalhaCredBasePis(regC501);
    end;
  finally
    c501.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC505(
  ARegC500: TJSSpedContribuicoesModelRegistroC500);
var
  i       : Integer;
  regC505 : TJSSpedContribuicoesModelRegistroC505;
  c505    : TObjectList<TJSSpedContribuicoesModelRegistroC505>;
begin
  c505 := FSpedContribuicoesService.DAO.BlocoC.DAOC505.listC505(ARegC500);
  try
    if (not Assigned(c505)) or (c505.Count = 0) then
      Exit;

    for i := 0 to Pred(c505.Count) do
    begin
      regC505     := c505[i];
      AdicionaLinhaSped(regC505);
      FBloco0.AddCodConta(regC505.codCta);
      FBlocoM.DetalhaCredBaseCofins(regC505);
    end;
  finally
    c505.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC800(
  ARegC010: TJSSpedContribuicoesModelRegistroC010);
var
  i       : Integer;
  regC800 : TJSSpedContribuicoesModelRegistroC800;
  c800    : TObjectList<TJSSpedContribuicoesModelRegistroC800>;
begin
  FStatus
    .Registro('C800')
    .Aguarde(True)
    .ShowStatus;

  c800 := FSpedContribuicoesService.DAO.BlocoC.DAOC800.listC800(ARegC010,
                                                                FSpedContribuicoesService.Config.DataInicial,
                                                                FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .ShowStatus;

  try
    if (not Assigned(c800)) or (c800.Count = 0) then
      Exit;

    FStatus
      .TotalRegistros(c800.Count);

    for i := 0 to Pred(c800.Count) do
    begin
      regC800 := c800[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regC800._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regC800);
      if RegC800.codSit in [csRegular,
                            csRegularExtemporaneo,
                            csComplementar,
                            csComplementarExtemporaneo,
                            csRegimeEspecial] then
        gerarC810(ARegC010, regC800);
    end;
  finally
    c800.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC810(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC800: TJSSpedContribuicoesModelRegistroC800);
var
  i       : Integer;
  regC810 : TJSSpedContribuicoesModelRegistroC810;
  c810    : TObjectList<TJSSpedContribuicoesModelRegistroC810>;
begin
  c810 := FSpedContribuicoesService.DAO.BlocoC.DAOC810.listC810(ARegC800);
  try
    if (not Assigned(c810)) or (c810.Count = 0) then
      Exit;

    for i := 0 to Pred(c810.Count) do
    begin
      regC810 := c810[i];
      AdicionaLinhaSped(regC810);
      FBloco0.AddCodItem(ARegC010._id, regC810.codItem);
      FBloco0.AddCodConta(regC810.codCta);
      FBlocoM.DetalhaContribPis(regC810);
      FBlocoM.DetalhaContribCofins(regC810);
      FBloco0.AcumulaReceitaBruta(regC810);
    end;
  finally
    c810.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC860(
  ARegC010: TJSSpedContribuicoesModelRegistroC010);
var
  i       : Integer;
  regC860 : TJSSpedContribuicoesModelRegistroC860;
  c860    : TObjectList<TJSSpedContribuicoesModelRegistroC860>;
begin
  FStatus
    .Registro('C860')
    .Aguarde(True)
    .ShowStatus;

  c860 := FSpedContribuicoesService.DAO.BlocoC.DAOC860.list(ARegC010,
                                                            FSpedContribuicoesService.Config.DataInicial,
                                                            FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .ShowStatus;

  try
    if (not Assigned(c860)) or (c860.Count = 0) then
      Exit;

    FStatus
      .TotalRegistros(c860.Count);

    for i := 0 to Pred(c860.Count) do
    begin
      regC860 := c860[i];
      FStatus.RegistroAtual(i + 1)
             .IdRegistro(regC860._id)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      AdicionaLinhaSped(regC860);
      gerarC870(ARegC010, regC860);
    end;
  finally
    c860.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC870(ARegC010: TJSSpedContribuicoesModelRegistroC010;
  ARegC860: TJSSpedContribuicoesModelRegistroC860);
var
  i       : Integer;
  regC870 : TJSSpedContribuicoesModelRegistroC870;
  c870    : TObjectList<TJSSpedContribuicoesModelRegistroC870>;
begin
  c870 := FSpedContribuicoesService.DAO.BlocoC.DAOC870.list(ARegC010, ARegC860);
  try
    if (not Assigned(c870)) or (c870.Count = 0) then
      Exit;

    for i := 0 to Pred(c870.Count) do
    begin
      regC870 := c870[i];
      AdicionaLinhaSped(regC870);
      FBloco0.AddCodItem(ARegC010._id, regC870.codItem);
      FBloco0.AddCodConta(regC870.codCta);
      FBlocoM.DetalhaContribPis(regC870);
      FBlocoM.DetalhaContribCofins(regC870);
      FBloco0.AcumulaReceitaBruta(regC870);
    end;
  finally
    c870.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC010(ARegC010: TJSSpedContribuicoesModelRegistroC010);
begin
  if FSpedContribuicoesService.Config.IndicadorEscrituracao = ieApuracaoIndividualizada then
    gerarC100(ARegC010);

  if (FSpedContribuicoesService.Config.VersaoPVA = VersaoPva208) or
     (FSpedContribuicoesService.Config.IndicadorEscrituracao = ieApuracaoConsolidada) then
    gerarC180(ARegC010);

  gerarC380(ARegC010);
  gerarC395(ARegC010);

  case FSpedContribuicoesService.Config.IndicadorEscrituracao of
     ieApuracaoConsolidada     : gerarC490(ARegC010);
     ieApuracaoIndividualizada : gerarC400(ARegC010);
  end;

  gerarC500(ARegC010);

  if FSpedContribuicoesService.Config.VersaoPVA = VersaoPva210 then
    if FSpedContribuicoesService.Config.GerarC860 then
      gerarC860(ARegC010)
    else
      gerarC800(ARegC010);

end;

procedure TJSSpedContribuicoesServiceBlocoC.gerarC010;
var
  i, n     : Integer;
  dao      : IJSSpedContribuicoesDAOC010;
  regC010  : TJSSpedContribuicoesModelRegistroC010;
  c010     : TObjectList<TJSSpedContribuicoesModelRegistroC010>;
begin
  if not FSpedContribuicoesService.Config.PermiteGeracao then
    Exit;

  dao := FSpedContribuicoesService.DAO.BlocoC.DAOC010;
  if not Assigned(dao) then
    Exit;

  c010 := dao.list;
  try
    for i := 0 to Pred(c010.Count) do
    begin
      regC010          := c010[i];
      regC010.indEscri := FSpedContribuicoesService.Config.IndicadorEscrituracao;
      n                := FArquivo.Count;
      gerarC010(regC010);
      if FArquivo.Count > n then
        AdicionaLinhaSped(regC010,n);
    end;
  finally
    c010.Free;
  end;

end;

class function TJSSpedContribuicoesServiceBlocoC.New(
  Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoC;
begin
  result := Self.create(Parent);
end;

procedure TJSSpedContribuicoesServiceBlocoC.OnAddRegistro(
  Registro: TJSSpedContribuicoesModelRegistro);
var
  onAddRegistro: TOnSpedContribuicoesAddRegistro;
begin
  onAddRegistro := FSpedContribuicoesService.Config.OnAddRegistro;

  if Assigned(onAddRegistro) then
    onAddRegistro(Registro);
end;

procedure TJSSpedContribuicoesServiceBlocoC.OnLogErro(ALogErro: String);
var
  onLogErro: TOnSpedContribuicoesLogErro;
begin
  onLogErro := FSpedContribuicoesService.Config.OnLogErro;

  if Assigned(onLogErro) then
    OnLogErro(ALogErro);
end;

function TJSSpedContribuicoesServiceBlocoC.ServiceBloco0(
  Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoC;
begin
  result  := Self;
  FBloco0 := Value;
end;

function TJSSpedContribuicoesServiceBlocoC.ServiceBloco1(
  Value: IJSSpedContribuicoesServiceBloco1): IJSSpedContribuicoesServiceBlocoC;
begin
  result  := Self;
  FBloco1 := Value;
end;

function TJSSpedContribuicoesServiceBlocoC.ServiceBlocoM(
  Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoC;
begin
  result  := Self;
  FBlocoM := Value;
end;

end.
