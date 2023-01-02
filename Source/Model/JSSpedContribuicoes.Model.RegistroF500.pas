unit JSSpedContribuicoes.Model.RegistroF500;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF500 = class(TJSSpedContribuicoesModelRegistro)
  private
    FinfCompl     : String;
    FvlBcPis      : Currency;
    FvlBcCofins   : Currency;
    FcodCta       : String;
    FvlDescPis    : Currency;
    FvlDescCofins : Currency;
    Fcfop         : String;
    FcodMod       : String;
    FcstPis       : String;
    FcstCofins    : String;
    FvlPis        : Currency;
    FvlCofins     : Currency;
    FvlRecCaixa   : Currency;
    FaliqPis      : Double;
    FaliqCofins   : Double;

  public
    property vlRecCaixa   : Currency  read FvlRecCaixa   write FvlRecCaixa;
    property cstPis       : String    read FcstPis       write FcstPis;
    property vlDescPis    : Currency  read FvlDescPis    write FvlDescPis;
    property vlBcPis      : Currency  read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double    read FaliqPis      write FaliqPis;
    property vlPis        : Currency  read FvlPis        write FvlPis;
    property cstCofins    : String    read FcstCofins    write FcstCofins;
    property vlDescCofins : Currency  read FvlDescCofins write FvlDescCofins;
    property vlBcCofins   : Currency  read FvlBcCofins   write FvlBcCofins;
    property aliqCofins   : Double    read FaliqCofins   write FaliqCofins;
    property vlCofins     : Currency  read FvlCofins     write FvlCofins;
    property codMod       : String    read FcodMod       write FcodMod;
    property cfop         : String    read Fcfop         write Fcfop;
    property codCta       : String    read FcodCta       write FcodCta;
    property infCompl     : String    read FinfCompl     write FinfCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF500>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF500 }

constructor TJSSpedContribuicoesModelRegistroF500.create;
begin
  inherited;
  reg := 'F500';
end;

destructor TJSSpedContribuicoesModelRegistroF500.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF500.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF500>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF500>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF500): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.cstPis + Left.cstCofins + Left.cfop + Left.aliqPis.tostring + Left.aliqCofins.tostring;
      RChave := Right.cstPis + Right.cstCofins + Right.cfop + Right.aliqPis.tostring + Right.aliqCofins.tostring;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
