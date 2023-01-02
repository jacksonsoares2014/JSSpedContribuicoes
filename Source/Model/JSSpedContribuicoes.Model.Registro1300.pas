unit JSSpedContribuicoes.Model.Registro1300;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1300 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindNatRet  : String;
    FprRecRet   : String;
    FvlRetApu   : Currency;
    FvlRetDed   : Currency;
    FvlRetPer   : Currency;
    FvlRetDcomp : Currency;
    FsldRet     : Currency;

  public
    property indNatRet  : String   read FindNatRet  write FindNatRet;
    property prRecRet   : String   read FprRecRet   write FprRecRet;
    property vlRetApu   : Currency read FvlRetApu   write FvlRetApu;
    property vlRetDed   : Currency read FvlRetDed   write FvlRetDed;
    property vlRetPer   : Currency read FvlRetPer   write FvlRetPer;
    property vlRetDcomp : Currency read FvlRetDcomp write FvlRetDcomp;
    property sldRet     : Currency read FsldRet     write FsldRet;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1300>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1300 }

constructor TJSSpedContribuicoesModelRegistro1300.create;
begin
  inherited;
  reg := '1300';
end;

destructor TJSSpedContribuicoesModelRegistro1300.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1300.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1300>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1300>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1300): Integer
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
