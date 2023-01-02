unit JSSpedContribuicoes.Model.Registro1010;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1010 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc    : String;
    FidSecJud   : String;
    FdescDecJud : String;
    FidVara     : String;
    FdtSentJud  : TDateTime;
    FindNatAcao : String;

  public
    property numProc    : String     read FnumProc     write FnumProc;
    property idSecJud   : String     read FidSecJud    write FidSecJud;
    property idVara     : String     read FidVara      write FidVara;
    property indNatAcao : String     read FindNatAcao  write FindNatAcao;
    property descDecJud : String     read FdescDecJud  write FdescDecJud;
    property dtSentJud  : TDateTime  read FdtSentJud   write FdtSentJud;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1010>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1010 }

constructor TJSSpedContribuicoesModelRegistro1010.create;
begin
  inherited;
  reg := '1010';
end;

destructor TJSSpedContribuicoesModelRegistro1010.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1010.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1010>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1010>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1010): Integer
    begin
      if Left.numProc < Right.numProc then
        Result := -1
      else if Left.numProc > Right.numProc then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
