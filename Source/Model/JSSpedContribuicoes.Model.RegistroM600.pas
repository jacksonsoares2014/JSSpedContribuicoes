unit JSSpedContribuicoes.Model.RegistroM600;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM600 = class(TJSSpedContribuicoesModelRegistro)
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

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM600>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM600 }

constructor TJSSpedContribuicoesModelRegistroM600.create;
begin
  inherited;
  reg := 'M600';
end;

destructor TJSSpedContribuicoesModelRegistroM600.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM600.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM600>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM600>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM600): Integer
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
