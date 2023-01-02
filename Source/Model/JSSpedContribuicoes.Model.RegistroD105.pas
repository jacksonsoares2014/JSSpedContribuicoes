unit JSSpedContribuicoes.Model.RegistroD105;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD105 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlBcCofins : Currency;
    FcodCta     : String;
    FcstCofins  : String;
    FnatBcCred  : String;
    FvlItem     : Currency;
    FvlCofins   : Currency;
    FaliqCofins : Double;
    FindNatFret : TJSSpedContribuicoesIndicadorNaturezaFrete;

  public
    property indNatFrt       : TJSSpedContribuicoesIndicadorNaturezaFrete   read FindNatFret   write FindNatFret;
    property vlItem          : Currency                                     read FvlItem       write FvlItem;
    property cstCofins       : String                                       read FcstCofins    write FcstCofins;
    property natBcCred       : String                                       read FnatBcCred    write FnatBcCred;
    property vlBcCofins      : Currency                                     read FvlBcCofins   write FvlBcCofins;
    property aliqCofins      : Double                                       read FaliqCofins   write FaliqCofins;
    property vlCofins        : Currency                                     read FvlCofins     write FvlCofins;
    property codCta          : String                                       read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD105>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD105 }

constructor TJSSpedContribuicoesModelRegistroD105.create;
begin
  inherited;
  reg := 'D105';
end;

destructor TJSSpedContribuicoesModelRegistroD105.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD105.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD105>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD105>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD105): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.indNatFrt.toString + Left.cstCofins + Left.natBcCred + Left.aliqCofins.ToString;

      RChave := Right.indNatFrt.toString + Right.cstCofins + Right.natBcCred + Right.aliqCofins.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
