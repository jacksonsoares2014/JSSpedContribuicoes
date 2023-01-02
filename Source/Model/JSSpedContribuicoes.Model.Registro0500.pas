unit JSSpedContribuicoes.Model.Registro0500;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro0500 = class(TJSSpedContribuicoesModelRegistro)
  private
    FdtAlt    : TDateTime;
    FcodNatCC : TJSSpedContribuicoesNaturezaDaConta;
    FindCta   : TJSSpedContribuicoesIndicadorDaConta;
    Fnivel    : Integer;
    FcodCta   : string;
    FnomeCta  : String;
    FcodCtaRef: String;
    FcnpjEst  : String;

  public
    property dtAlt     : TDateTime                            read FdtAlt     write FdtAlt;
    property codNatCC  : TJSSpedContribuicoesNaturezaDaConta  read FcodNatCC  write FcodNatCC;
    property indCta    : TJSSpedContribuicoesIndicadorDaConta read FindCta    write FindCta;
    property nivel     : Integer                              read Fnivel     write Fnivel;
    property codCta    : string                               read FcodCta    write FcodCta;
    property nomeCta   : String                               read FnomeCta   write FnomeCta;
    property codCtaRef : String                               read FcodCtaRef write FcodCtaRef;
    property cnpjEst   : String                               read FcnpjEst   write FcnpjEst;

    constructor create; override;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro0500>;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro0500 }

constructor TJSSpedContribuicoesModelRegistro0500.create;
begin
  inherited;
  reg := '0500';
end;

class function TJSSpedContribuicoesModelRegistro0500.getComparer: IComparer<TJSSpedContribuicoesModelRegistro0500>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro0500>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro0500): Integer
    begin
      if UpperCase(Left.codCta) < UpperCase(Right.codCta) then
        Result := -1
      else if UpperCase(Left.codCta) > UpperCase(Right.codCta) then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
