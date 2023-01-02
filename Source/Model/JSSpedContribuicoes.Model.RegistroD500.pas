unit JSSpedContribuicoes.Model.RegistroD500;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD500 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindOper     : TJSSpedContribuicoesTipoOperacaoServico;
    FindEmit     : TJSSpedContribuicoesIndicadorEmitente;
    FcodPart     : String;
    FcodMod      : String;
    FcodSit      : TJSSpedContribuicoesCodigoSituacaoDocumento;
    Fserie       : String;
    Fsubserie    : String;
    FnumDoc      : String;
    FdtDoc       : TDateTime;
    FdtAp        : TDateTime;
    FvlDoc       : Currency;
    FvlDesc      : Currency;
    FvlServ      : Currency;
    FvlServNt    : Currency;
    FvlTerc      : Currency;
    FvlDa        : Currency;
    FvlBcIcms    : Currency;
    FvlIcms      : Currency;
    FcodInf      : String;
    FvlPis       : Currency;
    FvlCofins    : Currency;

  public
    property indOper     : TJSSpedContribuicoesTipoOperacaoServico     read FindOper     write FindOper;
    property indEmit     : TJSSpedContribuicoesIndicadorEmitente       read FindEmit     write FindEmit;
    property codPart     : String                                      read FcodPart     write FcodPart;
    property codMod      : String                                      read FcodMod      write FcodMod;
    property codSit      : TJSSpedContribuicoesCodigoSituacaoDocumento read FcodSit      write FcodSit;
    property serie       : String                                      read Fserie       write Fserie;
    property subserie    : String                                      read Fsubserie    write Fsubserie;
    property numDoc      : String                                      read FnumDoc      write FnumDoc;
    property dtDoc       : TDateTime                                   read FdtDoc       write FdtDoc;
    property dtAp        : TDateTime                                   read FdtAp        write FdtAp;
    property vlDoc       : Currency                                    read FvlDoc       write FvlDoc;
    property vlDesc      : Currency                                    read FvlDesc      write FvlDesc;
    property vlServ      : Currency                                    read FvlServ      write FvlServ;
    property vlServNt    : Currency                                    read FvlServNt    write FvlServNt;
    property vlTerc      : Currency                                    read FvlTerc      write FvlTerc;
    property vlDa        : Currency                                    read FvlDa        write FvlDa;
    property vlBcIcms    : Currency                                    read FvlBcIcms    write FvlBcIcms;
    property vlIcms      : Currency                                    read FvlIcms      write FvlIcms;
    property codInf      : String                                      read FcodInf      write FcodInf;
    property vlPis       : Currency                                    read FvlPis       write FvlPis;
    property vlCofins    : Currency                                    read FvlCofins    write FvlCofins;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD500>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD500 }

constructor TJSSpedContribuicoesModelRegistroD500.create;
begin
  inherited;
  reg := 'D500';
end;

destructor TJSSpedContribuicoesModelRegistroD500.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD500.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD500>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD500>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD500): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codPart +
                Left.codMod  +
                Left.codSit.toString  +
                Left.serie     +
                Left.numDoc;

      RChave := Right.codPart +
                Right.codMod  +
                Right.codSit.toString  +
                Right.serie     +
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
