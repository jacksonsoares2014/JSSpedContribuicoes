unit JSSpedContribuicoes.Model.Registro0600;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistro0600 = class(TJSSpedContribuicoesModelRegistro)
  private
    FdtAlt  : TDateTime;
    FcodCCus: string;
    FcCus   : string;

  public
    property dtAlt  : TDateTime read FdtAlt   write FdtAlt;
    property codCCus: string    read FcodCCus write FcodCCus;
    property cCus   : string    read FcCus    write FcCus;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0600 }

constructor TJSSpedContribuicoesModelRegistro0600.create;
begin
  inherited;
  reg := '0600';
end;

end.
