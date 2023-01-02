unit JSSpedContribuicoes.Model.RegistroC010;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC010 = class(TJSSpedContribuicoesModelRegistro)
  private
    Fcnpj    : String;
    FindEscri: TJSSpedContribuicoesIndicadorEscrituracao;

  public
    property cnpj    : String                                    read Fcnpj     write Fcnpj;
    property indEscri: TJSSpedContribuicoesIndicadorEscrituracao read FindEscri write FindEscri;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC010 }

constructor TJSSpedContribuicoesModelRegistroC010.create;
begin
  inherited;
  reg := 'C010';
end;

destructor TJSSpedContribuicoesModelRegistroC010.Destroy;
begin
  inherited;
end;

end.
