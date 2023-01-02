unit JSSpedContribuicoes.Model.RegistroC870;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC870 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlBcPis    : Currency;
    FvlBcCofins : Currency;
    FcodCta     : String;
    FcodItem    : String;
    FcstPis     : String;
    Fcfop       : String;
    FcstCofins  : String;
    FvlPis      : Currency;
    FvlItem     : Currency;
    FvlCofins   : Currency;
    FvlDesc     : Currency;
    FaliqPis    : Double;
    FaliqCofins : Double;

  public
    property codItem    : String   read FcodItem    write FcodItem;
    property cfop       : String   read Fcfop       write Fcfop;
    property vlItem     : Currency read FvlItem     write FvlItem;
    property vlDesc     : Currency read FvlDesc     write FvlDesc;
    property cstPis     : String   read FcstPis     write FcstPis;
    property vlBcPis    : Currency read FvlBcPis    write FvlBcPis;
    property aliqPis    : Double   read FaliqPis    write FaliqPis;
    property vlPis      : Currency read FvlPis      write FvlPis;
    property cstCofins  : String   read FcstCofins  write FcstCofins;
    property vlBcCofins : Currency read FvlBcCofins write FvlBcCofins;
    property aliqCofins : Double   read FaliqCofins write FaliqCofins;
    property vlCofins   : Currency read FvlCofins   write FvlCofins;
    property codCta     : String   read FcodCta     write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC870>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC870 }

constructor TJSSpedContribuicoesModelRegistroC870.create;
begin
  inherited;
  reg := 'C870';
end;

destructor TJSSpedContribuicoesModelRegistroC870.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC870.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC870>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC870>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC870): Integer
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
