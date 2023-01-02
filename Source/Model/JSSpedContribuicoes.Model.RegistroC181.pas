unit JSSpedContribuicoes.Model.RegistroC181;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC181 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcstPis       : String;
    Fcfop         : string;
    FvlItem       : Currency;
    FvlDesc       : Currency;
    FvlBcPis      : Currency;
    FaliqPis      : Double;
    FquantBcPis   : Currency;
    FaliqPisQuant : Double;
    FvlPis        : Currency;
    FcodCta       : String;

  public
    property cstPis       : String   read FcstPis       write FcstPis;
    property cfop         : string   read Fcfop         write Fcfop;
    property vlItem       : Currency read FvlItem       write FvlItem;
    property vlDesc       : Currency read FvlDesc       write FvlDesc;
    property vlBcPis      : Currency read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double   read FaliqPis      write FaliqPis;
    property quantBcPis   : Currency read FquantBcPis   write FquantBcPis;
    property aliqPisQuant : Double   read FaliqPisQuant write FaliqPisQuant;
    property vlPis        : Currency read FvlPis        write FvlPis;
    property codCta       : String   read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC181>;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC181 }

constructor TJSSpedContribuicoesModelRegistroC181.create;
begin
  inherited;
  reg := 'C181';
end;

class function TJSSpedContribuicoesModelRegistroC181.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC181>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC181>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC181): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.cstPis + Left.cfop + Left.aliqPis.ToString;
      RChave := Right.cstPis + Right.cfop + Right.aliqPis.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0
    end);
end;

end.
