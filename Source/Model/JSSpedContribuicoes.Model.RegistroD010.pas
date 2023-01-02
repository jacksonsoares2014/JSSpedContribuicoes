unit JSSpedContribuicoes.Model.RegistroD010;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD010 = class(TJSSpedContribuicoesModelRegistro)
  private
    Fcnpj: String;

  public
    property cnpj: String read Fcnpj write Fcnpj;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD010>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD010 }

constructor TJSSpedContribuicoesModelRegistroD010.create;
begin
  inherited;
  reg := 'D010';
end;

destructor TJSSpedContribuicoesModelRegistroD010.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD010.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD010>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD010>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD010): Integer
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
