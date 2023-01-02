unit JSSpedContribuicoes.Model.RegistroM620;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM620 = class(TJSSpedContribuicoesModelRegistro)
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

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM620>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM620 }

constructor TJSSpedContribuicoesModelRegistroM620.create;
begin
  inherited;
  reg := 'M620';
end;

destructor TJSSpedContribuicoesModelRegistroM620.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM620.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM620>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM620>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM620): Integer
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
