unit JSSpedContribuicoes.Model.RegistroM605;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM605 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumCampo : String;
    FcodRec   : String;
    FvlDebito : Currency;

  public
    property numCampo : String   read FnumCampo write FnumCampo;
    property codRec   : String   read FcodRec   write FcodRec;
    property vlDebito : Currency read FvlDebito write FvlDebito;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM605>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM605 }

constructor TJSSpedContribuicoesModelRegistroM605.create;
begin
  inherited;
  reg := 'M605';
end;

destructor TJSSpedContribuicoesModelRegistroM605.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM605.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM605>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM605>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM605): Integer
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
