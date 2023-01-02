unit JSSpedContribuicoes.Model.RegistroM105;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM105 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnatBcCred     : String;
    FcstPis        : String;
    FvlBcPisTot    : Currency;
    FquantBcPisTot : Double;
    FvlBcPis       : Currency;
    FquantBcPis    : Double;
    FvlBcPisNC     : Currency;
    FvlBcPisCum    : Currency;
    FdescCred      : String;

  public
    property natBcCred     : String   read FnatBcCred     write FnatBcCred;
    property cstPis        : String   read FcstPis        write FcstPis;
    property vlBcPisTot    : Currency read FvlBcPisTot    write FvlBcPisTot;
    property vlBcPisCum    : Currency read FvlBcPisCum    write FvlBcPisCum;
    property vlBcPisNC     : Currency read FvlBcPisNC     write FvlBcPisNC;
    property vlBcPis       : Currency read FvlBcPis       write FvlBcPis;
    property quantBcPisTot : Double   read FquantBcPisTot write FquantBcPisTot;
    property quantBcPis    : Double   read FquantBcPis    write FquantBcPis;
    property descCred      : String   read FdescCred      write FdescCred;


    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM105>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM105 }

constructor TJSSpedContribuicoesModelRegistroM105.create;
begin
  inherited;
  reg := 'M105';
end;

destructor TJSSpedContribuicoesModelRegistroM105.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM105.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM105>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM105>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM105): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.GetValueStr('CODCRED') + Left.natBcCred + Left.cstPis;

      RChave := Right.GetValueStr('CODCRED') + Right.natBcCred + Right.cstPis;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
