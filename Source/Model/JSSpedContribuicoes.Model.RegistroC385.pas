unit JSSpedContribuicoes.Model.RegistroC385;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC385 = class(TJSSpedContribuicoesModelRegistro)
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

  public
    property cstCofins       : String   read FcstCofins       write FcstCofins;
    property codItem         : String   read FcodItem         write FcodItem;
    property vlItem          : Currency read FvlItem          write FvlItem;
    property vlBcCofins      : Currency read FvlBcCofins      write FvlBcCofins;
    property aliqCofins      : Double   read FaliqCofins      write FaliqCofins;
    property quantBcCofins   : Currency read FquantBcCofins   write FquantBcCofins;
    property aliqCofinsQuant : Double   read FaliqCofinsQuant write FaliqCofinsQuant;
    property vlCofins        : Currency read FvlCofins        write FvlCofins;
    property codCta          : String   read FcodCta          write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC385>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC385 }

constructor TJSSpedContribuicoesModelRegistroC385.create;
begin
  inherited;
  reg := 'C385';
end;

destructor TJSSpedContribuicoesModelRegistroC385.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC385.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC385>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC385>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC385): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codItem + Left.cstCofins + Left.aliqCofins.ToString;
      RChave := Right.codItem + Right.cstCofins + Right.aliqCofins.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
