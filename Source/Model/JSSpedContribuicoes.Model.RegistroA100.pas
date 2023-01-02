unit JSSpedContribuicoes.Model.RegistroA100;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroA100 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindOper     : TJSSpedContribuicoesTipoOperacaoServico;
    FindEmit     : TJSSpedContribuicoesIndicadorEmitente;
    FcodPart     : String;
    FcodSit      : TJSSpedContribuicoesCodigoSituacaoDocumento;
    Fserie       : String;
    Fsubserie    : String;
    FnumDoc      : String;
    FchvNfse     : String;
    FdtDoc       : TDateTime;
    FdtExeServ   : TDateTime;
    FvlDoc       : Currency;
    FindPgto     : TJSSpedContribuicoesIndicadorPagamento;
    FvlDesc      : Currency;
    FvlBcPis     : Currency;
    FvlPis       : Currency;
    FvlBcCofins  : Currency;
    FvlCofins    : Currency;
    FvlPisRet    : Currency;
    FvlCofinsRet : Currency;
    FvlIss       : Currency;

  public
    property indOper     : TJSSpedContribuicoesTipoOperacaoServico     read FindOper     write FindOper;
    property indEmit     : TJSSpedContribuicoesIndicadorEmitente       read FindEmit     write FindEmit;
    property codPart     : String                                      read FcodPart     write FcodPart;
    property codSit      : TJSSpedContribuicoesCodigoSituacaoDocumento read FcodSit      write FcodSit;
    property serie       : String                                      read Fserie       write Fserie;
    property subserie    : String                                      read Fsubserie    write Fsubserie;
    property numDoc      : String                                      read FnumDoc      write FnumDoc;
    property chvNfse     : String                                      read FchvNfse     write FchvNfse;
    property dtDoc       : TDateTime                                   read FdtDoc       write FdtDoc;
    property dtExeServ   : TDateTime                                   read FdtExeServ   write FdtExeServ;
    property vlDoc       : Currency                                    read FvlDoc       write FvlDoc;
    property indPgto     : TJSSpedContribuicoesIndicadorPagamento      read FindPgto     write FindPgto;
    property vlDesc      : Currency                                    read FvlDesc      write FvlDesc;
    property vlBcPis     : Currency                                    read FvlBcPis     write FvlBcPis;
    property vlPis       : Currency                                    read FvlPis       write FvlPis;
    property vlBcCofins  : Currency                                    read FvlBcCofins  write FvlBcCofins;
    property vlCofins    : Currency                                    read FvlCofins    write FvlCofins;
    property vlPisRet    : Currency                                    read FvlPisRet    write FvlPisRet;
    property vlCofinsRet : Currency                                    read FvlCofinsRet write FvlCofinsRet;
    property vlIss       : Currency                                    read FvlIss       write FvlIss;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroA100>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroA100 }

constructor TJSSpedContribuicoesModelRegistroA100.create;
begin
  inherited;
  reg := 'A100';
end;

destructor TJSSpedContribuicoesModelRegistroA100.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroA100.getComparer: IComparer<TJSSpedContribuicoesModelRegistroA100>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroA100>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroA100): Integer
    var LChave, RChave: string;
    begin
      LChave := '';

      RChave := '';

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
