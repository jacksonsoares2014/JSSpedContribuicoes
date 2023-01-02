unit JSSpedContribuicoes.Model.RegistroC380;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC380 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumDocIni : String;
    FdtDocIni  : TDateTime;
    FnumDocFin : String;
    FcodMod    : String;
    FdtDocFin  : TDateTime;
    FvlDocCanc : Currency;
    FvlDoc     : Currency;

  public
    property codMod    : String            read FcodMod    write FcodMod;
    property dtDocIni  : TDateTime         read FdtDocIni  write FdtDocIni;
    property dtDocFin  : TDateTime         read FdtDocFin  write FdtDocFin;
    property numDocIni : String            read FnumDocIni write FnumDocIni;
    property numDocFin : String            read FnumDocFin write FnumDocFin;
    property vlDoc     : Currency          read FvlDoc     write FvlDoc;
    property vlDocCanc : Currency          read FvlDocCanc write FvlDocCanc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC380>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC380 }

constructor TJSSpedContribuicoesModelRegistroC380.create;
begin
  inherited;
  reg := 'C380';
end;

destructor TJSSpedContribuicoesModelRegistroC380.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC380.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC380>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC380>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC380): Integer
    begin
      if Left.numDocIni < Right.numDocIni then
        Result := -1
      else if Left.numDocIni > Right.numDocIni then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
