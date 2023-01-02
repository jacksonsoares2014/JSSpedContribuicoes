unit JSSpedContribuicoes.Model.RegistroF600;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF600 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindNatRet   : String;
    FdtRet       : TDateTime;
    FvlBcRet     : Currency;
    FvlRet       : Currency;
    FcodRec      : String;
    FindNatRec   : String;
    Fcnpj        : String;
    FvlRetPis    : Currency;
    FvlRetCofins : Currency;
    FindDec      : String;

  public
    property indNatRet   : String    read FindNatRet   write FindNatRet;
    property dtRet       : TDateTime read FdtRet       write FdtRet;
    property vlBcRet     : Currency  read FvlBcRet     write FvlBcRet;
    property vlRet       : Currency  read FvlRet       write FvlRet;
    property codRec      : String    read FcodRec      write FcodRec;
    property indNatRec   : String    read FindNatRec   write FindNatRec;
    property cnpj        : String    read Fcnpj        write Fcnpj;
    property vlRetPis    : Currency  read FvlRetPis    write FvlRetPis;
    property vlRetCofins : Currency  read FvlRetCofins write FvlRetCofins;
    property indDec      : String    read FindDec      write FindDec;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF600>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF600 }

constructor TJSSpedContribuicoesModelRegistroF600.create;
begin
  inherited;
  reg := 'F600';
end;

destructor TJSSpedContribuicoesModelRegistroF600.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF600.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF600>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF600>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF600): Integer
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
