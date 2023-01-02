unit JSSpedContribuicoes.Model.RegistroF120;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF120 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnatBcCred         : String;
    FidentBemImob      : TJSSpedContribuicoesIndicadorBemImob;
    FindOrigCred       : TJSSpedContribuicoesIndicadorOrigemCredito;
    FindUtilBemImob    : TJSSpedContribuicoesIndicadorUtilBemImob;
    FvlBcPis           : Currency;
    FvlBcCofins        : Currency;
    FcodCta            : String;
    FdescBemImob       : String;
    FcstPis            : String;
    FcstCofins         : String;
    FvlPis             : Currency;
    FvlCofins          : Currency;
    FvlOperDep         : Currency;
    FaliqPis           : Double;
    FparcOperNaoBcCred : Currency;
    FcodCcus           : String;
    FaliqCofins        : Double;

  public
    property natBcCred         : String                                     read FnatBcCred         write FnatBcCred;
    property identBemImob      : TJSSpedContribuicoesIndicadorBemImob       read FidentBemImob      write FidentBemImob;
    property indOrigCred       : TJSSpedContribuicoesIndicadorOrigemCredito read FindOrigCred       write FindOrigCred;
    property indUtilBemImob    : TJSSpedContribuicoesIndicadorUtilBemImob   read FindUtilBemImob    write FindUtilBemImob;
    property vlOperDep         : Currency                                   read FvlOperDep         write FvlOperDep;
    property parcOperNaoBcCred : Currency                                   read FparcOperNaoBcCred write FparcOperNaoBcCred;
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
    property descBemImob       : string                                     read FdescBemImob       write FdescBemImob;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF120>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF120 }

constructor TJSSpedContribuicoesModelRegistroF120.create;
begin
  inherited;
  reg := 'F120';
end;

destructor TJSSpedContribuicoesModelRegistroF120.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF120.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF120>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF120>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF120): Integer
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
