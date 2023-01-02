unit JSSpedContribuicoes.Model.RegistroF200;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroF200 = class(TJSSpedContribuicoesModelRegistro)
  private
    FindOper      : TJSSpedContribuicoesIndicadorOperImob;
    FunidImob     : TJSSpedContribuicoesIndicadorUnidImob;
    FidentEmp     : String;
    FdescUnidImob : String;
    FnumCont      : String;
    FcpfCnpjAdqu  : String;
    FdtOper       : TDateTime;
    FvlTotVend    : Currency;
    FvlRecAcum    : Currency;
    FvlTotRec     : Currency;
    FcstPis       : String;
    FvlBcPis      : Currency;
    FaliqPis      : Double;
    FvlPis        : Currency;
    FvlBcCofins   : Currency;
    FcstCofins    : String;
    FvlCofins     : Currency;
    FaliqCofins   : Double;
    FpercRecReceb : Currency;
    FindNatEmp    : String;
    FinfComp      : String;

  public
    property indOper      : TJSSpedContribuicoesIndicadorOperImob read FindOper      write FindOper;
    property unidImob     : TJSSpedContribuicoesIndicadorUnidImob read FunidImob     write FunidImob;
    property identEmp     : String                                read FidentEmp     write FidentEmp;
    property descUnidImob : String                                read FdescUnidImob write FdescUnidImob;
    property numCont      : String                                read FnumCont      write FnumCont;
    property cpfCnpjAdqu  : String                                read FcpfCnpjAdqu  write FcpfCnpjAdqu;
    property dtOper       : TDateTime                             read FdtOper       write FdtOper;
    property vlTotVend    : Currency                              read FvlTotVend    write FvlTotVend;
    property vlRecAcum    : Currency                              read FvlRecAcum    write FvlRecAcum;
    property vlTotRec     : Currency                              read FvlTotRec     write FvlTotRec;
    property cstPis       : String                                read FcstPis       write FcstPis;
    property vlBcPis      : Currency                              read FvlBcPis      write FvlBcPis;
    property aliqPis      : Double                                read FaliqPis      write FaliqPis;
    property vlPis        : Currency                              read FvlPis        write FvlPis;
    property cstCofins    : String                                read FcstCofins    write FcstCofins;
    property vlBcCofins   : Currency                              read FvlBcCofins   write FvlBcCofins;
    property aliqCofins   : Double                                read FaliqCofins   write FaliqCofins;
    property vlCofins     : Currency                              read FvlCofins     write FvlCofins;
    property percRecReceb : Currency                              read FpercRecReceb write FpercRecReceb;
    property indNatEmp    : String                                read FindNatEmp    write FindNatEmp;
    property infComp      : String                                read FinfComp      write FinfComp;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroF200>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroF200 }

constructor TJSSpedContribuicoesModelRegistroF200.create;
begin
  inherited;
  reg := 'F200';
end;

destructor TJSSpedContribuicoesModelRegistroF200.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroF200.getComparer: IComparer<TJSSpedContribuicoesModelRegistroF200>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroF200>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroF200): Integer
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
