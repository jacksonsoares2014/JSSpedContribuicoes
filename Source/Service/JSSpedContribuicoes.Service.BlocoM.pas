(*
 FALTA FERIFICAR OS TÓPICOS ABAIXO NA GERAÇÃO DO M210 e M610
 1 VL_ITEM dos registros A170, cujo valor do campo IND_OPER do registro A100 seja igual a “1”.
 2 VL_ITEM dos registros C170, cujo valor do campo COD_MOD seja diferente de 55 (NFe)
   ou quando o valor do campo COD_MOD seja igual a 55 e o valor do campo IND_ESCRI do registro C010 seja igual a 2.
   Em ambos casos o valor do campo IND_OPER do registro C100 deve ser igual a “1”.
 3 VL_ITEM dos registros C181 e C491, quando o valor do campo IND_ESCRI do registro C010 seja igual a 1.
 4 VL_ITEM dos registros C481, quando o valor do campo do campo IND_ESCRI do registro C010 seja igual a 2.
 5 VL_ITEM dos registros C381, C601, C870, C880, D201, D601.
 6 VL_DOC dos registros D300.
 7 VL_BRT do registro D350.
 8 VL_OPER do registro C175 e do registro F100, cujo valor do campo IND_OPER seja igual a “1” ou “2”.
 9 VL_TOT_REC do registro F200.
10 VL_REC_CAIXA do registro F500 e F510.
11 VL_REC_COMP do registro F550 e F560.
12 VL_REC do registro I100.
*)

unit JSSpedContribuicoes.Service.BlocoM;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Service.Counter,
  JSSpedContribuicoes.Service.Status,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.DAO.Interfaces,
  JSSpedContribuicoes.Export.Interfaces,
  System.Threading,
  System.Generics.Collections,
  System.Generics.Defaults,
  System.SysUtils,
  System.Classes;

