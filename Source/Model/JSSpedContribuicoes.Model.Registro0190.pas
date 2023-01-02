unit JSSpedContribuicoes.Model.Registro0190;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro0190 = class(TJSSpedContribuicoesModelRegistro)
  private
    Funid : string;
    Fdescr: string;

  public
    property unid : string read Funid  write Funid;
    property descr: string read Fdescr write Fdescr;

    constructor create; override;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro0190>;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro0190 }

constructor TJSSpedContribuicoesModelRegistro0190.create;
begin
  inherited;
  reg := '0190';
end;

class function TJSSpedContribuicoesModelRegistro0190.getComparer: IComparer<TJSSpedContribuicoesModelRegistro0190>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro0190>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro0190): Integer
    begin
      if UpperCase(Left.unid) < UpperCase(Right.unid) then
        Result := -1
      else if UpperCase(Left.unid) > UpperCase(Right.unid) then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
