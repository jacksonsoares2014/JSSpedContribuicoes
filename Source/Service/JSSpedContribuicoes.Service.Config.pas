unit JSSpedContribuicoes.Service.Config;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Collections,
  System.SysUtils;

type
  TJSSpedContribuicoesServiceConfig<I: IInterface> = class(TInterfacedObject, IJSSpedContribuicoesConfig<I>)
  private
    [Weak]
    FParent: I;

    FDataInicial            : TDateTime;
    FDataFinal              : TDateTime;
    FTipoEscrituracao       : TJSSpedContribuicoesTipoEscrituracao;
    FNaturezaPJ             : TJSSpedContribuicoesIndicadorNaturezaPJ;
    FSituacaoEspecial       : TJSSpedContribuicoesIndicadorSituacaoEspecial;
    FTipoAtividade          : TJSSpedContribuicoesIndicadorAtividade;
    FOnStatus               : TOnSpedContribuicoesStatus;
    FOnAddRegistro          : TOnSpedContribuicoesAddRegistro;
    FOnLogErro              : TOnSpedContribuicoesLogErro;
    FIncidenciaTributaria   : TJSSpedContribuicoesIndicadorIncidenciaTributaria;
    FMetodoApropriacao      : TJSSpedContribuicoesIndicadorMetodoApropriacao;
    FTipoContribuicao       : TJSSpedContribuicoesIndicadorTipoContribuicao;
    FCriterioEscrituracao   : TJSSpedContribuicoesIndicadorCriterioEscrituracao;
    FTipoEnquadramento      : TJSSpedContribuicoesTipoEnquadramento;
    FVersaoPVA              : TJSSpedContribuicoesVersaoPVA;
    FIndicadorEscrituracao  : TJSSpedContribuicoesIndicadorEscrituracao;
    FSuframa                : String;
    FInformacaoCompl0120    : String;
    FNumRecAnterior         : String;
    FNomeArquivo            : String;
    FUFEmitente             : String;
    FAliqPisCumulativo      : Double;
    FAliqCofinsCumulativo   : Double;
    FEmpresaInativa         : Boolean;
    FGerar0900              : Boolean;
    FGerarC860              : Boolean;
    FGerarF120_F130         : Boolean;
    FGerarBlocoP            : Boolean;
    FGerarBlocoM            : Boolean;
    FCodDctfPisNC           : String;
    FCodDctfCofinsNC        : String;
    FCodDctfPisCum          : String;
    FCodDctfCofinsCum       : String;
    FControlaSaldoRetencao  : Boolean;
    FGerarRelatorio         : Boolean;
    FDescontoRecBruNCumTrib : Currency;
    FDescontoRecBruCumTrib  : Currency;
    FDescontoRecBruNCumNTrib: Currency;
    FDescontoRecBruCumNTrib : Currency;
    FDescontoRecBruNCumExp  : Currency;
    FEstornoRecBruNCumTrib  : Currency;
    FEstornoRecBruCumTrib   : Currency;
    FEstornoRecBruNCumNTrib : Currency;
    FEstornoRecBruCumNTrib  : Currency;
    FEstornoRecBruNCumExp   : Currency;

    FVlCredDescPis        : TDictionary<String, Currency>;
    FVlCredDescCofins     : TDictionary<String, Currency>;

