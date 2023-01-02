unit JSSpedContribuicoes.Model.RegistroC860;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC860 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodMod : String;
    FnrSat  : String;
    FdtDoc  : TDateTime;
    FdocIni : Integer;
    FdocFim : Integer;

  public
    property codMod : String    read FcodMod write FcodMod;
    property nrSat  : String    read FnrSat  write FnrSat;
    property dtDoc  : TDateTime read FdtDoc  write FdtDoc;
    property docIni : Integer   read FdocIni write FdocIni;
    property docFim : Integer   read FdocFim write FdocFim;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC860>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC860 }

constructor TJSSpedContribuicoesModelRegistroC860.create;
begin
  inherited;
  reg := 'C860';
end;

destructor TJSSpedContribuicoesModelRegistroC860.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC860.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC860>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC860>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC860): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.FnrSat +
                Formatdatetime('yyyymmdd',Left.dtDoc);

      RChave := Right.nrSat +
                Formatdatetime('yyyymmdd',Right.dtDoc);

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
