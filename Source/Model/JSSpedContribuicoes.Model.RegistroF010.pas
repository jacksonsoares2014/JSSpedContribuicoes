unit JSSpedContribuicoes.Model.RegistroF010;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF010 = class(TJSSpedContribuicoesModelRegistro)
  private
    Fcnpj: String;

  public
    property cnpj: String read Fcnpj write Fcnpj;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF010>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF010 }

constructor TJSSpedContribuicoesModelRegistroF010.create;
begin
  inherited;
  reg := 'F010';
end;

destructor TJSSpedContribuicoesModelRegistroF010.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF010.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF010>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF010>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF010): Integer
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
