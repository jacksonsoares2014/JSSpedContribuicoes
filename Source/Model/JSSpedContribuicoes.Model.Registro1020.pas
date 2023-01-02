unit JSSpedContribuicoes.Model.Registro1020;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistro1020 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnumProc    : String;
    FindNatAcao : String;
    FdtDecAdm   : TDateTime;

  public
    property numProc    : String    read FnumProc    write FnumProc;
    property indNatAcao : String    read FindNatAcao write FindNatAcao;
    property dtDecAdm   : TDateTime read FdtDecAdm   write FdtDecAdm;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistro1020>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistro1020 }

constructor TJSSpedContribuicoesModelRegistro1020.create;
begin
  inherited;
  reg := '1020';
end;

destructor TJSSpedContribuicoesModelRegistro1020.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistro1020.getComparer: IComparer<TJSSpedContribuicoesModelRegistro1020>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistro1020>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistro1020): Integer
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
