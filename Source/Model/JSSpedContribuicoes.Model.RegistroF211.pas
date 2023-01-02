unit JSSpedContribuicoes.Model.RegistroF211;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF211 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc: String;
    FindProc: TJSSpedContribuicoesOrigemProcesso;

  public
    property numProc: String                             read FnumProc write FnumProc;
    property indProc: TJSSpedContribuicoesOrigemProcesso read FindProc write FindProc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF211>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF211 }

constructor TJSSpedContribuicoesModelRegistroF211.create;
begin
  inherited;
  reg := 'F211';
end;

destructor TJSSpedContribuicoesModelRegistroF211.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF211.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF211>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF211>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF211): Integer
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
