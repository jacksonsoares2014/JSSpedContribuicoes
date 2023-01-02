unit JSSpedContribuicoes.Model.RegistroD501;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD501 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlBcPis    : Currency;
    FcodCta     : String;
    FcstPis     : String;
    FvlPis      : Currency;
    FvlItem     : Currency;
    FaliqPis    : Double;
    FnatBcCred  : String;

  public
    property cstPis       : String     read FcstPis       write FcstPis;
    property vlItem       : Currency   read FvlItem       write FvlItem;
    property natBcCred    : String     read FnatBcCred    write FnatBcCred;
    property vlBcPis      : Currency   read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double     read FaliqPis      write FaliqPis;
    property vlPis        : Currency   read FvlPis        write FvlPis;
    property codCta       : String     read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD501>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD501 }

constructor TJSSpedContribuicoesModelRegistroD501.create;
begin
  inherited;
  reg := 'D501';
end;

destructor TJSSpedContribuicoesModelRegistroD501.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD501.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD501>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD501>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD501): Integer
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
