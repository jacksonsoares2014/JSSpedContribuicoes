unit JSSpedContribuicoes.Model.RegistroD209;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD209 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc: String;
    FindProc: TJSSpedContribuicoesOrigemProcesso;

  public
    property numProc: String                             read FnumProc write FnumProc;
    property indProc: TJSSpedContribuicoesOrigemProcesso read FindProc write FindProc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD209>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD209 }

constructor TJSSpedContribuicoesModelRegistroD209.create;
begin
  inherited;
  reg := 'D209';
end;

destructor TJSSpedContribuicoesModelRegistroD209.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD209.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD209>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD209>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD209): Integer
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
