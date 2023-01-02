unit JSSpedContribuicoes.Model.RegistroM110;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM110 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindAj   : TJSSpedContribuicoesTipoAjuste;
    FvlAj    : Currency;
    FcodAj   : String;
    FnumDoc  : String;
    FdescrAj : String;
    FdtRef   : TDateTime;

  public
    property indAj   : TJSSpedContribuicoesTipoAjuste    read FindAj   write FindAj;
    property vlAj    : Currency                          read FvlAj    write FvlAj;
    property codAj   : String                            read FcodAj   write FcodAj;
    property numDoc  : String                            read FnumDoc  write FnumDoc;
    property descrAj : String                            read FdescrAj write FdescrAj;
    property dtRef   : TDateTime                         read FdtRef   write FdtRef;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM110>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM110 }

constructor TJSSpedContribuicoesModelRegistroM110.create;
begin
  inherited;
  reg := 'M110';
end;

destructor TJSSpedContribuicoesModelRegistroM110.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM110.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM110>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM110>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM110): Integer
    var LChave, RChave: string;
    begin
      LChave := '';

      RChave := '';

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
