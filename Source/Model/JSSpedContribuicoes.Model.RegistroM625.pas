unit JSSpedContribuicoes.Model.RegistroM625;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM625 = class(TJSSpedContribuicoesModelRegistro)
  private
    FdetValorAj : Currency;
    FcstCofins  : String;
    FdetBcCred  : Double;
    FdetAliq    : Double;
    FdtOperAj   : TDateTime;
    FdescAj     : String;
    FcodCta     : String;
    FinfoCompl  : String;

  public
    property detValorAj : Currency  read FdetValorAj write FdetValorAj;
    property cstCofins  : String    read FcstCofins  write FcstCofins;
    property detBcCred  : Double    read FdetBcCred  write FdetBcCred;
    property detAliq    : Double    read FdetAliq    write FdetAliq;
    property dtOperAj   : TDateTime read FdtOperAj   write FdtOperAj;
    property descAj     : String    read FdescAj     write FdescAj;
    property codCta     : String    read FcodCta     write FcodCta;
    property infoCompl  : String    read FinfoCompl  write FinfoCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM625>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM625 }

constructor TJSSpedContribuicoesModelRegistroM625.create;
begin
  inherited;
  reg := 'M625';
end;

destructor TJSSpedContribuicoesModelRegistroM625.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM625.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM625>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM625>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM625): Integer
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
