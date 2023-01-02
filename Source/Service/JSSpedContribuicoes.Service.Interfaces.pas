
unit JSSpedContribuicoes.Service.Interfaces;

interface

uses
  JSSpedContribuicoes.DAO.Interfaces,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Classes,
  System.Classes,
  System.Generics.Collections;

type
  IJSSpedContribuicoesConfig<I: IInterface> = interface;

  IJSSpedContribuicoesServiceBlocoM         = interface;

  IJSSpedContribuicoesDAOCollection         = interface;
  IJSSpedContribuicoesDAOCollectionBloco0   = interface;
  IJSSpedContribuicoesDAOCollectionBloco1   = interface;
  IJSSpedContribuicoesDAOCollectionBlocoA   = interface;
  IJSSpedContribuicoesDAOCollectionBlocoC   = interface;
  IJSSpedContribuicoesDAOCollectionBlocoD   = interface;
  IJSSpedContribuicoesDAOCollectionBlocoF   = interface;
  IJSSpedContribuicoesDAOCollectionBlocoM   = interface;
  IJSSpedContribuicoesDAOCollectionBlocoP   = interface;

  IJSSpedContribuicoesEmitente = interface;
  IJSSpedContribuicoesServiceStatus = interface;

  TOnSpedContribuicoesStatus = reference to procedure (Status: IJSSpedContribuicoesServiceStatus);
  TOnSpedContribuicoesAddRegistro = reference to procedure (Registro: TJSSpedContribuicoesModelRegistro);
  TOnSpedContribuicoesLogErro = reference to procedure (ALogErro: String);

  IJSSpedContribuicoesServiceStatus = interface
    ['{65A50237-3A09-4B1B-8F4F-7ED3DC2E33FA}']
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

    function Aguarde        (Value: Boolean): IJSSpedContribuicoesServiceStatus; overload;
    function Bloco          (Value: string): IJSSpedContribuicoesServiceStatus; overload;
    function Registro       (Value: string): IJSSpedContribuicoesServiceStatus; overload;
    function IdRegistro     (Value: String): IJSSpedContribuicoesServiceStatus; overload;
    function TotalRegistros (Value: Integer): IJSSpedContribuicoesServiceStatus; overload;
    function RegistroAtual  (Value: Integer): IJSSpedContribuicoesServiceStatus; overload;

    function RegistroFilho       (Value: string): IJSSpedContribuicoesServiceStatus; overload;
    function IdRegistroFilho     (Value: String): IJSSpedContribuicoesServiceStatus; overload;
    function TotalRegistrosFilho (Value: Integer): IJSSpedContribuicoesServiceStatus; overload;
    function RegistroFilhoAtual  (Value: Integer): IJSSpedContribuicoesServiceStatus; overload;

    function ShowStatus: IJSSpedContribuicoesServiceStatus;
  end;

  IJSSpedContribuicoesService = interface
    ['{593E54FD-633A-4325-9502-5F09E5636D6C}']
    function Emitente: IJSSpedContribuicoesEmitente;
    function Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>;
    function DAO   : IJSSpedContribuicoesDAOCollection;

    function Execute: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesServiceBloco0 = interface
    ['{B681CD24-6226-4D98-A567-F2493D80065E}']
    function Execute: TStrings;

    function AddCodPart         (AcodEst, Acodigo: string)                 : IJSSpedContribuicoesServiceBloco0;
    function AddUnid            (AcodEst, Acodigo: string)                 : IJSSpedContribuicoesServiceBloco0;
    function AddCodItem         (AcodEst, Acodigo: string)                 : IJSSpedContribuicoesServiceBloco0;
    function AddCodInf          (AcodEst, Acodigo: string)                 : IJSSpedContribuicoesServiceBloco0;
    function AddCodConta        (Value : String)                           : IJSSpedContribuicoesServiceBloco0;
    function AcumulaReceitaBruta(AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBloco0;

    function ReceitaBruta : TJSSpedContribuicoesModelRegistro0111;

    function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesServiceBloco1 = interface
    ['{739E476A-9723-459A-AABC-BED0A9C8F3B3}']
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBloco1;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBloco1;

    function AddProcJudicial    (AReg, AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBloco1;
    function AddProcADM         (AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBloco1;

  function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesServiceBlocoA = interface
    ['{1195ED02-9649-4CC1-A701-B375F585768F}']
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoA;
    function ServiceBloco1(Value: IJSSpedContribuicoesServiceBloco1): IJSSpedContribuicoesServiceBlocoA;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoA;

    function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesServiceBlocoC = interface
    ['{B5A8B066-7922-4564-A7C6-FCA45054A1D1}']
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoC;
    function ServiceBloco1(Value: IJSSpedContribuicoesServiceBloco1): IJSSpedContribuicoesServiceBlocoC;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoC;

    function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesServiceBlocoD = interface
    ['{5B923E3B-A5E3-46F1-AA50-288062132B86}']
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoD;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoD;

    function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesServiceBlocoF = interface
    ['{DAA5347F-C058-48A8-A21F-7C4FB5076337}']
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoF;
    function ServiceBlocoM(Value: IJSSpedContribuicoesServiceBlocoM): IJSSpedContribuicoesServiceBlocoF;

    function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesServiceBlocoP = interface
    ['{F25D1D2E-0A25-4524-8A20-E7FDBB393530}']
    function Execute: TStrings;

    function ServiceBloco0(Value: IJSSpedContribuicoesServiceBloco0): IJSSpedContribuicoesServiceBlocoP;

    function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesServiceBlocoM = interface
    ['{B2895689-B1C3-4711-97C8-FADCA59CFE8F}']
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
  end;


  IJSSpedContribuicoesServiceBloco9 = interface
    ['{F5775F5C-384E-4160-BB88-F0358FAB7E8D}']
    function Execute: TStrings;

    function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesConfig<I: IInterface> = interface
    ['{5FCF2047-3C65-48F5-AF30-B8B88A3BE4A2}']
    function DataInicial            (Value: TDateTime)                                         : IJSSpedContribuicoesConfig<I>; overload;
    function DataFinal              (Value: TDateTime)                                         : IJSSpedContribuicoesConfig<I>; overload;
    function TipoEscrituracao       (Value: TJSSpedContribuicoesTipoEscrituracao)              : IJSSpedContribuicoesConfig<I>; overload;
    function NaturezaPJ             (Value: TJSSpedContribuicoesIndicadorNaturezaPJ)           : IJSSpedContribuicoesConfig<I>; overload;
    function TipoAtividade          (Value: TJSSpedContribuicoesIndicadorAtividade)            : IJSSpedContribuicoesConfig<I>; overload;
    function SituacaoEspecial       (Value: TJSSpedContribuicoesIndicadorSituacaoEspecial)     : IJSSpedContribuicoesConfig<I>; overload;
    function IncidenciaTributaria   (Value: TJSSpedContribuicoesIndicadorIncidenciaTributaria) : IJSSpedContribuicoesConfig<I>; overload;
    function MetodoApropriacao      (Value: TJSSpedContribuicoesIndicadorMetodoApropriacao)    : IJSSpedContribuicoesConfig<I>; overload;
    function TipoContribuicao       (Value: TJSSpedContribuicoesIndicadorTipoContribuicao)     : IJSSpedContribuicoesConfig<I>; overload;
    function CriterioEscrituracao   (Value: TJSSpedContribuicoesIndicadorCriterioEscrituracao) : IJSSpedContribuicoesConfig<I>; overload;
    function TipoEnquadramento      (Value: TJSSpedContribuicoesTipoEnquadramento)             : IJSSpedContribuicoesConfig<I>; overload;
    function VersaoPVA              (Value: TJSSpedContribuicoesVersaoPVA)                     : IJSSpedContribuicoesConfig<I>; overload;
    function IndicadorEscrituracao  (Value: TJSSpedContribuicoesIndicadorEscrituracao)         : IJSSpedContribuicoesConfig<I>; overload;
    function NumRecAnterior         (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function Suframa                (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;
    function InformacaoCompl0120    (Value: String)                                            : IJSSpedContribuicoesConfig<I>; overload;                                           overload;
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

    function Versao                 : String;

    function AddVlCredDescPis   (ACodCred: String; AValor: Currency): IJSSpedContribuicoesConfig<I>;
    function AddVlCredDescCofins(ACodCred: String; AValor: Currency): IJSSpedContribuicoesConfig<I>;
    function GetVlCredDescPis   (ACodCred: String): Currency;
    function GetVlCredDescCofins(ACodCred: String): Currency;

    function OnStatus(Value: TOnSpedContribuicoesStatus): IJSSpedContribuicoesConfig<I>; overload;
    function OnStatus: TOnSpedContribuicoesStatus; overload;

    function OnAddRegistro(Value: TOnSpedContribuicoesAddRegistro): IJSSpedContribuicoesConfig<I>; overload;
    function OnAddRegistro: TOnSpedContribuicoesAddRegistro; overload;

    function OnLogErro(Value: TOnSpedContribuicoesLogErro): IJSSpedContribuicoesConfig<I>; overload;
    function OnLogErro: TOnSpedContribuicoesLogErro; overload;

    function &Begin: IJSSpedContribuicoesConfig<I>;
    function &End: I;
  end;

  IJSSpedContribuicoesEmitente = interface
    ['{5637D811-A89C-4760-8FAC-0F30F348564D}']
    function CNPJ  (Value: String): IJSSpedContribuicoesEmitente; overload;
    function Codigo(Value: String): IJSSpedContribuicoesEmitente; overload;
    function UF    (Value: string): IJSSpedContribuicoesEmitente; overload;

    function CNPJ  : string; overload;
    function Codigo: string; overload;
    function UF    : string; overload;

    function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesServiceFactory = interface
    ['{A713EC27-F3F1-4D28-AF70-472FFBF7A10B}']
    function createService: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesDAOCollection = interface
    ['{AB859337-7DC8-4501-9C7E-B56664FC78EF}']
    function Bloco0: IJSSpedContribuicoesDAOCollectionBloco0;
    function Bloco1: IJSSpedContribuicoesDAOCollectionBloco1;
    function BlocoA: IJSSpedContribuicoesDAOCollectionBlocoA;
    function BlocoC: IJSSpedContribuicoesDAOCollectionBlocoC;
    function BlocoD: IJSSpedContribuicoesDAOCollectionBlocoD;
    function BlocoF: IJSSpedContribuicoesDAOCollectionBlocoF;
    function BlocoM: IJSSpedContribuicoesDAOCollectionBlocoM;
    function BlocoP: IJSSpedContribuicoesDAOCollectionBlocoP;

    function &Begin: IJSSpedContribuicoesDAOCollection;
    function &End: IJSSpedContribuicoesService;
  end;

  IJSSpedContribuicoesDAOCollectionBloco0 = interface
    ['{A74E1129-893A-4302-8A72-EA923AC69683}']
    function Add0000(Value: IJSSpedContribuicoesDAO0000): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0035(Value: IJSSpedContribuicoesDAO0035): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0100(Value: IJSSpedContribuicoesDAO0100): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0140(Value: IJSSpedContribuicoesDAO0140): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0145(Value: IJSSpedContribuicoesDAO0145): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0150(Value: IJSSpedContribuicoesDAO0150): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0190(Value: IJSSpedContribuicoesDAO0190): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0200(Value: IJSSpedContribuicoesDAO0200): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0450(Value: IJSSpedContribuicoesDAO0450): IJSSpedContribuicoesDAOCollectionBloco0;
    function Add0500(Value: IJSSpedContribuicoesDAO0500): IJSSpedContribuicoesDAOCollectionBloco0;

    function DAO0000: IJSSpedContribuicoesDAO0000;
    function DAO0035: IJSSpedContribuicoesDAO0035;
    function DAO0100: IJSSpedContribuicoesDAO0100;
    function DAO0140: IJSSpedContribuicoesDAO0140;
    function DAO0145: IJSSpedContribuicoesDAO0145;
    function DAO0150: IJSSpedContribuicoesDAO0150;
    function DAO0190: IJSSpedContribuicoesDAO0190;
    function DAO0200: IJSSpedContribuicoesDAO0200;
    function DAO0450: IJSSpedContribuicoesDAO0450;
    function DAO0500: IJSSpedContribuicoesDAO0500;

    function &Begin: IJSSpedContribuicoesDAOCollectionBloco0;
    function &End: IJSSpedContribuicoesDAOCollection;
  end;

  IJSSpedContribuicoesDAOCollectionBloco1 = interface
    ['{C909FF3A-EEAE-4DD7-BB60-E7BD7B32666E}']
    function Add1011(Value: IJSSpedContribuicoesDAO1011): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1100(Value: IJSSpedContribuicoesDAO1100): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1101(Value: IJSSpedContribuicoesDAO1101): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1300(Value: IJSSpedContribuicoesDAO1300): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1500(Value: IJSSpedContribuicoesDAO1500): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1501(Value: IJSSpedContribuicoesDAO1501): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1700(Value: IJSSpedContribuicoesDAO1700): IJSSpedContribuicoesDAOCollectionBloco1;
    function Add1900(Value: IJSSpedContribuicoesDAO1900): IJSSpedContribuicoesDAOCollectionBloco1;

    function DAO1011: IJSSpedContribuicoesDAO1011;
    function DAO1100: IJSSpedContribuicoesDAO1100;
    function DAO1101: IJSSpedContribuicoesDAO1101;
    function DAO1300: IJSSpedContribuicoesDAO1300;
    function DAO1500: IJSSpedContribuicoesDAO1500;
    function DAO1501: IJSSpedContribuicoesDAO1501;
    function DAO1700: IJSSpedContribuicoesDAO1700;
    function DAO1900: IJSSpedContribuicoesDAO1900;

    function &Begin: IJSSpedContribuicoesDAOCollectionBloco1;
    function &End: IJSSpedContribuicoesDAOCollection;
  end;

  IJSSpedContribuicoesDAOCollectionBlocoA = interface
    ['{D1DD9090-E58B-45A4-86AD-E1B8340C4D6A}']
    function AddA010(Value: IJSSpedContribuicoesDAOA010): IJSSpedContribuicoesDAOCollectionBlocoA;
    function AddA100(Value: IJSSpedContribuicoesDAOA100): IJSSpedContribuicoesDAOCollectionBlocoA;
    function AddA110(Value: IJSSpedContribuicoesDAOA110): IJSSpedContribuicoesDAOCollectionBlocoA;
    function AddA111(Value: IJSSpedContribuicoesDAOA111): IJSSpedContribuicoesDAOCollectionBlocoA;
    function AddA170(Value: IJSSpedContribuicoesDAOA170): IJSSpedContribuicoesDAOCollectionBlocoA;

    function CountA100: Integer;

    function DAOA010: IJSSpedContribuicoesDAOA010;
    function DAOA100(Index: Integer): IJSSpedContribuicoesDAOA100;
    function DAOA110: IJSSpedContribuicoesDAOA110;
    function DAOA111: IJSSpedContribuicoesDAOA111;
    function DAOA170: IJSSpedContribuicoesDAOA170;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoA;
    function &End: IJSSpedContribuicoesDAOCollection;
  end;

  IJSSpedContribuicoesDAOCollectionBlocoC = interface
    ['{D718404D-4CBA-4B9A-B684-5877461AFDB9}']
    function AddC010(Value: IJSSpedContribuicoesDAOC010): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC100(Value: IJSSpedContribuicoesDAOC100): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC110(Value: IJSSpedContribuicoesDAOC110): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC111(Value: IJSSpedContribuicoesDAOC111): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC120(Value: IJSSpedContribuicoesDAOC120): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC170(Value: IJSSpedContribuicoesDAOC170): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC175(Value: IJSSpedContribuicoesDAOC175): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC180(Value: IJSSpedContribuicoesDAOC180): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC181(Value: IJSSpedContribuicoesDAOC181): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC185(Value: IJSSpedContribuicoesDAOC185): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC380(Value: IJSSpedContribuicoesDAOC380): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC381(Value: IJSSpedContribuicoesDAOC381): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC385(Value: IJSSpedContribuicoesDAOC385): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC395(Value: IJSSpedContribuicoesDAOC395): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC396(Value: IJSSpedContribuicoesDAOC396): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC400(Value: IJSSpedContribuicoesDAOC400): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC405(Value: IJSSpedContribuicoesDAOC405): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC481(Value: IJSSpedContribuicoesDAOC481): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC485(Value: IJSSpedContribuicoesDAOC485): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC490(Value: IJSSpedContribuicoesDAOC490): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC491(Value: IJSSpedContribuicoesDAOC491): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC495(Value: IJSSpedContribuicoesDAOC495): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC500(Value: IJSSpedContribuicoesDAOC500): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC501(Value: IJSSpedContribuicoesDAOC501): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC505(Value: IJSSpedContribuicoesDAOC505): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC800(Value: IJSSpedContribuicoesDAOC800): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC810(Value: IJSSpedContribuicoesDAOC810): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC860(Value: IJSSpedContribuicoesDAOC860): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC870(Value: IJSSpedContribuicoesDAOC870): IJSSpedContribuicoesDAOCollectionBlocoC;

    function CountC100: Integer;
    function CountC500: Integer;

    function DAOC010: IJSSpedContribuicoesDAOC010;
    function DAOC100(Index: Integer): IJSSpedContribuicoesDAOC100;
    function DAOC110: IJSSpedContribuicoesDAOC110;
    function DAOC111: IJSSpedContribuicoesDAOC111;
    function DAOC120: IJSSpedContribuicoesDAOC120;
    function DAOC170: IJSSpedContribuicoesDAOC170;
    function DAOC175: IJSSpedContribuicoesDAOC175;
    function DAOC180: IJSSpedContribuicoesDAOC180;
    function DAOC181: IJSSpedContribuicoesDAOC181;
    function DAOC185: IJSSpedContribuicoesDAOC185;
    function DAOC380: IJSSpedContribuicoesDAOC380;
    function DAOC381: IJSSpedContribuicoesDAOC381;
    function DAOC385: IJSSpedContribuicoesDAOC385;
    function DAOC395: IJSSpedContribuicoesDAOC395;
    function DAOC396: IJSSpedContribuicoesDAOC396;
    function DAOC400: IJSSpedContribuicoesDAOC400;
    function DAOC405: IJSSpedContribuicoesDAOC405;
    function DAOC481: IJSSpedContribuicoesDAOC481;
    function DAOC485: IJSSpedContribuicoesDAOC485;
    function DAOC490: IJSSpedContribuicoesDAOC490;
    function DAOC491: IJSSpedContribuicoesDAOC491;
    function DAOC495: IJSSpedContribuicoesDAOC495;
    function DAOC500(Index: Integer): IJSSpedContribuicoesDAOC500;
    function DAOC501: IJSSpedContribuicoesDAOC501;
    function DAOC505: IJSSpedContribuicoesDAOC505;
    function DAOC800: IJSSpedContribuicoesDAOC800;
    function DAOC810: IJSSpedContribuicoesDAOC810;
    function DAOC860: IJSSpedContribuicoesDAOC860;
    function DAOC870: IJSSpedContribuicoesDAOC870;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoC;
    function &End: IJSSpedContribuicoesDAOCollection;
  end;

  IJSSpedContribuicoesDAOCollectionBlocoD = interface
    ['{110DA0BB-C6B6-4F3D-A1EE-C1015EF5EA46}']
    function AddD010(Value: IJSSpedContribuicoesDAOD010): IJSSpedContribuicoesDAOCollectionBlocoD;

    function AddD100(Value: IJSSpedContribuicoesDAOD100): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD101(Value: IJSSpedContribuicoesDAOD101): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD105(Value: IJSSpedContribuicoesDAOD105): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD111(Value: IJSSpedContribuicoesDAOD111): IJSSpedContribuicoesDAOCollectionBlocoD;

    function AddD200(Value: IJSSpedContribuicoesDAOD200): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD201(Value: IJSSpedContribuicoesDAOD201): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD205(Value: IJSSpedContribuicoesDAOD205): IJSSpedContribuicoesDAOCollectionBlocoD;

    function AddD500(Value: IJSSpedContribuicoesDAOD500): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD501(Value: IJSSpedContribuicoesDAOD501): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD505(Value: IJSSpedContribuicoesDAOD505): IJSSpedContribuicoesDAOCollectionBlocoD;
    function AddD509(Value: IJSSpedContribuicoesDAOD509): IJSSpedContribuicoesDAOCollectionBlocoD;

    function CountD100: Integer;
    function CountD200: Integer;
    function CountD500: Integer;

    function DAOD010: IJSSpedContribuicoesDAOD010;

    function DAOD100(Index: Integer): IJSSpedContribuicoesDAOD100;
    function DAOD101: IJSSpedContribuicoesDAOD101;
    function DAOD105: IJSSpedContribuicoesDAOD105;
    function DAOD111: IJSSpedContribuicoesDAOD111;

    function DAOD200(Index: Integer): IJSSpedContribuicoesDAOD200;
    function DAOD201: IJSSpedContribuicoesDAOD201;
    function DAOD205: IJSSpedContribuicoesDAOD205;

    function DAOD500(Index: Integer): IJSSpedContribuicoesDAOD500;
    function DAOD501: IJSSpedContribuicoesDAOD501;
    function DAOD505: IJSSpedContribuicoesDAOD505;
    function DAOD509: IJSSpedContribuicoesDAOD509;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoD;
    function &End: IJSSpedContribuicoesDAOCollection;
  end;

  IJSSpedContribuicoesDAOCollectionBlocoF = interface
    ['{F1114AE7-1E19-41DC-AD08-5C90DD89F00F}']
    function AddF010(Value: IJSSpedContribuicoesDAOF010): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF100(Value: IJSSpedContribuicoesDAOF100): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF111(Value: IJSSpedContribuicoesDAOF111): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF120(Value: IJSSpedContribuicoesDAOF120): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF129(Value: IJSSpedContribuicoesDAOF129): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF130(Value: IJSSpedContribuicoesDAOF130): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF139(Value: IJSSpedContribuicoesDAOF139): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF200(Value: IJSSpedContribuicoesDAOF200): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF205(Value: IJSSpedContribuicoesDAOF205): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF210(Value: IJSSpedContribuicoesDAOF210): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF211(Value: IJSSpedContribuicoesDAOF211): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF500(Value: IJSSpedContribuicoesDAOF500): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF525(Value: IJSSpedContribuicoesDAOF525): IJSSpedContribuicoesDAOCollectionBlocoF;
    function AddF550(Value: IJSSpedContribuicoesDAOF550): IJSSpedContribuicoesDAOCollectionBlocoF;

    function AddF600(Value: IJSSpedContribuicoesDAOF600): IJSSpedContribuicoesDAOCollectionBlocoF;

    function CountF100: Integer;

    function DAOF010: IJSSpedContribuicoesDAOF010;
    function DAOF100(Index: Integer): IJSSpedContribuicoesDAOF100;
    function DAOF111: IJSSpedContribuicoesDAOF111;

    function DAOF120: IJSSpedContribuicoesDAOF120;
    function DAOF129: IJSSpedContribuicoesDAOF129;

    function DAOF130: IJSSpedContribuicoesDAOF130;
    function DAOF139: IJSSpedContribuicoesDAOF139;

    function DAOF200: IJSSpedContribuicoesDAOF200;
    function DAOF205: IJSSpedContribuicoesDAOF205;
    function DAOF210: IJSSpedContribuicoesDAOF210;
    function DAOF211: IJSSpedContribuicoesDAOF211;

    function DAOF500: IJSSpedContribuicoesDAOF500;
    function DAOF525: IJSSpedContribuicoesDAOF525;
    function DAOF550: IJSSpedContribuicoesDAOF550;

    function DAOF600: IJSSpedContribuicoesDAOF600;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoF;
    function &End: IJSSpedContribuicoesDAOCollection;
  end;

  IJSSpedContribuicoesDAOCollectionBlocoM = interface
    ['{32572CC8-9961-4125-85CE-A41C4994BB0D}']
    function AddM110(Value: IJSSpedContribuicoesDAOM110): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM115(Value: IJSSpedContribuicoesDAOM115): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM220(Value: IJSSpedContribuicoesDAOM220): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM225(Value: IJSSpedContribuicoesDAOM225): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM350(Value: IJSSpedContribuicoesDAOM350): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM510(Value: IJSSpedContribuicoesDAOM510): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM515(Value: IJSSpedContribuicoesDAOM515): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM620(Value: IJSSpedContribuicoesDAOM620): IJSSpedContribuicoesDAOCollectionBlocoM;
    function AddM625(Value: IJSSpedContribuicoesDAOM625): IJSSpedContribuicoesDAOCollectionBlocoM;

    function DAOM110: IJSSpedContribuicoesDAOM110;
    function DAOM115: IJSSpedContribuicoesDAOM115;
    function DAOM220: IJSSpedContribuicoesDAOM220;
    function DAOM225: IJSSpedContribuicoesDAOM225;
    function DAOM350: IJSSpedContribuicoesDAOM350;
    function DAOM510: IJSSpedContribuicoesDAOM510;
    function DAOM515: IJSSpedContribuicoesDAOM515;
    function DAOM620: IJSSpedContribuicoesDAOM620;
    function DAOM625: IJSSpedContribuicoesDAOM625;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoM;
    function &End: IJSSpedContribuicoesDAOCollection;
  end;

  IJSSpedContribuicoesDAOCollectionBlocoP = interface
    ['{D1B33D4A-40AF-4EA3-8FB0-A79DCA6CEA9E}']
    function AddP010(Value: IJSSpedContribuicoesDAOP010): IJSSpedContribuicoesDAOCollectionBlocoP;
    function AddP100(Value: IJSSpedContribuicoesDAOP100): IJSSpedContribuicoesDAOCollectionBlocoP;
    function AddP200(Value: IJSSpedContribuicoesDAOP200): IJSSpedContribuicoesDAOCollectionBlocoP;

    function DAOP010: IJSSpedContribuicoesDAOP010;
    function DAOP100: IJSSpedContribuicoesDAOP100;
    function DAOP200: IJSSpedContribuicoesDAOP200;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoP;
    function &End: IJSSpedContribuicoesDAOCollection;
  end;

function SpedContribuicoesServiceFactory: IJSSpedContribuicoesServiceFactory;
function SpedContribuicoesService: IJSSpedContribuicoesService;

implementation

uses
  JSSpedContribuicoes.Service.Factory;

function SpedContribuicoesService: IJSSpedContribuicoesService;
begin
  result := SpedContribuicoesServiceFactory.createService;
end;

function SpedContribuicoesServiceFactory: IJSSpedContribuicoesServiceFactory;
begin
  Result := TJSSpedContribuicoesServiceFactory.New;
end;

end.
