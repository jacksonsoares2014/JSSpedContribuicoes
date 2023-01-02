unit JSSpedContribuicoes.Model.RegistroC100;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC100 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindOper    : TJSSpedContribuicoesTipoOperacao;
    FindEmit    : TJSSpedContribuicoesIndicadorEmitente;
    FcodPart    : String;
    FcodMod     : String;
    FcodSit     : TJSSpedContribuicoesCodigoSituacaoDocumento;
    Fserie      : String;
    FnumDoc     : String;
    FchvNFe     : String;
    FdtDoc      : TDateTime;
    FdtEs       : TDateTime;
    FvlDoc      : Currency;
    FindPgto    : TJSSpedContribuicoesIndicadorPagamento;
    FvlDesc     : Currency;
    FvlAbatNt   : Currency;
    FvlMerc     : Currency;
    FindFrt     : TJSSpedContribuicoesIndicadorFrete;
    FvlFrt      : Currency;
    FvlSeg      : Currency;
    FvlOutDA    : Currency;
    FvlBcIcms   : Currency;
    FvlIcms     : Currency;
    FvlBcIcmsSt : Currency;
    FvlIcmsSt   : Currency;
    FvlIpi      : Currency;
    FvlPis      : Currency;
    FvlCofins   : Currency;
    FvlPisSt    : Currency;
    FvlCofinsSt : Currency;

  public
    property indOper   : TJSSpedContribuicoesTipoOperacao            read FindOper    write FindOper;
    property indEmit   : TJSSpedContribuicoesIndicadorEmitente       read FindEmit    write FindEmit;
    property codPart   : String                                      read FcodPart    write FcodPart;
    property codMod    : String                                      read FcodMod     write FcodMod;
    property codSit    : TJSSpedContribuicoesCodigoSituacaoDocumento read FcodSit     write FcodSit;
    property serie     : string                                      read Fserie      write Fserie;
    property numDoc    : String                                      read FnumDoc     write FnumDoc;
    property chvNFe    : String                                      read FchvNFe     write FchvNFe;
    property dtDoc     : TDateTime                                   read FdtDoc      write FdtDoc;
    property dtEs      : TDateTime                                   read FdtEs       write FdtEs;
    property vlDoc     : Currency                                    read FvlDoc      write FvlDoc;
    property indPgto   : TJSSpedContribuicoesIndicadorPagamento      read FindPgto    write FindPgto;
    property vlDesc    : Currency                                    read FvlDesc     write FvlDesc;
    property vlAbatNt  : Currency                                    read FvlAbatNt   write FvlAbatNt;
    property vlMerc    : Currency                                    read FvlMerc     write FvlMerc;
    property indFrt    : TJSSpedContribuicoesIndicadorFrete          read FindFrt     write FindFrt;
    property vlFrt     : Currency                                    read FvlFrt      write FvlFrt;
    property vlSeg     : Currency                                    read FvlSeg      write FvlSeg;
    property vlOutDA   : Currency                                    read FvlOutDA    write FvlOutDA;
    property vlBcIcms  : Currency                                    read FvlBcIcms   write FvlBcIcms;
    property vlIcms    : Currency                                    read FvlIcms     write FvlIcms;
    property vlBcIcmsSt: Currency                                    read FvlBcIcmsSt write FvlBcIcmsSt;
    property vlIcmsSt  : Currency                                    read FvlIcmsSt   write FvlIcmsSt;
    property vlIpi     : Currency                                    read FvlIpi      write FvlIpi;
    property vlPis     : Currency                                    read FvlPis      write FvlPis;
    property vlCofins  : Currency                                    read FvlCofins   write FvlCofins;
    property vlPisSt   : Currency                                    read FvlPisSt    write FvlPisSt;
    property vlCofinsSt: Currency                                    read FvlCofinsSt write FvlCofinsSt;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC100>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC100 }

constructor TJSSpedContribuicoesModelRegistroC100.create;
begin
  inherited;
  reg := 'C100';
end;

destructor TJSSpedContribuicoesModelRegistroC100.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC100.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC100>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC100>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC100): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.indOper.toString +
                Left.indEmit.toString +
                Left.codMod +
                Left.codSit.toString +
                FormatDateTime('yyyymmdd',Left.dtEs) +
                JSSF.PadL(Left.serie,3) +
                Left.numDoc;

      RChave := Right.indOper.toString +
                Right.indEmit.toString +
                Right.codMod +
                Right.codSit.toString +
                FormatDateTime('yyyymmdd',Right.dtEs) +
                JSSF.PadL(Right.serie,3) +
                Right.numDoc;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
