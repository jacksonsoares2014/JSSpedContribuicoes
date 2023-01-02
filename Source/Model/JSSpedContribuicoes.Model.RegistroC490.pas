unit JSSpedContribuicoes.Model.RegistroC490;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC490 = class(TJSSpedContribuicoesModelRegistro)
  private
    FdtDocIni: TDateTime;
    FdtDocFin: TDateTime;
    FcodMod  : String;

  public
    property dtDocIni: TDateTime read FdtDocIni write FdtDocIni;
    property dtDocFin: TDateTime read FdtDocFin write FdtDocFin;
    property codMod  : String    read FcodMod   write FcodMod;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC490>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC490 }

constructor TJSSpedContribuicoesModelRegistroC490.create;
begin
  inherited;
  reg := 'C490';
end;

destructor TJSSpedContribuicoesModelRegistroC490.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC490.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC490>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC490>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC490): Integer
    begin
      if Left.codMod < Right.codMod then
        Result := -1
      else if Left.codMod > Right.codMod then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
