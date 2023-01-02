unit JSSpedContribuicoes.Service.Bloco1;

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
  System.Generics.Defaults,
  System.DateUtils,
  System.SysUtils,
  System.Classes;

type
  TJSSpedContribuicoesServiceBloco1 = class(TInterfacedObject, IJSSpedContribuicoesServiceBloco1)
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

    FComparer1010 : IComparer<TJSSpedContribuicoesModelRegistro1010>;
    FComparer1020 : IComparer<TJSSpedContribuicoesModelRegistro1020>;

    _1010       : TObjectList<TJSSpedContribuicoesModelRegistro1010>;
    _1020       : TObjectList<TJSSpedContribuicoesModelRegistro1020>;

    procedure OnAddRegistro(Registro: TJSSpedContribuicoesModelRegistro);
    procedure OnLogErro(ALogErro: String);

    procedure AdicionaLinhaSped(ARegistro: TJSSpedContribuicoesModelRegistro; AIndex: Integer = -1);

    //A partir de 2014, os registros 1300 e 1700 tiveram que ser
    //agrupados por Regime de Apuração e caso o Regime seja Cumulativo
    //e Enquadramento Lucro Real, a natureza de retenção passou a ser
    //um dos valores:
    //'51','52','53','54','55' ou '59'.
    function Gerar1300_1700RegApu: Boolean;
    function GetNaturezaRetencao(IndNatRet: String; RegApu: String): string;

    function validateInstance<T: TJSSpedContribuicoesModelRegistro, constructor>(AModel: TJSSpedContribuicoesModelRegistro): Boolean;
    procedure AddProcJudicialA111(AReg, AModel: TJSSpedContribuicoesModelRegistro);
    procedure AddProcJudicialC111(AReg, AModel: TJSSpedContribuicoesModelRegistro);
    procedure AddProcADMA111     (AModel: TJSSpedContribuicoesModelRegistro);
    procedure AddProcADMC111     (AModel: TJSSpedContribuicoesModelRegistro);

    procedure gerar1010;
    procedure gerar1011(AReg1010: TJSSpedContribuicoesModelRegistro1010);
    procedure gerar1020;
    procedure gerar1100;
    procedure gerar1101(A1101List: TObjectList<TJSSpedContribuicoesModelRegistro1101>);
    procedure gerar1300;
    procedure gerar1300RegApu;
    procedure gerar1500;
    procedure gerar1501(A1501List: TObjectList<TJSSpedContribuicoesModelRegistro1501>);
    procedure gerar1700;
    procedure gerar1700RegApu;
    procedure gerar1900;
  protected
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBloco1;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBloco1;

    function AddProcJudicial    (AReg, AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBloco1;
    function AddProcADM         (AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBloco1;

    function &End: IJSSpedContribuicoesService;
  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBloco1;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceBloco1 }

function TJSSpedContribuicoesServiceBloco1.AddProcADM(
  AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBloco1;
begin
  result := Self;
  AddProcADMA111(AModel);
  AddProcADMC111(AModel);
end;

procedure TJSSpedContribuicoesServiceBloco1.AddProcADMA111(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegA111 : TJSSpedContribuicoesModelRegistroA111;
  Reg1020 : TJSSpedContribuicoesModelRegistro1020;
  I       : Integer;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroA111>(AModel) then
    Exit;

  RegA111 := TJSSpedContribuicoesModelRegistroA111(AModel);
  if (RegA111.numProc.IsEmpty) or
     (RegA111.GetValueStr('INDNATACAO').IsEmpty) or
     (RegA111.GetValueStr('DTDECADM').IsEmpty) then
    Exit;

  Reg1020 := TJSSpedContribuicoesModelRegistro1020.create;
  Reg1020.numProc    := RegA111.numProc;
  Reg1020.indNatAcao   := RegA111.GetValueStr('INDNATACAO');
  Reg1020.dtDecAdm     := StrToDate(RegA111.GetValueStr('DTDECADM'));

  if not Assigned(_1020) then
    _1020 := TObjectList<TJSSpedContribuicoesModelRegistro1020>.Create;

  if not _1020.BinarySearch(Reg1020, I, FComparer1020) then
    _1020.Insert(I, Reg1020)
  else
    FreeAndNil(Reg1020);
end;

procedure TJSSpedContribuicoesServiceBloco1.AddProcADMC111(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegC111 : TJSSpedContribuicoesModelRegistroC111;
  Reg1020 : TJSSpedContribuicoesModelRegistro1020;
  I       : Integer;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC111>(AModel) then
    Exit;

  RegC111 := TJSSpedContribuicoesModelRegistroC111(AModel);
  if (RegC111.numProc.IsEmpty) or
     (RegC111.GetValueStr('INDNATACAO').IsEmpty) or
     (RegC111.GetValueStr('DTDECADM').IsEmpty) then
    Exit;

  Reg1020 := TJSSpedContribuicoesModelRegistro1020.create;
  Reg1020.numProc      := RegC111.numProc;
  Reg1020.indNatAcao   := RegC111.GetValueStr('INDNATACAO');
  Reg1020.dtDecAdm     := StrToDate(RegC111.GetValueStr('DTDECADM'));

  if not Assigned(_1020) then
    _1020 := TObjectList<TJSSpedContribuicoesModelRegistro1020>.Create;

  if not _1020.BinarySearch(Reg1020, I, FComparer1020) then
    _1020.Insert(I, Reg1020)
  else
    FreeAndNil(Reg1020);
end;

function TJSSpedContribuicoesServiceBloco1.AddProcJudicial(AReg, AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBloco1;
begin
  result := Self;
  AddProcJudicialA111(AReg, AModel);
  AddProcJudicialC111(AReg, AModel);
end;

procedure TJSSpedContribuicoesServiceBloco1.AddProcJudicialA111(AReg, AModel: TJSSpedContribuicoesModelRegistro);
var
  RegA111 : TJSSpedContribuicoesModelRegistroA111;
  Reg1010 : TJSSpedContribuicoesModelRegistro1010;
  I       : Integer;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroA111>(AModel) then
    Exit;

  RegA111 := TJSSpedContribuicoesModelRegistroA111(AModel);
  if (RegA111.numProc.IsEmpty) or
     (RegA111.GetValueStr('IDSECJUD').IsEmpty) or
     (RegA111.GetValueStr('IDVARA').IsEmpty) or
     (RegA111.GetValueStr('INDNATACAO').IsEmpty) then
    Exit;

  Reg1010 := TJSSpedContribuicoesModelRegistro1010.create;
  Reg1010._id        := TJSSpedContribuicoesModelRegistroA010(AReg)._id;
  Reg1010.numProc    := RegA111.numProc;
  Reg1010.idSecJud   := RegA111.GetValueStr('IDSECJUD');
  Reg1010.idVara     := RegA111.GetValueStr('IDVARA');
  Reg1010.indNatAcao := RegA111.GetValueStr('INDNATACAO');
  Reg1010.descDecJud := RegA111.GetValueStr('DESCDECJUD');
  Reg1010.dtSentJud  := StrToDate(RegA111.GetValueStr('DTSENTJUD'));

  if not Assigned(_1010) then
    _1010 := TObjectList<TJSSpedContribuicoesModelRegistro1010>.Create;

  if not _1010.BinarySearch(Reg1010, I, FComparer1010) then
    _1010.Insert(I, Reg1010)
  else
    FreeAndNil(Reg1010);
end;

procedure TJSSpedContribuicoesServiceBloco1.AddProcJudicialC111(AReg, AModel: TJSSpedContribuicoesModelRegistro);
var
  RegC111 : TJSSpedContribuicoesModelRegistroC111;
  Reg1010 : TJSSpedContribuicoesModelRegistro1010;
  I       : Integer;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC111>(AModel) then
    Exit;

  RegC111 := TJSSpedContribuicoesModelRegistroC111(AModel);
  if (RegC111.numProc.IsEmpty) or
     (RegC111.GetValueStr('IDSECJUD').IsEmpty) or
     (RegC111.GetValueStr('IDVARA').IsEmpty) or
     (RegC111.GetValueStr('INDNATACAO').IsEmpty) then
    Exit;

  Reg1010 := TJSSpedContribuicoesModelRegistro1010.create;
  Reg1010._id        := TJSSpedContribuicoesModelRegistroC010(AReg)._id;
  Reg1010.numProc    := RegC111.numProc;
  Reg1010.idSecJud   := RegC111.GetValueStr('IDSECJUD');
  Reg1010.idVara     := RegC111.GetValueStr('IDVARA');
  Reg1010.indNatAcao := RegC111.GetValueStr('INDNATACAO');
  Reg1010.descDecJud := RegC111.GetValueStr('DESCDECJUD');
  Reg1010.dtSentJud  := StrToDate(RegC111.GetValueStr('DTSENTJUD'));

  if not Assigned(_1010) then
    _1010 := TObjectList<TJSSpedContribuicoesModelRegistro1010>.Create;

  if not _1010.BinarySearch(Reg1010, I, FComparer1010) then
    _1010.Insert(I, Reg1010)
  else
    FreeAndNil(Reg1010);
end;

procedure TJSSpedContribuicoesServiceBloco1.AdicionaLinhaSped(
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

constructor TJSSpedContribuicoesServiceBloco1.create(
  Parent: IJSSpedContribuicoesService);
begin
  FSpedContribuicoesService := Parent;
  FArquivo     := TStringList.Create;
  FStatus      := TJSSpedContribuicoesServiceStatus.New(Self.FSpedContribuicoesService).Bloco('1');
  FacadeExport := JSSpedContribuicoes.Export.Interfaces
                    .FacadeExport(FSpedContribuicoesService.Emitente, FSpedContribuicoesService.Config);

  FComparer1010 := TJSSpedContribuicoesModelRegistro1010.getComparer;
  FComparer1020 := TJSSpedContribuicoesModelRegistro1020.getComparer;
end;

destructor TJSSpedContribuicoesServiceBloco1.Destroy;
begin
  if Assigned(_1010) then
    _1010.Free;

  if Assigned(_1020) then
    _1020.Free;

  if Assigned(FArquivo) then
    FArquivo.Free;

  inherited;
end;

function TJSSpedContribuicoesServiceBloco1.&End: IJSSpedContribuicoesService;
begin
  result := FSpedContribuicoesService;
end;

function TJSSpedContribuicoesServiceBloco1.Execute: TStrings;
var
  reg1001 : TJSSpedContribuicoesModelRegistro1001;
  reg1990 : TJSSpedContribuicoesModelRegistro1990;
begin
  try
    reg1001 := nil;
    reg1990 := nil;
    try
      gerar1010;
      gerar1020;
      gerar1100;

      if Gerar1300_1700RegApu then
        gerar1300RegApu
      else
        gerar1300;

      gerar1500;

      if Gerar1300_1700RegApu then
        gerar1700RegApu
      else
        gerar1700;

      gerar1900;

      reg1001 := TJSSpedContribuicoesModelRegistro1001.create;
      if FArquivo.Count > 0 then
        reg1001.indMov := imComDadosInformados;
      AdicionaLinhaSped(reg1001,0);

      reg1990 := TJSSpedContribuicoesModelRegistro1990.create;
      reg1990.qtdLin1 := reg1990.qtdlin1 + FArquivo.Count;
      AdicionaLinhaSped(reg1990);

      result := FArquivo;
    finally
      reg1001.Free;
      reg1990.Free;
    end;
  except
    on e: Exception Do
    begin
      FArquivo.Free;
      OnLogErro('Houve erro na geração do blooo 1: ' + e.Message);
      Raise;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1010;
var
  i       : Integer;
  reg1010 : TJSSpedContribuicoesModelRegistro1010;
begin
  if not Assigned(_1010) then
    Exit;

  for i := 0 to Pred(_1010.Count) do
  begin
    reg1010 := _1010[i];
    AdicionaLinhaSped(reg1010);

    if (FSpedContribuicoesService.Config.DataInicial >= EncodeDate(2020,1,1)) then
      gerar1011(reg1010);
  end;
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1011(
  AReg1010: TJSSpedContribuicoesModelRegistro1010);
var
  i       : Integer;
  reg1011 : TJSSpedContribuicoesModelRegistro1011;
  _1011   : TObjectList<TJSSpedContribuicoesModelRegistro1011>;
begin
  _1011 := FSpedContribuicoesService.DAO.Bloco1.DAO1011.list(AReg1010, FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);
  try

    for i := 0 to Pred(_1011.Count) do
    begin
      reg1011 := _1011[i];
      reg1011.dtOper := FSpedContribuicoesService.Config.DataFinal;
      AdicionaLinhaSped(reg1011);

      FBloco0.AddCodPart(AReg1010._id, reg1011.codPart);
      FBloco0.AddCodItem(AReg1010._id, reg1011.codItem);
      FBloco0.AddCodConta(reg1011.codCta);
    end
  finally
    _1011.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1020;
var
  i       : Integer;
  reg1020 : TJSSpedContribuicoesModelRegistro1020;
begin
  if not Assigned(_1020) then
    Exit;

  for i := 0 to Pred(_1020.Count) do
  begin
    reg1020 := _1020[i];
    AdicionaLinhaSped(reg1020);
  end;
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1100;
var
  i       : Integer;
  reg1100 : TJSSpedContribuicoesModelRegistro1100;
  _1100   : TObjectList<TJSSpedContribuicoesModelRegistro1100>;
  _1101   : TObjectList<TJSSpedContribuicoesModelRegistro1101>;
begin
  FStatus
    .Registro('1100')
    .Aguarde(True)
    .ShowStatus;

  _1100 := FSpedContribuicoesService.DAO.Bloco1.DAO1100.list(FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .TotalRegistros(_1100.Count);

  try
    for i := 0 to Pred(_1100.Count) do
    begin
      FStatus.RegistroAtual(i + 1)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      reg1100 := _1100[i];
      _1101   := FSpedContribuicoesService.DAO.Bloco1.DAO1101.list(reg1100,FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

      try
        reg1100.vlTotCredApu  := reg1100.vlCredApu +
                                 reg1100.vlCredExtApu;

        reg1100.sdCredDispEfd := reg1100.vlTotCredApu -
                                 reg1100.vlCredDescPaAnt -
                                 reg1100.vlCredPerPaAnt -
                                 reg1100.vlCredDcompPaAnt;

        reg1100.sldCredFim    := reg1100.sdCredDispEfd -
                                 reg1100.vlCredDescEfd -
                                 reg1100.vlCredPerEfd  -
                                 reg1100.vlCredDcompEfd -
                                 reg1100.vlCredTrans -
                                 reg1100.vlCredOut;

        AdicionaLinhaSped(reg1100);
        FBlocoM.ConsolidaContribPis(reg1100);
        gerar1101(_1101);
      finally
        _1101.Free;
      end;
    end
  finally
    _1100.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1101(
  A1101List: TObjectList<TJSSpedContribuicoesModelRegistro1101>);
var
  i       : Integer;
  reg1101 : TJSSpedContribuicoesModelRegistro1101;
begin
  for i := 0 to Pred(A1101List.Count) do
  begin
    reg1101 := A1101List[i];
    AdicionaLinhaSped(reg1101);

    FBloco0.AddCodPart(FSpedContribuicoesService.Emitente.Codigo, reg1101.codPart);
    FBloco0.AddCodItem(FSpedContribuicoesService.Emitente.Codigo, reg1101.codItem);
    FBloco0.AddCodConta(reg1101.codCta);
  end
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1300;
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAO1300;
  reg1300 : TJSSpedContribuicoesModelRegistro1300;
  _1300   : TObjectList<TJSSpedContribuicoesModelRegistro1300>;
begin
  FStatus
    .Registro('1300')
    .Aguarde(True)
    .ShowStatus;

  dao   := FSpedContribuicoesService.DAO.Bloco1.DAO1300;
  _1300 := dao.list(FSpedContribuicoesService.Config.DataInicial);

  FStatus
    .Aguarde(False)
    .TotalRegistros(_1300.Count);

  try
    for i := 0 to Pred(_1300.Count) do
    begin
      reg1300 := _1300[i];
      AdicionaLinhaSped(reg1300);
    end
  finally
    _1300.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1300RegApu;
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAO1300;
  reg1300 : TJSSpedContribuicoesModelRegistro1300;
  _1300   : TObjectList<TJSSpedContribuicoesModelRegistro1300>;
begin
  FStatus
    .Registro('1300')
    .Aguarde(True)
    .ShowStatus;

  dao   := FSpedContribuicoesService.DAO.Bloco1.DAO1300;
  _1300 := dao.listRegApu(FSpedContribuicoesService.Config.DataInicial);

  FStatus
    .Aguarde(False)
    .TotalRegistros(_1300.Count);

  try
    for i := 0 to Pred(_1300.Count) do
    begin
      reg1300 := _1300[i];
      reg1300.indNatRet := GetNaturezaRetencao(reg1300.indNatRet,reg1300.GetValueStr('REGAPU'));
      AdicionaLinhaSped(reg1300);
      FBlocoM.ConsolidaRetencaoPis(reg1300);
    end
  finally
    _1300.Free;
  end;
end;

function TJSSpedContribuicoesServiceBloco1.Gerar1300_1700RegApu: Boolean;
begin
  Result := (FSpedContribuicoesService.Config.TipoEnquadramento = teReal) and
            (YearOf(FSpedContribuicoesService.Config.DataInicial) >= 2014);
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1500;
var
  i       : Integer;
  reg1500 : TJSSpedContribuicoesModelRegistro1500;
  _1500   : TObjectList<TJSSpedContribuicoesModelRegistro1500>;
  _1501   : TObjectList<TJSSpedContribuicoesModelRegistro1501>;
begin
  FStatus
    .Registro('1500')
    .Aguarde(True)
    .ShowStatus;

  _1500 := FSpedContribuicoesService.DAO.Bloco1.DAO1500.list(FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

  FStatus
    .Aguarde(False)
    .TotalRegistros(_1500.Count);

  try
    for i := 0 to Pred(_1500.Count) do
    begin
      FStatus.RegistroAtual(i + 1)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      reg1500 := _1500[i];
      _1501   := FSpedContribuicoesService.DAO.Bloco1.DAO1501.list(reg1500,FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

      try
        reg1500.vlTotCredApu  := reg1500.vlCredApu +
                                 reg1500.vlCredExtApu;

        reg1500.sdCredDispEfd := reg1500.vlTotCredApu -
                                 reg1500.vlCredDescPaAnt -
                                 reg1500.vlCredPerPaAnt -
                                 reg1500.vlCredDcompPaAnt;

        reg1500.sldCredFim    := reg1500.sdCredDispEfd -
                                 reg1500.vlCredDescEfd -
                                 reg1500.vlCredPerEfd  -
                                 reg1500.vlCredDcompEfd -
                                 reg1500.vlCredTrans -
                                 reg1500.vlCredOut;

        AdicionaLinhaSped(reg1500);
        FBlocoM.ConsolidaContribCofins(reg1500);
        gerar1501(_1501);
      finally
        _1501.Free;
      end;
    end;
  finally
    _1500.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1501(
  A1501List: TObjectList<TJSSpedContribuicoesModelRegistro1501>);
var
  i       : Integer;
  reg1501 : TJSSpedContribuicoesModelRegistro1501;
begin
  for i := 0 to Pred(A1501List.Count) do
  begin
    reg1501 := A1501List[i];
    AdicionaLinhaSped(reg1501);
    FBloco0.AddCodPart(FSpedContribuicoesService.Emitente.Codigo, reg1501.codPart);
    FBloco0.AddCodItem(FSpedContribuicoesService.Emitente.Codigo, reg1501.codItem);
    FBloco0.AddCodConta(reg1501.codCta);
  end
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1700;
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAO1700;
  reg1700 : TJSSpedContribuicoesModelRegistro1700;
  _1700   : TObjectList<TJSSpedContribuicoesModelRegistro1700>;
begin
  FStatus
    .Registro('1700')
    .Aguarde(True)
    .ShowStatus;

  dao   := FSpedContribuicoesService.DAO.Bloco1.DAO1700;
  _1700 := dao.list(FSpedContribuicoesService.Config.DataInicial);

  FStatus
    .Aguarde(False)
    .TotalRegistros(_1700.Count);

  try
    for i := 0 to Pred(_1700.Count) do
    begin
      reg1700 := _1700[i];
      AdicionaLinhaSped(reg1700);
    end
  finally
    _1700.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1700RegApu;
var
  i       : Integer;
  dao     : IJSSpedContribuicoesDAO1700;
  reg1700 : TJSSpedContribuicoesModelRegistro1700;
  _1700   : TObjectList<TJSSpedContribuicoesModelRegistro1700>;
begin
  FStatus
    .Registro('1700')
    .Aguarde(True)
    .ShowStatus;

  dao   := FSpedContribuicoesService.DAO.Bloco1.DAO1700;
  _1700 := dao.listRegApu(FSpedContribuicoesService.Config.DataInicial);

  FStatus
    .Aguarde(False)
    .TotalRegistros(_1700.Count);

  try
    for i := 0 to Pred(_1700.Count) do
    begin
      reg1700 := _1700[i];
      reg1700.indNatRet := GetNaturezaRetencao(reg1700.indNatRet,reg1700.GetValueStr('REGAPU'));
      AdicionaLinhaSped(reg1700);
      FBlocoM.ConsolidaRetencaoCofins(reg1700);
    end;
  finally
    _1700.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco1.gerar1900;
var
  FGera1900: Boolean;
  i       : Integer;
  dao     : IJSSpedContribuicoesDAO1900;
  reg1900 : TJSSpedContribuicoesModelRegistro1900;
  _1900   : TObjectList<TJSSpedContribuicoesModelRegistro1900>;
begin
  FGera1900 := (not FSpedContribuicoesService.Config.EmpresaInativa) and
               (FSpedContribuicoesService.Config.CriterioEscrituracao in [iceRegimeCompetenciaConsolidada, iceRegimeCaixa]) and
               (FSpedContribuicoesService.Config.TipoEnquadramento = tePresumido);

  if not FGera1900 then
    Exit;

  _1900 := TObjectList<TJSSpedContribuicoesModelRegistro1900>.create;
  try
    dao   := FSpedContribuicoesService.DAO.Bloco1.DAO1900;
    _1900 := dao.list(FSpedContribuicoesService.Config.DataInicial, FSpedContribuicoesService.Config.DataFinal);

    if _1900.Count = 0 then
    begin
      reg1900          := TJSSpedContribuicoesModelRegistro1900.create;
      reg1900.cnpj     := FSpedContribuicoesService.Emitente.CNPJ;
      reg1900.codMod   := '01';
      reg1900.vlTotRec := 0;
      reg1900.quantDoc := 0;

      //A empresa não auferindo receita nova no mês a que se refere a escrituração,
      //deve gerar o registro 1900 (especificado por documento fiscal usualmente
      //utilizado para o registro das receitas, no Campo 03) informando no campo 07
      //o valor R$ 0,00 e no campo 08 a quantidade 0 (zero).
      //Por isso a partir de 01/10/2005, que foi quando surgiu a NFe, mudei o codMod pra 55.
      if FSpedContribuicoesService.Config.DataInicial >= EncodeDate(2005,10,1) then
        reg1900.codMod := '55';

      AdicionaLinhaSped(reg1900);
    end;

    for i := 0 to Pred(_1900.Count) do
    begin
      reg1900 := _1900[i];
      AdicionaLinhaSped(reg1900);
      FBloco0.AddCodConta(reg1900.codCta);
    end;

  finally
    _1900.Free;
  end;


end;

function TJSSpedContribuicoesServiceBloco1.GetNaturezaRetencao(IndNatRet: String; RegApu: String): string;
const aNatRetOld : array of string = ['01','02','03','04','05','99'];
      aNatRetNew : array of string = ['51','52','53','54','55','59'];
var i: Integer;
begin
  Result := IndNatRet;
  if (RegApu = 'C') then
  begin
    for i := Low(aNatRetOld) to High(aNatRetOld) do
      if AnsiSameText(IndNatRet, aNatRetOld[i]) then
        Result := aNatRetNew[i];
  end;
end;

class function TJSSpedContribuicoesServiceBloco1.New(
  Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBloco1;
begin
  result := Self.create(Parent);
end;

procedure TJSSpedContribuicoesServiceBloco1.OnAddRegistro(
  Registro: TJSSpedContribuicoesModelRegistro);
begin

end;

procedure TJSSpedContribuicoesServiceBloco1.OnLogErro(ALogErro: String);
var
  onLogErro: TOnSpedContribuicoesLogErro;
begin
  onLogErro := FSpedContribuicoesService.Config.OnLogErro;

  if Assigned(onLogErro) then
    OnLogErro(ALogErro);
end;

function TJSSpedContribuicoesServiceBloco1.ServiceBloco0(
  Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBloco1;
begin
  result  := Self;
  FBloco0 := Value;
end;

function TJSSpedContribuicoesServiceBloco1.ServiceBlocoM(
  Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBloco1;
begin
  result  := Self;
  FBlocoM := Value;
end;

function TJSSpedContribuicoesServiceBloco1.validateInstance<T>(
  AModel: TJSSpedContribuicoesModelRegistro): Boolean;
var
  model: T;
begin
  model := T.create;
  try
    Result := (AModel is T);
  finally
    model.free;
  end;
end;

end.
