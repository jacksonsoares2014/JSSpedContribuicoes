unit JSSpedContribuicoes.Model.Registro0200;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro0200 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodItem    : String;
    FdescrItem  : String;
    FcodBarra   : String;
    FcodAntItem : String;
    FunidInv    : String;
    FtipoItem   : TJSSpedContribuicoesTipoItem;
    FcodNcm     : String;
    FexIpi      : String;
    FcodGen     : String;
    FcodLst     : String;
    FaliqIcms   : Currency;

  public
    property codItem    : String                       read FcodItem    write FcodItem;
    property descrItem  : String                       read FdescrItem  write FdescrItem;
    property codBarra   : String                       read FcodBarra   write FcodBarra;
    property codAntItem : String                       read FcodAntItem write FcodAntItem;
    property unidInv    : String                       read FunidInv    write FunidInv;
    property tipoItem   : TJSSpedContribuicoesTipoItem read FtipoItem   write FtipoItem;
    property codNcm     : String                       read FcodNcm     write FcodNcm;
    property exIpi      : String                       read FexIpi      write FexIpi;
    property codGen     : String                       read FcodGen     write FcodGen;
    property codLst     : String                       read FcodLst     write FcodLst;
    property aliqIcms   : Currency                     read FaliqIcms   write FaliqIcms;

    constructor create; override;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro0200>;
end;

implementation

{ TJSSpedContribuicoesModelRegistro0200 }

constructor TJSSpedContribuicoesModelRegistro0200.create;
begin
  inherited;
  reg := '0200';
end;

class function TJSSpedContribuicoesModelRegistro0200.getComparer: IComparer<TJSSpedContribuicoesModelRegistro0200>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro0200>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro0200): Integer
    begin
      if UpperCase(Left.descrItem) < UpperCase(Right.descrItem) then
        Result := -1
      else if UpperCase(Left.descrItem) > UpperCase(Right.descrItem) then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
