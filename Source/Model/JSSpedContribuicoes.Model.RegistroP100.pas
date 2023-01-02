unit JSSpedContribuicoes.Model.RegistroP100;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroP100 = class(TJSSpedContribuicoesModelRegistro)
  private
    FinfoCompl      : String;
    FvlRecAtivEstab : Currency;
    FvlExc          : Currency;
    FcodCta         : String;
    FvlContApu      : Currency;
    FvlRecTotEst    : Currency;
    FdtIni          : TDateTime;
    FaliqCont       : Double;
    FcodAtivEcon    : String;
    FdtFin          : TDateTime;
    FvlBcCont       : Currency;

  public
    property dtIni          : TDateTime    read FdtIni           write FdtIni;
    property dtFin          : TDateTime    read FdtFin           write FdtFin;
    property vlRecTotEst    : Currency     read FvlRecTotEst     write FvlRecTotEst;
    property codAtivEcon    : String       read FcodAtivEcon     write FcodAtivEcon;
    property vlRecAtivEstab : Currency     read FvlRecAtivEstab  write FvlRecAtivEstab;
    property vlExc          : Currency     read FvlExc           write FvlExc;
    property vlBcCont       : Currency     read FvlBcCont        write FvlBcCont;
    property aliqCont       : Double       read FaliqCont        write FaliqCont;
    property vlContApu      : Currency     read FvlContApu       write FvlContApu;
    property codCta         : String       read FcodCta          write FcodCta;
    property infoCompl      : String       read FinfoCompl       write FinfoCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroP100>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroP100 }

constructor TJSSpedContribuicoesModelRegistroP100.create;
begin
  inherited;
  reg := 'P100';
end;

destructor TJSSpedContribuicoesModelRegistroP100.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroP100.getComparer: IComparer<TJSSpedContribuicoesModelRegistroP100>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroP100>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroP100): Integer
    var LChave, RChave: string;
    begin
      LChave := '';

      RChave := '';

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
