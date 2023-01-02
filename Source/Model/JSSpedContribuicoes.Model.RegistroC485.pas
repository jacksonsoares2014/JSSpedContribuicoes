unit JSSpedContribuicoes.Model.RegistroC485;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC485 = class(TJSSpedContribuicoesModelRegistro)
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
    property vlItem          : Currency read FvlItem          write FvlItem;
    property vlBcCofins      : Currency read FvlBcCofins      write FvlBcCofins;
    property aliqCofins      : Double   read FaliqCofins      write FaliqCofins;
    property quantBcCofins   : Currency read FquantBcCofins   write FquantBcCofins;
    property aliqCofinsQuant : Double   read FaliqCofinsQuant write FaliqCofinsQuant;
    property vlCofins        : Currency read FvlCofins        write FvlCofins;
    property codItem         : String   read FcodItem         write FcodItem;
    property codCta          : String   read FcodCta          write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC485>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC485 }

constructor TJSSpedContribuicoesModelRegistroC485.create;
begin
  inherited;
  reg := 'C485';
end;

destructor TJSSpedContribuicoesModelRegistroC485.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC485.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC485>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC485>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC485): Integer
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
