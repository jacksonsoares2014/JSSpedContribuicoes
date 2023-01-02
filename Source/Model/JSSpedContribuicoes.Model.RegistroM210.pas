unit JSSpedContribuicoes.Model.RegistroM210;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM210 = class(TJSSpedContribuicoesModelRegistro)
  private
    FaliqPisQuant     : Double;
    FvlContApur       : Currency;
    FquantBcPis       : Double;
    FcodCont          : String;
    FvlRecBrt         : Currency;
    FvlContPer        : Currency;
    FvlContDifer      : Currency;
    FvlAjusAcres      : Currency;
    FvlContDiferAnt   : Currency;
    FvlAjusReduc      : Currency;
    FvlBcCont         : Currency;
    FaliqPis          : Double;
    FvlAjusAcresBcPis : Currency;
    FvlBcContAjus     : Currency;
    FvlAjusReducBcPis : Currency;

  public
    property codCont          : String    read FcodCont          write FcodCont;
    property vlRecBrt         : Currency  read FvlRecBrt         write FvlRecBrt;
    property vlBcCont         : Currency  read FvlBcCont         write FvlBcCont;
    property vlAjusAcresBcPis : Currency  read FvlAjusAcresBcPis write FvlAjusAcresBcPis;
    property vlAjusReducBcPis : Currency  read FvlAjusReducBcPis write FvlAjusReducBcPis;
    property vlBcContAjus     : Currency  read FvlBcContAjus     write FvlBcContAjus;
    property aliqPis          : Double    read FaliqPis          write FaliqPis;
    property quantBcPis       : Double    read FquantBcPis       write FquantBcPis;
    property aliqPisQuant     : Double    read FaliqPisQuant     write FaliqPisQuant;
    property vlContApur       : Currency  read FvlContApur       write FvlContApur;
    property vlAjusAcres      : Currency  read FvlAjusAcres      write FvlAjusAcres;
    property vlAjusReduc      : Currency  read FvlAjusReduc      write FvlAjusReduc;
    property vlContDifer      : Currency  read FvlContDifer      write FvlContDifer;
    property vlContDiferAnt   : Currency  read FvlContDiferAnt   write FvlContDiferAnt;
    property vlContPer        : Currency  read FvlContPer        write FvlContPer;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM210>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM210 }

constructor TJSSpedContribuicoesModelRegistroM210.create;
begin
  inherited;
  reg := 'M210';
end;

destructor TJSSpedContribuicoesModelRegistroM210.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM210.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM210>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM210>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM210): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codCont;

      RChave := Right.codCont;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
