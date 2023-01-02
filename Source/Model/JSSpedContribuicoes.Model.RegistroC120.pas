unit JSSpedContribuicoes.Model.RegistroC120;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults;

type
  TJSSpedContribuicoesModelRegistroC120 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodDocImp   : TJSSpedContribuicoesDocumentoImportacao;
    FnumDoc      : string;
    FvlPisImp    : Currency;
    FvlCofinsImp : Currency;
    FnumAcdRaw   : String;

  public
    property codDocImp   : TJSSpedContribuicoesDocumentoImportacao read FcodDocImp   write FcodDocImp;
    property numDocImp   : string                                  read FnumDoc      write FnumDoc;
    property vlPisImp    : Currency                                read FvlPisImp    write FvlPisImp;
    property vlCofinsImp : Currency                                read FvlCofinsImp write FvlCofinsImp;
    property numAcdRaw   : String                                  read FnumAcdRaw   write FnumAcdRaw;

    constructor create; override;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC120>;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC120 }

constructor TJSSpedContribuicoesModelRegistroC120.create;
begin
  inherited;
  reg := 'C120';
end;

class function TJSSpedContribuicoesModelRegistroC120.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC120>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC120>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC120): Integer
    var LChave, RChave: String;
    begin
      LChave := Left.codDocImp.toString  + Left.numDocImp;
      RChave := Right.codDocImp.toString + Right.numDocImp;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
