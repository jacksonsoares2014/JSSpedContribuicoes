unit JSSpedContribuicoes.Model.Registro1900;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1900 = class(TJSSpedContribuicoesModelRegistro)
  private
    FinfCompl  : String;
    Fcnpj      : String;
    FcodCta    : String;
    Fsubserie  : String;
    FvlTotRec  : Currency;
    Fserie     : String;
    Fcfop      : String;
    FcstPis    : String;
    FcodSit    : String;
    FcodMod    : String;
    FcstCofins : String;
    FquantDoc  : Integer;

  public
    property cnpj        : String     read Fcnpj        write Fcnpj;
    property codMod      : String     read FcodMod      write FcodMod;
    property serie       : String     read Fserie       write Fserie;
    property subserie    : String     read Fsubserie    write Fsubserie;
    property codSit      : String     read FcodSit      write FcodSit;
    property vlTotRec    : Currency   read FvlTotRec    write FvlTotRec;
    property quantDoc    : Integer    read FquantDoc    write FquantDoc;
    property cstPis      : String     read FcstPis      write FcstPis;
    property cstCofins   : String     read FcstCofins   write FcstCofins;
    property cfop        : String     read Fcfop        write Fcfop;
    property infCompl    : String     read FinfCompl    write FinfCompl;
    property codCta      : String     read FcodCta      write FcodCta;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1900>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1900 }

constructor TJSSpedContribuicoesModelRegistro1900.create;
begin
  inherited;
  reg := '1900';
end;

destructor TJSSpedContribuicoesModelRegistro1900.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1900.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1900>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1900>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1900): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codMod + Left.serie + Left.subserie + Left.codSit + Left.cfop + Left.infCompl + Left.codCta;

      RChave := Right.codMod + Right.serie + Right.subserie + Right.codSit + Right.cfop + Right.infCompl + Right.codCta;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
