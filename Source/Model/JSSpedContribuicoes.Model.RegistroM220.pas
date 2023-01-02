unit JSSpedContribuicoes.Model.RegistroM220;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM220 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindAj  : TJSSpedContribuicoesTipoAjuste;
    FvlAj   : Currency;
    FcodAj  : String;
    FnumDoc : String;
    FdescrAj: String;
    FdtRef  : TDateTime;

  public
    property indAj  : TJSSpedContribuicoesTipoAjuste read FindAj   write FindAj;
    property vlAj   : Currency                       read FvlAj    write FvlAj;
    property codAj  : String                         read FcodAj   write FcodAj;
    property numDoc : String                         read FnumDoc  write FnumDoc;
    property descrAj: String                         read FdescrAj write FdescrAj;
    property dtRef  : TDateTime                      read FdtRef   write FdtRef;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM220>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM220 }

constructor TJSSpedContribuicoesModelRegistroM220.create;
begin
  inherited;
  reg := 'M220';
end;

destructor TJSSpedContribuicoesModelRegistroM220.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM220.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM220>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM220>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM220): Integer
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
