unit JSSpedContribuicoes.Model.RegistroC495;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC495 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcstCofins       : String;
    FcodItem         : String;
    FvlItem          : Currency;
    FvlBcCofins      : Currency;
    FaliqCofins      : Double;
    FquantBcCofins   : Currency;
    FaliqCofinsQuant : Double;
    FvlCofins        : Currency;
    FcodCta          : String;
    Fcfop            : String;

  public
    property codItem         : String   read FcodItem         write FcodItem;
    property cstCofins       : String   read FcstCofins       write FcstCofins;
    property cfop            : String   read Fcfop            write Fcfop;
    property vlItem          : Currency read FvlItem          write FvlItem;
    property vlBcCofins      : Currency read FvlBcCofins      write FvlBcCofins;
    property aliqCofins      : Double   read FaliqCofins      write FaliqCofins;
    property quantBcCofins   : Currency read FquantBcCofins   write FquantBcCofins;
    property aliqCofinsQuant : Double   read FaliqCofinsQuant write FaliqCofinsQuant;
    property vlCofins        : Currency read FvlCofins        write FvlCofins;
    property codCta          : String   read FcodCta          write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC495>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC495 }

constructor TJSSpedContribuicoesModelRegistroC495.create;
begin
  inherited;
  reg := 'C495';
end;

destructor TJSSpedContribuicoesModelRegistroC495.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC495.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC495>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC495>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC495): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codItem  + Left.cstCofins  + Left.aliqCofins.toString;
      RChave := Right.codItem + Right.cstCofins + Right.aliqCofins.toString;;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
