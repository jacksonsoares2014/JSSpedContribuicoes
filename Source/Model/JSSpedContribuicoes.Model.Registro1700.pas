unit JSSpedContribuicoes.Model.Registro1700;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1700 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlRetPer   : Currency;
    FvlRetApu   : Currency;
    FvlRetDed   : Currency;
    FsldRet     : Currency;
    FvlRetDcomp : Currency;
    FindNatRet  : String;
    FprRecRet   : String;

  public
    property indNatRet  : String   read FindNatRet  write FindNatRet;
    property prRecRet   : String   read FprRecRet   write FprRecRet;
    property vlRetApu   : Currency read FvlRetApu   write FvlRetApu;
    property vlRetDed   : Currency read FvlRetDed   write FvlRetDed;
    property vlRetPer   : Currency read FvlRetPer   write FvlRetPer;
    property vlRetDcomp : Currency read FvlRetDcomp write FvlRetDcomp;
    property sldRet     : Currency read FsldRet     write FsldRet;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1700>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1700 }

constructor TJSSpedContribuicoesModelRegistro1700.create;
begin
  inherited;
  reg := '1700';
end;

destructor TJSSpedContribuicoesModelRegistro1700.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1700.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1700>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1700>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1700): Integer
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
