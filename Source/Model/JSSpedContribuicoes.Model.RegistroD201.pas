unit JSSpedContribuicoes.Model.RegistroD201;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD201 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlBcPis    : Currency;
    FcodCta     : String;
    FcstPis     : String;
    FvlPis      : Currency;
    FvlItem     : Currency;
    FaliqPis    : Double;

  public
    property cstPis       : String     read FcstPis       write FcstPis;
    property vlItem       : Currency   read FvlItem       write FvlItem;
    property vlBcPis      : Currency   read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double     read FaliqPis      write FaliqPis;
    property vlPis        : Currency   read FvlPis        write FvlPis;
    property codCta       : String     read FcodCta       write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD201>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD201 }

constructor TJSSpedContribuicoesModelRegistroD201.create;
begin
  inherited;
  reg := 'D201';
end;

destructor TJSSpedContribuicoesModelRegistroD201.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD201.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD201>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD201>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD201): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.cstPis + Left.aliqPis.ToString;

      RChave := Right.cstPis + Right.aliqPis.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
