unit JSSpedContribuicoes.Model.RegistroC800;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC800 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodMod     : String;
    FcodSit     : TJSSpedContribuicoesCodigoSituacaoDocumento;
    FnumCfe     : Integer;
    FdtDoc      : TDateTime;
    FvlCfe      : Currency;
    FvlPis      : Currency;
    FvlCofins   : Currency;
    FcnpjCpf    : String;
    FnrSat      : String;
    FchvCfe     : String;
    FvlDesc     : Currency;
    FvlMerc     : Currency;
    FvlOutDa    : Currency;
    FvlIcms     : Currency;
    FvlPisSt    : Currency;
    FvlCofinsSt : Currency;

  public
    property codMod     : String                                      read FcodMod     write FcodMod;
    property codSit     : TJSSpedContribuicoesCodigoSituacaoDocumento read FcodSit     write FcodSit;
    property numCfe     : Integer                                     read FnumCfe     write FnumCfe;
    property dtDoc      : TDateTime                                   read FdtDoc      write FdtDoc;
    property vlCfe      : Currency                                    read FvlCfe      write FvlCfe;
    property vlPis      : Currency                                    read FvlPis      write FvlPis;
    property vlCofins   : Currency                                    read FvlCofins   write FvlCofins;
    property cnpjCpf    : String                                      read FcnpjCpf    write FcnpjCpf;
    property nrSat      : String                                      read FnrSat      write FnrSat;
    property chvCfe     : String                                      read FchvCfe     write FchvCfe;
    property vlDesc     : Currency                                    read FvlDesc     write FvlDesc;
    property vlMerc     : Currency                                    read FvlMerc     write FvlMerc;
    property vlOutDa    : Currency                                    read FvlOutDa    write FvlOutDa;
    property vlIcms     : Currency                                    read FvlIcms     write FvlIcms;
    property vlPisSt    : Currency                                    read FvlPisSt    write FvlPisSt;
    property vlCofinsSt : Currency                                    read FvlCofinsSt write FvlCofinsSt;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC800>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC800 }

constructor TJSSpedContribuicoesModelRegistroC800.create;
begin
  inherited;
  reg := 'C800';
end;

destructor TJSSpedContribuicoesModelRegistroC800.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC800.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC800>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC800>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC800): Integer
    var LChave, RChave: string;
    begin
      LChave := Formatdatetime('yyyymmdd',Left.dtDoc) +
                Left.FnrSat +
                Left.FnumCfe.ToString;

      RChave := Formatdatetime('yyyymmdd',Right.dtDoc) +
                Right.FnrSat +
                Right.FnumCfe.ToString;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
