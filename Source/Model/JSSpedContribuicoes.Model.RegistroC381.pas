unit JSSpedContribuicoes.Model.RegistroC381;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC381 = class(TJSSpedContribuicoesModelRegistro)
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
    property codItem      : String   read FcodItem      write FcodItem;
    property vlItem       : Currency read FvlItem       write FvlItem;
    property vlBcPis      : Currency read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double   read FaliqPis      write FaliqPis;
    property quantBcPis   : Currency read FquantBcPis   write FquantBcPis;
    property aliqPisQuant : Double   read FaliqPisQuant write FaliqPisQuant;
    property vlPis        : Currency read FvlPis        write FvlPis;
    property codCta       : String   read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC381>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC381 }

constructor TJSSpedContribuicoesModelRegistroC381.create;
begin
  inherited;
  reg := 'C381';
end;

destructor TJSSpedContribuicoesModelRegistroC381.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC381.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC381>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC381>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC381): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codItem + Left.cstPis + Left.aliqPis.ToString;
      RChave := Right.codItem + Right.cstPis + Right.aliqPis.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
