unit JSSpedContribuicoes.Model.Registro0150;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro0150 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodPart  : string;
    Fnome     : string;
    FcodPais  : string;
    Fcnpj     : string;
    Fcpf      : string;
    Fie       : string;
    FcodMun   : string;
    Fsuframa  : string;
    Fendereco : string;
    Fnumero   : string;
    Fcompl    : string;
    Fbairro   : string;

  public
    property codPart  : string  read FcodPart  write FcodPart;
    property nome     : string  read Fnome     write Fnome;
    property codPais  : string  read FcodPais  write FcodPais;
    property cnpj     : string  read Fcnpj     write Fcnpj;
    property cpf      : string  read Fcpf      write Fcpf;
    property ie       : string  read Fie       write Fie;
    property codMun   : string  read FcodMun   write FcodMun;
    property suframa  : string  read Fsuframa  write Fsuframa;
    property endereco : string  read Fendereco write Fendereco;
    property numero   : string  read Fnumero   write Fnumero;
    property compl    : string  read Fcompl    write Fcompl;
    property bairro   : string  read Fbairro   write Fbairro;

    constructor create; override;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro0150>;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0150 }

constructor TJSSpedContribuicoesModelRegistro0150.create;
begin
  inherited;
  reg := '0150';
end;

class function TJSSpedContribuicoesModelRegistro0150.getComparer: IComparer<TJSSpedContribuicoesModelRegistro0150>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro0150>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro0150): Integer
    begin
      if UpperCase(Left.nome) < UpperCase(Right.nome) then
        Result := -1
      else if UpperCase(Left.nome) > UpperCase(Right.nome) then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
