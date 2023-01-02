unit JSSpedContribuicoes.Model.RegistroC810;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC810 = class(TJSSpedContribuicoesModelRegistro)
  private
    Fcfop       : String;
    FvlItem     : Currency;
    FcodItem    : String;
    FvlBcPis    : Currency;
    FcstPis     : String;
    FaliqPis    : Double;
    FvlPis      : Currency;
    FcstCofins  : String;
    FvlBcCofins : Currency;
    FaliqCofins : Double;
    FvlCofins   : Currency;
    FcodCta     : String;

  public
    property cfop       : String   read Fcfop       write Fcfop;
    property vlItem     : Currency read FvlItem     write FvlItem;
    property codItem    : String   read FcodItem    write FcodItem;
    property cstPis     : String   read FcstPis     write FcstPis;
    property vlBcPis    : Currency read FvlBcPis    write FvlBcPis;
    property aliqPis    : Double   read FaliqPis    write FaliqPis;
    property vlPis      : Currency read FvlPis      write FvlPis;
    property cstCofins  : String   read FcstCofins  write FcstCofins;
    property vlBcCofins : Currency read FvlBcCofins write FvlBcCofins;
    property aliqCofins : Double   read FaliqCofins write FaliqCofins;
    property vlCofins   : Currency read FvlCofins   write FvlCofins;
    property codCta     : String   read FcodCta     write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC810>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC810 }

constructor TJSSpedContribuicoesModelRegistroC810.create;
begin
  inherited;
  reg := 'C810';
end;

destructor TJSSpedContribuicoesModelRegistroC810.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC810.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC810>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC810>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC810): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codItem  + Left.cfop  + Left.cstPis  + Left.cstCofins  + Left.aliqPis.tostring  + Left.aliqCofins.tostring;
      RChave := Right.codItem + Right.cfop + Right.cstPis + Right.cstCofins + Right.aliqPis.tostring + Right.aliqCofins.tostring;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
