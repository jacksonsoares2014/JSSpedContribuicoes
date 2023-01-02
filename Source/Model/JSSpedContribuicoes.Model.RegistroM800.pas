unit JSSpedContribuicoes.Model.RegistroM800;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM800 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcstCofins : String;
    FvlTotRec  : Currency;
    FcodCta    : String;
    FdescCompl : String;

  public
    property cstCofins : String   read FcstCofins write FcstCofins;
    property vlTotRec  : Currency read FvlTotRec  write FvlTotRec;
    property codCta    : String   read FcodCta    write FcodCta;
    property descCompl : String   read FdescCompl write FdescCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM800>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM800 }

constructor TJSSpedContribuicoesModelRegistroM800.create;
begin
  inherited;
  reg := 'M800';
end;

destructor TJSSpedContribuicoesModelRegistroM800.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM800.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM800>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM800>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM800): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.cstCofins + Left.codCta;

      RChave := Right.cstCofins + Right.codCta;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
