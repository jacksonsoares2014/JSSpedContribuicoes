unit JSSpedContribuicoes.Model.RegistroC405;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type TJSSpedContribuicoesModelRegistroC405 = class(TJSSpedContribuicoesModelRegistro)
  private
    FdtDoc     : TDateTime;
    Fcro       : Integer;
    Fcrz       : Integer;
    FnumCooFin : Integer;
    FgtFin     : Currency;
    FvlBrt     : Currency;

  public
    property dtDoc     : TDateTime read FdtDoc     write FdtDoc;
    property cro       : Integer   read Fcro       write Fcro;
    property crz       : Integer   read Fcrz       write Fcrz;
    property numCooFin : Integer   read FnumCooFin write FnumCooFin;
    property gtFin     : Currency  read FgtFin     write FgtFin;
    property vlBrt     : Currency  read FvlBrt     write FvlBrt;

    constructor create; override;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC405>;
end;

implementation

{ TJSSpedContribuicoesModelRegistroC405 }

constructor TJSSpedContribuicoesModelRegistroC405.create;
begin
  inherited;
  reg := 'C405';
end;

class function TJSSpedContribuicoesModelRegistroC405.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC405>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC405>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC405): Integer
    var LChave, RChave: String;
    begin
      LChave := FormatDateTime('yyyymmdd',Left.dtDoc);
      RChave := FormatDateTime('yyyymmdd',Right.dtDoc);

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0
    end);
end;

end.

