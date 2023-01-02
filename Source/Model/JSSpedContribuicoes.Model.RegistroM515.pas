unit JSSpedContribuicoes.Model.RegistroM515;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM515 = class(TJSSpedContribuicoesModelRegistro)
  private
    FdetValorAj : Currency;
    FcstCofins  : String;
    FdetBcCred  : Currency;
    FdetAliq    : Double;
    FdescAj     : String;
    FdtOperAj   : TDateTime;
    FinfoCompl  : String;
    FcodCta     : String;

  public
    property detValorAj : Currency  read FdetValorAj write FdetValorAj;
    property cstCofins  : String    read FcstCofins  write FcstCofins;
    property detBcCred  : Currency  read FdetBcCred  write FdetBcCred;
    property detAliq    : Double    read FdetAliq    write FdetAliq;
    property dtOperAj   : TDateTime read FdtOperAj   write FdtOperAj;
    property descAj     : String    read FdescAj     write FdescAj;
    property codCta     : String    read FcodCta     write FcodCta;
    property infoCompl  : String    read FinfoCompl  write FinfoCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM515>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM515 }

constructor TJSSpedContribuicoesModelRegistroM515.create;
begin
  inherited;
  reg := 'M515';
end;

destructor TJSSpedContribuicoesModelRegistroM515.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM515.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM515>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM515>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM515): Integer
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
