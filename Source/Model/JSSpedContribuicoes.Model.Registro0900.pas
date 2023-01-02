unit JSSpedContribuicoes.Model.Registro0900;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistro0900 = class(TJSSpedContribuicoesModelRegistro)
  private
    FrecTotalBlocoA     : Currency;
    FrecNrbBlocoA       : Currency;
    FrecTotalBlocoC     : Currency;
    FrecNrbBlocoC       : Currency;
    FrecTotalBlocoD     : Currency;
    FrecNrbBlocoD       : Currency;
    FrecTotalBlocoF     : Currency;
    FrecNrbBlocoF       : Currency;
    FrecTotalBlocoI     : Currency;
    FrecNrbBlocoI       : Currency;
    FrecTotalBloco1     : Currency;
    FrecNrbBloco1       : Currency;
    FrecTotalPeriodo    : Currency;
    FrecTotalNrbPeriodo : Currency;

  public
    property recTotalBlocoA     : Currency read FrecTotalBlocoA     write FrecTotalBlocoA;
    property recNrbBlocoA       : Currency read FrecNrbBlocoA       write FrecNrbBlocoA;
    property recTotalBlocoC     : Currency read FrecTotalBlocoC     write FrecTotalBlocoC;
    property recNrbBlocoC       : Currency read FrecNrbBlocoC       write FrecNrbBlocoC;
    property recTotalBlocoD     : Currency read FrecTotalBlocoD     write FrecTotalBlocoD;
    property recNrbBlocoD       : Currency read FrecNrbBlocoD       write FrecNrbBlocoD;
    property recTotalBlocoF     : Currency read FrecTotalBlocoF     write FrecTotalBlocoF;
    property recNrbBlocoF       : Currency read FrecNrbBlocoF       write FrecNrbBlocoF;
    property recTotalBlocoI     : Currency read FrecTotalBlocoI     write FrecTotalBlocoI;
    property recNrbBlocoI       : Currency read FrecNrbBlocoI       write FrecNrbBlocoI;
    property recTotalBloco1     : Currency read FrecTotalBloco1     write FrecTotalBloco1;
    property recNrbBloco1       : Currency read FrecNrbBloco1       write FrecNrbBloco1;
    property recTotalPeriodo    : Currency read FrecTotalPeriodo    write FrecTotalPeriodo;
    property recTotalNrbPeriodo : Currency read FrecTotalNrbPeriodo write FrecTotalNrbPeriodo;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro0900 }

constructor TJSSpedContribuicoesModelRegistro0900.create;
begin
  inherited;
  reg := '0900';
end;

end.
