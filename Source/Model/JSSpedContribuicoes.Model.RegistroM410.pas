unit JSSpedContribuicoes.Model.RegistroM410;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM410 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnatRec    : String;
    FvlRec     : Currency;
    FcodCta    : String;
    FdescCompl : String;

  public
    property natRec    : String   read FnatRec    write FnatRec;
    property vlRec     : Currency read FvlRec     write FvlRec;
    property codCta    : String   read FcodCta    write FcodCta;
    property descCompl : String   read FdescCompl write FdescCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM410>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM410 }

constructor TJSSpedContribuicoesModelRegistroM410.create;
begin
  inherited;
  reg := 'M410';
end;

destructor TJSSpedContribuicoesModelRegistroM410.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM410.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM410>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM410>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM410): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.GetValueStr('CSTPIS') + Left.natRec + Left.codCta;

      RChave := Right.GetValueStr('CSTPIS') + Right.natRec + Right.codCta;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
