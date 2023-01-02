unit JSSpedContribuicoes.Model.RegistroM225;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM225 = class(TJSSpedContribuicoesModelRegistro)
  private
    FdetValorAj : Currency;
    FcstPis     : String;
    FdetBcCred  : Double;
    FdetAliq    : Double;
    FdtOperAj   : TDateTime;
    FdescAj     : String;
    FcodCta     : String;
    FinfoCompl  : String;

  public
    property detValorAj : Currency  read FdetValorAj write FdetValorAj;
    property cstPis     : String    read FcstPis     write FcstPis;
    property detBcCred  : Double    read FdetBcCred  write FdetBcCred;
    property detAliq    : Double    read FdetAliq    write FdetAliq;
    property dtOperAj   : TDateTime read FdtOperAj   write FdtOperAj;
    property descAj     : String    read FdescAj     write FdescAj;
    property codCta     : String    read FcodCta     write FcodCta;
    property infoCompl  : String    read FinfoCompl  write FinfoCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM225>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM225 }

constructor TJSSpedContribuicoesModelRegistroM225.create;
begin
  inherited;
  reg := 'M225';
end;

destructor TJSSpedContribuicoesModelRegistroM225.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM225.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM225>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM225>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM225): Integer
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
