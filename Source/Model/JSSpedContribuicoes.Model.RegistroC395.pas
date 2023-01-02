unit JSSpedContribuicoes.Model.RegistroC395;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC395 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodMod   : String;
    FcodPart  : String;
    Fserie    : String;
    FsubSerie : String;
    FnumDoc   : String;
    FdtDoc    : TDateTime;
    FvlDoc    : Currency;

  public
    property codMod   : String    read FcodMod   write FcodMod;
    property codPart  : String    read FcodPart  write FcodPart;
    property serie    : String    read Fserie    write Fserie;
    property subSerie : String    read FsubSerie write FsubSerie;
    property numDoc   : String    read FnumDoc   write FnumDoc;
    property dtDoc    : TDateTime read FdtDoc    write FdtDoc;
    property vlDoc    : Currency  read FvlDoc    write FvlDoc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC395>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC395 }

constructor TJSSpedContribuicoesModelRegistroC395.create;
begin
  inherited;
  reg := 'C395';
end;

destructor TJSSpedContribuicoesModelRegistroC395.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC395.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC395>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC395>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC395): Integer
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
