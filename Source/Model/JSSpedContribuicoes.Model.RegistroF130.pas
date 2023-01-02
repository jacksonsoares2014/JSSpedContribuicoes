unit JSSpedContribuicoes.Model.RegistroF130;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF130 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlBcPis           : Currency;
    FindUtilBemImob    : TJSSpedContribuicoesIndicadorUtilBemImob;
    FvlBcCofins        : Currency;
    FcodCta            : String;
    FdescBemImob       : String;
    FvlBcCred          : Currency;
    FmesOperAquis      : String;
    FidentBemImob      : TJSSpedContribuicoesIndicadorBemImob;
    FindNrParc         : String;
    FcstPis            : String;
    FcstCofins         : String;
    FvlPis             : Currency;
    FnatBcCred         : String;
    FvlCofins          : Currency;
    FindOrigCred       : TJSSpedContribuicoesIndicadorOrigemCredito;
    FaliqPis           : Double;
    FparcOperNaoBcCred : Currency;
    FvlOperAquis       : Currency;
    FcodCcus           : String;
    FaliqCofins        : Double;

  public
    property natBcCred         : String                                     read FnatBcCred         write FnatBcCred;
    property identBemImob      : TJSSpedContribuicoesIndicadorBemImob       read FidentBemImob      write FidentBemImob;
    property indOrigCred       : TJSSpedContribuicoesIndicadorOrigemCredito read FindOrigCred       write FindOrigCred;
    property indUtilBemImob    : TJSSpedContribuicoesIndicadorUtilBemImob   read FindUtilBemImob    write FindUtilBemImob;
    property mesOperAquis      : String                                     read FmesOperAquis      write FmesOperAquis;
    property vlOperAquis       : Currency                                   read FvlOperAquis       write FvlOperAquis;
    property parcOperNaoBcCred : Currency                                   read FparcOperNaoBcCred write FparcOperNaoBcCred;
    property vlBcCred          : Currency                                   read FvlBcCred          write FvlBcCred;
    property indNrParc         : String                                     read FindNrParc         write FindNrParc;
    property cstPis            : String                                     read FcstPis            write FcstPis;
    property vlBcPis           : Currency                                   read FvlBcPis           write FvlBcPis;
    property aliqPis           : Double                                     read FaliqPis           write FaliqPis;
    property vlPis             : Currency                                   read FvlPis             write FvlPis;
    property cstCofins         : String                                     read FcstCofins         write FcstCofins;
    property vlBcCofins        : Currency                                   read FvlBcCofins        write FvlBcCofins;
    property aliqCofins        : Double                                     read FaliqCofins        write FaliqCofins;
    property vlCofins          : Currency                                   read FvlCofins          write FvlCofins;
    property codCta            : String                                     read FcodCta            write FcodCta;
    property codCcus           : String                                     read FcodCcus           write FcodCcus;
    property descBemImob       : String                                     read FdescBemImob       write FdescBemImob;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF130>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF130 }

constructor TJSSpedContribuicoesModelRegistroF130.create;
begin
  inherited;
  reg := 'F130';
end;

destructor TJSSpedContribuicoesModelRegistroF130.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF130.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF130>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF130>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF130): Integer
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
