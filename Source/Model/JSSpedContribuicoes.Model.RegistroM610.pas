unit JSSpedContribuicoes.Model.RegistroM610;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM610 = class(TJSSpedContribuicoesModelRegistro)
  private
    FaliqCofinsQuant     : Double;
    FvlContApur          : Currency;
    FquantBcCofins       : Double;
    FcodCont             : String;
    FvlRecBrt            : Currency;
    FvlContPer           : Currency;
    FvlContDifer         : Currency;
    FvlAjusAcres         : Currency;
    FvlContDiferAnt      : Currency;
    FvlAjusReduc         : Currency;
    FvlBcCont            : Currency;
    FaliqCofins          : Double;
    FvlAjusAcresBcCofins : Currency;
    FvlBcContAjus        : Currency;
    FvlAjusReducBcCofins : Currency;

  public
    property codCont             : String    read FcodCont             write FcodCont;
    property vlRecBrt            : Currency  read FvlRecBrt            write FvlRecBrt;
    property vlBcCont            : Currency  read FvlBcCont            write FvlBcCont;
    property vlAjusAcresBcCofins : Currency  read FvlAjusAcresBcCofins write FvlAjusAcresBcCofins;
    property vlAjusReducBcCofins : Currency  read FvlAjusReducBcCofins write FvlAjusReducBcCofins;
    property vlBcContAjus        : Currency  read FvlBcContAjus        write FvlBcContAjus;
    property aliqCofins          : Double    read FaliqCofins          write FaliqCofins;
    property quantBcCofins       : Double    read FquantBcCofins       write FquantBcCofins;
    property aliqCofinsQuant     : Double    read FaliqCofinsQuant     write FaliqCofinsQuant;
    property vlContApur          : Currency  read FvlContApur          write FvlContApur;
    property vlAjusAcres         : Currency  read FvlAjusAcres         write FvlAjusAcres;
    property vlAjusReduc         : Currency  read FvlAjusReduc         write FvlAjusReduc;
    property vlContDifer         : Currency  read FvlContDifer         write FvlContDifer;
    property vlContDiferAnt      : Currency  read FvlContDiferAnt      write FvlContDiferAnt;
    property vlContPer           : Currency  read FvlContPer           write FvlContPer;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM610>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM610 }

constructor TJSSpedContribuicoesModelRegistroM610.create;
begin
  inherited;
  reg := 'M610';
end;

destructor TJSSpedContribuicoesModelRegistroM610.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM610.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM610>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM610>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM610): Integer
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
