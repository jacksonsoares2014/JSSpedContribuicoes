unit JSSpedContribuicoes.Model.RegistroF210;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF210 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlCusOrc         : Currency;
    FvlExc            : Currency;
    FvlCusOrcAju      : Currency;
    FvlBcCred         : Currency;
    FvlCredPisUtil    : Currency;
    FvlCredCofinsUtil : Currency;
    FcstPis           : String;
    FcstCofins        : String;
    FaliqPis          : Double;
    FaliqCofins       : Double;

  public
    property vlCusOrc             : Currency read FvlCusOrc             write FvlCusOrc;
    property vlExc                : Currency read FvlExc                write FvlExc;
    property vlCusOrcAju          : Currency read FvlCusOrcAju          write FvlCusOrcAju;
    property vlBcCred             : Currency read FvlBcCred             write FvlBcCred;
    property cstPis               : String   read FcstPis               write FcstPis;
    property aliqPis              : Double   read FaliqPis              write FaliqPis;
    property vlCredPisUtil        : Currency read FvlCredPisUtil        write FvlCredPisUtil;
    property cstCofins            : String   read FcstCofins            write FcstCofins;
    property aliqCofins           : Double   read FaliqCofins           write FaliqCofins;
    property vlCredCofinsUtil     : Currency read FvlCredCofinsUtil     write FvlCredCofinsUtil;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF210>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF210 }

constructor TJSSpedContribuicoesModelRegistroF210.create;
begin
  inherited;
  reg := 'F210';
end;

destructor TJSSpedContribuicoesModelRegistroF210.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF210.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF210>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF210>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF210): Integer
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
