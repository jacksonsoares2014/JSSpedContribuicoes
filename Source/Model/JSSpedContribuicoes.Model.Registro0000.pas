unit JSSpedContribuicoes.Model.Registro0000;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types;

type
  TJSSpedContribuicoesModelRegistro0000 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodMun         : string;
    FtipoEscrit     : TJSSpedContribuicoesTipoEscrituracao;
    Fcnpj           : string;
    FnumRecAnterior : string;
    Fuf             : string;
    FdtIni          : TDateTime;
    Fsuframa        : string;
    FindNatPj       : TJSSpedContribuicoesIndicadorNaturezaPJ;
    FindAtiv        : TJSSpedContribuicoesIndicadorAtividade;
    FcodVer         : string;
    FdtFin          : TDateTime;
    Fnome           : string;
    FindSitEsp      : TJSSpedContribuicoesIndicadorSituacaoEspecial;
  public
    property codVer         : string                                        read FcodVer         write FcodVer;
    property tipoEscrit     : TJSSpedContribuicoesTipoEscrituracao          read FtipoEscrit     write FtipoEscrit;
    property indSitEsp      : TJSSpedContribuicoesIndicadorSituacaoEspecial read FindSitEsp      write FindSitEsp;
    property numRecAnterior : string                                        read FnumRecAnterior write FnumRecAnterior;
    property dtIni          : TDateTime                                     read FdtIni          write FdtIni;
    property dtFin          : TDateTime                                     read FdtFin          write FdtFin;
    property nome           : string                                        read Fnome           write Fnome;
    property cnpj           : string                                        read Fcnpj           write Fcnpj;
    property uf             : string                                        read Fuf             write Fuf;
    property codMun         : string                                        read FcodMun         write FcodMun;
    property suframa        : string                                        read Fsuframa        write Fsuframa;
    property indNatPj       : TJSSpedContribuicoesIndicadorNaturezaPJ       read FindNatPj       write FindNatPj;
    property indAtiv        : TJSSpedContribuicoesIndicadorAtividade        read FindAtiv        write FindAtiv;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro0000 }

constructor TJSSpedContribuicoesModelRegistro0000.create;
begin
  inherited;
  reg := '0000';
end;

end.
