unit JSSpedContribuicoes.Model.RegistroP010;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroP010 = class(TJSSpedContribuicoesModelRegistro)
  private
    Fcnpj: String;

  public
    property cnpj: String read Fcnpj write Fcnpj;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroP010>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroP010 }

constructor TJSSpedContribuicoesModelRegistroP010.create;
begin
  inherited;
  reg := 'P010';
end;

destructor TJSSpedContribuicoesModelRegistroP010.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroP010.getComparer: IComparer<TJSSpedContribuicoesModelRegistroP010>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroP010>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroP010): Integer
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
