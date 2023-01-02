unit JSSpedContribuicoes.Model.Registro0111;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistro0111 = class(TJSSpedContribuicoesModelRegistro)
  private
    FrecBruNcumNtMi   : Currency;
    FrecBruNcumExp    : Currency;
    FrecBruCum        : Currency;
    FrecBruTotal      : Currency;
    FrecBruNcumTribMi : Currency;

  public
    property recBruNcumTribMi  : Currency read FrecBruNcumTribMi  write FrecBruNcumTribMi;
    property recBruNcumNtMi    : Currency read FrecBruNcumNtMi    write FrecBruNcumNtMi;
    property recBruNcumExp     : Currency read FrecBruNcumExp     write FrecBruNcumExp;
    property recBruCum         : Currency read FrecBruCum         write FrecBruCum;
    property recBruTotal       : Currency read FrecBruTotal       write FrecBruTotal;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0111 }

constructor TJSSpedContribuicoesModelRegistro0111.create;
begin
  inherited;
  reg := '0111';
end;

end.
