unit JSSpedContribuicoes.Model.RegistroC170;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults;

type
  TJSSpedContribuicoesModelRegistroC170 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumItem         : Integer;
    FcodItem         : String;
    FdescrCompl      : string;
    Fqtd             : Double;
    Funid            : string;
    FvlItem          : Currency;
    FvlDesc          : Currency;
    FindMov          : TJSSpedContribuicoesIndicadorMovimentacao;
    FcstIcms         : String;
    Fcfop            : string;
    FcodNat          : String;
    FvlBcIcms        : Currency;
    FaliqIcms        : Double;
    FvlIcms          : Currency;
    FvlBcIcmsSt      : Currency;
    FaliqSt          : Double;
    FvlIcmsSt        : Currency;
    FindApur         : string;
    FcstIpi          : string;
    FcodEnq          : String;
    FvlBcIpi         : Currency;
    FaliqIpi         : Double;
    FvlIpi           : Currency;
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

  public
    property numItem         : Integer                                   read FnumItem         write FnumItem;
    property codItem         : String                                    read FcodItem         write FcodItem;
    property descrCompl      : string                                    read FdescrCompl      write FdescrCompl;
    property qtd             : Double                                    read Fqtd             write Fqtd;
    property unid            : string                                    read Funid            write Funid;
    property vlItem          : Currency                                  read FvlItem          write FvlItem;
    property vlDesc          : Currency                                  read FvlDesc          write FvlDesc;
    property indMov          : TJSSpedContribuicoesIndicadorMovimentacao read FindMov          write FindMov;
    property cstIcms         : String                                    read FcstIcms         write FcstIcms;
    property cfop            : string                                    read Fcfop            write Fcfop;
    property codNat          : String                                    read FcodNat          write FcodNat;
    property vlBcIcms        : Currency                                  read FvlBcIcms        write FvlBcIcms;
    property aliqIcms        : Double                                    read FaliqIcms        write FaliqIcms;
    property vlIcms          : Currency                                  read FvlIcms          write FvlIcms;
    property vlBcIcmsSt      : Currency                                  read FvlBcIcmsSt      write FvlBcIcmsSt;
    property aliqSt          : Double                                    read FaliqSt          write FaliqSt;
    property vlIcmsSt        : Currency                                  read FvlIcmsSt        write FvlIcmsSt;
    property indApur         : string                                    read FindApur         write FindApur;
    property cstIpi          : string                                    read FcstIpi          write FcstIpi;
    property codEnq          : String                                    read FcodEnq          write FcodEnq;
    property vlBcIpi         : Currency                                  read FvlBcIpi         write FvlBcIpi;
    property aliqIpi         : Double                                    read FaliqIpi         write FaliqIpi;
    property vlIpi           : Currency                                  read FvlIpi           write FvlIpi;
    property cstPis          : string                                    read FcstPis          write FcstPis;
    property vlBcPis         : Currency                                  read FvlBcPis         write FvlBcPis;
    property aliqPis         : Double                                    read FaliqPis         write FaliqPis;
    property quantBcPis      : Currency                                  read FquantBcPis      write FquantBcPis;
    property aliqPisQuant    : Double                                    read FaliqPisQuant    write FaliqPisQuant;
    property vlPis           : Currency                                  read FvlPis           write FvlPis;
    property cstCofins       : string                                    read FcstCofins       write FcstCofins;
    property vlBcCofins      : Currency                                  read FvlBcCofins      write FvlBcCofins;
    property aliqCofins      : Double                                    read FaliqCofins      write FaliqCofins;
    property quantBcCofins   : Currency                                  read FquantBcCofins   write FquantBcCofins;
    property aliqCofinsQuant : Double                                    read FaliqCofinsQuant write FaliqCofinsQuant;
    property vlCofins        : Currency                                  read FvlCofins        write FvlCofins;
    property codCta          : String                                    read FcodCta          write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC170>;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC170 }

constructor TJSSpedContribuicoesModelRegistroC170.create;
begin
  inherited;
  reg := 'C170';
end;

class function TJSSpedContribuicoesModelRegistroC170.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC170>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC170>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC170): Integer
    begin
      if Left.codItem < Right.codItem then
        Result := -1
      else if Left.codItem > Right.codItem then
        Result := 1
      else
        Result := 0
    end);
end;

end.
