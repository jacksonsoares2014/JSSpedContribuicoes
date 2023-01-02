unit JSSpedContribuicoes.Model.RegistroF205;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF205 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlCusIncAcum        : Currency;
    FvlCredPisAcum       : Currency;
    FvlCredCofinsAcum    : Currency;
    FvlCredPisDesc       : Currency;
    FvlCredCofinsDesc    : Currency;
    FvlCusIncAcumAnt     : Currency;
    FvlCredPisDescFut    : Currency;
    FvlCredCofinsDescFut : Currency;
    FcstPis              : String;
    FcstCofins           : String;
    FvlCredPisDescAnt    : Currency;
    FvlCredCofinsDescAnt : Currency;
    FvlExcBcCusIncAcum   : Currency;
    FvlCusIncPerEsc      : Currency;
    FvlBcCusInc          : Currency;
    FaliqPis             : Double;
    FaliqCofins          : Double;

  public
    property vlCusIncAcumAnt      : Currency read FvlCusIncAcumAnt      write FvlCusIncAcumAnt;
    property vlCusIncPerEsc       : Currency read FvlCusIncPerEsc       write FvlCusIncPerEsc;
    property vlCusIncAcum         : Currency read FvlCusIncAcum         write FvlCusIncAcum;
    property vlExcBcCusIncAcum    : Currency read FvlExcBcCusIncAcum    write FvlExcBcCusIncAcum;
    property vlBcCusInc           : Currency read FvlBcCusInc           write FvlBcCusInc;
    property cstPis               : String   read FcstPis               write FcstPis;
    property aliqPis              : Double   read FaliqPis              write FaliqPis;
    property vlCredPisAcum        : Currency read FvlCredPisAcum        write FvlCredPisAcum;
    property vlCredPisDescAnt     : Currency read FvlCredPisDescAnt     write FvlCredPisDescAnt;
    property vlCredPisDesc        : Currency read FvlCredPisDesc        write FvlCredPisDesc;
    property vlCredPisDescFut     : Currency read FvlCredPisDescFut     write FvlCredPisDescFut;
    property cstCofins            : String   read FcstCofins            write FcstCofins;
    property aliqCofins           : Double   read FaliqCofins           write FaliqCofins;
    property vlCredCofinsAcum     : Currency read FvlCredCofinsAcum     write FvlCredCofinsAcum;
    property vlCredCofinsDescAnt  : Currency read FvlCredCofinsDescAnt  write FvlCredCofinsDescAnt;
    property vlCredCofinsDesc     : Currency read FvlCredCofinsDesc     write FvlCredCofinsDesc;
    property vlCredCofinsDescFut  : Currency read FvlCredCofinsDescFut  write FvlCredCofinsDescFut;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF205>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF205 }

constructor TJSSpedContribuicoesModelRegistroF205.create;
begin
  inherited;
  reg := 'F205';
end;

destructor TJSSpedContribuicoesModelRegistroF205.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF205.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF205>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF205>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF205): Integer
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
