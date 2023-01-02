unit JSSpedContribuicoes.Model.RegistroC110;

interface

uses
  JSSpedContribuicoes.Model.Registro;

type
  TJSSpedContribuicoesModelRegistroC110 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodInf  : string;
    FtxtCompl: string;

  public
    property codInf  : string read FcodInf   write FcodInf;
    property txtCompl: string read FtxtCompl write FtxtCompl;

    constructor create; override;
  end;

implementation

uses
  System.SysUtils;

{ TJSSpedContribuicoesModelRegistroC110 }

constructor TJSSpedContribuicoesModelRegistroC110.create;
begin
  inherited;
  reg := 'C110';
end;

end.
