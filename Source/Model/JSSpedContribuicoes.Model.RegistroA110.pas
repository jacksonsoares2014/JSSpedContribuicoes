unit JSSpedContribuicoes.Model.RegistroA110;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroA110 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodInf  : String;
    FtxtCompl: String;

  public
    property codInf  : String read FcodInf   write FcodInf;
    property txtCompl: String read FtxtCompl write FtxtCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroA110>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroA110 }

constructor TJSSpedContribuicoesModelRegistroA110.create;
begin
  inherited;
  reg := 'A110';
end;

destructor TJSSpedContribuicoesModelRegistroA110.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroA110.getComparer: IComparer<TJSSpedContribuicoesModelRegistroA110>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroA110>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroA110): Integer
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
