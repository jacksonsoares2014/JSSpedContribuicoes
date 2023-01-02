unit JSSpedContribuicoes.Model.RegistroD100;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD100 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindOper     : TJSSpedContribuicoesTipoOperacaoServico;
    FindEmit     : TJSSpedContribuicoesIndicadorEmitente;
    FcodPart     : String;
    FcodSit      : TJSSpedContribuicoesCodigoSituacaoDocumento;
    Fserie       : String;
    Fsubserie    : String;
    FnumDoc      : String;
    FchvCTe      : String;
    FdtDoc       : TDateTime;
    FtpCte       : String;
    FvlDoc       : Currency;
    FvlDesc      : Currency;
    FindFrt      : TJSSpedContribuicoesIndicadorFrete;
    FvlServ      : Currency;
    FvlBcIcms    : Currency;
    FvlNt        : Currency;
    FcodMod      : String;
    FdtAp        : TDateTime;
    FchvCTeRef   : String;
    FvlIcms      : Currency;
    FcodInf      : String;
    FcodCta      : String;

  public
    property indOper     : TJSSpedContribuicoesTipoOperacaoServico     read FindOper     write FindOper;
    property indEmit     : TJSSpedContribuicoesIndicadorEmitente       read FindEmit     write FindEmit;
    property codPart     : String                                      read FcodPart     write FcodPart;
    property codMod      : String                                      read FcodMod      write FcodMod;
    property codSit      : TJSSpedContribuicoesCodigoSituacaoDocumento read FcodSit      write FcodSit;
    property serie       : String                                      read Fserie       write Fserie;
    property subserie    : String                                      read Fsubserie    write Fsubserie;
    property numDoc      : String                                      read FnumDoc      write FnumDoc;
    property chvCTe      : String                                      read FchvCTe      write FchvCTe;
    property dtDoc       : TDateTime                                   read FdtDoc       write FdtDoc;
    property dtAp        : TDateTime                                   read FdtAp        write FdtAp;
    property tpCte       : String                                      read FtpCte       write FtpCte;
    property chvCTeRef   : String                                      read FchvCTeRef   write FchvCTeRef;
    property vlDoc       : Currency                                    read FvlDoc       write FvlDoc;
    property vlDesc      : Currency                                    read FvlDesc      write FvlDesc;
    property indFrt      : TJSSpedContribuicoesIndicadorFrete          read FindFrt      write FindFrt;
    property vlServ      : Currency                                    read FvlServ      write FvlServ;
    property vlBcIcms    : Currency                                    read FvlBcIcms    write FvlBcIcms;
    property vlIcms      : Currency                                    read FvlIcms      write FvlIcms;
    property vlNt        : Currency                                    read FvlNt        write FvlNt;
    property codInf      : String                                      read FcodInf      write FcodInf;
    property codCta      : String                                      read FcodCta      write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD100>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD100 }

constructor TJSSpedContribuicoesModelRegistroD100.create;
begin
  inherited;
  reg := 'D100';
end;

destructor TJSSpedContribuicoesModelRegistroD100.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD100.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD100>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD100>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD100): Integer
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