//    FBlocos     : IGBSpedConfigBlocos<IGBSpedConfig<I>>;
//    FInventario : IGBSpedConfigInventario<IGBSpedConfig<I>>;

  public
    function DataInicial            (Value: TDateTime)                                         : IJSSpedContribuicoesConfig<I>; overload;
    function DataFinal              (Value: TDateTime)                                         : IJSSpedContribuicoesConfig<I>; overload;
    function TipoEscrituracao       (Value: TJSSpedContribuicoesTipoEscrituracao)              : IJSSpedContribuicoesConfig<I>; overload;
    function NaturezaPJ             (Value: TJSSpedContribuicoesIndicadorNaturezaPJ)           : IJSSpedContribuicoesConfig<I>; overload;
    function TipoAtividade          (Value: TJSSpedContribuicoesIndicadorAtividade)            : IJSSpedContribuicoesConfig<I>; overload;
    function SituacaoEspecial       (Value: TJSSpedContribuicoesIndicadorSituacaoEspecial)     : IJSSpedContribuicoesConfig<I>; overload;
    function IncidenciaTributaria   (Value: TJSSpedContribuicoesIndicadorIncidenciaTributaria) : IJSSpedContribuicoesConfig<I>; overload;
    function MetodoApropriacao      (Value: TJSSpedContribuicoesIndicadorMetodoApropriacao)    : IJSSpedContribuicoesConfig<I>; overload;
    function TipoContribuicao       (Value: TJSSpedContribuicoesIndicadorTipoContribuicao)     : IJSSpedContribuicoesConfig<I>; overload;
    function VersaoPVA              (Value: TJSSpedContribuicoesVersaoPVA)                     : IJSSpedContribuicoesConfig<I>; overload;
    function IndicadorEscrituracao  (Value: TJSSpedContribuicoesIndicadorEscrituracao)         : IJSSpedContribuicoesConfig<I>; overload;
    function CriterioEscrituracao   (Value: TJSSpedContribuicoesIndicadorCriterioEscrituracao) : IJSSpedContribuicoesConfig<I>; overload;
    function TipoEnquadramento      (Value: TJSSpedContribuicoesTipoEnquadramento)             : IJSSpedContribuicoesConfig<I>; overload;
    function NumRecAnterior         (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function Suframa                (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function InformacaoCompl0120    (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function NomeArquivo            (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function AliqPisCumulativo      (Value: Double)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function AliqCofinsCumulativo   (Value: Double)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function EmpresaInativa         (Value: Boolean)                                           : IJSSpedContribuicoesConfig<I>; overload;
    function Gerar0900              (Value: Boolean)                                           : IJSSpedContribuicoesConfig<I>; overload;
    function GerarC860              (Value: Boolean)                                           : IJSSpedContribuicoesConfig<I>; overload;
    function GerarF120_F130         (Value: Boolean)                                           : IJSSpedContribuicoesConfig<I>; overload;
    function GerarBlocoP            (Value: Boolean)                                           : IJSSpedContribuicoesConfig<I>; overload;
    function GerarBlocoM            (Value: Boolean)                                           : IJSSpedContribuicoesConfig<I>; overload;
    function CodDctfPisNC           (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function CodDctfCofinsNC        (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function CodDctfPisCum          (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function CodDctfCofinsCum       (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function ControlaSaldoRetencao  (Value: Boolean)                                           : IJSSpedContribuicoesConfig<I>; overload;
    function GerarRelatorio         (Value: Boolean)                                           : IJSSpedContribuicoesConfig<I>; overload;

    function DescontoRecBruNCumTrib (Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;
    function DescontoRecBruCumTrib  (Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;
    function DescontoRecBruNCumNTrib(Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;
    function DescontoRecBruCumNTrib (Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;
    function DescontoRecBruNCumExp  (Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;
    function EstornoRecBruNCumTrib  (Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;
    function EstornoRecBruCumTrib   (Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;
    function EstornoRecBruNCumNTrib (Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;
    function EstornoRecBruCumNTrib  (Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;
    function EstornoRecBruNCumExp   (Value: Currency)                                          : IJSSpedContribuicoesConfig<I>; overload;

    function DataInicial            : TDateTime;                                        overload;
    function DataFinal              : TDateTime;                                        overload;
    function TipoEscrituracao       : TJSSpedContribuicoesTipoEscrituracao;             overload;
    function NaturezaPJ             : TJSSpedContribuicoesIndicadorNaturezaPJ;          overload;
    function TipoAtividade          : TJSSpedContribuicoesIndicadorAtividade;           overload;
    function SituacaoEspecial       : TJSSpedContribuicoesIndicadorSituacaoEspecial     overload;
    function IncidenciaTributaria   : TJSSpedContribuicoesIndicadorIncidenciaTributaria overload;
    function MetodoApropriacao      : TJSSpedContribuicoesIndicadorMetodoApropriacao    overload;
    function TipoContribuicao       : TJSSpedContribuicoesIndicadorTipoContribuicao     overload;
    function CriterioEscrituracao   : TJSSpedContribuicoesIndicadorCriterioEscrituracao overload;
    function TipoEnquadramento      : TJSSpedContribuicoesTipoEnquadramento             overload;
    function VersaoPVA              : TJSSpedContribuicoesVersaoPVA                     overload;
    function IndicadorEscrituracao  : TJSSpedContribuicoesIndicadorEscrituracao         overload;
    function NumRecAnterior         : String;                                           overload;
    function Suframa                : String;                                           overload;
    function InformacaoCompl0120    : String;                                           overload;
    function NomeArquivo            : String;                                           overload;
    function AliqPisCumulativo      : Double;                                           overload;
    function AliqCofinsCumulativo   : Double;                                           overload;
    function EmpresaInativa         : Boolean;                                          overload;
    function Gerar0900              : Boolean;                                          overload;
    function GerarC860              : Boolean;                                          overload;
    function GerarF120_F130         : Boolean;                                          overload;
    function GerarBlocoP            : Boolean;                                          overload;
    function GerarBlocoM            : Boolean;                                          overload;
    function PermiteGeracao         : Boolean;                                          overload;
    function CodDctfPisNC           : String;                                           overload;
    function CodDctfCofinsNC        : String;                                           overload;
    function CodDctfPisCum          : String;                                           overload;
    function CodDctfCofinsCum       : String;                                           overload;
    function ControlaSaldoRetencao  : Boolean;                                          overload;
    function GerarRelatorio         : Boolean;                                          overload;

    function DescontoRecBruNCumTrib : Currency;                                         overload;
    function DescontoRecBruCumTrib  : Currency;                                         overload;
    function DescontoRecBruNCumNTrib: Currency;                                         overload;
    function DescontoRecBruCumNTrib : Currency;                                         overload;
    function DescontoRecBruNCumExp  : Currency;                                         overload;
    function EstornoRecBruNCumTrib  : Currency;                                         overload;
    function EstornoRecBruCumTrib   : Currency;                                         overload;
    function EstornoRecBruNCumNTrib : Currency;                                         overload;
    function EstornoRecBruCumNTrib  : Currency;                                         overload;
    function EstornoRecBruNCumExp   : Currency;                                         overload;

    function Versao               : String;

    function AddVlCredDescPis   (ACodCred: String; AValor: Currency): IJSSpedContribuicoesConfig<I>;
    function AddVlCredDescCofins(ACodCred: String; AValor: Currency): IJSSpedContribuicoesConfig<I>;

    function GetVlCredDescPis   (ACodCred: String): Currency;
    function GetVlCredDescCofins(ACodCred: String): Currency;

  //  function Blocos    : IGBSpedConfigBlocos<IGBSpedConfig<I>>;
  //  function Inventario: IGBSpedConfigInventario<IGBSpedConfig<I>>;

    function OnStatus(Value: TOnSpedContribuicoesStatus): IJSSpedContribuicoesConfig<I>; overload;
    function OnStatus: TOnSpedContribuicoesStatus; overload;

    function OnAddRegistro(Value: TOnSpedContribuicoesAddRegistro): IJSSpedContribuicoesConfig<I>; overload;
    function OnAddRegistro: TOnSpedContribuicoesAddRegistro; overload;

    function OnLogErro(Value: TOnSpedContribuicoesLogErro): IJSSpedContribuicoesConfig<I>; overload;
    function OnLogErro: TOnSpedContribuicoesLogErro; overload;

    function &Begin: IJSSpedContribuicoesConfig<I>;
    function &End: I;

    class function New(Parent: I): IJSSpedContribuicoesConfig<I>;
    constructor create(Parent: I);
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceConfig<I> }

function TJSSpedContribuicoesServiceConfig<I>.AliqCofinsCumulativo(
  Value: Double): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FAliqCofinsCumulativo := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.AddVlCredDescCofins(
  ACodCred: String; AValor: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FVlCredDescCofins.AddOrSetValue(ACodCred, AValor);
end;

function TJSSpedContribuicoesServiceConfig<I>.AddVlCredDescPis(ACodCred: String;
  AValor: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FVlCredDescPis.AddOrSetValue(ACodCred, AValor);
end;

function TJSSpedContribuicoesServiceConfig<I>.AliqCofinsCumulativo: Double;
begin
  result := FAliqCofinsCumulativo;
end;

function TJSSpedContribuicoesServiceConfig<I>.AliqPisCumulativo(
  Value: Double): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FAliqPisCumulativo := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.AliqPisCumulativo: Double;
begin
  result := FAliqPisCumulativo;
end;

function TJSSpedContribuicoesServiceConfig<I>.&Begin: IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
end;

function TJSSpedContribuicoesServiceConfig<I>.CodDctfCofinsCum(
  Value: String): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FCodDctfCofinsCum := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.CodDctfCofinsNC(
  Value: String): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FCodDctfCofinsNC := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.CodDctfPisCum(
  Value: String): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FCodDctfPisCum := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.CodDctfPisNC(
  Value: String): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FCodDctfPisNC := Value;
end;

constructor TJSSpedContribuicoesServiceConfig<I>.create(Parent: I);
begin
  FVlCredDescPis    := TDictionary<string, Currency>.Create;
  FVlCredDescCofins := TDictionary<string, Currency>.Create;
  FParent           := Parent;
end;

function TJSSpedContribuicoesServiceConfig<I>.CriterioEscrituracao(
  Value: TJSSpedContribuicoesIndicadorCriterioEscrituracao): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FCriterioEscrituracao := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.CriterioEscrituracao: TJSSpedContribuicoesIndicadorCriterioEscrituracao;
begin
  Result := FCriterioEscrituracao;
end;

function TJSSpedContribuicoesServiceConfig<I>.DataFinal(
  Value: TDateTime): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FDataFinal := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.DataFinal: TDateTime;
begin
  result := FDataFinal;
end;

function TJSSpedContribuicoesServiceConfig<I>.DataInicial: TDateTime;
begin
  result := FDataInicial;
end;

function TJSSpedContribuicoesServiceConfig<I>.DataInicial(
  Value: TDateTime): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FDataInicial := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruCumNTrib: Currency;
begin
  Result := FDescontoRecBruCumNTrib;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruCumNTrib(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FDescontoRecBruCumNTrib := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruCumTrib(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FDescontoRecBruCumTrib := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruCumTrib: Currency;
begin
  Result := FDescontoRecBruCumTrib;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruNCumNTrib(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FDescontoRecBruNCumNTrib := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruNCumExp(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FDescontoRecBruNCumExp := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruNCumExp: Currency;
begin
  Result := FDescontoRecBruNCumExp;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruNCumNTrib: Currency;
begin
  Result := FDescontoRecBruNCumNTrib;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruNCumTrib(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FDescontoRecBruNCumTrib := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.DescontoRecBruNCumTrib: Currency;
begin
  Result := FDescontoRecBruNCumTrib;
end;

destructor TJSSpedContribuicoesServiceConfig<I>.Destroy;
begin
  FVlCredDescPis.Free;
  FVlCredDescCofins.Free;

  if Assigned(FOnStatus) then
    FOnStatus := nil;

  if Assigned(FOnAddRegistro) then
    FOnAddRegistro := nil;

  if Assigned(FOnLogErro) then
    FOnLogErro := nil;

  inherited;
end;

function TJSSpedContribuicoesServiceConfig<I>.EmpresaInativa(
  Value: Boolean): IJSSpedContribuicoesConfig<I>;
begin
  Result := self;
  FEmpresaInativa := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.EmpresaInativa: Boolean;
begin
  Result := FEmpresaInativa;
end;

function TJSSpedContribuicoesServiceConfig<I>.&End: I;
begin
  result := FParent;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruCumNTrib(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FEstornoRecBruCumNTrib := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruCumNTrib: Currency;
begin
  Result := FEstornoRecBruCumNTrib;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruCumTrib(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FEstornoRecBruCumTrib := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruCumTrib: Currency;
begin
  Result := FEstornoRecBruCumTrib;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruNCumExp(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FEstornoRecBruNCumExp := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruNCumExp: Currency;
begin
  Result := FEstornoRecBruNCumExp;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruNCumNTrib: Currency;
begin
  Result := FEstornoRecBruNCumNTrib;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruNCumNTrib(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FEstornoRecBruNCumNTrib := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruNCumTrib(
  Value: Currency): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FEstornoRecBruNCumTrib := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.EstornoRecBruNCumTrib: Currency;
begin
  Result := FEstornoRecBruNCumTrib;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarBlocoM(
  Value: Boolean): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FGerarBlocoM := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.Gerar0900: Boolean;
begin
  Result := FGerar0900;
end;

function TJSSpedContribuicoesServiceConfig<I>.Gerar0900(
  Value: Boolean): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FGerar0900 := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarBlocoM: Boolean;
begin
  Result := FGerarBlocoM;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarBlocoP: Boolean;
begin
  Result := FGerarBlocoP;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarBlocoP(
  Value: Boolean): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FGerarBlocoP := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarC860: Boolean;
begin
  Result := FGerarC860;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarF120_F130: Boolean;
begin
  Result := FGerarF120_F130;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarRelatorio: Boolean;
begin
  Result := FGerarRelatorio;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarRelatorio(
  Value: Boolean): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FGerarRelatorio := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarF120_F130(
  Value: Boolean): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FGerarF120_F130 := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.GetVlCredDescCofins(
  ACodCred: String): Currency;
var
  valor: Currency;
begin
  if not FVlCredDescCofins.TryGetValue(ACodCred, valor) then
    valor := 0;
  Result := valor;
end;

function TJSSpedContribuicoesServiceConfig<I>.GetVlCredDescPis(
  ACodCred: String): Currency;
var
  valor: Currency;
begin
  if not FVlCredDescPis.TryGetValue(ACodCred, valor) then
    valor := 0;
  Result := valor;
end;

function TJSSpedContribuicoesServiceConfig<I>.GerarC860(
  Value: Boolean): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FGerarC860 := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.IncidenciaTributaria(
  Value: TJSSpedContribuicoesIndicadorIncidenciaTributaria): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FIncidenciaTributaria := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.IncidenciaTributaria: TJSSpedContribuicoesIndicadorIncidenciaTributaria;
begin
  Result := FIncidenciaTributaria;
end;

function TJSSpedContribuicoesServiceConfig<I>.IndicadorEscrituracao: TJSSpedContribuicoesIndicadorEscrituracao;
begin
  Result := FIndicadorEscrituracao;
end;

function TJSSpedContribuicoesServiceConfig<I>.IndicadorEscrituracao(
  Value: TJSSpedContribuicoesIndicadorEscrituracao): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FIndicadorEscrituracao := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.InformacaoCompl0120(
  Value: String): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FInformacaoCompl0120 := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.InformacaoCompl0120: String;
begin
  Result := FInformacaoCompl0120;
end;

function TJSSpedContribuicoesServiceConfig<I>.MetodoApropriacao(
  Value: TJSSpedContribuicoesIndicadorMetodoApropriacao): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FMetodoApropriacao := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.MetodoApropriacao: TJSSpedContribuicoesIndicadorMetodoApropriacao;
begin
  Result := FMetodoApropriacao;
end;

function TJSSpedContribuicoesServiceConfig<I>.NaturezaPJ: TJSSpedContribuicoesIndicadorNaturezaPJ;
begin
  Result := FNaturezaPJ;
end;

function TJSSpedContribuicoesServiceConfig<I>.NaturezaPJ(
  Value: TJSSpedContribuicoesIndicadorNaturezaPJ): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FNaturezaPJ := Value;
end;

class function TJSSpedContribuicoesServiceConfig<I>.New(
  Parent: I): IJSSpedContribuicoesConfig<I>;
begin
  result := Self.create(Parent);
end;

function TJSSpedContribuicoesServiceConfig<I>.NomeArquivo: String;
begin
  result := FNomeArquivo;
end;

function TJSSpedContribuicoesServiceConfig<I>.NumRecAnterior(
  Value: String): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FNumRecAnterior := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.NumRecAnterior: String;
begin
  Result := FNumRecAnterior;
end;

function TJSSpedContribuicoesServiceConfig<I>.OnAddRegistro(
  Value: TOnSpedContribuicoesAddRegistro): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FOnAddRegistro := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.OnAddRegistro: TOnSpedContribuicoesAddRegistro;
begin
  Result := FOnAddRegistro;
end;

function TJSSpedContribuicoesServiceConfig<I>.OnLogErro: TOnSpedContribuicoesLogErro;
begin
  Result := FOnLogErro;
end;

function TJSSpedContribuicoesServiceConfig<I>.OnLogErro(
  Value: TOnSpedContribuicoesLogErro): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FOnLogErro := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.OnStatus(
  Value: TOnSpedContribuicoesStatus): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FOnStatus := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.OnStatus: TOnSpedContribuicoesStatus;
begin
  result := FOnStatus;
end;

function TJSSpedContribuicoesServiceConfig<I>.PermiteGeracao: Boolean;
begin
  if FEmpresaInativa then
    Exit(False);

  if (FTipoEnquadramento = tePresumido) and (FCriterioEscrituracao = iceRegimeCaixa) then
    Exit(False);

  if (FTipoEnquadramento = tePresumido) and (FCriterioEscrituracao = iceRegimeCompetenciaConsolidada) then
    Exit(False);

  Exit(True);
end;

function TJSSpedContribuicoesServiceConfig<I>.NomeArquivo(
  Value: String): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FNomeArquivo := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.SituacaoEspecial(
  Value: TJSSpedContribuicoesIndicadorSituacaoEspecial): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FSituacaoEspecial := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.SituacaoEspecial: TJSSpedContribuicoesIndicadorSituacaoEspecial;
begin
  Result := FSituacaoEspecial;
end;

function TJSSpedContribuicoesServiceConfig<I>.Suframa: String;
begin
  result := FSuframa;
end;

function TJSSpedContribuicoesServiceConfig<I>.TipoAtividade(
  Value: TJSSpedContribuicoesIndicadorAtividade): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FTipoAtividade := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.TipoAtividade: TJSSpedContribuicoesIndicadorAtividade;
begin
  Result := FTipoAtividade;
end;

function TJSSpedContribuicoesServiceConfig<I>.TipoContribuicao(
  Value: TJSSpedContribuicoesIndicadorTipoContribuicao): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FTipoContribuicao := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.TipoContribuicao: TJSSpedContribuicoesIndicadorTipoContribuicao;
begin
  Result := FTipoContribuicao;
end;

function TJSSpedContribuicoesServiceConfig<I>.TipoEscrituracao(
  Value: TJSSpedContribuicoesTipoEscrituracao): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FTipoEscrituracao := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.TipoEnquadramento: TJSSpedContribuicoesTipoEnquadramento;
begin
  Result := FTipoEnquadramento;
end;

function TJSSpedContribuicoesServiceConfig<I>.TipoEnquadramento(
  Value: TJSSpedContribuicoesTipoEnquadramento): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FTipoEnquadramento := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.TipoEscrituracao: TJSSpedContribuicoesTipoEscrituracao;
begin
  Result := FTipoEscrituracao;
end;

function TJSSpedContribuicoesServiceConfig<I>.Suframa(
  Value: String): IJSSpedContribuicoesConfig<I>;
begin
  result     := Self;
  FSuframa := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.Versao: String;
begin
  Result := '';

  if FDataFinal >= EncodeDate(2020,1,1) then
    Exit('006');

  if FDataFinal >= EncodeDate(2019,1,1) then
    Exit('005');

  if FDataFinal >= EncodeDate(2018,6,1) then
    Exit('004');

  if FDataFinal >= EncodeDate(2012,7,1) then
    Exit('003');

  if FDataFinal >= EncodeDate(2008,1,1) then
    Exit('002');

end;

function TJSSpedContribuicoesServiceConfig<I>.VersaoPVA: TJSSpedContribuicoesVersaoPVA;
begin
  Result := FVersaoPVA;
end;

function TJSSpedContribuicoesServiceConfig<I>.VersaoPVA(
  Value: TJSSpedContribuicoesVersaoPVA): IJSSpedContribuicoesConfig<I>;
begin
  result := Self;
  FVersaoPVA := Value;
end;

function TJSSpedContribuicoesServiceConfig<I>.CodDctfCofinsCum: String;
begin
  Result := FCodDctfCofinsCum;
end;

function TJSSpedContribuicoesServiceConfig<I>.CodDctfCofinsNC: String;
begin
  Result := FCodDctfCofinsNC;
end;

function TJSSpedContribuicoesServiceConfig<I>.CodDctfPisCum: String;
begin
  Result := FCodDctfPisCum;
end;

function TJSSpedContribuicoesServiceConfig<I>.CodDctfPisNC: String;
begin
  Result := FCodDctfPisNC;
end;

function TJSSpedContribuicoesServiceConfig<I>.ControlaSaldoRetencao: Boolean;
begin
  Result := FControlaSaldoRetencao;
end;

function TJSSpedContribuicoesServiceConfig<I>.ControlaSaldoRetencao(
  Value: Boolean): IJSSpedContribuicoesConfig<I>;
begin
  Result := Self;
  FControlaSaldoRetencao := Value;
end;

end.
