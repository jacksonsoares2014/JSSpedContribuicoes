unit JSSpedContribuicoes.Model.RegistroC175;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC175 = class(TJSSpedContribuicoesModelRegistro)
  private
    Fcfop            : String;
    FvlOpr           : Currency;
    FvlDesc          : Currency;
    FcstPis          : string;
    FvlBcPis         : Currency;
    FaliqPis         : Double;
    FquantBcPis      : Currency;
    FaliqPisQuant    : Double;
    FvlPis           : Currency;
    FcstCofins       : string;
    FvlBcCofins      : Currency;
    FaliqCofins      : Double;
    FquantBcCofins   : Currency;
    FaliqCofinsQuant : Double;
    FvlCofins        : Currency;
    FcodCta          : String;
    FinfoCompl       : string;

  public
    property cfop            : String   read Fcfop            write Fcfop;
    property vlOpr           : Currency read FvlOpr           write FvlOpr;
    property vlDesc          : Currency read FvlDesc          write FvlDesc;
    property cstPis          : string   read FcstPis          write FcstPis;
    property vlBcPis         : Currency read FvlBcPis         write FvlBcPis;
    property aliqPis         : Double   read FaliqPis         write FaliqPis;
    property quantBcPis      : Currency read FquantBcPis      write FquantBcPis;
    property aliqPisQuant    : Double   read FaliqPisQuant    write FaliqPisQuant;
    property vlPis           : Currency read FvlPis           write FvlPis;
    property cstCofins       : string   read FcstCofins       write FcstCofins;
    property vlBcCofins      : Currency read FvlBcCofins      write FvlBcCofins;
    property aliqCofins      : Double   read FaliqCofins      write FaliqCofins;
    property quantBcCofins   : Currency read FquantBcCofins   write FquantBcCofins;
    property aliqCofinsQuant : Double   read FaliqCofinsQuant write FaliqCofinsQuant;
    property vlCofins        : Currency read FvlCofins        write FvlCofins;
    property codCta          : String   read FcodCta          write FcodCta;
    property infoCompl       : string   read FinfoCompl       write FinfoCompl;

    constructor create; override;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC175>;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC175 }

constructor TJSSpedContribuicoesModelRegistroC175.create;
begin
  inherited;
  reg := 'C175';
end;

class function TJSSpedContribuicoesModelRegistroC175.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC175>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC175>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC175): Integer
    var LChave, RChave: String;
    begin
      LChave := Left.cstPis + Left.cstCofins + Left.cfop + Left.aliqPis.tostring + Left.aliqCofins.tostring;
      RChave := Right.cstPis + Right.cstCofins + Right.cfop + Right.aliqPis.tostring + Right.aliqCofins.tostring;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
