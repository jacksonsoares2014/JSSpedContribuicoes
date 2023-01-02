unit JSSpedContribuicoes.Model.Registro0100;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistro0100 = class(TJSSpedContribuicoesModelRegistro)
  private
    Fnome    : string;
    Fcpf     : String;
    Fcrc     : string;
    Fcnpj    : string;
    Fcep     : String;
    Fender   : String;
    Fnumero  : String;
    Fcompl   : String;
    Fbairro  : string;
    Ffone    : string;
    Ffax     : string;
    Femail   : String;
    FcodMun  : string;

  public
    property nome  : string read Fnome   write Fnome;
    property cpf   : String read Fcpf    write Fcpf;
    property crc   : string read Fcrc    write Fcrc;
    property cnpj  : string read Fcnpj   write Fcnpj;
    property cep   : String read Fcep    write Fcep;
    property ender : String read Fender  write Fender;
    property numero: String read Fnumero write Fnumero;
    property compl : String read Fcompl  write Fcompl;
    property bairro: string read Fbairro write Fbairro;
    property fone  : string read Ffone   write Ffone;
    property fax   : string read Ffax    write Ffax;
    property email : String read Femail  write Femail;
    property codMun: string read FcodMun write FcodMun;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0100 }

constructor TJSSpedContribuicoesModelRegistro0100.create;
begin
  inherited;
  reg := '0100';
end;

end.
