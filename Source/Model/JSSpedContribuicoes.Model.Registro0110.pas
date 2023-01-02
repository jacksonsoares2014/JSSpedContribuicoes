unit JSSpedContribuicoes.Model.Registro0110;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type
  TJSSpedContribuicoesModelRegistro0110 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodTipoCont : TJSSpedContribuicoesIndicadorTipoContribuicao;
    FcodIncTrib  : TJSSpedContribuicoesIndicadorIncidenciaTributaria;
    FindAproCred : TJSSpedContribuicoesIndicadorMetodoApropriacao;
    FindRegCum   : TJSSpedContribuicoesIndicadorCriterioEscrituracao;

  public
    property codIncTrib  : TJSSpedContribuicoesIndicadorIncidenciaTributaria read FcodIncTrib    write FcodIncTrib;
    property indAproCred : TJSSpedContribuicoesIndicadorMetodoApropriacao    read FindAproCred   write FindAproCred;
    property codTipoCont : TJSSpedContribuicoesIndicadorTipoContribuicao     read FcodTipoCont   write FcodTipoCont;
    property indRegCum   : TJSSpedContribuicoesIndicadorCriterioEscrituracao read FindRegCum     write FindRegCum;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0110 }

constructor TJSSpedContribuicoesModelRegistro0110.create;
begin
  inherited;
  reg := '0110';
end;

end.
