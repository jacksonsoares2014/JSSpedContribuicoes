unit JSSpedContribuicoes.Model.RegistroC491;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC491 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcstPis       : String;
    FcodItem      : String;
    FvlItem       : Currency;
    FvlBcPis      : Currency;
    FaliqPis      : Double;
    FquantBcPis   : Currency;
    FaliqPisQuant : Double;
    FvlPis        : Currency;
    FcodCta       : String;
    Fcfop         : String;

  public
    property codItem      : String   read FcodItem      write FcodItem;
    property cstPis       : String   read FcstPis       write FcstPis;
    property cfop         : String   read Fcfop         write Fcfop;
    property vlItem       : Currency read FvlItem       write FvlItem;
    property vlBcPis      : Currency read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double   read FaliqPis      write FaliqPis;
    property quantBcPis   : Currency read FquantBcPis   write FquantBcPis;
    property aliqPisQuant : Double   read FaliqPisQuant write FaliqPisQuant;
    property vlPis        : Currency read FvlPis        write FvlPis;
    property codCta       : String   read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC491>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC491 }

constructor TJSSpedContribuicoesModelRegistroC491.create;
begin
  inherited;
  reg := 'C491';
end;

destructor TJSSpedContribuicoesModelRegistroC491.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC491.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC491>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC491>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC491): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codItem  + Left.cstPis  + Left.aliqPis.toString;
      RChave := Right.codItem + Right.cstPis + Right.aliqPis.toString;;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
