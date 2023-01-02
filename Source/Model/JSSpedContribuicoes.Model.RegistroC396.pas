unit JSSpedContribuicoes.Model.RegistroC396;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC396 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodItem    : String;
    FvlItem     : Currency;
    FvlDesc     : Currency;
    FnatBcCred  : String;
    FcstPis     : String;
    FvlBcPis    : Currency;
    FaliqPis    : Currency;
    FvlPis      : Currency;
    FvlBcCofins : Currency;
    FcstCofins  : String;
    FvlCofins   : Currency;
    FaliqCofins : Currency;
    FcodCta     : String;

  public
    property codItem    : String   read FcodItem    write FcodItem;
    property vlItem     : Currency read FvlItem     write FvlItem;
    property vlDesc     : Currency read FvlDesc     write FvlDesc;
    property natBcCred  : String   read FnatBcCred  write FnatBcCred;
    property cstPis     : String   read FcstPis     write FcstPis;
    property vlBcPis    : Currency read FvlBcPis    write FvlBcPis;
    property aliqPis    : Currency read FaliqPis    write FaliqPis;
    property vlPis      : Currency read FvlPis      write FvlPis;
    property cstCofins  : String   read FcstCofins  write FcstCofins;
    property vlBcCofins : Currency read FvlBcCofins write FvlBcCofins;
    property aliqCofins : Currency read FaliqCofins write FaliqCofins;
    property vlCofins   : Currency read FvlCofins   write FvlCofins;
    property codCta     : String   read FcodCta     write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC396>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC396 }

constructor TJSSpedContribuicoesModelRegistroC396.create;
begin
  inherited;
  reg := 'C396';
end;

destructor TJSSpedContribuicoesModelRegistroC396.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC396.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC396>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC396>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC396): Integer
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
