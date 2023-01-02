unit JSSpedContribuicoes.Model.RegistroF525;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF525 = class(TJSSpedContribuicoesModelRegistro)
  private
    FvlRec     : Currency;
    FindRec    : String;
    FcnpjCpf   : String;
    FnumDoc    : String;
    FcodItem   : String;
    FvlRecDet  : Currency;
    FcstPis    : String;
    FcstCofins : String;
    FinfCompl  : String;
    FcodCta    : String;

  public
    property vlRec     : Currency read FvlRec     write FvlRec;
    property indRec    : String   read FindRec    write FindRec;
    property cnpjCpf   : String   read FcnpjCpf   write FcnpjCpf;
    property numDoc    : String   read FnumDoc    write FnumDoc;
    property codItem   : String   read FcodItem   write FcodItem;
    property vlRecDet  : Currency read FvlRecDet  write FvlRecDet;
    property cstPis    : String   read FcstPis    write FcstPis;
    property cstCofins : String   read FcstCofins write FcstCofins;
    property infCompl  : String   read FinfCompl  write FinfCompl;
    property codCta    : String   read FcodCta    write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF525>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF525 }

constructor TJSSpedContribuicoesModelRegistroF525.create;
begin
  inherited;
  reg := 'F525';
end;

destructor TJSSpedContribuicoesModelRegistroF525.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF525.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF525>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF525>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF525): Integer
    begin
      if Left.numDoc < Right.numDoc then
        Result := -1
      else if Left.numDoc > Right.numDoc then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
