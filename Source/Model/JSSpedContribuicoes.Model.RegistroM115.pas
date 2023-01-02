unit JSSpedContribuicoes.Model.RegistroM115;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM115 = class(TJSSpedContribuicoesModelRegistro)
  private
    FdetValorAj : Currency;
    FcstPis     : String;
    FdetBcCred  : Currency;
    FdetAliq    : Double;
    FdescAj     : String;
    FdtOperAj   : TDateTime;
    FinfoCompl  : String;
    FcodCta     : String;

  public
    property detValorAj : Currency  read FdetValorAj write FdetValorAj;
    property cstPis     : String    read FcstPis     write FcstPis;
    property detBcCred  : Currency  read FdetBcCred  write FdetBcCred;
    property detAliq    : Double    read FdetAliq    write FdetAliq;
    property dtOperAj   : TDateTime read FdtOperAj   write FdtOperAj;
    property descAj     : String    read FdescAj     write FdescAj;
    property codCta     : String    read FcodCta     write FcodCta;
    property infoCompl  : String    read FinfoCompl  write FinfoCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM115>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM115 }

constructor TJSSpedContribuicoesModelRegistroM115.create;
begin
  inherited;
  reg := 'M115';
end;

destructor TJSSpedContribuicoesModelRegistroM115.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM115.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM115>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM115>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM115): Integer
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
