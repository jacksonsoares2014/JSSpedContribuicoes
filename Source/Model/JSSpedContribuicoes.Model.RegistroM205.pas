unit JSSpedContribuicoes.Model.RegistroM205;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM205 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumCampo : String;
    FcodRec   : String;
    FvlDebito : Currency;

  public
    property numCampo : String   read FnumCampo write FnumCampo;
    property codRec   : String   read FcodRec   write FcodRec;
    property vlDebito : Currency read FvlDebito write FvlDebito;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM205>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM205 }

constructor TJSSpedContribuicoesModelRegistroM205.create;
begin
  inherited;
  reg := 'M205';
end;

destructor TJSSpedContribuicoesModelRegistroM205.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM205.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM205>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM205>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM205): Integer
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
