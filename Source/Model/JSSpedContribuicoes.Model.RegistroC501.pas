unit JSSpedContribuicoes.Model.RegistroC501;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC501 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlBcPis   : Currency;
    FcodCta    : String;
    FcstPis    : String;
    FvlPis     : Currency;
    FnatBcCred : String;
    FvlItem    : Currency;
    FaliqPis   : Double;

  public
    property cstPis       : String   read FcstPis       write FcstPis;
    property vlItem       : Currency read FvlItem       write FvlItem;
    property natBcCred    : String   read FnatBcCred    write FnatBcCred;
    property vlBcPis      : Currency read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double   read FaliqPis      write FaliqPis;
    property vlPis        : Currency read FvlPis        write FvlPis;
    property codCta       : String   read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC501>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC501 }

constructor TJSSpedContribuicoesModelRegistroC501.create;
begin
  inherited;
  reg := 'C501';
end;

destructor TJSSpedContribuicoesModelRegistroC501.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC501.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC501>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC501>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC501): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.natBcCred + Left.cstPis + Left.aliqPis.ToString;

      RChave := Right.natBcCred + Right.cstPis + Right.aliqPis.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
