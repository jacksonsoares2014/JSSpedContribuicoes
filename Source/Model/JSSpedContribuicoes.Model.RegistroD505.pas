unit JSSpedContribuicoes.Model.RegistroD505;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD505 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlBcCofins : Currency;
    FcodCta     : String;
    FcstCofins  : String;
    FvlItem     : Currency;
    FvlCofins   : Currency;
    FaliqCofins : Double;
    FnatBcCred  : String;

  public
    property cstCofins       : String     read FcstCofins    write FcstCofins;
    property vlItem          : Currency   read FvlItem       write FvlItem;
    property natBcCred       : String     read FnatBcCred    write FnatBcCred;
    property vlBcCofins      : Currency   read FvlBcCofins   write FvlBcCofins;
    property aliqCofins      : Double     read FaliqCofins   write FaliqCofins;
    property vlCofins        : Currency   read FvlCofins     write FvlCofins;
    property codCta          : String     read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD505>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD505 }

constructor TJSSpedContribuicoesModelRegistroD505.create;
begin
  inherited;
  reg := 'D505';
end;

destructor TJSSpedContribuicoesModelRegistroD505.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD505.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD505>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD505>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD505): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.natBcCred + Left.cstCofins + Left.aliqCofins.ToString;

      RChave := Right.natBcCred + Right.cstCofins + Right.aliqCofins.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
