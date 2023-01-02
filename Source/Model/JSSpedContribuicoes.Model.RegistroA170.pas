unit JSSpedContribuicoes.Model.RegistroA170;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroA170 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumItem     : Integer;
    FcodItem     : String;
    FvlDesc      : Currency;
    FvlItem      : Currency;
    FnatBcCred   : String;
    FindOrigCred : TJSSpedContribuicoesIndicadorOrigemCredito;
    FcstPis      : String;
    FvlBcPis     : Currency;
    FaliqPis     : Double;
    FvlPis       : Currency;
    FvlBcCofins  : Currency;
    FcstCofins   : String;
    FvlCofins    : Currency;
    FaliqCofins  : Double;
    FcodCta      : String;
    FcodCcus     : String;
    FdescrCompl  : String;

  public
    property numItem     : Integer                                    read FnumItem     write FnumItem;
    property codItem     : String                                     read FcodItem     write FcodItem;
    property descrCompl  : String                                     read FdescrCompl  write FdescrCompl;
    property vlItem      : Currency                                   read FvlItem      write FvlItem;
    property vlDesc      : Currency                                   read FvlDesc      write FvlDesc;
    property natBcCred   : String                                     read FnatBcCred   write FnatBcCred;
    property indOrigCred : TJSSpedContribuicoesIndicadorOrigemCredito read FindOrigCred write FindOrigCred;
    property cstPis      : String                                     read FcstPis      write FcstPis;
    property vlBcPis     : Currency                                   read FvlBcPis     write FvlBcPis;
    property aliqPis     : Double                                     read FaliqPis     write FaliqPis;
    property vlPis       : Currency                                   read FvlPis       write FvlPis;
    property cstCofins   : String                                     read FcstCofins   write FcstCofins;
    property vlBcCofins  : Currency                                   read FvlBcCofins  write FvlBcCofins;
    property aliqCofins  : Double                                     read FaliqCofins  write FaliqCofins;
    property vlCofins    : Currency                                   read FvlCofins    write FvlCofins;
    property codCta      : String                                     read FcodCta      write FcodCta;
    property codCcus     : String                                     read FcodCcus     write FcodCcus;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroA170>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroA170 }

constructor TJSSpedContribuicoesModelRegistroA170.create;
begin
  inherited;
  reg := 'A170';
end;

destructor TJSSpedContribuicoesModelRegistroA170.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroA170.getComparer: IComparer<TJSSpedContribuicoesModelRegistroA170>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroA170>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroA170): Integer
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
