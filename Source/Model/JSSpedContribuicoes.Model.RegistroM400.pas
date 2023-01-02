unit JSSpedContribuicoes.Model.RegistroM400;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM400 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcstPis    : String;
    FvlTotRec  : Currency;
    FcodCta    : String;
    FdescCompl : String;

  public
    property cstPis    : String   read FcstPis    write FcstPis;
    property vlTotRec  : Currency read FvlTotRec  write FvlTotRec;
    property codCta    : String   read FcodCta    write FcodCta;
    property descCompl : String   read FdescCompl write FdescCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM400>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM400 }

constructor TJSSpedContribuicoesModelRegistroM400.create;
begin
  inherited;
  reg := 'M400';
end;

destructor TJSSpedContribuicoesModelRegistroM400.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM400.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM400>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM400>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM400): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.cstPis + Left.codCta;

      RChave := Right.cstPis + Right.codCta;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
