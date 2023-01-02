unit JSSpedContribuicoes.Model.RegistroM100;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM100 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodCred      : String;
    FindCredOri   : String;
    FaliqPisQuant : Double;
    FvlBcPis      : Currency;
    FquantBcPis   : Currency;
    FvlAjusAcres  : Currency;
    FvlCredDif    : Currency;
    FvlAjusReduc  : Currency;
    FvlCredDisp   : Currency;
    FvlCred       : Currency;
    FaliqPis      : Double;
    FindDescCred  : String;
    FvlCredDesc   : Currency;
    FsldCred      : Currency;

  public
    property codCred      : String   read FcodCred      write FcodCred;
    property indCredOri   : String   read FindCredOri   write FindCredOri;
    property vlBcPis      : Currency read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double   read FaliqPis      write FaliqPis;
    property quantBcPis   : Currency read FquantBcPis   write FquantBcPis;
    property aliqPisQuant : Double   read FaliqPisQuant write FaliqPisQuant;
    property vlCred       : Currency read FvlCred       write FvlCred;
    property vlAjusAcres  : Currency read FvlAjusAcres  write FvlAjusAcres;
    property vlAjusReduc  : Currency read FvlAjusReduc  write FvlAjusReduc;
    property vlCredDif    : Currency read FvlCredDif    write FvlCredDif;
    property vlCredDisp   : Currency read FvlCredDisp   write FvlCredDisp;
    property indDescCred  : String   read FindDescCred  write FindDescCred;
    property vlCredDesc   : Currency read FvlCredDesc   write FvlCredDesc;
    property sldCred      : Currency read FsldCred      write FsldCred;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM100>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM100 }

constructor TJSSpedContribuicoesModelRegistroM100.create;
begin
  inherited;
  reg := 'M100';
end;

destructor TJSSpedContribuicoesModelRegistroM100.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM100.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM100>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM100>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM100): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codCred;

      RChave := Right.codCred;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
