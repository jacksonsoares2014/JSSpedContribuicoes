unit JSSpedContribuicoes.Model.RegistroD205;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD205 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlBcCofins : Currency;
    FcodCta     : String;
    FcstCofins  : String;
    FvlItem     : Currency;
    FvlCofins   : Currency;
    FaliqCofins : Double;

  public
    property cstCofins       : String     read FcstCofins    write FcstCofins;
    property vlItem          : Currency   read FvlItem       write FvlItem;
    property vlBcCofins      : Currency   read FvlBcCofins   write FvlBcCofins;
    property aliqCofins      : Double     read FaliqCofins   write FaliqCofins;
    property vlCofins        : Currency   read FvlCofins     write FvlCofins;
    property codCta          : String     read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD205>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD205 }

constructor TJSSpedContribuicoesModelRegistroD205.create;
begin
  inherited;
  reg := 'D205';
end;

destructor TJSSpedContribuicoesModelRegistroD205.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD205.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD205>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD205>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD205): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.cstCofins + Left.aliqCofins.ToString;

      RChave := Right.cstCofins + Right.aliqCofins.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
