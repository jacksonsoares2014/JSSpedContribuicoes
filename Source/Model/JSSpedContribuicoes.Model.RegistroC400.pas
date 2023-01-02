unit JSSpedContribuicoes.Model.RegistroC400;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults;

type
  TJSSpedContribuicoesModelRegistroC400 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodMod: string;
    FecfMod: string;
    FecfFab: string;
    FecfCx : string;

  public
    property codMod: string read FcodMod write FcodMod;
    property ecfMod: string read FecfMod write FecfMod;
    property ecfFab: string read FecfFab write FecfFab;
    property ecfCx:  string read FecfCx  write FecfCx;

    constructor create; override;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC400>;
end;

implementation

{ TJSSpedContribuicoesModelRegistroC400 }

constructor TJSSpedContribuicoesModelRegistroC400.create;
begin
  inherited;
  reg := 'C400';
end;

class function TJSSpedContribuicoesModelRegistroC400.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC400>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC400>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC400): Integer
    var LChave, RChave: String;
    begin
      LChave := Left.codMod +
                Left.ecfMod +
                Left.ecfFab;

      RChave := Right.codMod +
                Right.ecfMod +
                Right.ecfFab;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0
    end);
end;

end.

