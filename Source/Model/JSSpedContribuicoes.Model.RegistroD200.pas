unit JSSpedContribuicoes.Model.RegistroD200;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroD200 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodMod      : String;
    FcodSit      : TJSSpedContribuicoesCodigoSituacaoDocumento;
    Fserie       : String;
    Fsubserie    : String;
    FnumDocIni   : String;
    FnumDocFin   : String;
    Fcfop        : String;
    FdtRef       : TDateTime;
    FvlDoc       : Currency;
    FvlDesc      : Currency;

  public
    property codMod      : String                                      read FcodMod      write FcodMod;
    property codSit      : TJSSpedContribuicoesCodigoSituacaoDocumento read FcodSit      write FcodSit;
    property serie       : String                                      read Fserie       write Fserie;
    property subserie    : String                                      read Fsubserie    write Fsubserie;
    property numDocIni   : String                                      read FnumDocIni   write FnumDocIni;
    property numDocFin   : String                                      read FnumDocFin   write FnumDocFin;
    property cfop        : String                                      read Fcfop        write Fcfop;
    property dtRef       : TDateTime                                   read FdtRef       write FdtRef;
    property vlDoc       : Currency                                    read FvlDoc       write FvlDoc;
    property vlDesc      : Currency                                    read FvlDesc      write FvlDesc;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroD200>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroD200 }

constructor TJSSpedContribuicoesModelRegistroD200.create;
begin
  inherited;
  reg := 'D200';
end;

destructor TJSSpedContribuicoesModelRegistroD200.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroD200.getComparer: IComparer<TJSSpedContribuicoesModelRegistroD200>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroD200>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroD200): Integer
    var LChave, RChave: string;
    begin
      LChave := FormatDateTime('yyyymmdd',Left.dtRef) + Left.serie;
      RChave := FormatDateTime('yyyymmdd',Right.dtRef) + Right.serie;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
