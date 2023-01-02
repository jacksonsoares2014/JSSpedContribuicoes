unit JSSpedContribuicoes.Model.Registro1500;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1500 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcnpjSuc          : String;
    FvlCredDescPaAnt  : Currency;
    ForigCred         : String;
    FsdCredDispEfd    : Currency;
    FvlCredPerPaAnt   : Currency;
    FvlCredTrans      : Currency;
    FcodCred          : String;
    FsldCredFim       : Currency;
    FvlCredExtApu     : Currency;
    FvlCredDcompEfd   : Currency;
    FvlCredOut        : Currency;
    FvlTotCredApu     : Currency;
    FperApuCred       : String;
    FvlCredDescEfd    : Currency;
    FvlCredApu        : Currency;
    FvlCredPerEfd     : Currency;
    FvlCredDcompPaAnt : Currency;

  public
    property perApuCred        : String     read FperApuCred        write FperApuCred;
    property origCred          : String     read ForigCred          write ForigCred;
    property cnpjSuc           : String     read FcnpjSuc           write FcnpjSuc;
    property codCred           : String     read FcodCred           write FcodCred;
    property vlCredApu         : Currency   read FvlCredApu         write FvlCredApu;
    property vlCredExtApu      : Currency   read FvlCredExtApu      write FvlCredExtApu;
    property vlTotCredApu      : Currency   read FvlTotCredApu      write FvlTotCredApu;
    property vlCredDescPaAnt   : Currency   read FvlCredDescPaAnt   write FvlCredDescPaAnt;
    property vlCredPerPaAnt    : Currency   read FvlCredPerPaAnt    write FvlCredPerPaAnt;
    property vlCredDcompPaAnt  : Currency   read FvlCredDcompPaAnt  write FvlCredDcompPaAnt;
    property sdCredDispEfd     : Currency   read FsdCredDispEfd     write FsdCredDispEfd;
    property vlCredDescEfd     : Currency   read FvlCredDescEfd     write FvlCredDescEfd;
    property vlCredPerEfd      : Currency   read FvlCredPerEfd      write FvlCredPerEfd;
    property vlCredDcompEfd    : Currency   read FvlCredDcompEfd    write FvlCredDcompEfd;
    property vlCredTrans       : Currency   read FvlCredTrans       write FvlCredTrans;
    property vlCredOut         : Currency   read FvlCredOut         write FvlCredOut;
    property sldCredFim        : Currency   read FsldCredFim        write FsldCredFim;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1500>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1500 }

constructor TJSSpedContribuicoesModelRegistro1500.create;
begin
  inherited;
  reg := '1500';
end;

destructor TJSSpedContribuicoesModelRegistro1500.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1500.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1500>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1500>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1500): Integer
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
