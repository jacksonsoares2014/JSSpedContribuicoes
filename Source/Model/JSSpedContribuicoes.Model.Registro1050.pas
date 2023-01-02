unit JSSpedContribuicoes.Model.Registro1050;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1050 = class(TJSSpedContribuicoesModelRegistro)
  private
    FdtRef     : TDateTime;
    FindAjBc   : String;
    Fcnpj      : String;
    FvlAjTot   : Currency;
    FvlAjCst01 : Currency;
    FvlAjCst99 : Currency;
    FvlAjCst08 : Currency;
    FvlAjCst09 : Currency;
    FvlAjCst49 : Currency;
    FvlAjCst02 : Currency;
    FvlAjCst03 : Currency;
    FvlAjCst06 : Currency;
    FvlAjCst07 : Currency;
    FvlAjCst04 : Currency;
    FvlAjCst05 : Currency;
    FindAprop  : String;
    FnumRec    : String;
    FinfoCompl : String;

  public
    property dtRef     : TDateTime read FdtRef     write FdtRef;
    property indAjBc   : String    read FindAjBc   write FindAjBc;
    property cnpj      : String    read Fcnpj      write Fcnpj;
    property vlAjTot   : Currency  read FvlAjTot   write FvlAjTot;
    property vlAjCst01 : Currency  read FvlAjCst01 write FvlAjCst01;
    property vlAjCst02 : Currency  read FvlAjCst02 write FvlAjCst02;
    property vlAjCst03 : Currency  read FvlAjCst03 write FvlAjCst03;
    property vlAjCst04 : Currency  read FvlAjCst04 write FvlAjCst04;
    property vlAjCst05 : Currency  read FvlAjCst05 write FvlAjCst05;
    property vlAjCst06 : Currency  read FvlAjCst06 write FvlAjCst06;
    property vlAjCst07 : Currency  read FvlAjCst07 write FvlAjCst07;
    property vlAjCst08 : Currency  read FvlAjCst08 write FvlAjCst08;
    property vlAjCst09 : Currency  read FvlAjCst09 write FvlAjCst09;
    property vlAjCst49 : Currency  read FvlAjCst49 write FvlAjCst49;
    property vlAjCst99 : Currency  read FvlAjCst99 write FvlAjCst99;
    property indAprop  : String    read FindAprop  write FindAprop;
    property numRec    : String    read FnumRec    write FnumRec;
    property infoCompl : String    read FinfoCompl write FinfoCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1050>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1050 }

constructor TJSSpedContribuicoesModelRegistro1050.create;
begin
  inherited;
  reg := '1050';
end;

destructor TJSSpedContribuicoesModelRegistro1050.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1050.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1050>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1050>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1050): Integer
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