type
  TJSSpedContribuicoesServiceBlocoM = class(TInterfacedObject, IJSSpedContribuicoesServiceBlocoM)
  private
    [Weak]
    FSpedContribuicoesService: IJSSpedContribuicoesService;

    [Weak]
    FBloco0: IJSSpedContribuicoesServiceBloco0;

    FStatus     : IJSSpedContribuicoesServiceStatus;
    FacadeExport: IJSSpedContribuicoesExportFacade;
    FArquivo    : TStrings;

    lstReceitaTributadaMI    : TList<string>;
    lstReceitaNaoTributadaMI : TList<string>;
    lstReceitaExportacao     : TList<string>;

    lstCst_53_63             : TList<string>;
    lstCst_54_64             : TList<string>;
    lstCst_56_66             : TList<string>;
    lstCst_55_65             : TList<string>;

    lstCST_PISCOFINS_NTRIB   : TList<string>;

    FComparerM100 : IComparer<TJSSpedContribuicoesModelRegistroM100>;
    FComparerM500 : IComparer<TJSSpedContribuicoesModelRegistroM500>;

    FComparerM105 : IComparer<TJSSpedContribuicoesModelRegistroM105>;
    FComparerM505 : IComparer<TJSSpedContribuicoesModelRegistroM505>;

    FComparerM210 : IComparer<TJSSpedContribuicoesModelRegistroM210>;
    FComparerM410 : IComparer<TJSSpedContribuicoesModelRegistroM410>;
    FComparerM610 : IComparer<TJSSpedContribuicoesModelRegistroM610>;
    FComparerM810 : IComparer<TJSSpedContribuicoesModelRegistroM810>;

    m105    : TObjectList<TJSSpedContribuicoesModelRegistroM105>;
    m505    : TObjectList<TJSSpedContribuicoesModelRegistroM505>;

    regM200 : TJSSpedContribuicoesModelRegistroM200;
    m210    : TObjectList<TJSSpedContribuicoesModelRegistroM210>;
    m410    : TObjectList<TJSSpedContribuicoesModelRegistroM410>;

    regM600    : TJSSpedContribuicoesModelRegistroM600;
    m610    : TObjectList<TJSSpedContribuicoesModelRegistroM610>;
    m810    : TObjectList<TJSSpedContribuicoesModelRegistroM810>;

    procedure OnAddRegistro(Registro: TJSSpedContribuicoesModelRegistro);
    procedure OnLogErro(ALogErro: String);
    procedure CarregaListas;
    function CoefProp(ACodCred: String; ACst: String): Double;

    function IsReceitaTribCst_53_63   (AModel: TJSSpedContribuicoesModelRegistro): boolean;
    function IsReceitaNaoTribCst_53_63(AModel: TJSSpedContribuicoesModelRegistro): boolean;
    function IsReceitaTribCst_54_64   (AModel: TJSSpedContribuicoesModelRegistro): boolean;
    function IsReceitaExpCst_54_64    (AModel: TJSSpedContribuicoesModelRegistro): boolean;
    function IsReceitaNaoTribCst_55_65(AModel: TJSSpedContribuicoesModelRegistro): boolean;
    function IsReceitaExpCst_55_65    (AModel: TJSSpedContribuicoesModelRegistro): boolean;
    function IsReceitaTribCst_56_66   (AModel: TJSSpedContribuicoesModelRegistro): boolean;
    function IsReceitaNaoTribCst_56_66(AModel: TJSSpedContribuicoesModelRegistro): boolean;
    function IsReceitaExpCst_56_66    (AModel: TJSSpedContribuicoesModelRegistro): boolean;

    //M100
    procedure ConsolidaCredPisM105(AM100List: TObjectList<TJSSpedContribuicoesModelRegistroM100>);
    procedure ConsolidaCredPisM110(AM100List: TObjectList<TJSSpedContribuicoesModelRegistroM100>; AM110List: TObjectList<TJSSpedContribuicoesModelRegistroM110>);

    //M105
    procedure DetalhaCredBasePisA170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBasePisC170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBasePisC501(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBasePisD101(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBasePisD501(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBasePisF100(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBasePisF120(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBasePisF130(AModel: TJSSpedContribuicoesModelRegistro);

    function ClonaM105(AReg: TJSSpedContribuicoesModelRegistroM105): TJSSpedContribuicoesModelRegistroM105;
    procedure IncluiCredPisOutrasReceitas;
    procedure IncluiCredPisOutrasReceitasGrupo_100_200;
    procedure IncluiCredPisOutrasReceitasGrupo_100_300;
    procedure IncluiCredPisOutrasReceitasGrupo_200_300;
    procedure IncluiCredPisOutrasReceitasGrupo_100_200_300;
    procedure CalcCredPisMaisDeUmaReceita;

    //M500
    procedure ConsolidaCredCofinsM505(AM500List: TObjectList<TJSSpedContribuicoesModelRegistroM500>);
    procedure ConsolidaCredCofinsM510(AM500List: TObjectList<TJSSpedContribuicoesModelRegistroM500>; AM510List: TObjectList<TJSSpedContribuicoesModelRegistroM510>);

    //M505
    procedure DetalhaCredBaseCofinsA170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBaseCofinsC170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBaseCofinsC505(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBaseCofinsD105(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBaseCofinsD505(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBaseCofinsF100(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBaseCofinsF120(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaCredBaseCofinsF130(AModel: TJSSpedContribuicoesModelRegistro);

    function ClonaM505(AReg: TJSSpedContribuicoesModelRegistroM505): TJSSpedContribuicoesModelRegistroM505;
    procedure IncluiCredCofinsOutrasReceitas;
    procedure IncluiCredCofinsOutrasReceitasGrupo_100_200;
    procedure IncluiCredCofinsOutrasReceitasGrupo_100_300;
    procedure IncluiCredCofinsOutrasReceitasGrupo_200_300;
    procedure IncluiCredCofinsOutrasReceitasGrupo_100_200_300;
    procedure CalcCredCofinsMaisDeUmaReceita;

    //M200
    procedure ConsolidaContribPisM100(ARegM100: TJSSpedContribuicoesModelRegistroM100);
    procedure ConsolidaContribPis1100(AReg1100: TJSSpedContribuicoesModelRegistro1100);
    procedure ConsolidaContribPisM210;
    procedure ConsolidaContribPisM220(AM220List: TObjectList<TJSSpedContribuicoesModelRegistroM220>);

    //M210 e M410
    procedure DetalhaContribPisNaoTributada(ARegM410: TJSSpedContribuicoesModelRegistroM410);
    procedure DetalhaContribPisTributada(ARegM210: TJSSpedContribuicoesModelRegistroM210);
    procedure DetalhaContribPisA170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisC170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisC175(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisC181(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisC381(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisC481(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisC491(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisC810(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisC870(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisD201(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisF100(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisF200(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisF500(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribPisF550(AModel: TJSSpedContribuicoesModelRegistro);

    //M400
    procedure ConsolidaContribPisM410(AM400List: TObjectList<TJSSpedContribuicoesModelRegistroM400>);

    //M600
    procedure ConsolidaContribCofinsM500(ARegM500: TJSSpedContribuicoesModelRegistroM500);
    procedure ConsolidaContribCofins1500(AReg1500: TJSSpedContribuicoesModelRegistro1500);
    procedure ConsolidaContribCofinsM610;
    procedure ConsolidaContribCofinsM620(AM620List: TObjectList<TJSSpedContribuicoesModelRegistroM620>);

    //M610 e M810
    procedure DetalhaContribCofinsNaoTributada(ARegM810: TJSSpedContribuicoesModelRegistroM810);
    procedure DetalhaContribCofinsTributada(ARegM610: TJSSpedContribuicoesModelRegistroM610);
    procedure DetalhaContribCofinsA170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsC170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsC175(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsC185(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsC385(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsC485(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsC495(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsC810(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsC870(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsD205(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsF100(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsF200(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsF500(AModel: TJSSpedContribuicoesModelRegistro);
    procedure DetalhaContribCofinsF550(AModel: TJSSpedContribuicoesModelRegistro);

    //M800
    procedure ConsolidaContribPisM810(AM800List: TObjectList<TJSSpedContribuicoesModelRegistroM800>);

    procedure AdicionaLinhaSped(ARegistro: TJSSpedContribuicoesModelRegistro; AArquivo: TStrings); overload;
    procedure AdicionaLinhaSped(ARegistro: TJSSpedContribuicoesModelRegistro; AIndex: Integer = -1); overload;

    function validateInstance<T: TJSSpedContribuicoesModelRegistro, constructor>(AModel: TJSSpedContribuicoesModelRegistro): Boolean;

    procedure gerarM100;
    procedure gerarM105(ARegM100: TJSSpedContribuicoesModelRegistroM100);
    procedure gerarM110(ARegM100: TJSSpedContribuicoesModelRegistroM100; AM110List: TObjectList<TJSSpedContribuicoesModelRegistroM110>);
    procedure gerarM115(ARegM110: TJSSpedContribuicoesModelRegistroM110);

    procedure gerarM200;
    procedure gerarM205;
    procedure gerarM210(AM220List: TObjectList<TJSSpedContribuicoesModelRegistroM220>);
    procedure gerarM220(ARegM210: TJSSpedContribuicoesModelRegistroM210; AM220List: TObjectList<TJSSpedContribuicoesModelRegistroM220>);
    procedure gerarM225(ARegM220: TJSSpedContribuicoesModelRegistroM220);

    procedure gerarM350;

    procedure gerarM400;
    procedure gerarM410(ARegM400: TJSSpedContribuicoesModelRegistroM400);

    procedure gerarM500;
    procedure gerarM505(ARegM500: TJSSpedContribuicoesModelRegistroM500);
    procedure gerarM510(ARegM500: TJSSpedContribuicoesModelRegistroM500; AM510List: TObjectList<TJSSpedContribuicoesModelRegistroM510>);
    procedure gerarM515(ARegM510: TJSSpedContribuicoesModelRegistroM510);

    procedure gerarM600;
    procedure gerarM605;
    procedure gerarM610(AM620List: TObjectList<TJSSpedContribuicoesModelRegistroM620>);
    procedure gerarM620(ARegM610: TJSSpedContribuicoesModelRegistroM610; AM620List: TObjectList<TJSSpedContribuicoesModelRegistroM620>);
    procedure gerarM625(ARegM620: TJSSpedContribuicoesModelRegistroM620);

    procedure gerarM800;
    procedure gerarM810(ARegM800: TJSSpedContribuicoesModelRegistroM800);
  protected
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoM;

    function DetalhaCredBasePis(AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBlocoM;
    function DetalhaCredBaseCofins(AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBlocoM;

    function DetalhaContribPis(AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBlocoM;
    function DetalhaContribCofins(AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBlocoM;

    function ConsolidaContribPis(AReg1100: TJSSpedContribuicoesModelRegistro1100): IJSSpedContribuicoesServiceBlocoM;
    function ConsolidaContribCofins(AReg1500: TJSSpedContribuicoesModelRegistro1500): IJSSpedContribuicoesServiceBlocoM;

    function ConsolidaRetencaoPis(AReg1300: TJSSpedContribuicoesModelRegistro1300): IJSSpedContribuicoesServiceBlocoM;
    function ConsolidaRetencaoCofins(AReg1700: TJSSpedContribuicoesModelRegistro1700): IJSSpedContribuicoesServiceBlocoM;

    function &End: IJSSpedContribuicoesService;

  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoM;
    destructor Destroy; override;
  end;

implementation

uses
  System.Helper.Double;

{ TJSSpedContribuicoesServiceBlocoM }

procedure TJSSpedContribuicoesServiceBlocoM.AdicionaLinhaSped(ARegistro: TJSSpedContribuicoesModelRegistro; AArquivo: TStrings);
var
  linhaSped: string;
begin
  linhaSped := FacadeExport.linhaSped(ARegistro);
  AArquivo.Add(linhaSped);
  Counter.AddCounter(ARegistro);
  OnAddRegistro(ARegistro);
end;

procedure TJSSpedContribuicoesServiceBlocoM.AdicionaLinhaSped(
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

function TJSSpedContribuicoesServiceBlocoM.ConsolidaContribPis(
  AReg1100: TJSSpedContribuicoesModelRegistro1100): IJSSpedContribuicoesServiceBlocoM;
begin
  result  := Self;
  ConsolidaContribPis1100(AReg1100);
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribPis1100(
  AReg1100: TJSSpedContribuicoesModelRegistro1100);
begin
  regM200.vlTotCredDescAnt := regM200.vlTotCredDescAnt + AReg1100.vlCredDescEfd;
end;

function TJSSpedContribuicoesServiceBlocoM.ConsolidaContribCofins(
  AReg1500: TJSSpedContribuicoesModelRegistro1500): IJSSpedContribuicoesServiceBlocoM;
begin
  result  := Self;
  ConsolidaContribCofins1500(AReg1500);
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribCofins1500(
  AReg1500: TJSSpedContribuicoesModelRegistro1500);
begin
  regM600.vlTotCredDescAnt := regM600.vlTotCredDescAnt + AReg1500.vlCredDescEfd;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribPisM100(
  ARegM100: TJSSpedContribuicoesModelRegistroM100);
begin
  regM200.vlTotCredDesc := regM200.vlTotCredDesc + ARegM100.vlCredDesc;
end;

procedure TJSSpedContribuicoesServiceBlocoM.CalcCredCofinsMaisDeUmaReceita;
var i: Integer;
    Valor: Double;
begin
  if not Assigned(m505) then
    Exit;

  for I := 0 to Pred(m505.Count) do
  begin
    Valor := m505[i].vlBcCofins * CoefProp(m505[i].GetValueStr('CODCRED'), m505[i].cstCofins);
    m505[i].vlBcCofins := Valor.roundABNT;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.CalcCredPisMaisDeUmaReceita;
var i: Integer;
    Valor: Double;
begin
  if not Assigned(m105) then
    Exit;

  for I := 0 to Pred(m105.Count) do
  begin
    Valor := m105[i].vlBcPis * CoefProp(m105[i].GetValueStr('CODCRED'), m105[i].cstPis);
    m105[i].vlBcPis := Valor.roundABNT;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.CarregaListas;
begin
  if not Assigned(lstReceitaTributadaMI) then
    lstReceitaTributadaMI := TList<string>.Create;

  lstReceitaTributadaMI.Add('101');
  lstReceitaTributadaMI.Add('102');
  lstReceitaTributadaMI.Add('103');
  lstReceitaTributadaMI.Add('104');
  lstReceitaTributadaMI.Add('105');
  lstReceitaTributadaMI.Add('106');
  lstReceitaTributadaMI.Add('107');
  lstReceitaTributadaMI.Add('108');
  lstReceitaTributadaMI.Add('199');

  if not Assigned(lstReceitaNaoTributadaMI) then
    lstReceitaNaoTributadaMI := TList<string>.Create;

  lstReceitaNaoTributadaMI.Add('201');
  lstReceitaNaoTributadaMI.Add('202');
  lstReceitaNaoTributadaMI.Add('203');
  lstReceitaNaoTributadaMI.Add('204');
  lstReceitaNaoTributadaMI.Add('205');
  lstReceitaNaoTributadaMI.Add('206');
  lstReceitaNaoTributadaMI.Add('207');
  lstReceitaNaoTributadaMI.Add('208');
  lstReceitaNaoTributadaMI.Add('299');

  if not Assigned(lstReceitaExportacao) then
    lstReceitaExportacao := TList<string>.Create;

  lstReceitaExportacao.Add('301');
  lstReceitaExportacao.Add('302');
  lstReceitaExportacao.Add('303');
  lstReceitaExportacao.Add('304');
  lstReceitaExportacao.Add('305');
  lstReceitaExportacao.Add('306');
  lstReceitaExportacao.Add('307');
  lstReceitaExportacao.Add('308');
  lstReceitaExportacao.Add('399');

  if not Assigned(lstCST_PISCOFINS_NTRIB) then
    lstCST_PISCOFINS_NTRIB := TList<string>.Create;

  lstCST_PISCOFINS_NTRIB.Add('04');
  lstCST_PISCOFINS_NTRIB.Add('05');
  lstCST_PISCOFINS_NTRIB.Add('06');
  lstCST_PISCOFINS_NTRIB.Add('07');
  lstCST_PISCOFINS_NTRIB.Add('08');
  lstCST_PISCOFINS_NTRIB.Add('09');

  if not Assigned(lstCst_53_63) then
    lstCst_53_63 := TList<string>.Create;

  lstCst_53_63.Add('53');
  lstCst_53_63.Add('63');

  if not Assigned(lstCst_54_64) then
    lstCst_54_64 := TList<string>.Create;

  lstCst_54_64.Add('54');
  lstCst_54_64.Add('64');

  if not Assigned(lstCst_55_65) then
    lstCst_55_65 := TList<string>.Create;

  lstCst_55_65.Add('55');
  lstCst_55_65.Add('65');

  if not Assigned(lstCst_56_66) then
    lstCst_56_66 := TList<string>.Create;

  lstCst_56_66.Add('56');
  lstCst_56_66.Add('66');
end;

function TJSSpedContribuicoesServiceBlocoM.ClonaM105(
  AReg: TJSSpedContribuicoesModelRegistroM105): TJSSpedContribuicoesModelRegistroM105;
begin
  Result := TJSSpedContribuicoesModelRegistroM105.create;
  Result.AddOrSetValue('CODCRED',AReg.GetValueStr('CODCRED'));
  Result.AddOrSetValue('ALIQPIS',AReg.GetValueDouble('ALIQPIS'));
  Result.natBcCred     := AReg.natBcCred;
  Result.cstPis        := AReg.cstPis;
  Result.vlBcPisTot    := AReg.vlBcPisTot;
  Result.vlBcPisCum    := AReg.vlBcPisCum;
  Result.vlBcPisNC     := AReg.vlBcPisNC;
  Result.vlBcPis       := AReg.vlBcPis;
  Result.quantBcPisTot := AReg.quantBcPisTot;
  Result.quantBcPis    := AReg.quantBcPis;
  Result.descCred      := AReg.descCred;
end;

function TJSSpedContribuicoesServiceBlocoM.ClonaM505(
  AReg: TJSSpedContribuicoesModelRegistroM505): TJSSpedContribuicoesModelRegistroM505;
begin
  Result := TJSSpedContribuicoesModelRegistroM505.create;
  Result.AddOrSetValue('CODCRED',AReg.GetValueStr('CODCRED'));
  Result.AddOrSetValue('ALIQCOFINS',AReg.GetValueDouble('ALIQCOFINS'));
  Result.natBcCred        := AReg.natBcCred;
  Result.cstCofins        := AReg.cstCofins;
  Result.vlBcCofinsTot    := AReg.vlBcCofinsTot;
  Result.vlBcCofinsCum    := AReg.vlBcCofinsCum;
  Result.vlBcCofinsNC     := AReg.vlBcCofinsNC;
  Result.vlBcCofins       := AReg.vlBcCofins;
  Result.quantBcCofinsTot := AReg.quantBcCofinsTot;
  Result.quantBcCofins    := AReg.quantBcCofins;
  Result.descCred         := AReg.descCred;
end;

function TJSSpedContribuicoesServiceBlocoM.CoefProp(ACodCred, ACst: String): Double;
begin
  Result := 1;

  //Grupo 100
  if lstReceitaTributadaMI.Contains(ACodCred) and lstCst_53_63.Contains(ACst) then
    Result := FBloco0.ReceitaBruta.recBruNcumTribMi / (FBloco0.ReceitaBruta.recBruNcumTribMi + FBloco0.ReceitaBruta.recBruNcumNtMi);

  if lstReceitaTributadaMI.Contains(ACodCred) and lstCst_54_64.Contains(ACst) then
    Result := FBloco0.ReceitaBruta.recBruNcumTribMi / (FBloco0.ReceitaBruta.recBruNcumTribMi + FBloco0.ReceitaBruta.recBruNcumExp);

  if lstReceitaTributadaMI.Contains(ACodCred) and lstCst_56_66.Contains(ACst) then
    Result := FBloco0.ReceitaBruta.recBruNcumTribMi / (FBloco0.ReceitaBruta.recBruNcumTribMi + FBloco0.ReceitaBruta.recBruNcumNtMi + FBloco0.ReceitaBruta.recBruNcumExp);

  //Grupo 200
  if lstReceitaNaoTributadaMI.Contains(ACodCred) and lstCst_53_63.Contains(ACst) then
    Result := FBloco0.ReceitaBruta.recBruNcumNtMi / (FBloco0.ReceitaBruta.recBruNcumTribMi + FBloco0.ReceitaBruta.recBruNcumNtMi);

  if lstReceitaNaoTributadaMI.Contains(ACodCred) and lstCst_55_65.Contains(ACst) then
    Result := FBloco0.ReceitaBruta.recBruNcumNtMi / (FBloco0.ReceitaBruta.recBruNcumNtMi + FBloco0.ReceitaBruta.recBruNcumExp);

  if lstReceitaNaoTributadaMI.Contains(ACodCred) and lstCst_56_66.Contains(ACst) then
    Result := FBloco0.ReceitaBruta.recBruNcumNtMi / (FBloco0.ReceitaBruta.recBruNcumTribMi + FBloco0.ReceitaBruta.recBruNcumNtMi + FBloco0.ReceitaBruta.recBruNcumExp);

  //Grupo 300
  if lstReceitaExportacao.Contains(ACodCred) and lstCst_54_64.Contains(ACst) then
    Result := FBloco0.ReceitaBruta.recBruNcumExp / (FBloco0.ReceitaBruta.recBruNcumTribMi + FBloco0.ReceitaBruta.recBruNcumExp);

  if lstReceitaExportacao.Contains(ACodCred) and lstCst_55_65.Contains(ACst) then
    Result := FBloco0.ReceitaBruta.recBruNcumExp / (FBloco0.ReceitaBruta.recBruNcumNtMi + FBloco0.ReceitaBruta.recBruNcumExp);

  if lstReceitaExportacao.Contains(ACodCred) and lstCst_56_66.Contains(ACst) then
    Result := FBloco0.ReceitaBruta.recBruNcumExp / (FBloco0.ReceitaBruta.recBruNcumTribMi + FBloco0.ReceitaBruta.recBruNcumNtMi + FBloco0.ReceitaBruta.recBruNcumExp);
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribCofinsM500(
  ARegM500: TJSSpedContribuicoesModelRegistroM500);
begin
  regM600.vlTotCredDesc := regM600.vlTotCredDesc + ARegM500.vlCredDesc;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribCofinsM610;
var
  i: Integer;
begin
  if not Assigned(m610) then
    Exit;

  for i := 0 to Pred(m610.Count) do
  begin
    m610[i].vlContApur   := Double(m610[i].vlBcCont * m610[i].aliqCofins / 100).roundABNT;

    m610[i].vlBcContAjus := m610[i].vlBcCont +
                            m610[i].vlAjusAcresBcCofins -
                            m610[i].vlAjusReducBcCofins;

    m610[i].vlContPer    := m610[i].vlContApur +
                            m610[i].vlAjusAcres -
                            m610[i].vlAjusReduc -
                            m610[i].vlContDifer +
                            m610[i].vlContDiferAnt;


    if Pos(m610[i].codCont, '01_02_03_04_32_71') > 0  then
      regM600.vlTotContNcPer := regM600.vlTotContNcPer + m610[i].vlContPer;

    if Pos(m610[i].codCont, '31_32_51_52_53_54_72') > 0  then
      regM600.vlTotContCumPer := regM600.vlTotContCumPer + m610[i].vlContPer;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribPisM210;
var
  i: Integer;
begin
  if not Assigned(m210) then
    Exit;

  for i := 0 to Pred(m210.Count) do
  begin
    m210[i].vlContApur   := Double(m210[i].vlBcCont * m210[i].aliqPis / 100).roundABNT;

    m210[i].vlBcContAjus := m210[i].vlBcCont +
                            m210[i].vlAjusAcresBcPis -
                            m210[i].vlAjusReducBcPis;

    m210[i].vlContPer    := m210[i].vlContApur +
                            m210[i].vlAjusAcres -
                            m210[i].vlAjusReduc -
                            m210[i].vlContDifer +
                            m210[i].vlContDiferAnt;


    if Pos(m210[i].codCont, '01_02_03_04_32_71') > 0  then
      regM200.vlTotContNcPer := regM200.vlTotContNcPer + m210[i].vlContPer;

    if Pos(m210[i].codCont, '31_32_51_52_53_54_72') > 0  then
      regM200.vlTotContCumPer := regM200.vlTotContCumPer + m210[i].vlContPer;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribPisM220(AM220List: TObjectList<TJSSpedContribuicoesModelRegistroM220>);
var
  i, j    : Integer;
  regM210 : TJSSpedContribuicoesModelRegistroM210;
begin
  if not Assigned(AM220List) or (AM220List.Count = 0) then
    Exit;

  if not Assigned(m210) then
    m210 := TObjectList<TJSSpedContribuicoesModelRegistroM210>.Create;

  for i := 0 to Pred(AM220List.Count) do
  begin
    regM210 := TJSSpedContribuicoesModelRegistroM210.create;
    regM210.codCont := AM220List[i].GetValueStr('CODCONT');

    if AM220List[i].indAj = taAjuReducao then
      regM210.vlAjusReduc := AM220List[i].vlAj
    else
      regM210.vlAjusAcres := AM220List[i].vlAj;

    if not m210.BinarySearch(regM210, j, FComparerM210) then
      m210.Insert(j, regM210)
    else
    begin
      FreeAndNil(regM210);
      if AM220List[i].indAj = taAjuReducao then
        m210[j].vlAjusReduc := m210[j].vlAjusReduc + AM220List[i].vlAj
      else
        m210[j].vlAjusAcres := m210[j].vlAjusAcres + AM220List[i].vlAj;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribPisM410(
  AM400List: TObjectList<TJSSpedContribuicoesModelRegistroM400>);
var
  i, j    : Integer;
  regM400 : TJSSpedContribuicoesModelRegistroM400;
  ComparerM400 : IComparer<TJSSpedContribuicoesModelRegistroM400>;
begin
  if not Assigned(m410) or (m410.Count = 0) then
    Exit;

  ComparerM400 := TJSSpedContribuicoesModelRegistroM400.getComparer;
  for i := 0 to Pred(m410.Count) do
  begin
    regM400 := TJSSpedContribuicoesModelRegistroM400.create;
    regM400.cstPis   := m410[i].GetValueStr('CSTPIS');
    regM400.vlTotRec := m410[i].vlRec;
    regM400.codCta   := m410[i].codCta;

    if not AM400List.BinarySearch(regM400, j, ComparerM400) then
      AM400List.Insert(j, regM400)
    else
    begin
      AM400List[j].vlTotRec := AM400List[j].vlTotRec + regM400.vlTotRec;
      FreeAndNil(regM400);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribPisM810(
  AM800List: TObjectList<TJSSpedContribuicoesModelRegistroM800>);
var
  i, j    : Integer;
  regM800 : TJSSpedContribuicoesModelRegistroM800;
  ComparerM800 : IComparer<TJSSpedContribuicoesModelRegistroM800>;
begin
  if not Assigned(m810) or (m810.Count = 0) then
    Exit;

  ComparerM800 := TJSSpedContribuicoesModelRegistroM800.getComparer;
  for i := 0 to Pred(m810.Count) do
  begin
    regM800 := TJSSpedContribuicoesModelRegistroM800.create;
    regM800.cstCofins := m810[i].GetValueStr('CSTCOFINS');
    regM800.vlTotRec  := m810[i].vlRec;
    regM800.codCta    := m810[i].codCta;

    if not AM800List.BinarySearch(regM800, j, ComparerM800) then
      AM800List.Insert(j, regM800)
    else
    begin
      AM800List[j].vlTotRec := AM800List[j].vlTotRec + regM800.vlTotRec;
      FreeAndNil(regM800);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaContribCofinsM620(
  AM620List: TObjectList<TJSSpedContribuicoesModelRegistroM620>);
var
  i, j    : Integer;
  regM610 : TJSSpedContribuicoesModelRegistroM610;
begin
  if not Assigned(AM620List) or (AM620List.Count = 0) then
    Exit;

  if not Assigned(m610) then
    m610 := TObjectList<TJSSpedContribuicoesModelRegistroM610>.Create;

  for i := 0 to Pred(AM620List.Count) do
  begin
    regM610 := TJSSpedContribuicoesModelRegistroM610.create;
    regM610.codCont := AM620List[i].GetValueStr('CODCONT');

    if AM620List[i].indAj = taAjuReducao then
      regM610.vlAjusReduc := AM620List[i].vlAj
    else
      regM610.vlAjusAcres := AM620List[i].vlAj;

    if not m610.BinarySearch(regM610, j, FComparerM610) then
      m610.Insert(j, regM610)
    else
    begin
      FreeAndNil(regM610);
      if AM620List[i].indAj = taAjuReducao then
        m610[j].vlAjusReduc := m610[j].vlAjusReduc + AM620List[i].vlAj
      else
        m610[j].vlAjusAcres := m610[j].vlAjusAcres + AM620List[i].vlAj;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaCredCofinsM505(AM500List: TObjectList<TJSSpedContribuicoesModelRegistroM500>);
var
  i,j: Integer;
  regM500: TJSSpedContribuicoesModelRegistroM500;
begin
  if not Assigned(m505) then
    Exit;

  for i := 0 to Pred(m505.Count) do
  begin
    regM500 := TJSSpedContribuicoesModelRegistroM500.create;
    regM500.codCred    := m505[i].GetValueStr('CODCRED');
    regM500.vlBcCofins := m505[i].vlBcCofins;
    regM500.aliqCofins := m505[i].GetValueDouble('ALIQCOFINS');

    if not AM500List.BinarySearch(RegM500, j, FComparerM500) then
      AM500List.Insert(j, regM500)
    else
    begin
      FreeAndNil(regM500);
      AM500List[j].vlBcCofins := AM500List[j].vlBcCofins + m505[i].vlBcCofins;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaCredCofinsM510(
  AM500List: TObjectList<TJSSpedContribuicoesModelRegistroM500>;
  AM510List: TObjectList<TJSSpedContribuicoesModelRegistroM510>);
var
  i, j    : Integer;
  regM500 : TJSSpedContribuicoesModelRegistroM500;
begin
  if not Assigned(AM510List) or (AM510List.Count = 0) then
    Exit;

  for i := 0 to Pred(AM510List.Count) do
  begin
    regM500 := TJSSpedContribuicoesModelRegistroM500.create;
    regM500.codCred := AM510List[i].GetValueStr('CODCRED');

    if AM510List[i].indAj = taAjuReducao then
      regM500.vlAjusReduc := AM510List[i].vlAj
    else
      regM500.vlAjusAcres := AM510List[i].vlAj;

    if not AM500List.BinarySearch(regM500, j, FComparerM500) then
      AM500List.Insert(j, regM500)
    else
    begin
      FreeAndNil(regM500);
      if AM510List[i].indAj = taAjuReducao then
        AM500List[j].vlAjusReduc := AM500List[j].vlAjusReduc + AM510List[i].vlAj
      else
        AM500List[j].vlAjusAcres := AM500List[j].vlAjusAcres + AM510List[i].vlAj;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaCredPisM105(AM100List: TObjectList<TJSSpedContribuicoesModelRegistroM100>);
var
  i,j: Integer;
  regM100: TJSSpedContribuicoesModelRegistroM100;
begin
  if not Assigned(m105) then
    Exit;

  for i := 0 to Pred(m105.Count) do
  begin
    regM100 := TJSSpedContribuicoesModelRegistroM100.create;
    regM100.codCred := m105[i].GetValueStr('CODCRED');
    regM100.vlBcPis := m105[i].vlBcPis;
    regM100.aliqPis := m105[i].GetValueDouble('ALIQPIS');

    if not AM100List.BinarySearch(RegM100, j, FComparerM100) then
      AM100List.Insert(j, regM100)
    else
    begin
      FreeAndNil(regM100);
      AM100List[j].vlBcPis := AM100List[j].vlBcPis + m105[i].vlBcPis;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.ConsolidaCredPisM110(
  AM100List: TObjectList<TJSSpedContribuicoesModelRegistroM100>;
  AM110List: TObjectList<TJSSpedContribuicoesModelRegistroM110>);
var
  i, j    : Integer;
  regM100 : TJSSpedContribuicoesModelRegistroM100;
begin
  if not Assigned(AM110List) or (AM110List.Count = 0) then
    Exit;

  for i := 0 to Pred(AM110List.Count) do
  begin
    regM100 := TJSSpedContribuicoesModelRegistroM100.create;
    regM100.codCred := AM110List[i].GetValueStr('CODCRED');

    if AM110List[i].indAj = taAjuReducao then
      regM100.vlAjusReduc := AM110List[i].vlAj
    else
      regM100.vlAjusAcres := AM110List[i].vlAj;

    if not AM100List.BinarySearch(regM100, j, FComparerM100) then
      AM100List.Insert(j, regM100)
    else
    begin
      FreeAndNil(regM100);
      if AM110List[i].indAj = taAjuReducao then
        AM100List[j].vlAjusReduc := AM100List[j].vlAjusReduc + AM110List[i].vlAj
      else
        AM100List[j].vlAjusAcres := AM100List[j].vlAjusAcres + AM110List[i].vlAj;
    end;
  end;
end;

constructor TJSSpedContribuicoesServiceBlocoM.create(
  Parent: IJSSpedContribuicoesService);
begin
  FSpedContribuicoesService := Parent;
  FArquivo                  := TStringList.Create;

  FStatus      := TJSSpedContribuicoesServiceStatus.New(Self.FSpedContribuicoesService).Bloco('0');
  FacadeExport := JSSpedContribuicoes.Export.Interfaces
                    .FacadeExport(FSpedContribuicoesService.Emitente, FSpedContribuicoesService.Config);

  FComparerM100 := TJSSpedContribuicoesModelRegistroM100.getComparer;
  FComparerM105 := TJSSpedContribuicoesModelRegistroM105.getComparer;
  FComparerM210 := TJSSpedContribuicoesModelRegistroM210.getComparer;
  FComparerM410 := TJSSpedContribuicoesModelRegistroM410.getComparer;
  FComparerM500 := TJSSpedContribuicoesModelRegistroM500.getComparer;
  FComparerM505 := TJSSpedContribuicoesModelRegistroM505.getComparer;
  FComparerM610 := TJSSpedContribuicoesModelRegistroM610.getComparer;
  FComparerM810 := TJSSpedContribuicoesModelRegistroM810.getComparer;

  regM200 := TJSSpedContribuicoesModelRegistroM200.Create;
  regM600 := TJSSpedContribuicoesModelRegistroM600.Create;

  CarregaListas;
end;

destructor TJSSpedContribuicoesServiceBlocoM.Destroy;
begin
  if Assigned(m105) then
    m105.Free;

  if Assigned(m505) then
    m505.Free;

  if Assigned(m410) then
    m410.Free;

  if Assigned(m810) then
    m810.Free;

  if Assigned(regM200) then
    regM200.Free;

  if Assigned(regM600) then
    regM600.Free;

  if Assigned(FArquivo) then
    FArquivo.Free;

  if Assigned(lstReceitaTributadaMI) then
    lstReceitaTributadaMI.Free;

  if Assigned(lstReceitaNaoTributadaMI) then
    lstReceitaNaoTributadaMI.Free;

  if Assigned(lstReceitaExportacao) then
    lstReceitaExportacao.Free;

  if Assigned(lstCst_53_63) then
    lstCst_53_63.Free;

  if Assigned(lstCst_54_64) then
    lstCst_54_64.Free;

  if Assigned(lstCst_56_66) then
    lstCst_56_66.Free;

  if Assigned(lstCst_55_65) then
    lstCst_55_65.Free;

  if Assigned(lstCST_PISCOFINS_NTRIB) then
    lstCST_PISCOFINS_NTRIB.Free;

  inherited;
end;

function TJSSpedContribuicoesServiceBlocoM.DetalhaCredBaseCofins(
  AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBlocoM;
begin
  result  := Self;
  DetalhaCredBaseCofinsA170(AModel);
  DetalhaCredBaseCofinsC170(AModel);
  DetalhaCredBaseCofinsC505(AModel);
  DetalhaCredBaseCofinsD105(AModel);
  DetalhaCredBaseCofinsD505(AModel);
  DetalhaCredBaseCofinsF100(AModel);
  DetalhaCredBaseCofinsF120(AModel);
  DetalhaCredBaseCofinsF130(AModel);
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBaseCofinsA170(AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM505 : TJSSpedContribuicoesModelRegistroM505;
  RegA170 : TJSSpedContribuicoesModelRegistroA170;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroA170>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroA170(AModel).vlBcCofins = 0 then
    Exit;

  RegA170 := TJSSpedContribuicoesModelRegistroA170(AModel);
  if not Assigned(m505) then
    m505 := TObjectList<TJSSpedContribuicoesModelRegistroM505>.Create;

  RegM505 := TJSSpedContribuicoesModelRegistroM505.create;
  RegM505.AddOrSetValue('CODCRED',RegA170.GetValueStr('CODCRED'));
  RegM505.AddOrSetValue('ALIQCOFINS',RegA170.aliqCofins);
  RegM505.natBcCred     := RegA170.natBcCred;
  RegM505.cstCofins     := RegA170.cstCofins;
  RegM505.vlBcCofinsTot := RegA170.vlBcCofins;
  RegM505.vlBcCofinsCum := RegA170.GetValueDouble('VLBCCOFINSCUM');
  RegM505.vlBcCofinsNC  := RegM505.vlBcCofinsTot -
                           RegM505.vlBcCofinsCum;
  RegM505.vlBcCofins    := RegM505.vlBcCofinsNC;
  RegM505.descCred      := RegA170.GetValueStr('DESCCRED');

  if not m505.BinarySearch(RegM505, I, FComparerM505) then
    m505.Insert(I, RegM505)
  else
  begin
    FreeAndNil(RegM505);
    m505[I].vlBcCofinsTot    := m505[I].vlBcCofinsTot  + RegA170.vlBcCofins;
    m505[I].vlBcCofinsCum    := m505[I].vlBcCofinsCum  + RegA170.GetValueDouble('VLBCCOFINSCUM');
    m505[I].vlBcCofinsNC     := m505[I].vlBcCofinsTot  -
                                m505[I].vlBcCofinsCum;
    m505[I].vlBcCofins       := m505[I].vlBcCofinsNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBaseCofinsC170(AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM505 : TJSSpedContribuicoesModelRegistroM505;
  RegC170 : TJSSpedContribuicoesModelRegistroC170;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC170>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroC170(AModel).vlBcCofins = 0 then
    Exit;

  RegC170 := TJSSpedContribuicoesModelRegistroC170(AModel);
  if not Assigned(m505) then
    m505 := TObjectList<TJSSpedContribuicoesModelRegistroM505>.Create;

  RegM505 := TJSSpedContribuicoesModelRegistroM505.create;
  RegM505.AddOrSetValue('CODCRED',RegC170.GetValueStr('CODCRED'));
  RegM505.AddOrSetValue('ALIQCOFINS',RegC170.aliqCofins);
  RegM505.natBcCred     := RegC170.GetValueStr('NATBCCRED');
  RegM505.cstCofins     := RegC170.cstCofins;
  RegM505.vlBcCofinsTot := RegC170.vlBcCofins;
  RegM505.vlBcCofinsCum := RegC170.GetValueDouble('VLBCCOFINSCUM');
  RegM505.vlBcCofinsNC  := RegM505.vlBcCofinsTot -
                           RegM505.vlBcCofinsCum;
  RegM505.vlBcCofins    := RegM505.vlBcCofinsNC;
  RegM505.descCred      := RegC170.GetValueStr('DESCCRED');

  if not m505.BinarySearch(RegM505, I, FComparerM505) then
    m505.Insert(I, RegM505)
  else
  begin
    FreeAndNil(RegM505);
    m505[I].vlBcCofinsTot    := m505[I].vlBcCofinsTot  + RegC170.vlBcCofins;
    m505[I].vlBcCofinsCum    := m505[I].vlBcCofinsCum  + RegC170.GetValueDouble('VLBCCOFINSCUM');
    m505[I].vlBcCofinsNC     := m505[I].vlBcCofinsTot  -
                                m505[I].vlBcCofinsCum;
    m505[I].vlBcCofins       := m505[I].vlBcCofinsNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBaseCofinsC505(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM505 : TJSSpedContribuicoesModelRegistroM505;
  RegC505 : TJSSpedContribuicoesModelRegistroC505;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC505>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroC505(AModel).vlBcCofins = 0 then
    Exit;

  RegC505 := TJSSpedContribuicoesModelRegistroC505(AModel);
  if not Assigned(m505) then
    m505 := TObjectList<TJSSpedContribuicoesModelRegistroM505>.Create;

  RegM505 := TJSSpedContribuicoesModelRegistroM505.create;
  RegM505.AddOrSetValue('CODCRED',RegC505.GetValueStr('CODCRED'));
  RegM505.AddOrSetValue('ALIQCOFINS',RegC505.aliqCofins);
  RegM505.natBcCred     := RegC505.natBcCred;
  RegM505.cstCofins     := RegC505.cstCofins;
  RegM505.vlBcCofinsTot := RegC505.vlBcCofins;
  RegM505.vlBcCofinsCum := RegC505.GetValueDouble('VLBCCOFINSCUM');
  RegM505.vlBcCofinsNC  := RegM505.vlBcCofinsTot -
                           RegM505.vlBcCofinsCum;
  RegM505.vlBcCofins    := RegM505.vlBcCofinsNC;
  RegM505.descCred      := RegC505.GetValueStr('DESCCRED');

  if not m505.BinarySearch(RegM505, I, FComparerM505) then
    m505.Insert(I, RegM505)
  else
  begin
    FreeAndNil(RegM505);
    m505[I].vlBcCofinsTot    := m505[I].vlBcCofinsTot  + RegC505.vlBcCofins;
    m505[I].vlBcCofinsCum    := m505[I].vlBcCofinsCum  + RegC505.GetValueDouble('VLBCCOFINSCUM');
    m505[I].vlBcCofinsNC     := m505[I].vlBcCofinsTot  -
                                m505[I].vlBcCofinsCum;
    m505[I].vlBcCofins       := m505[I].vlBcCofinsNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBaseCofinsD105(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM505 : TJSSpedContribuicoesModelRegistroM505;
  RegD105 : TJSSpedContribuicoesModelRegistroD105;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroD105>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroD105(AModel).vlBcCofins = 0 then
    Exit;

  RegD105 := TJSSpedContribuicoesModelRegistroD105(AModel);
  if not Assigned(m505) then
    m505 := TObjectList<TJSSpedContribuicoesModelRegistroM505>.Create;

  RegM505 := TJSSpedContribuicoesModelRegistroM505.create;
  RegM505.AddOrSetValue('CODCRED',RegD105.GetValueStr('CODCRED'));
  RegM505.AddOrSetValue('ALIQCOFINS',RegD105.aliqCofins);
  RegM505.natBcCred     := RegD105.natBcCred;
  RegM505.cstCofins     := RegD105.cstCofins;
  RegM505.vlBcCofinsTot := RegD105.vlBcCofins;
  RegM505.vlBcCofinsCum := RegD105.GetValueDouble('VLBCCOFINSCUM');
  RegM505.vlBcCofinsNC  := RegM505.vlBcCofinsTot -
                           RegM505.vlBcCofinsCum;
  RegM505.vlBcCofins    := RegM505.vlBcCofinsNC;
  RegM505.descCred      := RegD105.GetValueStr('DESCCRED');

  if not m505.BinarySearch(RegM505, I, FComparerM505) then
    m505.Insert(I, RegM505)
  else
  begin
    FreeAndNil(RegM505);
    m505[I].vlBcCofinsTot    := m505[I].vlBcCofinsTot  + RegD105.vlBcCofins;
    m505[I].vlBcCofinsCum    := m505[I].vlBcCofinsCum  + RegD105.GetValueDouble('VLBCCOFINSCUM');
    m505[I].vlBcCofinsNC     := m505[I].vlBcCofinsTot  -
                                m505[I].vlBcCofinsCum;
    m505[I].vlBcCofins       := m505[I].vlBcCofinsNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBaseCofinsD505(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM505 : TJSSpedContribuicoesModelRegistroM505;
  RegD505 : TJSSpedContribuicoesModelRegistroD505;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroD505>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroD505(AModel).vlBcCofins = 0 then
    Exit;

  RegD505 := TJSSpedContribuicoesModelRegistroD505(AModel);
  if not Assigned(m505) then
    m505 := TObjectList<TJSSpedContribuicoesModelRegistroM505>.Create;

  RegM505 := TJSSpedContribuicoesModelRegistroM505.create;
  RegM505.AddOrSetValue('CODCRED',RegD505.GetValueStr('CODCRED'));
  RegM505.AddOrSetValue('ALIQCOFINS',RegD505.aliqCofins);
  RegM505.natBcCred     := RegD505.natBcCred;
  RegM505.cstCofins     := RegD505.cstCofins;
  RegM505.vlBcCofinsTot := RegD505.vlBcCofins;
  RegM505.vlBcCofinsCum := RegD505.GetValueDouble('VLBCCOFINSCUM');
  RegM505.vlBcCofinsNC  := RegM505.vlBcCofinsTot -
                           RegM505.vlBcCofinsCum;
  RegM505.vlBcCofins    := RegM505.vlBcCofinsNC;
  RegM505.descCred      := RegD505.GetValueStr('DESCCRED');

  if not m505.BinarySearch(RegM505, I, FComparerM505) then
    m505.Insert(I, RegM505)
  else
  begin
    FreeAndNil(RegM505);
    m505[I].vlBcCofinsTot    := m505[I].vlBcCofinsTot  + RegD505.vlBcCofins;
    m505[I].vlBcCofinsCum    := m505[I].vlBcCofinsCum  + RegD505.GetValueDouble('VLBCCOFINSCUM');
    m505[I].vlBcCofinsNC     := m505[I].vlBcCofinsTot  -
                                m505[I].vlBcCofinsCum;
    m505[I].vlBcCofins       := m505[I].vlBcCofinsNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBaseCofinsF100(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM505 : TJSSpedContribuicoesModelRegistroM505;
  RegF100 : TJSSpedContribuicoesModelRegistroF100;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF100>(AModel) then
    Exit;

  if (TJSSpedContribuicoesModelRegistroF100(AModel).vlBcCofins = 0) or
     (TJSSpedContribuicoesModelRegistroF100(AModel).indOper <> tofAquisicaoPisCofins) then
    Exit;

  RegF100 := TJSSpedContribuicoesModelRegistroF100(AModel);
  if not Assigned(m505) then
    m505 := TObjectList<TJSSpedContribuicoesModelRegistroM505>.Create;

  RegM505 := TJSSpedContribuicoesModelRegistroM505.create;
  RegM505.AddOrSetValue('CODCRED',RegF100.GetValueStr('CODCRED'));
  RegM505.AddOrSetValue('ALIQCOFINS',RegF100.aliqCofins);
  RegM505.natBcCred     := RegF100.natBcCred;
  RegM505.cstCofins     := RegF100.cstCofins;
  RegM505.vlBcCofinsTot := RegF100.vlBcCofins;
  RegM505.vlBcCofinsCum := RegF100.GetValueDouble('VLBCCOFINSCUM');
  RegM505.vlBcCofinsNC  := RegM505.vlBcCofinsTot -
                           RegM505.vlBcCofinsCum;
  RegM505.vlBcCofins    := RegM505.vlBcCofinsNC;
  RegM505.descCred      := RegF100.GetValueStr('DESCCRED');

  if not m505.BinarySearch(RegM505, I, FComparerM505) then
    m505.Insert(I, RegM505)
  else
  begin
    FreeAndNil(RegM505);
    m505[I].vlBcCofinsTot    := m505[I].vlBcCofinsTot  + RegF100.vlBcCofins;
    m505[I].vlBcCofinsCum    := m505[I].vlBcCofinsCum  + RegF100.GetValueDouble('VLBCCOFINSCUM');
    m505[I].vlBcCofinsNC     := m505[I].vlBcCofinsTot  -
                                m505[I].vlBcCofinsCum;
    m505[I].vlBcCofins       := m505[I].vlBcCofinsNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBaseCofinsF120(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM505 : TJSSpedContribuicoesModelRegistroM505;
  RegF120 : TJSSpedContribuicoesModelRegistroF120;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF120>(AModel) then
    Exit;

  if (TJSSpedContribuicoesModelRegistroF120(AModel).vlBcCofins = 0) then
    Exit;

  RegF120 := TJSSpedContribuicoesModelRegistroF120(AModel);
  if not Assigned(m505) then
    m505 := TObjectList<TJSSpedContribuicoesModelRegistroM505>.Create;

  RegM505 := TJSSpedContribuicoesModelRegistroM505.create;
  RegM505.AddOrSetValue('CODCRED',RegF120.GetValueStr('CODCRED'));
  RegM505.AddOrSetValue('ALIQCOFINS',RegF120.aliqCofins);
  RegM505.natBcCred     := RegF120.natBcCred;
  RegM505.cstCofins     := RegF120.cstCofins;
  RegM505.vlBcCofinsTot := RegF120.vlBcCofins;
  RegM505.vlBcCofinsCum := RegF120.GetValueDouble('VLBCCOFINSCUM');
  RegM505.vlBcCofinsNC  := RegM505.vlBcCofinsTot -
                           RegM505.vlBcCofinsCum;
  RegM505.vlBcCofins    := RegM505.vlBcCofinsNC;
  RegM505.descCred      := RegF120.GetValueStr('DESCCRED');

  if not m505.BinarySearch(RegM505, I, FComparerM505) then
    m505.Insert(I, RegM505)
  else
  begin
    FreeAndNil(RegM505);
    m505[I].vlBcCofinsTot    := m505[I].vlBcCofinsTot  + RegF120.vlBcCofins;
    m505[I].vlBcCofinsNC     := m505[I].vlBcCofinsTot;
    m505[I].vlBcCofins       := m505[I].vlBcCofinsNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBaseCofinsF130(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM505 : TJSSpedContribuicoesModelRegistroM505;
  RegF130 : TJSSpedContribuicoesModelRegistroF130;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF130>(AModel) then
    Exit;

  if (TJSSpedContribuicoesModelRegistroF130(AModel).vlBcCofins = 0) then
    Exit;

  RegF130 := TJSSpedContribuicoesModelRegistroF130(AModel);
  if not Assigned(m505) then
    m505 := TObjectList<TJSSpedContribuicoesModelRegistroM505>.Create;

  RegM505 := TJSSpedContribuicoesModelRegistroM505.create;
  RegM505.AddOrSetValue('CODCRED',RegF130.GetValueStr('CODCRED'));
  RegM505.AddOrSetValue('ALIQCOFINS',RegF130.aliqCofins);
  RegM505.natBcCred     := RegF130.natBcCred;
  RegM505.cstCofins     := RegF130.cstCofins;
  RegM505.vlBcCofinsTot := RegF130.vlBcCofins;
  RegM505.vlBcCofinsCum := RegF130.GetValueDouble('VLBCCOFINSCUM');
  RegM505.vlBcCofinsNC  := RegM505.vlBcCofinsTot -
                           RegM505.vlBcCofinsCum;
  RegM505.vlBcCofins    := RegM505.vlBcCofinsNC;
  RegM505.descCred      := RegF130.GetValueStr('DESCCRED');

  if not m505.BinarySearch(RegM505, I, FComparerM505) then
    m505.Insert(I, RegM505)
  else
  begin
    FreeAndNil(RegM505);
    m505[I].vlBcCofinsTot    := m505[I].vlBcCofinsTot  + RegF130.vlBcCofins;
    m505[I].vlBcCofinsNC     := m505[I].vlBcCofinsTot;
    m505[I].vlBcCofins       := m505[I].vlBcCofinsNC;
  end;
end;

function TJSSpedContribuicoesServiceBlocoM.DetalhaCredBasePis(
  AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBlocoM;
begin
  result  := Self;
  DetalhaCredBasePisA170(AModel);
  DetalhaCredBasePisC170(AModel);
  DetalhaCredBasePisC501(AModel);
  DetalhaCredBasePisD101(AModel);
  DetalhaCredBasePisD501(AModel);
  DetalhaCredBasePisF100(AModel);
  DetalhaCredBasePisF120(AModel);
  DetalhaCredBasePisF130(AModel);
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBasePisA170(AModel: TJSSpedContribuicoesModelRegistro);
var
  I       : Integer;
  RegM105 : TJSSpedContribuicoesModelRegistroM105;
  RegA170 : TJSSpedContribuicoesModelRegistroA170;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroA170>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroA170(AModel).vlBcPis = 0 then
    Exit;

  RegA170 := TJSSpedContribuicoesModelRegistroA170(AModel);
  if not Assigned(m105) then
    m105 := TObjectList<TJSSpedContribuicoesModelRegistroM105>.Create;

  RegM105 := TJSSpedContribuicoesModelRegistroM105.create;
  RegM105.AddOrSetValue('CODCRED',RegA170.GetValueStr('CODCRED'));
  RegM105.AddOrSetValue('ALIQPIS',RegA170.aliqPis);
  RegM105.natBcCred  := RegA170.natBcCred;
  RegM105.cstPis     := RegA170.cstPis;
  RegM105.vlBcPisTot := RegA170.vlBcPis;
  RegM105.vlBcPisCum := RegA170.GetValueDouble('VLBCPISCUM');
  RegM105.vlBcPisNC  := RegM105.vlBcPisTot -
                        RegM105.vlBcPisCum;
  RegM105.vlBcPis    := RegM105.vlBcPisNC;
  RegM105.descCred   := RegA170.GetValueStr('DESCCRED');

  if not m105.BinarySearch(RegM105, I, FComparerM105) then
    m105.Insert(I, RegM105)
  else
  begin
    FreeAndNil(RegM105);

    m105[I].vlBcPisTot    := m105[I].vlBcPisTot  + RegA170.vlBcPis;
    m105[I].vlBcPisCum    := m105[I].vlBcPisCum  + RegA170.GetValueDouble('VLBCPISCUM');
    m105[I].vlBcPisNC     := m105[I].vlBcPisTot  -
                             m105[I].vlBcPisCum;
    m105[I].vlBcPis       := m105[I].vlBcPisNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBasePisC170(AModel: TJSSpedContribuicoesModelRegistro);
var
  I       : Integer;
  RegM105 : TJSSpedContribuicoesModelRegistroM105;
  RegC170 : TJSSpedContribuicoesModelRegistroC170;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC170>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroC170(AModel).vlBcPis = 0 then
    Exit;

  RegC170 := TJSSpedContribuicoesModelRegistroC170(AModel);
  if not Assigned(m105) then
    m105 := TObjectList<TJSSpedContribuicoesModelRegistroM105>.Create;

  RegM105 := TJSSpedContribuicoesModelRegistroM105.create;
  RegM105.AddOrSetValue('CODCRED',RegC170.GetValueStr('CODCRED'));
  RegM105.AddOrSetValue('ALIQPIS',RegC170.aliqPis);
  RegM105.natBcCred  := RegC170.GetValueStr('NATBCCRED');
  RegM105.cstPis     := RegC170.cstPis;
  RegM105.vlBcPisTot := RegC170.vlBcPis;
  RegM105.vlBcPisCum := RegC170.GetValueDouble('VLBCPISCUM');
  RegM105.vlBcPisNC  := RegM105.vlBcPisTot -
                        RegM105.vlBcPisCum;
  RegM105.vlBcPis    := RegM105.vlBcPisNC;
  RegM105.descCred   := RegC170.GetValueStr('DESCCRED');

  if not m105.BinarySearch(RegM105, I, FComparerM105) then
    m105.Insert(I, RegM105)
  else
  begin
    FreeAndNil(RegM105);
    m105[I].vlBcPisTot    := m105[I].vlBcPisTot  + RegC170.vlBcPis;
    m105[I].vlBcPisCum    := m105[I].vlBcPisCum  + RegC170.GetValueDouble('VLBCPISCUM');
    m105[I].vlBcPisNC     := m105[I].vlBcPisTot  -
                             m105[I].vlBcPisCum;
    m105[I].vlBcPis       := m105[I].vlBcPisNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBasePisC501(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM105 : TJSSpedContribuicoesModelRegistroM105;
  RegC501 : TJSSpedContribuicoesModelRegistroC501;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC501>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroC501(AModel).vlBcPis = 0 then
    Exit;

  RegC501 := TJSSpedContribuicoesModelRegistroC501(AModel);
  if not Assigned(m105) then
    m105 := TObjectList<TJSSpedContribuicoesModelRegistroM105>.Create;

  RegM105 := TJSSpedContribuicoesModelRegistroM105.create;
  RegM105.AddOrSetValue('CODCRED',RegC501.GetValueStr('CODCRED'));
  RegM105.AddOrSetValue('ALIQPIS',RegC501.aliqPis);
  RegM105.natBcCred  := RegC501.natBcCred;
  RegM105.cstPis     := RegC501.cstPis;
  RegM105.vlBcPisTot := RegC501.vlBcPis;
  RegM105.vlBcPisCum := RegC501.GetValueDouble('VLBCPISCUM');
  RegM105.vlBcPisNC  := RegM105.vlBcPisTot -
                        RegM105.vlBcPisCum;
  RegM105.vlBcPis    := RegM105.vlBcPisNC;
  RegM105.descCred   := RegC501.GetValueStr('DESCCRED');

  if not m105.BinarySearch(RegM105, I, FComparerM105) then
    m105.Insert(I, RegM105)
  else
  begin
    FreeAndNil(RegM105);
    m105[I].vlBcPisTot    := m105[I].vlBcPisTot  + RegC501.vlBcPis;
    m105[I].vlBcPisCum    := m105[I].vlBcPisCum  + RegC501.GetValueDouble('VLBCPISCUM');
    m105[I].vlBcPisNC     := m105[I].vlBcPisTot  -
                             m105[I].vlBcPisCum;
    m105[I].vlBcPis       := m105[I].vlBcPisNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBasePisD101(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I       : Integer;
  RegM105 : TJSSpedContribuicoesModelRegistroM105;
  RegD101 : TJSSpedContribuicoesModelRegistroD101;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroD101>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroD101(AModel).vlBcPis = 0 then
    Exit;

  RegD101 := TJSSpedContribuicoesModelRegistroD101(AModel);
  if not Assigned(m105) then
    m105 := TObjectList<TJSSpedContribuicoesModelRegistroM105>.Create;

  RegM105 := TJSSpedContribuicoesModelRegistroM105.create;
  RegM105.AddOrSetValue('CODCRED',RegD101.GetValueStr('CODCRED'));
  RegM105.AddOrSetValue('ALIQPIS',RegD101.aliqPis);
  RegM105.natBcCred  := RegD101.natBcCred;
  RegM105.cstPis     := RegD101.cstPis;
  RegM105.vlBcPisTot := RegD101.vlBcPis;
  RegM105.vlBcPisCum := RegD101.GetValueDouble('VLBCPISCUM');
  RegM105.vlBcPisNC  := RegM105.vlBcPisTot -
                        RegM105.vlBcPisCum;
  RegM105.vlBcPis    := RegM105.vlBcPisNC;
  RegM105.descCred   := RegD101.GetValueStr('DESCCRED');

  if not m105.BinarySearch(RegM105, I, FComparerM105) then
    m105.Insert(I, RegM105)
  else
  begin
    FreeAndNil(RegM105);
    m105[I].vlBcPisTot    := m105[I].vlBcPisTot  + RegD101.vlBcPis;
    m105[I].vlBcPisCum    := m105[I].vlBcPisCum  + RegD101.GetValueDouble('VLBCPISCUM');
    m105[I].vlBcPisNC     := m105[I].vlBcPisTot  -
                             m105[I].vlBcPisCum;
    m105[I].vlBcPis       := m105[I].vlBcPisNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBasePisD501(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM105 : TJSSpedContribuicoesModelRegistroM105;
  RegD501 : TJSSpedContribuicoesModelRegistroD501;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroD501>(AModel) then
    Exit;

  if TJSSpedContribuicoesModelRegistroD501(AModel).vlBcPis = 0 then
    Exit;

  RegD501 := TJSSpedContribuicoesModelRegistroD501(AModel);
  if not Assigned(m105) then
    m105 := TObjectList<TJSSpedContribuicoesModelRegistroM105>.Create;

  RegM105 := TJSSpedContribuicoesModelRegistroM105.create;
  RegM105.AddOrSetValue('CODCRED',RegD501.GetValueStr('CODCRED'));
  RegM105.AddOrSetValue('ALIQPIS',RegD501.aliqPis);
  RegM105.natBcCred  := RegD501.natBcCred;
  RegM105.cstPis     := RegD501.cstPis;
  RegM105.vlBcPisTot := RegD501.vlBcPis;
  RegM105.vlBcPisCum := RegD501.GetValueDouble('VLBCPISCUM');
  RegM105.vlBcPisNC  := RegM105.vlBcPisTot -
                        RegM105.vlBcPisCum;
  RegM105.vlBcPis    := RegM105.vlBcPisNC;
  RegM105.descCred   := RegD501.GetValueStr('DESCCRED');

  if not m105.BinarySearch(RegM105, I, FComparerM105) then
    m105.Insert(I, RegM105)
  else
  begin
    FreeAndNil(RegM105);
    m105[I].vlBcPisTot    := m105[I].vlBcPisTot  + RegD501.vlBcPis;
    m105[I].vlBcPisCum    := m105[I].vlBcPisCum  + RegD501.GetValueDouble('VLBCPISCUM');
    m105[I].vlBcPisNC     := m105[I].vlBcPisTot  -
                             m105[I].vlBcPisCum;
    m105[I].vlBcPis       := m105[I].vlBcPisNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBasePisF100(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM105 : TJSSpedContribuicoesModelRegistroM105;
  RegF100 : TJSSpedContribuicoesModelRegistroF100;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF100>(AModel) then
    Exit;

  if (TJSSpedContribuicoesModelRegistroF100(AModel).vlBcPis = 0) or
     (TJSSpedContribuicoesModelRegistroF100(AModel).indOper <> tofAquisicaoPisCofins) then
    Exit;

  RegF100 := TJSSpedContribuicoesModelRegistroF100(AModel);
  if not Assigned(m105) then
    m105 := TObjectList<TJSSpedContribuicoesModelRegistroM105>.Create;

  RegM105 := TJSSpedContribuicoesModelRegistroM105.create;
  RegM105.AddOrSetValue('CODCRED',RegF100.GetValueStr('CODCRED'));
  RegM105.AddOrSetValue('ALIQPIS',RegF100.aliqPis);
  RegM105.natBcCred  := RegF100.natBcCred;
  RegM105.cstPis     := RegF100.cstPis;
  RegM105.vlBcPisTot := RegF100.vlBcPis;
  RegM105.vlBcPisCum := RegF100.GetValueDouble('VLBCPISCUM');
  RegM105.vlBcPisNC  := RegM105.vlBcPisTot -
                        RegM105.vlBcPisCum;
  RegM105.vlBcPis    := RegM105.vlBcPisNC;
  RegM105.descCred   := RegF100.GetValueStr('DESCCRED');

  if not m105.BinarySearch(RegM105, I, FComparerM105) then
    m105.Insert(I, RegM105)
  else
  begin
    FreeAndNil(RegM105);
    m105[I].vlBcPisTot    := m105[I].vlBcPisTot  + RegF100.vlBcPis;
    m105[I].vlBcPisCum    := m105[I].vlBcPisCum  + RegF100.GetValueDouble('VLBCPISCUM');
    m105[I].vlBcPisNC     := m105[I].vlBcPisTot  -
                             m105[I].vlBcPisCum;
    m105[I].vlBcPis       := m105[I].vlBcPisNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBasePisF120(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM105 : TJSSpedContribuicoesModelRegistroM105;
  RegF120 : TJSSpedContribuicoesModelRegistroF120;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF120>(AModel) then
    Exit;

  if (TJSSpedContribuicoesModelRegistroF120(AModel).vlBcPis = 0) then
    Exit;

  RegF120 := TJSSpedContribuicoesModelRegistroF120(AModel);
  if not Assigned(m105) then
    m105 := TObjectList<TJSSpedContribuicoesModelRegistroM105>.Create;

  RegM105 := TJSSpedContribuicoesModelRegistroM105.create;
  RegM105.AddOrSetValue('CODCRED',RegF120.GetValueStr('CODCRED'));
  RegM105.AddOrSetValue('ALIQPIS',RegF120.aliqPis);
  RegM105.natBcCred  := RegF120.natBcCred;
  RegM105.cstPis     := RegF120.cstPis;
  RegM105.vlBcPisTot := RegF120.vlBcPis;
  RegM105.vlBcPisCum := RegF120.GetValueDouble('VLBCPISCUM');
  RegM105.vlBcPisNC  := RegM105.vlBcPisTot -
                        RegM105.vlBcPisCum;
  RegM105.vlBcPis    := RegM105.vlBcPisNC;
  RegM105.descCred   := RegF120.GetValueStr('DESCCRED');

  if not m105.BinarySearch(RegM105, I, FComparerM105) then
    m105.Insert(I, RegM105)
  else
  begin
    FreeAndNil(RegM105);
    m105[I].vlBcPisTot    := m105[I].vlBcPisTot  + RegF120.vlBcPis;
    m105[I].vlBcPisNC     := m105[I].vlBcPisTot;
    m105[I].vlBcPis       := m105[I].vlBcPisNC;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaCredBasePisF130(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  I: Integer;
  RegM105 : TJSSpedContribuicoesModelRegistroM105;
  RegF130 : TJSSpedContribuicoesModelRegistroF130;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF130>(AModel) then
    Exit;

  if (TJSSpedContribuicoesModelRegistroF130(AModel).vlBcPis = 0) then
    Exit;

  RegF130 := TJSSpedContribuicoesModelRegistroF130(AModel);
  if not Assigned(m105) then
    m105 := TObjectList<TJSSpedContribuicoesModelRegistroM105>.Create;

  RegM105 := TJSSpedContribuicoesModelRegistroM105.create;
  RegM105.AddOrSetValue('CODCRED',RegF130.GetValueStr('CODCRED'));
  RegM105.AddOrSetValue('ALIQPIS',RegF130.aliqPis);
  RegM105.natBcCred  := RegF130.natBcCred;
  RegM105.cstPis     := RegF130.cstPis;
  RegM105.vlBcPisTot := RegF130.vlBcPis;
  RegM105.vlBcPisCum := RegF130.GetValueDouble('VLBCPISCUM');
  RegM105.vlBcPisNC  := RegM105.vlBcPisTot -
                        RegM105.vlBcPisCum;
  RegM105.vlBcPis    := RegM105.vlBcPisNC;
  RegM105.descCred   := RegF130.GetValueStr('DESCCRED');

  if not m105.BinarySearch(RegM105, I, FComparerM105) then
    m105.Insert(I, RegM105)
  else
  begin
    FreeAndNil(RegM105);
    m105[I].vlBcPisTot    := m105[I].vlBcPisTot  + RegF130.vlBcPis;
    m105[I].vlBcPisNC     := m105[I].vlBcPisTot;
    m105[I].vlBcPis       := m105[I].vlBcPisNC;
  end;
end;

function TJSSpedContribuicoesServiceBlocoM.ConsolidaRetencaoCofins(
  AReg1700: TJSSpedContribuicoesModelRegistro1700): IJSSpedContribuicoesServiceBlocoM;
begin
  case FSpedContribuicoesService.Config.IncidenciaTributaria of
     iitRegimeNaoCumulativo           : begin
                                          if AReg1700.GetValueStr('REGAPU') = 'N' then
                                            regM600.vlRetNc := regM600.vlRetNc + AReg1700.GetValueDouble('VLRET');
                                        end;

     iitRegimeCumulativo              : begin
                                          if AReg1700.GetValueStr('REGAPU') = 'C' then
                                            regM600.vlRetCum := regM600.vlRetCum + AReg1700.GetValueDouble('VLRET');
                                        end;

     iitRegimeNaoCumulativoECumulativo: begin
                                          if AReg1700.GetValueStr('REGAPU') = 'N' then
                                            regM600.vlRetNc := regM600.vlRetNc + AReg1700.GetValueDouble('VLRET');

                                          if AReg1700.GetValueStr('REGAPU') = 'C' then
                                            regM600.vlRetCum := regM600.vlRetCum + AReg1700.GetValueDouble('VLRET');
                                        end;
  end;
end;

function TJSSpedContribuicoesServiceBlocoM.ConsolidaRetencaoPis(
  AReg1300: TJSSpedContribuicoesModelRegistro1300): IJSSpedContribuicoesServiceBlocoM;
begin
  case FSpedContribuicoesService.Config.IncidenciaTributaria of
     iitRegimeNaoCumulativo           : begin
                                          if AReg1300.GetValueStr('REGAPU') = 'N' then
                                            regM200.vlRetNc := regM200.vlRetNc + AReg1300.GetValueDouble('VLRET');
                                        end;

     iitRegimeCumulativo              : begin
                                          if AReg1300.GetValueStr('REGAPU') = 'C' then
                                            regM200.vlRetCum := regM200.vlRetCum + AReg1300.GetValueDouble('VLRET');
                                        end;

     iitRegimeNaoCumulativoECumulativo: begin
                                          if AReg1300.GetValueStr('REGAPU') = 'N' then
                                            regM200.vlRetNc := regM200.vlRetNc + + AReg1300.GetValueDouble('VLRET');

                                          if AReg1300.GetValueStr('REGAPU') = 'C' then
                                            regM200.vlRetCum := regM200.vlRetCum + + AReg1300.GetValueDouble('VLRET');
                                        end;
  end;
end;

function TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofins(
  AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBlocoM;
begin
  result  := Self;
  DetalhaContribCofinsA170(AModel);
  DetalhaContribCofinsC170(AModel);
  DetalhaContribCofinsC175(AModel);
  DetalhaContribCofinsC185(AModel);
  DetalhaContribCofinsC385(AModel);
  DetalhaContribCofinsC485(AModel);
  DetalhaContribCofinsC495(AModel);
  DetalhaContribCofinsC810(AModel);
  DetalhaContribCofinsC870(AModel);
  DetalhaContribCofinsD205(AModel);
  DetalhaContribCofinsF100(AModel);
  DetalhaContribCofinsF500(AModel);
  DetalhaContribCofinsF550(AModel);
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsA170(AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegA170 : TJSSpedContribuicoesModelRegistroA170;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroA170>(AModel) then
    Exit;

  RegA170 := TJSSpedContribuicoesModelRegistroA170(AModel);
  if RegA170.vlBcCofins > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegA170.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegA170.vlItem;
    RegM610.vlBcCont   := RegA170.vlBcCofins;
    RegM610.aliqCofins := RegA170.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegA170.cstCofins) and
     (RegA170.vlItem > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegA170.cstCofins);
    RegM810.natRec  := RegA170.GetValueStr('NATREC');
    RegM810.vlRec   := RegA170.vlItem;
    RegM810.codCta  := RegA170.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsC170(AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegC170 : TJSSpedContribuicoesModelRegistroC170;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC170>(AModel) then
    Exit;

  RegC170 := TJSSpedContribuicoesModelRegistroC170(AModel);
  if RegC170.vlBcCofins > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegC170.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegC170.vlItem;
    RegM610.vlBcCont   := RegC170.vlBcCofins;
    RegM610.aliqCofins := RegC170.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC170.cstCofins) and
     (RegC170.vlItem > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegC170.cstCofins);
    RegM810.natRec  := RegC170.GetValueStr('NATREC');
    RegM810.vlRec   := RegC170.vlItem;
    RegM810.codCta  := RegC170.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsC175(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegC175 : TJSSpedContribuicoesModelRegistroC175;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC175>(AModel) then
    Exit;

  RegC175 := TJSSpedContribuicoesModelRegistroC175(AModel);
  if RegC175.vlBcCofins > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegC175.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegC175.vlOpr;
    RegM610.vlBcCont   := RegC175.vlBcCofins;
    RegM610.aliqCofins := RegC175.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC175.cstCofins) and
     (RegC175.vlOpr > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegC175.cstCofins);
    RegM810.natRec  := RegC175.GetValueStr('NATREC');
    RegM810.vlRec   := RegC175.vlOpr;
    RegM810.codCta  := RegC175.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsC185(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegC185 : TJSSpedContribuicoesModelRegistroC185;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC185>(AModel) then
    Exit;

  RegC185 := TJSSpedContribuicoesModelRegistroC185(AModel);
  if RegC185.vlBcCofins > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegC185.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegC185.vlItem;
    RegM610.vlBcCont   := RegC185.vlBcCofins;
    RegM610.aliqCofins := RegC185.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC185.cstCofins) and
     (RegC185.vlItem > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegC185.cstCofins);
    RegM810.natRec  := RegC185.GetValueStr('NATREC');
    RegM810.vlRec   := RegC185.vlItem;
    RegM810.codCta  := RegC185.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsC385(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegC385 : TJSSpedContribuicoesModelRegistroC385;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC385>(AModel) then
    Exit;

  RegC385 := TJSSpedContribuicoesModelRegistroC385(AModel);
  if RegC385.vlBcCofins > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegC385.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegC385.vlItem;
    RegM610.vlBcCont   := RegC385.vlBcCofins;
    RegM610.aliqCofins := RegC385.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC385.cstCofins) and
     (RegC385.vlItem > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegC385.cstCofins);
    RegM810.natRec  := RegC385.GetValueStr('NATREC');
    RegM810.vlRec   := RegC385.vlItem;
    RegM810.codCta  := RegC385.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsC485(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegC485 : TJSSpedContribuicoesModelRegistroC485;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC485>(AModel) then
    Exit;

  RegC485 := TJSSpedContribuicoesModelRegistroC485(AModel);
  if RegC485.vlBcCofins > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegC485.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegC485.vlItem;
    RegM610.vlBcCont   := RegC485.vlBcCofins;
    RegM610.aliqCofins := RegC485.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC485.cstCofins) and
     (RegC485.vlItem > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegC485.cstCofins);
    RegM810.natRec  := RegC485.GetValueStr('NATREC');
    RegM810.vlRec   := RegC485.vlItem;
    RegM810.codCta  := RegC485.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsC495(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegC495 : TJSSpedContribuicoesModelRegistroC495;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC495>(AModel) then
    Exit;

  RegC495 := TJSSpedContribuicoesModelRegistroC495(AModel);
  if RegC495.vlBcCofins > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegC495.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegC495.vlItem;
    RegM610.vlBcCont   := RegC495.vlBcCofins;
    RegM610.aliqCofins := RegC495.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC495.cstCofins) and
     (RegC495.vlItem > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegC495.cstCofins);
    RegM810.natRec  := RegC495.GetValueStr('NATREC');
    RegM810.vlRec   := RegC495.vlItem;
    RegM810.codCta  := RegC495.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsC810(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegC810 : TJSSpedContribuicoesModelRegistroC810;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC810>(AModel) then
    Exit;

  RegC810 := TJSSpedContribuicoesModelRegistroC810(AModel);
  if RegC810.vlBcCofins > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegC810.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegC810.vlItem;
    RegM610.vlBcCont   := RegC810.vlBcCofins;
    RegM610.aliqCofins := RegC810.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC810.cstCofins) and
     (RegC810.vlItem > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegC810.cstCofins);
    RegM810.natRec  := RegC810.GetValueStr('NATREC');
    RegM810.vlRec   := RegC810.vlItem;
    RegM810.codCta  := RegC810.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsC870(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegC870 : TJSSpedContribuicoesModelRegistroC870;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC870>(AModel) then
    Exit;

  RegC870 := TJSSpedContribuicoesModelRegistroC870(AModel);
  if RegC870.vlBcPis > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegC870.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegC870.vlItem;
    RegM610.vlBcCont   := RegC870.vlBcCofins;
    RegM610.aliqCofins := RegC870.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC870.cstCofins) and
     (RegC870.vlItem > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegC870.cstCofins);
    RegM810.natRec  := RegC870.GetValueStr('NATREC');
    RegM810.vlRec   := RegC870.vlItem;
    RegM810.codCta  := RegC870.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsD205(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegD205 : TJSSpedContribuicoesModelRegistroD205;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroD205>(AModel) then
    Exit;

  RegD205 := TJSSpedContribuicoesModelRegistroD205(AModel);
  if RegD205.vlBcCofins > 0 then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegD205.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegD205.vlItem;
    RegM610.vlBcCont   := RegD205.vlBcCofins;
    RegM610.aliqCofins := RegD205.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegD205.cstCofins) and
     (RegD205.vlItem > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegD205.cstCofins);
    RegM810.natRec  := RegD205.GetValueStr('NATREC');
    RegM810.vlRec   := RegD205.vlItem;
    RegM810.codCta  := RegD205.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsF100(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegF100 : TJSSpedContribuicoesModelRegistroF100;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF100>(AModel) then
    Exit;

  RegF100 := TJSSpedContribuicoesModelRegistroF100(AModel);
  if (RegF100.vlBcCofins > 0) and
     (RegF100.aliqCofins > 0) and
     (RegF100.vlOper > 0)  and
     (RegF100.indOper <> tofAquisicaoPisCofins) then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegF100.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegF100.vlOper;
    RegM610.vlBcCont   := RegF100.vlBcCofins;
    RegM610.aliqCofins := RegF100.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegF100.cstCofins) and
     (RegF100.indOper <> tofAquisicaoPisCofins) and
     (RegF100.vlOper > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegF100.cstCofins);
    RegM810.natRec  := RegF100.GetValueStr('NATREC');
    RegM810.vlRec   := RegF100.vlOper;
    RegM810.codCta  := RegF100.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsF200(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegF200 : TJSSpedContribuicoesModelRegistroF200;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF200>(AModel) then
    Exit;

  RegF200 := TJSSpedContribuicoesModelRegistroF200(AModel);
  if (RegF200.vlBcCofins > 0) then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegF200.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegF200.vlTotRec;
    RegM610.vlBcCont   := RegF200.vlBcCofins;
    RegM610.aliqCofins := RegF200.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegF200.cstCofins) and
     (RegF200.vlTotRec > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegF200.cstCofins);
    RegM810.natRec  := RegF200.GetValueStr('NATREC');
    RegM810.vlRec   := RegF200.vlTotRec;
    //RegM810.codCta  := RegF200.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsF500(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegF500 : TJSSpedContribuicoesModelRegistroF500;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF500>(AModel) then
    Exit;

  RegF500 := TJSSpedContribuicoesModelRegistroF500(AModel);
  if (RegF500.vlBcCofins > 0) then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegF500.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegF500.vlRecCaixa;
    RegM610.vlBcCont   := RegF500.vlBcCofins;
    RegM610.aliqCofins := RegF500.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegF500.cstCofins) and
     (RegF500.vlRecCaixa > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegF500.cstCofins);
    RegM810.natRec  := RegF500.GetValueStr('NATREC');
    RegM810.vlRec   := RegF500.vlRecCaixa;
    //RegM810.codCta  := RegF500.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsF550(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM610 : TJSSpedContribuicoesModelRegistroM610;
  RegM810 : TJSSpedContribuicoesModelRegistroM810;
  RegF550 : TJSSpedContribuicoesModelRegistroF550;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF550>(AModel) then
    Exit;

  RegF550 := TJSSpedContribuicoesModelRegistroF550(AModel);
  if (RegF550.vlRecComp > 0) then
  begin
    RegM610 := TJSSpedContribuicoesModelRegistroM610.create;
    RegM610.codCont    := RegF550.GetValueStr('CODCONT');
    RegM610.vlRecBrt   := RegF550.vlRecComp;
    RegM610.vlBcCont   := RegF550.vlBcCofins;
    RegM610.aliqCofins := RegF550.aliqCofins;
    DetalhaContribCofinsTributada(RegM610);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegF550.cstCofins) and
     (RegF550.vlRecComp > 0) then
  begin
    RegM810 := TJSSpedContribuicoesModelRegistroM810.create;
    RegM810.AddOrSetValue('CSTCOFINS',RegF550.cstCofins);
    RegM810.natRec  := RegF550.GetValueStr('NATREC');
    RegM810.vlRec   := RegF550.vlRecComp;
    //RegM810.codCta  := RegF550.codCta;
    DetalhaContribCofinsNaoTributada(RegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsNaoTributada(
  ARegM810: TJSSpedContribuicoesModelRegistroM810);
var
  I: Integer;
begin
  if not Assigned(m810) then
    m810 := TObjectList<TJSSpedContribuicoesModelRegistroM810>.Create;

  if not m810.BinarySearch(ARegM810, I, FComparerM810) then
    m810.Insert(I, ARegM810)
  else
  begin
    m810[I].vlRec := m810[I].vlRec + ARegM810.vlRec;
    FreeAndNil(ARegM810);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribCofinsTributada(
  ARegM610: TJSSpedContribuicoesModelRegistroM610);
var
  I: Integer;
begin
  if not Assigned(m610) then
    m610 := TObjectList<TJSSpedContribuicoesModelRegistroM610>.Create;

  if not m610.BinarySearch(ARegM610, I, FComparerM610) then
    m610.Insert(I, ARegM610)
  else
  begin
    m610[I].vlBcCont    := m610[I].vlBcCont  + ARegM610.vlBcCont;
    m610[I].vlRecBrt    := m610[I].vlRecBrt  + ARegM610.vlRecBrt;
    FreeAndNil(ARegM610);
  end;
end;

function TJSSpedContribuicoesServiceBlocoM.DetalhaContribPis(
  AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBlocoM;
begin
  result  := Self;
  DetalhaContribPisA170(AModel);
  DetalhaContribPisC170(AModel);
  DetalhaContribPisC175(AModel);
  DetalhaContribPisC181(AModel);
  DetalhaContribPisC381(AModel);
  DetalhaContribPisC481(AModel);
  DetalhaContribPisC491(AModel);
  DetalhaContribPisC810(AModel);
  DetalhaContribPisC870(AModel);
  DetalhaContribPisD201(AModel);
  DetalhaContribPisF100(AModel);
  DetalhaContribPisF500(AModel);
  DetalhaContribPisF550(AModel);
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisA170(AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegA170 : TJSSpedContribuicoesModelRegistroA170;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroA170>(AModel) then
    Exit;

  RegA170 := TJSSpedContribuicoesModelRegistroA170(AModel);
  if RegA170.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegA170.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegA170.vlItem;
    RegM210.vlBcCont := RegA170.vlBcPis;
    RegM210.aliqPis  := RegA170.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegA170.cstPis) and
     (RegA170.vlItem > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegA170.cstPis);
    RegM410.natRec  := RegA170.GetValueStr('NATREC');
    RegM410.vlRec   := RegA170.vlItem;
    RegM410.codCta  := RegA170.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisC170(AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegC170 : TJSSpedContribuicoesModelRegistroC170;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC170>(AModel) then
    Exit;

  RegC170 := TJSSpedContribuicoesModelRegistroC170(AModel);
  if RegC170.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegC170.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegC170.vlItem;
    RegM210.vlBcCont := RegC170.vlBcPis;
    RegM210.aliqPis  := RegC170.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC170.cstPis) and
     (RegC170.vlItem > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegC170.cstPis);
    RegM410.natRec  := RegC170.GetValueStr('NATREC');
    RegM410.vlRec   := RegC170.vlItem;
    RegM410.codCta  := RegC170.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisC175(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegC175 : TJSSpedContribuicoesModelRegistroC175;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC175>(AModel) then
    Exit;

  RegC175 := TJSSpedContribuicoesModelRegistroC175(AModel);
  if RegC175.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegC175.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegC175.vlOpr;
    RegM210.vlBcCont := RegC175.vlBcPis;
    RegM210.aliqPis  := RegC175.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC175.cstPis) and
     (RegC175.vlOpr > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegC175.cstPis);
    RegM410.natRec  := RegC175.GetValueStr('NATREC');
    RegM410.vlRec   := RegC175.vlOpr;
    RegM410.codCta  := RegC175.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisC181(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegC181 : TJSSpedContribuicoesModelRegistroC181;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC181>(AModel) then
    Exit;

  RegC181 := TJSSpedContribuicoesModelRegistroC181(AModel);
  if RegC181.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegC181.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegC181.vlItem;
    RegM210.vlBcCont := RegC181.vlBcPis;
    RegM210.aliqPis  := RegC181.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC181.cstPis) and
     (RegC181.vlItem > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegC181.cstPis);
    RegM410.natRec  := RegC181.GetValueStr('NATREC');
    RegM410.vlRec   := RegC181.vlItem;
    RegM410.codCta  := RegC181.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisC381(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegC381 : TJSSpedContribuicoesModelRegistroC381;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC381>(AModel) then
    Exit;

  RegC381 := TJSSpedContribuicoesModelRegistroC381(AModel);
  if RegC381.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegC381.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegC381.vlItem;
    RegM210.vlBcCont := RegC381.vlBcPis;
    RegM210.aliqPis  := RegC381.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC381.cstPis) and
     (RegC381.vlItem > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegC381.cstPis);
    RegM410.natRec  := RegC381.GetValueStr('NATREC');
    RegM410.vlRec   := RegC381.vlItem;
    RegM410.codCta  := RegC381.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisC481(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegC481 : TJSSpedContribuicoesModelRegistroC481;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC481>(AModel) then
    Exit;

  RegC481 := TJSSpedContribuicoesModelRegistroC481(AModel);
  if RegC481.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegC481.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegC481.vlItem;
    RegM210.vlBcCont := RegC481.vlBcPis;
    RegM210.aliqPis  := RegC481.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC481.cstPis) and
     (RegC481.vlItem > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegC481.cstPis);
    RegM410.natRec  := RegC481.GetValueStr('NATREC');
    RegM410.vlRec   := RegC481.vlItem;
    RegM410.codCta  := RegC481.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisC491(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegC491 : TJSSpedContribuicoesModelRegistroC491;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC491>(AModel) then
    Exit;

  RegC491 := TJSSpedContribuicoesModelRegistroC491(AModel);
  if RegC491.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegC491.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegC491.vlItem;
    RegM210.vlBcCont := RegC491.vlBcPis;
    RegM210.aliqPis  := RegC491.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC491.cstPis) and
     (RegC491.vlItem > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegC491.cstPis);
    RegM410.natRec  := RegC491.GetValueStr('NATREC');
    RegM410.vlRec   := RegC491.vlItem;
    RegM410.codCta  := RegC491.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisC810(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegC810 : TJSSpedContribuicoesModelRegistroC810;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC810>(AModel) then
    Exit;

  RegC810 := TJSSpedContribuicoesModelRegistroC810(AModel);
  if RegC810.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegC810.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegC810.vlItem;
    RegM210.vlBcCont := RegC810.vlBcPis;
    RegM210.aliqPis  := RegC810.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC810.cstPis) and
     (RegC810.vlItem > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegC810.cstPis);
    RegM410.natRec  := RegC810.GetValueStr('NATREC');
    RegM410.vlRec   := RegC810.vlItem;
    RegM410.codCta  := RegC810.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisC870(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegC870 : TJSSpedContribuicoesModelRegistroC870;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC870>(AModel) then
    Exit;

  RegC870 := TJSSpedContribuicoesModelRegistroC870(AModel);
  if RegC870.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegC870.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegC870.vlItem;
    RegM210.vlBcCont := RegC870.vlBcPis;
    RegM210.aliqPis  := RegC870.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegC870.cstPis) and
     (RegC870.vlItem > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegC870.cstPis);
    RegM410.natRec  := RegC870.GetValueStr('NATREC');
    RegM410.vlRec   := RegC870.vlItem;
    RegM410.codCta  := RegC870.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisD201(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegD201 : TJSSpedContribuicoesModelRegistroD201;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroD201>(AModel) then
    Exit;

  RegD201 := TJSSpedContribuicoesModelRegistroD201(AModel);
  if RegD201.vlBcPis > 0 then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegD201.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegD201.vlItem;
    RegM210.vlBcCont := RegD201.vlBcPis;
    RegM210.aliqPis  := RegD201.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegD201.cstPis) and
     (RegD201.vlItem > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegD201.cstPis);
    RegM410.natRec  := RegD201.GetValueStr('NATREC');
    RegM410.vlRec   := RegD201.vlItem;
    RegM410.codCta  := RegD201.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisF100(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegF100 : TJSSpedContribuicoesModelRegistroF100;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF100>(AModel) then
    Exit;

  RegF100 := TJSSpedContribuicoesModelRegistroF100(AModel);
  if (RegF100.vlBcPis > 0) and
     (RegF100.aliqPis > 0) and
     (RegF100.vlOper > 0)  and
     (RegF100.indOper <> tofAquisicaoPisCofins) then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegF100.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegF100.vlOper;
    RegM210.vlBcCont := RegF100.vlBcPis;
    RegM210.aliqPis  := RegF100.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegF100.cstPis) and
     (RegF100.indOper <> tofAquisicaoPisCofins) and
     (RegF100.vlOper > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegF100.cstPis);
    RegM410.natRec  := RegF100.GetValueStr('NATREC');
    RegM410.vlRec   := RegF100.vlOper;
    RegM410.codCta  := RegF100.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisF200(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegF200 : TJSSpedContribuicoesModelRegistroF200;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF200>(AModel) then
    Exit;

  RegF200 := TJSSpedContribuicoesModelRegistroF200(AModel);
  if (RegF200.vlBcPis > 0) then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegF200.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegF200.vlTotRec;
    RegM210.vlBcCont := RegF200.vlBcPis;
    RegM210.aliqPis  := RegF200.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegF200.cstPis) and
     (RegF200.vlTotRec > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegF200.cstPis);
    RegM410.natRec  := RegF200.GetValueStr('NATREC');
    RegM410.vlRec   := RegF200.vlTotRec;
    //RegM410.codCta  := RegF200.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisF500(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegF500 : TJSSpedContribuicoesModelRegistroF500;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF500>(AModel) then
    Exit;

  RegF500 := TJSSpedContribuicoesModelRegistroF500(AModel);
  if (RegF500.vlBcPis > 0) then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegF500.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegF500.vlRecCaixa;
    RegM210.vlBcCont := RegF500.vlBcPis;
    RegM210.aliqPis  := RegF500.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegF500.cstPis) and
     (RegF500.vlRecCaixa > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegF500.cstPis);
    RegM410.natRec  := RegF500.GetValueStr('NATREC');
    RegM410.vlRec   := RegF500.vlRecCaixa;
    //RegM410.codCta  := RegF500.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisF550(
  AModel: TJSSpedContribuicoesModelRegistro);
var
  RegM210 : TJSSpedContribuicoesModelRegistroM210;
  RegM410 : TJSSpedContribuicoesModelRegistroM410;
  RegF550 : TJSSpedContribuicoesModelRegistroF550;
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF550>(AModel) then
    Exit;

  RegF550 := TJSSpedContribuicoesModelRegistroF550(AModel);
  if (RegF550.vlBcPis > 0) then
  begin
    RegM210 := TJSSpedContribuicoesModelRegistroM210.create;
    RegM210.codCont  := RegF550.GetValueStr('CODCONT');
    RegM210.vlRecBrt := RegF550.vlRecComp;
    RegM210.vlBcCont := RegF550.vlBcPis;
    RegM210.aliqPis  := RegF550.aliqPis;
    DetalhaContribPisTributada(RegM210);
  end;

  if lstCST_PISCOFINS_NTRIB.Contains(RegF550.cstPis) and
     (RegF550.vlRecComp > 0) then
  begin
    RegM410 := TJSSpedContribuicoesModelRegistroM410.create;
    RegM410.AddOrSetValue('CSTPIS',RegF550.cstPis);
    RegM410.natRec  := RegF550.GetValueStr('NATREC');
    RegM410.vlRec   := RegF550.vlRecComp;
    //RegM410.codCta  := RegF550.codCta;
    DetalhaContribPisNaoTributada(RegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisNaoTributada(
  ARegM410: TJSSpedContribuicoesModelRegistroM410);
var
  I: Integer;
begin
  if not Assigned(m410) then
    m410 := TObjectList<TJSSpedContribuicoesModelRegistroM410>.Create;

  if not m410.BinarySearch(ARegM410, I, FComparerM410) then
    m410.Insert(I, ARegM410)
  else
  begin
    m410[I].vlRec := m410[I].vlRec + ARegM410.vlRec;
    FreeAndNil(ARegM410);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.DetalhaContribPisTributada(
  ARegM210: TJSSpedContribuicoesModelRegistroM210);
var
  I: Integer;
begin
  if not Assigned(m210) then
    m210 := TObjectList<TJSSpedContribuicoesModelRegistroM210>.Create;

  if not m210.BinarySearch(ARegM210, I, FComparerM210) then
    m210.Insert(I, ARegM210)
  else
  begin
    m210[I].vlBcCont    := m210[I].vlBcCont  + ARegM210.vlBcCont;
    m210[I].vlRecBrt    := m210[I].vlRecBrt  + ARegM210.vlRecBrt;
    FreeAndNil(ARegM210);
  end;
end;

function TJSSpedContribuicoesServiceBlocoM.&End: IJSSpedContribuicoesService;
begin
  result := FSpedContribuicoesService;
end;

function TJSSpedContribuicoesServiceBlocoM.Execute: TStrings;
var
  regM001 : TJSSpedContribuicoesModelRegistroM001;
  regM990 : TJSSpedContribuicoesModelRegistroM990;

  procedure addSped(AReg: TStrings);
  var
    i : Integer;
  begin
    for i := 0 to Pred(AReg.Count) do
      FArquivo.Add(AReg[i]);
  end;
begin
  try
    regM001 := nil;
    regM990 := nil;
    try
      gerarM100;
      gerarM200;
      gerarM350;
      gerarM400;
      gerarM500;
      gerarM600;
      gerarM800;

      regM001 := TJSSpedContribuicoesModelRegistroM001.create;
      if FArquivo.Count > 0 then
        regM001.indMov := imComDadosInformados;
      AdicionaLinhaSped(regM001,0);

      regM990 := TJSSpedContribuicoesModelRegistroM990.create;
      regM990.qtdlinM := regM990.qtdlinM + FArquivo.Count;
      AdicionaLinhaSped(regM990);

      result := FArquivo;
    finally
      regM001.Free;
      regM990.Free;
    end;
  except
    on e: Exception Do
    begin
      FArquivo.Free;
      OnLogErro('Houve erro na geração do blooo M: ' + e.Message);
      Raise;
    end;
  end;
end;

function TJSSpedContribuicoesServiceBlocoM.IsReceitaExpCst_54_64(AModel: TJSSpedContribuicoesModelRegistro): boolean;
var
  CodCred, Cst: String;
begin
  if validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel) then
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM105(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM105(AModel).cstPis;
  end
  else
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM505(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM505(AModel).cstCofins;
  end;

  Result := lstReceitaExportacao.Contains(CodCred) and lstCst_54_64.Contains(Cst);
end;

function TJSSpedContribuicoesServiceBlocoM.IsReceitaExpCst_55_65(AModel: TJSSpedContribuicoesModelRegistro): boolean;
var
  CodCred, Cst: String;
begin
  if validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel) then
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM105(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM105(AModel).cstPis;
  end
  else
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM505(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM505(AModel).cstCofins;
  end;

  Result := lstReceitaExportacao.Contains(CodCred) and lstCst_55_65.Contains(Cst);
end;

function TJSSpedContribuicoesServiceBlocoM.IsReceitaExpCst_56_66(AModel: TJSSpedContribuicoesModelRegistro): boolean;
var
  CodCred, Cst: String;
begin
  if validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel) then
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM105(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM105(AModel).cstPis;
  end
  else
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM505(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM505(AModel).cstCofins;
  end;

  Result := lstReceitaExportacao.Contains(CodCred) and lstCst_56_66.Contains(Cst);
end;

function TJSSpedContribuicoesServiceBlocoM.IsReceitaNaoTribCst_53_63(AModel: TJSSpedContribuicoesModelRegistro): boolean;
var
  CodCred, Cst: String;
begin
  if validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel) then
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM105(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM105(AModel).cstPis;
  end
  else
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM505(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM505(AModel).cstCofins;
  end;

  Result := lstReceitaNaoTributadaMI.Contains(CodCred) and lstCst_53_63.Contains(Cst);
end;

function TJSSpedContribuicoesServiceBlocoM.IsReceitaNaoTribCst_55_65(AModel: TJSSpedContribuicoesModelRegistro): boolean;
var
  CodCred, Cst: String;
begin
  if validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel) then
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM105(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM105(AModel).cstPis;
  end
  else
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM505(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM505(AModel).cstCofins;
  end;

  Result := lstReceitaNaoTributadaMI.Contains(CodCred) and lstCst_55_65.Contains(Cst);
end;

function TJSSpedContribuicoesServiceBlocoM.IsReceitaNaoTribCst_56_66(AModel: TJSSpedContribuicoesModelRegistro): boolean;
var
  CodCred, Cst: String;
begin
  if validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel) then
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM105(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM105(AModel).cstPis;
  end
  else
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM505(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM505(AModel).cstCofins;
  end;

  Result := lstReceitaNaoTributadaMI.Contains(CodCred) and lstCst_56_66.Contains(Cst);
end;

function TJSSpedContribuicoesServiceBlocoM.IsReceitaTribCst_53_63(AModel: TJSSpedContribuicoesModelRegistro): boolean;
var
  CodCred, Cst: String;
begin
  if validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel) then
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM105(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM105(AModel).cstPis;
  end
  else
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM505(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM505(AModel).cstCofins;
  end;

  Result := lstReceitaTributadaMI.Contains(CodCred) and lstCst_53_63.Contains(Cst);
end;

function TJSSpedContribuicoesServiceBlocoM.IsReceitaTribCst_54_64(AModel: TJSSpedContribuicoesModelRegistro): boolean;
var
  CodCred, Cst: String;
begin
  if validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel) then
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM105(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM105(AModel).cstPis;
  end
  else
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM505(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM505(AModel).cstCofins;
  end;

  Result := lstReceitaTributadaMI.Contains(CodCred) and lstCst_54_64.Contains(Cst);
end;

function TJSSpedContribuicoesServiceBlocoM.IsReceitaTribCst_56_66(AModel: TJSSpedContribuicoesModelRegistro): boolean;
var
  CodCred, Cst: String;
begin
  if validateInstance<TJSSpedContribuicoesModelRegistroM105>(AModel) then
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM105(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM105(AModel).cstPis;
  end
  else
  begin
    CodCred := TJSSpedContribuicoesModelRegistroM505(AModel).GetValueStr('CODCRED');
    Cst     := TJSSpedContribuicoesModelRegistroM505(AModel).cstCofins;
  end;

  Result := lstReceitaTributadaMI.Contains(CodCred) and lstCst_56_66.Contains(Cst);
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM100;
var
  i, j    : Integer;
  nSaldo  : Currency;
  regM100 : TJSSpedContribuicoesModelRegistroM100;
  m100    : TObjectList<TJSSpedContribuicoesModelRegistroM100>;
  m110    : TObjectList<TJSSpedContribuicoesModelRegistroM110>;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa then
    Exit;

  if not FSpedContribuicoesService.Config.GerarBlocoM then
    Exit;

  m100 := TObjectList<TJSSpedContribuicoesModelRegistroM100>.Create;
  m110 := FSpedContribuicoesService.DAO.BlocoM.DAOM110.list(FSpedContribuicoesService.Config.DataInicial);

  IncluiCredPisOutrasReceitas;
  CalcCredPisMaisDeUmaReceita;
  ConsolidaCredPisM105(m100);
  ConsolidaCredPisM110(m100, m110);

  try
    if (m100.Count = 0) then
      Exit;

    nSaldo := 0;
    for i := 0 to pred(m100.Count) do
    begin
      regM100 := m100[i];

      nSaldo := nSaldo + Double(FSpedContribuicoesService.Config.GetVlCredDescPis(regM100.codCred)).roundABNT;

      regM100.indCredOri := '0';
      regM100.vlCred     := Double(regM100.vlBcPis * regM100.aliqPis / 100).roundABNT;
      regM100.vlCredDisp := regM100.vlCred + regM100.vlAjusAcres - regM100.vlAjusReduc - regM100.vlCredDif;

      regM100.vlCredDesc := nSaldo;
      if nSaldo > regM100.vlCredDisp then
      begin
        regM100.vlCredDesc := regM100.vlCredDisp;
        nSaldo := nSaldo - regM100.vlCredDisp;
      end;

      regM100.sldCred    := regM100.vlCredDisp - regM100.vlCredDesc;

      regM100.indDescCred := '0';
      if regM100.sldCred > 0 then
        regM100.indDescCred := '1';

      AdicionaLinhaSped(regM100, FArquivo);
      gerarM105(regM100);
      gerarM110(regM100, m110);

      ConsolidaContribPisM100(regM100);
    end;
  finally
    m100.Free;
    m110.Free;
  end;

end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM105(ARegM100: TJSSpedContribuicoesModelRegistroM100);
var
  regM105  : TJSSpedContribuicoesModelRegistroM105;
  i        : Integer;
begin
  if not Assigned(m105) then
    Exit;

  for i := 0 to Pred(m105.Count) do
  begin
    regM105 := m105[i];
    if regM105.GetValueStr('CODCRED') = ARegM100.codCred then
      AdicionaLinhaSped(regM105, FArquivo);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM110(ARegM100: TJSSpedContribuicoesModelRegistroM100;
  AM110List: TObjectList<TJSSpedContribuicoesModelRegistroM110>);
var
  i       : Integer;
  regM110 : TJSSpedContribuicoesModelRegistroM110;
begin
  if (not Assigned(AM110List)) or (AM110List.Count = 0) then
    Exit;

  for i := 0 to Pred(AM110List.Count) do
  begin
    regM110 := AM110List[i];
    if regM110.GetValueStr('CODCRED') = ARegM100.codCred then
    begin
      AdicionaLinhaSped(regM110,FArquivo);
      if FSpedContribuicoesService.Config.DataInicial >= EncodeDate(2014,5,1) then
        gerarM115(regM110);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM115(
  ARegM110: TJSSpedContribuicoesModelRegistroM110);
var
  i       : Integer;
  regM115 : TJSSpedContribuicoesModelRegistroM115;
  m115    : TObjectList<TJSSpedContribuicoesModelRegistroM115>;
begin
  m115 := FSpedContribuicoesService.DAO.BlocoM.DAOM115.list(ARegM110);
  try
    if (not Assigned(m115)) or (m115.Count = 0) then
      Exit;

    for i := 0 to Pred(m115.Count) do
    begin
      regM115 := m115[i];
      AdicionaLinhaSped(regM115, FArquivo);
      FBloco0.AddCodConta(regM115.codCta);
    end;
  finally
    m115.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM200;
var
  i       : Integer;
  m220    : TObjectList<TJSSpedContribuicoesModelRegistroM220>;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa then
  begin
    AdicionaLinhaSped(regM200, FArquivo);
    Exit;
  end;

  if not FSpedContribuicoesService.Config.GerarBlocoM then
    Exit;

  m220 := FSpedContribuicoesService.DAO.BlocoM.DAOM220.list(FSpedContribuicoesService.Config.DataInicial);
  try
    ConsolidaContribPisM220(m220);
    ConsolidaContribPisM210;

    regM200.vlTotContNcDev := regM200.vlTotContNcPer  - regM200.vlTotCredDesc - regM200.vlTotCredDescAnt;
    if regM200.vlTotContNcDev < 0 then
      regM200.vlTotContNcDev := 0;

    regM200.vlContNcRec    := regM200.vlTotContNcDev  - regM200.vlRetNc       - regM200.vlOutDedNc;
    regM200.vlContCumRec   := regM200.vlTotContCumPer - regM200.vlRetCum      - regM200.vlOutDedCum;
    regM200.vlTotContRec   := regM200.vlContNcRec     + regM200.vlContCumRec;

    AdicionaLinhaSped(regM200, FArquivo);
    gerarM205;
    gerarM210(m220);
  finally
    m220.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM205;
var
  regM205 : TJSSpedContribuicoesModelRegistroM205;
begin
  if FSpedContribuicoesService.Config.DataInicial < EncodeDate(2014,1,1) then
    Exit;

  regM205 := TJSSpedContribuicoesModelRegistroM205.create;
  try
    if not FSpedContribuicoesService.Config.CodDctfPisNC.IsEmpty and (regM200.vlContNcRec > 0) then
    begin
      regM205.numCampo := '08';
      regM205.codRec   := FSpedContribuicoesService.Config.CodDctfPisNC;
      regM205.vlDebito := regM200.vlContNcRec;
      AdicionaLinhaSped(regM205, FArquivo);
    end;

    if not FSpedContribuicoesService.Config.coddctfpiscum.IsEmpty and (regM200.vlContCumRec > 0) then
    begin
      regM205.numCampo := '12';
      regM205.codRec   := FSpedContribuicoesService.Config.CodDctfPisCum;
      regM205.vlDebito := regM200.vlContCumRec;
      AdicionaLinhaSped(regM205, FArquivo);
    end;
  finally
    regM205.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM210(AM220List: TObjectList<TJSSpedContribuicoesModelRegistroM220>);
var
  regM210  : TJSSpedContribuicoesModelRegistroM210;
  i        : Integer;
begin
  if not Assigned(m210) then
    Exit;

  try
    for i := 0 to Pred(m210.Count) do
    begin
      regM210 := m210[i];
      AdicionaLinhaSped(regM210, FArquivo);
      gerarM220(regM210, AM220List);
    end;
  finally
    m210.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM220(ARegM210: TJSSpedContribuicoesModelRegistroM210;
  AM220List: TObjectList<TJSSpedContribuicoesModelRegistroM220>);
var
  regM220  : TJSSpedContribuicoesModelRegistroM220;
  i        : Integer;
begin
  if not Assigned(AM220List) then
    Exit;

  for i := 0 to Pred(AM220List.Count) do
  begin
    regM220 := AM220List[i];
    if regM220.GetValueStr('CODCONT') = ARegM210.codCont then
    begin
      AdicionaLinhaSped(regM220, FArquivo);
      gerarM225(regM220);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM225(
  ARegM220: TJSSpedContribuicoesModelRegistroM220);
var
  i       : Integer;
  m225    : TObjectList<TJSSpedContribuicoesModelRegistroM225>;
  regM225 : TJSSpedContribuicoesModelRegistroM225;
begin
  m225 := FSpedContribuicoesService.DAO.BlocoM.DAOM225.list(ARegM220);
  try
    if not Assigned(m225) or (m225.Count = 0) then
      Exit;

    for i :=0 to Pred(m225.Count) do
    begin
      regM225 := m225[i];
      AdicionaLinhaSped(regM225, FArquivo);
    end;
  finally
    m225.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM350;
var
  i       : Integer;
  regM350 : TJSSpedContribuicoesModelRegistroM350;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa then
    Exit;

  regM350 := FSpedContribuicoesService.DAO.BlocoM.DAOM350.load(FSpedContribuicoesService.Config.DataInicial);
  if not Assigned(regM350) then
    Exit;

  AdicionaLinhaSped(regM350, FArquivo);
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM400;
var
  i       : Integer;
  m400    : TObjectList<TJSSpedContribuicoesModelRegistroM400>;
  regM400 : TJSSpedContribuicoesModelRegistroM400;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa then
    Exit;

  m400 := TObjectList<TJSSpedContribuicoesModelRegistroM400>.Create;

  ConsolidaContribPisM410(m400);

  try
    if (m400.Count = 0) then
      Exit;

    for i := 0 to pred(m400.Count) do
    begin
      regM400 := m400[i];
      AdicionaLinhaSped(regM400, FArquivo);
      gerarM410(regM400);
    end;
  finally
    m400.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM410(
  ARegM400: TJSSpedContribuicoesModelRegistroM400);
var
  i       : Integer;
  regM410 : TJSSpedContribuicoesModelRegistroM410;
begin
  if (not Assigned(m410)) or (m410.Count = 0) then
      Exit;

  for i := 0 to pred(m410.Count) do
  begin
    regM410 := m410[i];
    if (regM410.GetValueStr('CSTPIS') = ARegM400.cstPis) and
       (regM410.codCta = ARegM400.codCta) then
    begin
      AdicionaLinhaSped(regM410, FArquivo);
      FBloco0.AddCodConta(regM410.codCta);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM500;
var
  i, j    : Integer;
  nSaldo  : Currency;
  regM500 : TJSSpedContribuicoesModelRegistroM500;
  m500    : TObjectList<TJSSpedContribuicoesModelRegistroM500>;
  m510    : TObjectList<TJSSpedContribuicoesModelRegistroM510>;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa then
    Exit;

  if not FSpedContribuicoesService.Config.GerarBlocoM then
    Exit;

  m500 := TObjectList<TJSSpedContribuicoesModelRegistroM500>.Create;
  m510 := FSpedContribuicoesService.DAO.BlocoM.DAOM510.list(FSpedContribuicoesService.Config.DataInicial);

  IncluiCredCofinsOutrasReceitas;
  CalcCredCofinsMaisDeUmaReceita;
  ConsolidaCredCofinsM505(m500);
  ConsolidaCredCofinsM510(m500, m510);

  try
    if (m500.Count = 0) then
      Exit;

    nSaldo := 0;
    for i := 0 to pred(m500.Count) do
    begin
      regM500 := m500[i];

      nSaldo := nSaldo + Double(FSpedContribuicoesService.Config.GetVlCredDescCofins(regM500.codCred)).roundABNT;

      regM500.indCredOri := '0';
      regM500.vlCred     := Double(regM500.vlBcCofins * regM500.aliqCofins / 100).roundABNT;
      regM500.vlCredDisp := regM500.vlCred + regM500.vlAjusAcres - regM500.vlAjusReduc - regM500.vlCredDif;

      regM500.vlCredDesc := nSaldo;
      if nSaldo > regM500.vlCredDisp then
      begin
        regM500.vlCredDesc := regM500.vlCredDisp;
        nSaldo := nSaldo - regM500.vlCredDisp;
      end;

      regM500.sldCred    := regM500.vlCredDisp - regM500.vlCredDesc;

      regM500.indDescCred := '0';
      if regM500.sldCred > 0 then
        regM500.indDescCred := '1';

      AdicionaLinhaSped(regM500, FArquivo);
      gerarM505(regM500);
      gerarM510(regM500, m510);

      ConsolidaContribCofinsM500(regM500);
    end;
  finally
    m500.Free;
    m510.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM505(ARegM500: TJSSpedContribuicoesModelRegistroM500);
var
  regM505  : TJSSpedContribuicoesModelRegistroM505;
  i        : Integer;
begin
  if not Assigned(m505) then
    Exit;

  for i := 0 to Pred(m505.Count) do
  begin
    regM505 := m505[i];
    if regM505.GetValueStr('CODCRED') = ARegM500.codCred then
      AdicionaLinhaSped(regM505, FArquivo);
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM510(ARegM500: TJSSpedContribuicoesModelRegistroM500;
  AM510List: TObjectList<TJSSpedContribuicoesModelRegistroM510>);
var
  i       : Integer;
  regM510 : TJSSpedContribuicoesModelRegistroM510;
begin
  if (not Assigned(AM510List)) or (AM510List.Count = 0) then
    Exit;

  for i := 0 to Pred(AM510List.Count) do
  begin
    regM510 := AM510List[i];
    if regM510.GetValueStr('CODCRED') = ARegM500.codCred then
    begin
      AdicionaLinhaSped(regM510,FArquivo);
      if FSpedContribuicoesService.Config.DataInicial >= EncodeDate(2014,5,1) then
        gerarM515(regM510);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM515(
  ARegM510: TJSSpedContribuicoesModelRegistroM510);
var
  i       : Integer;
  regM515 : TJSSpedContribuicoesModelRegistroM515;
  m515    : TObjectList<TJSSpedContribuicoesModelRegistroM515>;
begin
  m515 := FSpedContribuicoesService.DAO.BlocoM.DAOM515.list(ARegM510);
  try
    if (not Assigned(m515)) or (m515.Count = 0) then
      Exit;

    for i := 0 to Pred(m515.Count) do
    begin
      regM515 := m515[i];
      AdicionaLinhaSped(regM515, FArquivo);
      FBloco0.AddCodConta(regM515.codCta);
    end;
  finally
    m515.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM600;
var
  i       : Integer;
  m620    : TObjectList<TJSSpedContribuicoesModelRegistroM620>;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa then
  begin
    AdicionaLinhaSped(regM600, FArquivo);
    Exit;
  end;

  if not FSpedContribuicoesService.Config.GerarBlocoM then
    Exit;

  m620 := FSpedContribuicoesService.DAO.BlocoM.DAOM620.list(FSpedContribuicoesService.Config.DataInicial);
  try
    ConsolidaContribCofinsM620(m620);
    ConsolidaContribCofinsM610;

    regM600.vlTotContNcDev := regM600.vlTotContNcPer  - regM600.vlTotCredDesc - regM600.vlTotCredDescAnt;
    if regM600.vlTotContNcDev < 0 then
      regM600.vlTotContNcDev := 0;

    regM600.vlContNcRec    := regM600.vlTotContNcDev  - regM600.vlRetNc       - regM600.vlOutDedNc;
    regM600.vlContCumRec   := regM600.vlTotContCumPer - regM600.vlRetCum      - regM600.vlOutDedCum;
    regM600.vlTotContRec   := regM600.vlContNcRec     + regM600.vlContCumRec;

    AdicionaLinhaSped(regM600, FArquivo);
    gerarM605;
    gerarM610(m620);
  finally
    m620.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM605;
var
  regM605 : TJSSpedContribuicoesModelRegistroM605;
begin
  if FSpedContribuicoesService.Config.DataInicial < EncodeDate(2014,1,1) then
    Exit;

  regM605 := TJSSpedContribuicoesModelRegistroM605.create;
  try
    if not FSpedContribuicoesService.Config.CodDctfCofinsNC.IsEmpty and (regM600.vlContNcRec > 0) then
    begin
      regM605.numCampo := '08';
      regM605.codRec   := FSpedContribuicoesService.Config.CodDctfCofinsNC;
      regM605.vlDebito := regM600.vlContNcRec;
      AdicionaLinhaSped(regM605, FArquivo);
    end;

    if not FSpedContribuicoesService.Config.CodDctfCofinsCum.IsEmpty and (regM600.vlContCumRec > 0) then
    begin
      regM605.numCampo := '12';
      regM605.codRec   := FSpedContribuicoesService.Config.CodDctfCofinsCum;
      regM605.vlDebito := regM600.vlContCumRec;
      AdicionaLinhaSped(regM605, FArquivo);
    end;
  finally
    regM605.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM610(AM620List: TObjectList<TJSSpedContribuicoesModelRegistroM620>);
var
  regM610  : TJSSpedContribuicoesModelRegistroM610;
  i        : Integer;
begin
  if not Assigned(m610) then
    Exit;

  try
    for i := 0 to Pred(m610.Count) do
    begin
      regM610 := m610[i];
      AdicionaLinhaSped(regM610, FArquivo);
      gerarM620(regM610, AM620List);
    end;
  finally
    m610.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM620(ARegM610: TJSSpedContribuicoesModelRegistroM610;
  AM620List: TObjectList<TJSSpedContribuicoesModelRegistroM620>);
var
  regM620  : TJSSpedContribuicoesModelRegistroM620;
  i        : Integer;
begin
  if not Assigned(AM620List) then
    Exit;

  for i := 0 to Pred(AM620List.Count) do
  begin
    regM620 := AM620List[i];
    if regM620.GetValueStr('CODCONT') = ARegM610.codCont then
    begin
      AdicionaLinhaSped(regM620, FArquivo);
      gerarM625(regM620);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM625(
  ARegM620: TJSSpedContribuicoesModelRegistroM620);
var
  i       : Integer;
  m625    : TObjectList<TJSSpedContribuicoesModelRegistroM625>;
  regM625 : TJSSpedContribuicoesModelRegistroM625;
begin
  m625 := FSpedContribuicoesService.DAO.BlocoM.DAOM625.list(ARegM620);
  try
    if not Assigned(m625) or (m625.Count = 0) then
      Exit;

    for i :=0 to Pred(m625.Count) do
    begin
      regM625 := m625[i];
      AdicionaLinhaSped(regM625, FArquivo);
    end;
  finally
    m625.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM800;
var
  i       : Integer;
  m800    : TObjectList<TJSSpedContribuicoesModelRegistroM800>;
  regM800 : TJSSpedContribuicoesModelRegistroM800;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa then
    Exit;

  m800 := TObjectList<TJSSpedContribuicoesModelRegistroM800>.Create;

  ConsolidaContribPisM810(m800);

  try
    if (m800.Count = 0) then
      Exit;

    for i := 0 to pred(m800.Count) do
    begin
      regM800 := m800[i];
      AdicionaLinhaSped(regM800, FArquivo);
      gerarM810(regM800);
    end;
  finally
    m800.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.gerarM810(
  ARegM800: TJSSpedContribuicoesModelRegistroM800);
var
  i       : Integer;
  regM810 : TJSSpedContribuicoesModelRegistroM810;
begin
  if (not Assigned(m810)) or (m810.Count = 0) then
      Exit;

  for i := 0 to pred(m810.Count) do
  begin
    regM810 := m810[i];
    if (regM810.GetValueStr('CSTCOFINS') = ARegM800.cstCofins) and
       (regM810.codCta = ARegM800.codCta) then
    begin
      AdicionaLinhaSped(regM810, FArquivo);
      FBloco0.AddCodConta(regM810.codCta);
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredCofinsOutrasReceitas;
begin
  if not Assigned(m505) then
    Exit;

  IncluiCredCofinsOutrasReceitasGrupo_100_200;
  IncluiCredCofinsOutrasReceitasGrupo_100_300;
  IncluiCredCofinsOutrasReceitasGrupo_200_300;
  IncluiCredCofinsOutrasReceitasGrupo_100_200_300;
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredCofinsOutrasReceitasGrupo_100_200;
var i, j, k: Integer;
    RegM505 : TJSSpedContribuicoesModelRegistroM505;
    arrNatBcCred100, arrNatBcCred200 : array of integer;
begin
  SetLength(arrNatBcCred100,0);
  SetLength(arrNatBcCred200,0);

  for i := 0 to pred(m505.Count) do
  begin
    if IsReceitaTribCst_53_63(m505[i]) then
    begin
      SetLength(arrNatBcCred100,length(arrNatBcCred100) + 1);
      arrNatBcCred100[length(arrNatBcCred100) - 1] := i;
    end;

    if IsReceitaNaoTribCst_53_63(m505[i]) then
    begin
      SetLength(arrNatBcCred200,length(arrNatBcCred200) + 1);
      arrNatBcCred200[length(arrNatBcCred200) - 1] := i;
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred100)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred100[i]]);
    j := lstReceitaTributadaMI.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaNaoTributadaMI[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred200)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred200[i]]);
    j := lstReceitaNaoTributadaMI.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaTributadaMI[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  m505.Sort(FComparerM505);
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredCofinsOutrasReceitasGrupo_100_200_300;
var i, j, k: Integer;
    RegM505 : TJSSpedContribuicoesModelRegistroM505;
    arrNatBcCred100, arrNatBcCred200, arrNatBcCred300 : array of Integer;
begin
  SetLength(arrNatBcCred100,0);
  SetLength(arrNatBcCred200,0);
  SetLength(arrNatBcCred300,0);

  for i := 0 to pred(m505.Count) do
  begin
    if IsReceitaTribCst_56_66(m505[i]) then
    begin
      SetLength(arrNatBcCred100,length(arrNatBcCred100) + 1);
      arrNatBcCred100[length(arrNatBcCred100) - 1] := i;
    end;

      if IsReceitaNaoTribCst_56_66(m505[i]) then
    begin
      SetLength(arrNatBcCred200,length(arrNatBcCred200) + 1);
      arrNatBcCred200[length(arrNatBcCred200) - 1] := i;
    end;

    if IsReceitaExpCst_56_66(m505[i]) then
    begin
      SetLength(arrNatBcCred300,length(arrNatBcCred300) + 1);
      arrNatBcCred300[length(arrNatBcCred300) - 1] := i;
    end;
  end;

  //Achei o grupo 100, crio o 200 e 300
  for i := 0 to Pred(Length(arrNatBcCred100)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred100[i]]);
    j := lstReceitaTributadaMI.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaNaoTributadaMI[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred100)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred100[i]]);
    j := lstReceitaTributadaMI.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaExportacao[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  //Achei o grupo 200, crio o 100 e 300
  for i := 0 to Pred(Length(arrNatBcCred200)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred200[i]]);
    j := lstReceitaNaoTributadaMI.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaTributadaMI[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred200)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred200[i]]);
    j := lstReceitaNaoTributadaMI.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaExportacao[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  //Achei o grupo 300, crio o 100 e 200
  for i := 0 to Pred(Length(arrNatBcCred300)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred300[i]]);
    j := lstReceitaExportacao.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaTributadaMI[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred300)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred300[i]]);
    j := lstReceitaExportacao.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaNaoTributadaMI[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  m505.Sort(FComparerM505);
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredCofinsOutrasReceitasGrupo_100_300;
var i, j, k: Integer;
    RegM505 : TJSSpedContribuicoesModelRegistroM505;
    arrNatBcCred100, arrNatBcCred300 : array of integer;
begin
  SetLength(arrNatBcCred100,0);
  SetLength(arrNatBcCred300,0);

  for i := 0 to pred(m505.Count) do
  begin
    if IsReceitaTribCst_54_64(m505[i]) then
    begin
      SetLength(arrNatBcCred100,length(arrNatBcCred100) + 1);
      arrNatBcCred100[length(arrNatBcCred100) - 1] := i;
    end;

    if IsReceitaExpCst_54_64(m505[i]) then
    begin
      SetLength(arrNatBcCred300,length(arrNatBcCred300) + 1);
      arrNatBcCred300[length(arrNatBcCred300) - 1] := i;
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred100)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred100[i]]);
    j := lstReceitaTributadaMI.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaExportacao[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred300)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred300[i]]);
    j := lstReceitaExportacao.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaTributadaMI[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  m505.Sort(FComparerM505);
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredCofinsOutrasReceitasGrupo_200_300;
var i, j, k: Integer;
    RegM505 : TJSSpedContribuicoesModelRegistroM505;
    arrNatBcCred200, arrNatBcCred300 : array of Integer;
begin
  SetLength(arrNatBcCred200,0);
  SetLength(arrNatBcCred300,0);

  for i := 0 to pred(m505.Count) do
  begin
    if IsReceitaNaoTribCst_55_65(m505[i]) then
    begin
      SetLength(arrNatBcCred200,length(arrNatBcCred200) + 1);
      arrNatBcCred200[length(arrNatBcCred200) - 1] := i;
    end;

    if IsReceitaExpCst_55_65(m505[i]) then
    begin
      SetLength(arrNatBcCred300,length(arrNatBcCred300) + 1);
      arrNatBcCred300[length(arrNatBcCred300) - 1] := i;
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred200)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred200[i]]);
    j := lstReceitaNaoTributadaMI.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaExportacao[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred300)) do
  begin
    RegM505 := ClonaM505(m505[arrNatBcCred300[i]]);
    j := lstReceitaExportacao.IndexOf(RegM505.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM505.AddOrSetValue('CODCRED',lstReceitaNaoTributadaMI[j]);
      if not m505.BinarySearch(RegM505, k, FComparerM505) then
        m505.Insert(k, RegM505)
      else
        FreeAndNil(RegM505);
    end;
  end;

  m505.Sort(FComparerM505);
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredPisOutrasReceitas;
begin
  if not Assigned(m105) then
    Exit;

  IncluiCredPisOutrasReceitasGrupo_100_200;
  IncluiCredPisOutrasReceitasGrupo_100_300;
  IncluiCredPisOutrasReceitasGrupo_200_300;
  IncluiCredPisOutrasReceitasGrupo_100_200_300;
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredPisOutrasReceitasGrupo_100_200;
var i, j, k: Integer;
    RegM105 : TJSSpedContribuicoesModelRegistroM105;
    arrNatBcCred100, arrNatBcCred200 : array of integer;
begin
  SetLength(arrNatBcCred100,0);
  SetLength(arrNatBcCred200,0);

  for i := 0 to pred(m105.Count) do
  begin
    if IsReceitaTribCst_53_63(m105[i]) then
    begin
      SetLength(arrNatBcCred100,length(arrNatBcCred100) + 1);
      arrNatBcCred100[length(arrNatBcCred100) - 1] := i;
    end;

    if IsReceitaNaoTribCst_53_63(m105[i]) then
    begin
      SetLength(arrNatBcCred200,length(arrNatBcCred200) + 1);
      arrNatBcCred200[length(arrNatBcCred200) - 1] := i;
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred100)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred100[i]]);
    j := lstReceitaTributadaMI.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaNaoTributadaMI[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred200)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred200[i]]);
    j := lstReceitaNaoTributadaMI.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaTributadaMI[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  m105.Sort(FComparerM105);
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredPisOutrasReceitasGrupo_100_200_300;
var i, j, k: Integer;
    RegM105 : TJSSpedContribuicoesModelRegistroM105;
    arrNatBcCred100, arrNatBcCred200, arrNatBcCred300 : array of Integer;
begin
  SetLength(arrNatBcCred100,0);
  SetLength(arrNatBcCred200,0);
  SetLength(arrNatBcCred300,0);

  for i := 0 to pred(m105.Count) do
  begin
    if IsReceitaTribCst_56_66(m105[i]) then
    begin
      SetLength(arrNatBcCred100,length(arrNatBcCred100) + 1);
      arrNatBcCred100[length(arrNatBcCred100) - 1] := i;
    end;

    if IsReceitaNaoTribCst_56_66(m105[i]) then
    begin
      SetLength(arrNatBcCred200,length(arrNatBcCred200) + 1);
      arrNatBcCred200[length(arrNatBcCred200) - 1] := i;
    end;

    if IsReceitaExpCst_56_66(m105[i]) then
    begin
      SetLength(arrNatBcCred300,length(arrNatBcCred300) + 1);
      arrNatBcCred300[length(arrNatBcCred300) - 1] := i;
    end;
  end;

  //Achou grupo 100, cria grupo 200 e 300
  for i := 0 to Pred(Length(arrNatBcCred100)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred100[i]]);
    j := lstReceitaTributadaMI.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaNaoTributadaMI[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred100)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred100[i]]);
    j := lstReceitaTributadaMI.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaExportacao[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  //Achou grupo 200, cria grupo 100 e 300
  for i := 0 to Pred(Length(arrNatBcCred200)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred200[i]]);
    j := lstReceitaNaoTributadaMI.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaTributadaMI[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred200)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred200[i]]);
    j := lstReceitaNaoTributadaMI.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaExportacao[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  //Achou grupo 300, cria grupo 100 e 200
  for i := 0 to Pred(Length(arrNatBcCred300)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred300[i]]);
    j := lstReceitaExportacao.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaTributadaMI[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred300)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred300[i]]);
    j := lstReceitaExportacao.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaNaoTributadaMI[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  m105.Sort(FComparerM105);
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredPisOutrasReceitasGrupo_100_300;
var i, j, k: Integer;
    RegM105 : TJSSpedContribuicoesModelRegistroM105;
    arrNatBcCred100, arrNatBcCred300 : array of integer;
begin
  SetLength(arrNatBcCred100,0);
  SetLength(arrNatBcCred300,0);

  for i := 0 to pred(m105.Count) do
  begin
    if IsReceitaTribCst_54_64(m105[i]) then
    begin
      SetLength(arrNatBcCred100,length(arrNatBcCred100) + 1);
      arrNatBcCred100[length(arrNatBcCred100) - 1] := i;
    end;

    if IsReceitaExpCst_54_64(m105[i]) then
    begin
      SetLength(arrNatBcCred300,length(arrNatBcCred300) + 1);
      arrNatBcCred300[length(arrNatBcCred300) - 1] := i;
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred100)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred100[i]]);
    j := lstReceitaTributadaMI.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaExportacao[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred300)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred300[i]]);
    j := lstReceitaExportacao.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaTributadaMI[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  m105.Sort(FComparerM105);
end;

procedure TJSSpedContribuicoesServiceBlocoM.IncluiCredPisOutrasReceitasGrupo_200_300;
var i, j, k: Integer;
    RegM105 : TJSSpedContribuicoesModelRegistroM105;
    arrNatBcCred200, arrNatBcCred300 : array of Integer;
begin
  SetLength(arrNatBcCred200,0);
  SetLength(arrNatBcCred300,0);

  for i := 0 to pred(m105.Count) do
  begin
    if IsReceitaNaoTribCst_55_65(m105[i]) then
    begin
      SetLength(arrNatBcCred200,length(arrNatBcCred200) + 1);
      arrNatBcCred200[length(arrNatBcCred200) - 1] := i;
    end;

    if IsReceitaExpCst_55_65(m105[i]) then
    begin
      SetLength(arrNatBcCred300,length(arrNatBcCred300) + 1);
      arrNatBcCred300[length(arrNatBcCred300) - 1] := i;
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred200)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred200[i]]);
    j := lstReceitaNaoTributadaMI.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaExportacao[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  for i := 0 to Pred(Length(arrNatBcCred300)) do
  begin
    RegM105 := ClonaM105(m105[arrNatBcCred300[i]]);
    j := lstReceitaExportacao.IndexOf(RegM105.GetValueStr('CODCRED'));
    if j >= 0 then
    begin
      RegM105.AddOrSetValue('CODCRED',lstReceitaNaoTributadaMI[j]);
      if not m105.BinarySearch(RegM105, k, FComparerM105) then
        m105.Insert(k, RegM105)
      else
        FreeAndNil(RegM105);
    end;
  end;

  m105.Sort(FComparerM105);
end;

class function TJSSpedContribuicoesServiceBlocoM.New(
  Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBlocoM;
begin
  Result := Self.create(Parent);
end;

procedure TJSSpedContribuicoesServiceBlocoM.OnAddRegistro(
  Registro: TJSSpedContribuicoesModelRegistro);
var
  onAddRegistro: TOnSpedContribuicoesAddRegistro;
begin
  onAddRegistro := FSpedContribuicoesService.Config.OnAddRegistro;

  if Assigned(onAddRegistro) then
    onAddRegistro(Registro);
end;

procedure TJSSpedContribuicoesServiceBlocoM.OnLogErro(ALogErro: String);
var
  onLogErro: TOnSpedContribuicoesLogErro;
begin
  onLogErro := FSpedContribuicoesService.Config.OnLogErro;

  if Assigned(onLogErro) then
    OnLogErro(ALogErro);
end;

function TJSSpedContribuicoesServiceBlocoM.ServiceBloco0(
  Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoM;
begin
  result  := Self;
  FBloco0 := Value;
end;

function TJSSpedContribuicoesServiceBlocoM.validateInstance<T>(
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
