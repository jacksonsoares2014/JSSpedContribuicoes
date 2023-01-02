unit JSSpedContribuicoes.Model.RegistroD101;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD101 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlBcPis    : Currency;
    FcodCta     : String;
    FcstPis     : String;
    FvlPis      : Currency;
    FnatBcCred  : String;
    FvlItem     : Currency;
    FaliqPis    : Double;
    FindNatFret : TJSSpedContribuicoesIndicadorNaturezaFrete;

  public
    property indNatFrt    : TJSSpedContribuicoesIndicadorNaturezaFrete   read FindNatFret   write FindNatFret;
    property vlItem       : Currency                                     read FvlItem       write FvlItem;
    property cstPis       : String                                       read FcstPis       write FcstPis;
    property natBcCred    : String                                       read FnatBcCred    write FnatBcCred;
    property vlBcPis      : Currency                                     read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double                                       read FaliqPis      write FaliqPis;
    property vlPis        : Currency                                     read FvlPis        write FvlPis;
    property codCta       : String                                       read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD101>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD101 }

constructor TJSSpedContribuicoesModelRegistroD101.create;
begin
  inherited;
  reg := 'D101';
end;

destructor TJSSpedContribuicoesModelRegistroD101.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD101.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD101>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD101>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD101): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.indNatFrt.toString + Left.cstPis + Left.natBcCred + Left.aliqPis.ToString;

      RChave := Right.indNatFrt.toString + Right.cstPis + Right.natBcCred + Right.aliqPis.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
