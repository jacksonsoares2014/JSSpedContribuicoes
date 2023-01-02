unit JSSpedContribuicoes.Model.RegistroC185;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC185 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcstCofins       : string;
    Fcfop            : string;
    FvlItem          : Currency;
    FvlDesc          : Currency;
    FvlBcCofins      : Currency;
    FaliqCofins      : Double;
    FquantBcCofins   : Currency;
    FaliqCofinsQuant : Double;
    FvlCofins        : Currency;
    FcodCta          : string;

  public
    property cstCofins       : string   read FcstCofins       write FcstCofins;
    property cfop            : string   read Fcfop            write Fcfop;
    property vlItem          : Currency read FvlItem          write FvlItem;
    property vlDesc          : Currency read FvlDesc          write FvlDesc;
    property vlBcCofins      : Currency read FvlBcCofins      write FvlBcCofins;
    property aliqCofins      : Double   read FaliqCofins      write FaliqCofins;
    property quantBcCofins   : Currency read FquantBcCofins   write FquantBcCofins;
    property aliqCofinsQuant : Double   read FaliqCofinsQuant write FaliqCofinsQuant;
    property vlCofins        : Currency read FvlCofins        write FvlCofins;
    property codCta          : string   read FcodCta          write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC185>;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC185 }

constructor TJSSpedContribuicoesModelRegistroC185.create;
begin
  inherited;
  reg := 'C185';
end;

class function TJSSpedContribuicoesModelRegistroC185.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC185>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC185>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC185): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.cstCofins + Left.cfop + Left.aliqCofins.ToString;
      RChave := Right.cstCofins + Right.cfop + Right.aliqCofins.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0
    end);
end;

end.
