unit JSSpedContribuicoes.Model.RegistroF100;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF100 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindOper     : TJSSpedContribuicoesTipoOperacaoF100;
    FcodPart     : String;
    FcodItem     : String;
    FdtOper      : TDateTime;
    FvlOper      : Currency;
    FcstPis      : String;
    FvlBcPis     : Currency;
    FaliqPis     : Double;
    FvlPis       : Currency;
    FcstCofins   : String;
    FvlBcCofins  : Currency;
    FaliqCofins  : Double;
    FvlCofins    : Currency;
    FnatBcCred   : String;
    FcodCta      : String;
    FindOrigCred : TJSSpedContribuicoesIndicadorOrigemCredito;
    FdescDocOper : String;
    FcodCcus     : String;

  public
    property indOper     : TJSSpedContribuicoesTipoOperacaoF100        read FindOper     write FindOper;
    property codPart     : String                                      read FcodPart     write FcodPart;
    property codItem     : String                                      read FcodItem     write FcodItem;
    property dtOper      : TDateTime                                   read FdtOper      write FdtOper;
    property vlOper      : Currency                                    read FvlOper      write FvlOper;
    property cstPis      : String                                      read FcstPis      write FcstPis;
    property vlBcPis     : Currency                                    read FvlBcPis     write FvlBcPis;
    property aliqPis     : Double                                      read FaliqPis     write FaliqPis;
    property vlPis       : Currency                                    read FvlPis       write FvlPis;
    property cstCofins   : String                                      read FcstCofins   write FcstCofins;
    property vlBcCofins  : Currency                                    read FvlBcCofins  write FvlBcCofins;
    property aliqCofins  : Double                                      read FaliqCofins  write FaliqCofins;
    property vlCofins    : Currency                                    read FvlCofins    write FvlCofins;
    property natBcCred   : String                                      read FnatBcCred   write FnatBcCred;
    property indOrigCred : TJSSpedContribuicoesIndicadorOrigemCredito  read FindOrigCred write FindOrigCred;
    property codCta      : String                                      read FcodCta      write FcodCta;
    property codCcus     : String                                      read FcodCcus     write FcodCcus;
    property descDocOper : String                                      read FdescDocOper write FdescDocOper;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF100>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF100 }

constructor TJSSpedContribuicoesModelRegistroF100.create;
begin
  inherited;
  reg := 'F100';
end;

destructor TJSSpedContribuicoesModelRegistroF100.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF100.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF100>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF100>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF100): Integer
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
