unit JSSpedContribuicoes.Model.RegistroM350;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM350 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlTotFol     : Currency;
    FvlExcBc      : Currency;
    FvlTotBc      : Currency;
    FaliqPisFol   : Currency;
    FvlTotContFol : Currency;

  public
    property vlTotFol     : Currency read FvlTotFol     write FvlTotFol;
    property vlExcBc      : Currency read FvlExcBc      write FvlExcBc;
    property vlTotBc      : Currency read FvlTotBc      write FvlTotBc;
    property aliqPisFol   : Currency read FaliqPisFol   write FaliqPisFol;
    property vlTotContFol : Currency read FvlTotContFol write FvlTotContFol;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM350>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM350 }

constructor TJSSpedContribuicoesModelRegistroM350.create;
begin
  inherited;
  reg := 'M350';
end;

destructor TJSSpedContribuicoesModelRegistroM350.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM350.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM350>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM350>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM350): Integer
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
