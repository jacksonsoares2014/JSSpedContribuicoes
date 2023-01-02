unit JSSpedContribuicoes.Model.Registro1101;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1101 = class(TJSSpedContribuicoesModelRegistro)
  private
    FchvNfe      : String;
    FnumDoc      : Integer;
    FperEscrit   : String;
    FvlBcPis     : Currency;
    FvlOper      : Currency;
    Fcnpj        : String;
    FcodCta      : String;
    Fsubserie    : String;
    FdescCompl   : String;
    FdtOper      : TDateTime;
    FcodItem     : String;
    Fserie       : String;
    FcstPis      : String;
    Fcfop        : String;
    FcodMod      : String;
    FcodPart     : String;
    FvlPis       : Currency;
    FnatBcCred   : String;
    FindOrigCred : String;
    FaliqPis     : Currency;
    FcodCcus     : String;

  public
    property codPart     : String     read FcodPart     write FcodPart;
    property codItem     : String     read FcodItem     write FcodItem;
    property codMod      : String     read FcodMod      write FcodMod;
    property serie       : String     read Fserie       write Fserie;
    property subserie    : String     read Fsubserie    write Fsubserie;
    property numDoc      : Integer    read FnumDoc      write FnumDoc;
    property dtOper      : TDateTime  read FdtOper      write FdtOper;
    property chvNfe      : String     read FchvNfe      write FchvNfe;
    property vlOper      : Currency   read FvlOper      write FvlOper;
    property cfop        : String     read Fcfop        write Fcfop;
    property natBcCred   : String     read FnatBcCred   write FnatBcCred;
    property indOrigCred : String     read FindOrigCred write FindOrigCred;
    property cstPis      : String     read FcstPis      write FcstPis;
    property vlBcPis     : Currency   read FvlBcPis     write FvlBcPis;
    property aliqPis     : Currency   read FaliqPis     write FaliqPis;
    property vlPis       : Currency   read FvlPis       write FvlPis;
    property codCta      : String     read FcodCta      write FcodCta;
    property codCcus     : String     read FcodCcus     write FcodCcus;
    property descCompl   : String     read FdescCompl   write FdescCompl;
    property perEscrit   : String     read FperEscrit   write FperEscrit;
    property cnpj        : String     read Fcnpj        write Fcnpj;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1101>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1101 }

constructor TJSSpedContribuicoesModelRegistro1101.create;
begin
  inherited;
  reg := '1101';
end;

destructor TJSSpedContribuicoesModelRegistro1101.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1101.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1101>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1101>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1101): Integer
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
