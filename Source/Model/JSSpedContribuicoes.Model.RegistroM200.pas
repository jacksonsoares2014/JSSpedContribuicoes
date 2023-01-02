unit JSSpedContribuicoes.Model.RegistroM200;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM200 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlTotContNcPer   : Currency;
    FvlContNcRec      : Currency;
    FvlContCumRec     : Currency;
    FvlTotContNcDev   : Currency;
    FvlRetNc          : Currency;
    FvlRetCum         : Currency;
    FvlOutDedNc       : Currency;
    FvlOutDedCum      : Currency;
    FvlTotCredDesc    : Currency;
    FvlTotContCumPer  : Currency;
    FvlTotContRec     : Currency;
    FvlTotCredDescAnt : Currency;

  public
    property vlTotContNcPer  : Currency read FvlTotContNcPer   write FvlTotContNcPer;
    property vlTotCredDesc   : Currency read FvlTotCredDesc    write FvlTotCredDesc;
    property vlTotCredDescAnt: Currency read FvlTotCredDescAnt write FvlTotCredDescAnt;
    property vlTotContNcDev  : Currency read FvlTotContNcDev   write FvlTotContNcDev;
    property vlRetNc         : Currency read FvlRetNc          write FvlRetNc;
    property vlOutDedNc      : Currency read FvlOutDedNc       write FvlOutDedNc;
    property vlContNcRec     : Currency read FvlContNcRec      write FvlContNcRec;
    property vlTotContCumPer : Currency read FvlTotContCumPer  write FvlTotContCumPer;
    property vlRetCum        : Currency read FvlRetCum         write FvlRetCum;
    property vlOutDedCum     : Currency read FvlOutDedCum      write FvlOutDedCum;
    property vlContCumRec    : Currency read FvlContCumRec     write FvlContCumRec;
    property vlTotContRec    : Currency read FvlTotContRec     write FvlTotContRec;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM200>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM200 }

constructor TJSSpedContribuicoesModelRegistroM200.create;
begin
  inherited;
  reg := 'M200';
end;

destructor TJSSpedContribuicoesModelRegistroM200.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM200.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM200>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM200>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM200): Integer
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
