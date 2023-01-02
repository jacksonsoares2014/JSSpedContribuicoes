unit JSSpedContribuicoes.Model.Registro0140;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistro0140 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodMun  : string;
    Fcnpj    : string;
    Fim      : string;
    Fuf      : String;
    Fie      : string;
    Fsuframa : string;
    Fnome    : String;
    FcodEst  : String;

  public
    property codEst    : String read FcodEst    write FcodEst;
    property nome      : String read Fnome      write Fnome;
    property cnpj      : string read Fcnpj      write Fcnpj;
    property uf        : String read Fuf        write Fuf;
    property ie        : string read Fie        write Fie;
    property codMun    : string read FcodMun    write FcodMun;
    property im        : string read Fim        write Fim;
    property suframa   : string read Fsuframa   write Fsuframa;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0140 }

constructor TJSSpedContribuicoesModelRegistro0140.create;
begin
  inherited;
  reg := '0140';
end;

end.

