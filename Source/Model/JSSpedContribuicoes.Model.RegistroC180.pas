unit JSSpedContribuicoes.Model.RegistroC180;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults;

type
  TJSSpedContribuicoesModelRegistroC180 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodMod    : string;
    FdtDocIni  : TDateTime;
    FdtDocFin  : TDateTime;
    FcodItem   : string;
    FcodNcm    : string;
    FexIpi     : string;
    FvlTotItem : Currency;

  public
    property codMod    : string    read FcodMod    write FcodMod;
    property dtDocIni  : TDateTime read FdtDocIni  write FdtDocIni;
    property dtDocFin  : TDateTime read FdtDocFin  write FdtDocFin;
    property codItem   : string    read FcodItem   write FcodItem;
    property codNcm    : string    read FcodNcm    write FcodNcm;
    property exIpi     : string    read FexIpi     write FexIpi;
    property vlTotItem : Currency  read FvlTotItem write FvlTotItem;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC180>;

    constructor create; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC180 }

constructor TJSSpedContribuicoesModelRegistroC180.create;
begin
  inherited;
  reg := 'C180';
end;

class function TJSSpedContribuicoesModelRegistroC180.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC180>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC180>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC180): Integer
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
