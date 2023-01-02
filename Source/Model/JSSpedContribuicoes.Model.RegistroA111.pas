unit JSSpedContribuicoes.Model.RegistroA111;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroA111 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc: String;
    FindProc: TJSSpedContribuicoesOrigemProcesso;

  public
    property numProc: String                             read FnumProc write FnumProc;
    property indProc: TJSSpedContribuicoesOrigemProcesso read FindProc write FindProc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroA111>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroA111 }

constructor TJSSpedContribuicoesModelRegistroA111.create;
begin
  inherited;
  reg := 'A111';
end;

destructor TJSSpedContribuicoesModelRegistroA111.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroA111.getComparer: IComparer<TJSSpedContribuicoesModelRegistroA111>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroA111>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroA111): Integer
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
