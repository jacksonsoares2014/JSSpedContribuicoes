unit JSSpedContribuicoes.Model.RegistroM505;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM505 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnatBcCred        : String;
    FcstCofins        : String;
    FvlBcCofinsTot    : Currency;
    FquantBcCofinsTot : Double;
    FvlBcCofins       : Currency;
    FquantBcCofins    : Double;
    FvlBcCofinsNC     : Currency;
    FvlBcCofinsCum    : Currency;
    FdescCred         : String;

  public
    property natBcCred        : String   read FnatBcCred        write FnatBcCred;
    property cstCofins        : String   read FcstCofins        write FcstCofins;
    property vlBcCofinsTot    : Currency read FvlBcCofinsTot    write FvlBcCofinsTot;
    property vlBcCofinsCum    : Currency read FvlBcCofinsCum    write FvlBcCofinsCum;
    property vlBcCofinsNC     : Currency read FvlBcCofinsNC     write FvlBcCofinsNC;
    property vlBcCofins       : Currency read FvlBcCofins       write FvlBcCofins;
    property quantBcCofinsTot : Double   read FquantBcCofinsTot write FquantBcCofinsTot;
    property quantBcCofins    : Double   read FquantBcCofins    write FquantBcCofins;
    property descCred         : String   read FdescCred         write FdescCred;


    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM505>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM505 }

constructor TJSSpedContribuicoesModelRegistroM505.create;
begin
  inherited;
  reg := 'M505';
end;

destructor TJSSpedContribuicoesModelRegistroM505.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM505.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM505>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM505>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM505): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.GetValueStr('CODCRED') + Left.natBcCred + Left.cstCofins;

      RChave := Right.GetValueStr('CODCRED') + Right.natBcCred + Right.cstCofins;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
