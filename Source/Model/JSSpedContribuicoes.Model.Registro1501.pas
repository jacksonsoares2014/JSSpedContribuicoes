unit JSSpedContribuicoes.Model.Registro1501;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1501 = class(TJSSpedContribuicoesModelRegistro)
  private
    FchvNfe      : String;
    FnumDoc      : Integer;
    FperEscrit   : String;
    FvlOper      : Currency;
    Fcnpj        : String;
    FvlBcCofins  : Currency;
    FcodCta      : String;
    Fsubserie    : String;
    FdescCompl   : String;
    FdtOper      : TDateTime;
    FcodItem     : String;
    Fserie       : String;
    Fcfop        : String;
    FcodMod      : String;
    FcodPart     : String;
    FcstCofins   : String;
    FnatBcCred   : String;
    FvlCofins    : Currency;
    FindOrigCred : String;
    FcodCcus     : String;
    FaliqCofins  : Currency;

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
    property cstCofins   : String     read FcstCofins   write FcstCofins;
    property vlBcCofins  : Currency   read FvlBcCofins  write FvlBcCofins;
    property aliqCofins  : Currency   read FaliqCofins  write FaliqCofins;
    property vlCofins    : Currency   read FvlCofins    write FvlCofins;
    property codCta      : String     read FcodCta      write FcodCta;
    property codCcus     : String     read FcodCcus     write FcodCcus;
    property descCompl   : String     read FdescCompl   write FdescCompl;
    property perEscrit   : String     read FperEscrit   write FperEscrit;
    property cnpj        : String     read Fcnpj        write Fcnpj;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1501>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1501 }

constructor TJSSpedContribuicoesModelRegistro1501.create;
begin
  inherited;
  reg := '1501';
end;

destructor TJSSpedContribuicoesModelRegistro1501.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1501.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1501>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1501>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1501): Integer
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
