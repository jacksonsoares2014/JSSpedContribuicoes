unit JSSpedContribuicoes.Model.Registro0145;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type
  TJSSpedContribuicoesModelRegistro0145 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodIncTrib     : TJSSpedContribuicoesIndicadorIncidenciaTributariaPrev;
    FvlRecAtiv      : Currency;
    FvlRecTot       : Currency;
    FvlRecDemaisAtiv: Currency;
    FinfoCompl      : String;

  public
    property codIncTrib      : TJSSpedContribuicoesIndicadorIncidenciaTributariaPrev read FcodIncTrib       write FcodIncTrib;
    property vlRecTot        : Currency                                              read FvlRecTot         write FvlRecTot;
    property vlRecAtiv       : Currency                                              read FvlRecAtiv        write FvlRecAtiv;
    property vlRecDemaisAtiv : Currency                                              read FvlRecDemaisAtiv  write FvlRecDemaisAtiv;
    property infoCompl       : String                                                read FinfoCompl        write FinfoCompl;

    constructor create; override;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0145 }

constructor TJSSpedContribuicoesModelRegistro0145.create;
begin
  inherited;
  reg := '0145';
end;

end.
