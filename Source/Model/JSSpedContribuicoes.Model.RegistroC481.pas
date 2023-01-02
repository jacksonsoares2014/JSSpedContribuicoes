unit JSSpedContribuicoes.Model.RegistroC481;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC481 = class(TJSSpedContribuicoesModelRegistro)
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

  public
    property cstPis       : String   read FcstPis       write FcstPis;
    property vlItem       : Currency read FvlItem       write FvlItem;
    property vlBcPis      : Currency read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double   read FaliqPis      write FaliqPis;
    property quantBcPis   : Currency read FquantBcPis   write FquantBcPis;
    property aliqPisQuant : Double   read FaliqPisQuant write FaliqPisQuant;
    property vlPis        : Currency read FvlPis        write FvlPis;
    property codItem      : String   read FcodItem      write FcodItem;
    property codCta       : String   read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC481>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC481 }

constructor TJSSpedContribuicoesModelRegistroC481.create;
begin
  inherited;
  reg := 'C481';
end;

destructor TJSSpedContribuicoesModelRegistroC481.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC481.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC481>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC481>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC481): Integer
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
