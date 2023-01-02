unit JSSpedContribuicoes.Model.RegistroP200;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroP200 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlTotContDev : Currency;
    FcodRec       : String;
    FvlTotContApu : Currency;
    FperRef       : String;
    FvlTotAjAcres : Currency;
    FvlTotAjReduc : Currency;

  public
    property perRef       : String   read FperRef       write FperRef;
    property vlTotContApu : Currency read FvlTotContApu write FvlTotContApu;
    property vlTotAjReduc : Currency read FvlTotAjReduc write FvlTotAjReduc;
    property vlTotAjAcres : Currency read FvlTotAjAcres write FvlTotAjAcres;
    property vlTotContDev : Currency read FvlTotContDev write FvlTotContDev;
    property codRec       : String   read FcodRec       write FcodRec;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroP200>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroP200 }

constructor TJSSpedContribuicoesModelRegistroP200.create;
begin
  inherited;
  reg := 'P200';
end;

destructor TJSSpedContribuicoesModelRegistroP200.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroP200.getComparer: IComparer<TJSSpedContribuicoesModelRegistroP200>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroP200>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroP200): Integer
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
