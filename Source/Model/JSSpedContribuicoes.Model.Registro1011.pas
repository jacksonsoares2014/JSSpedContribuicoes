unit JSSpedContribuicoes.Model.Registro1011;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1011 = class(TJSSpedContribuicoesModelRegistro)
  private
    FregRef        : String;
    FvlBcPis       : Double;
    FvlOper        : Currency;
    FvlBcCofins    : Double;
    FaliqPisSusp   : Double;
    FaliqCofinsSusp: Double;
    FcodCta        : String;
    FvlBcPisSusp   : Double;
    FvlBcCofinsSusp: Double;
    FdtOper        : TDateTime;
    FcodItem       : String;
    FcstPis        : String;
    FcodPart       : String;
    FcstCofins     : String;
    FvlPis         : Currency;
    FvlCofins      : Currency;
    FchaveDoc      : String;
    FdescDocOper   : String;
    FcstPisSusp    : String;
    FcstCofinsSusp : String;
    FvlPisSusp     : Currency;
    FvlCofinsSusp  : Currency;
    FaliqPis       : Double;
    FcodCcus       : String;
    FaliqCofins    : Double;

  public
    property regRef         : String    read FregRef         write FregRef;
    property chaveDoc       : String    read FchaveDoc       write FchaveDoc;
    property codPart        : String    read FcodPart        write FcodPart;
    property codItem        : String    read FcodItem        write FcodItem;
    property dtOper         : TDateTime read FdtOper         write FdtOper;
    property vlOper         : Currency  read FvlOper         write FvlOper;
    property cstPis         : String    read FcstPis         write FcstPis;
    property vlBcPis        : Double    read FvlBcPis        write FvlBcPis;
    property aliqPis        : Double    read FaliqPis        write FaliqPis;
    property vlPis          : Currency  read FvlPis          write FvlPis;
    property cstCofins      : String    read FcstCofins      write FcstCofins;
    property vlBcCofins     : Double    read FvlBcCofins     write FvlBcCofins;
    property aliqCofins     : Double    read FaliqCofins     write FaliqCofins;
    property vlCofins       : Currency  read FvlCofins       write FvlCofins;
    property cstPisSusp     : String    read FcstPisSusp     write FcstPisSusp;
    property vlBcPisSusp    : Double    read FvlBcPisSusp    write FvlBcPisSusp;
    property aliqPisSusp    : Double    read FaliqPisSusp    write FaliqPisSusp;
    property vlPisSusp      : Currency  read FvlPisSusp      write FvlPisSusp;
    property cstCofinsSusp  : String    read FcstCofinsSusp  write FcstCofinsSusp;
    property vlBcCofinsSusp : Double    read FvlBcCofinsSusp write FvlBcCofinsSusp;
    property aliqCofinsSusp : Double    read FaliqCofinsSusp write FaliqCofinsSusp;
    property vlCofinsSusp   : Currency  read FvlCofinsSusp   write FvlCofinsSusp;
    property codCta         : String    read FcodCta         write FcodCta;
    property codCcus        : String    read FcodCcus        write FcodCcus;
    property descDocOper    : String    read FdescDocOper    write FdescDocOper;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1011>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1011 }

constructor TJSSpedContribuicoesModelRegistro1011.create;
begin
  inherited;
  reg := '1011';
end;

destructor TJSSpedContribuicoesModelRegistro1011.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1011.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1011>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1011>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1011): Integer
    begin
      if Left.codItem < Right.codItem then
        Result := -1
      else if Left.codItem > Right.codItem then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
