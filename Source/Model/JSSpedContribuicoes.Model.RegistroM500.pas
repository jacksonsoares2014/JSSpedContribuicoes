unit JSSpedContribuicoes.Model.RegistroM500;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM500 = class(TJSSpedContribuicoesModelRegistro)
  private
    FaliqCofinsQuant : Double;
    FvlBcCofins      : Currency;
    FsldCred         : Currency;
    FquantBcCofins   : Currency;
    FindDescCred     : String;
    FindCredOri      : String;
    FvlAjusAcres     : Currency;
    FcodCred         : String;
    FvlCredDif       : Currency;
    FvlCredDesc      : Currency;
    FvlAjusReduc     : Currency;
    FvlCredDisp      : Currency;
    FvlCred          : Currency;
    FaliqCofins      : Double;

  public
    property codCred         : String   read FcodCred         write FcodCred;
    property indCredOri      : String   read FindCredOri      write FindCredOri;
    property vlBcCofins      : Currency read FvlBcCofins      write FvlBcCofins;
    property aliqCofins      : Double   read FaliqCofins      write FaliqCofins;
    property quantBcCofins   : Currency read FquantBcCofins   write FquantBcCofins;
    property aliqCofinsQuant : Double   read FaliqCofinsQuant write FaliqCofinsQuant;
    property vlCred          : Currency read FvlCred          write FvlCred;
    property vlAjusAcres     : Currency read FvlAjusAcres     write FvlAjusAcres;
    property vlAjusReduc     : Currency read FvlAjusReduc     write FvlAjusReduc;
    property vlCredDif       : Currency read FvlCredDif       write FvlCredDif;
    property vlCredDisp      : Currency read FvlCredDisp      write FvlCredDisp;
    property indDescCred     : String   read FindDescCred     write FindDescCred;
    property vlCredDesc      : Currency read FvlCredDesc      write FvlCredDesc;
    property sldCred         : Currency read FsldCred         write FsldCred;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM500>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM500 }

constructor TJSSpedContribuicoesModelRegistroM500.create;
begin
  inherited;
  reg := 'M500';
end;

destructor TJSSpedContribuicoesModelRegistroM500.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM500.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM500>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM500>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM500): Integer
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
