unit JSSpedContribuicoes.Model.RegistroC500;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroC500 = class(TJSSpedContribuicoesModelRegistro)
  private
    FcodPart        : String;
    FcodMod         : String;
    FcodSit         : TJSSpedContribuicoesCodigoSituacaoDocumento;
    Fser            : String;
  	Fsub            : String;
    FnumDoc         : String;
    FdtDoc          : TDateTime;
    FdtEnt          : TDateTime;
    FvlDoc          : Currency;
    FvlIcms         : Currency;
    FcodInf         : String;
    FvlPis          : Currency;
    FvlCofins       : Currency;
    FchvDocE        : String;
  public
    property codPart   	   	: String                         read FcodPart  		  write FcodPart;
    property codMod    		  : String                         read FcodMod   		  write FcodMod;
    property codSit    		  : TJSSpedContribuicoesCodigoSituacaoDocumento read FcodSit   		  write FcodSit;
    property ser       		  : string                         read Fser      		  write Fser;
    property sub       		  : string                         read Fsub      		  write Fsub;
    property numDoc    		  : String                         read FnumDoc   		  write FnumDoc;
    property dtDoc     		  : TDateTime                      read FdtDoc    		  write FdtDoc;
    property dtEnt     		  : TDateTime                      read FdtEnt    		  write FdtEnt;
    property vlDoc     		  : Currency                       read FvlDoc    		  write FvlDoc;
    property vlIcms    		  : Currency                       read FvlIcms   		  write FvlIcms;
    property codInf    		  : String                         read FcodInf   		  write FcodInf;
    property vlPis     		  : Currency                       read FvlPis    		  write FvlPis;
    property vlCofins  		  : Currency                       read FvlCofins  	    write FvlCofins;
    property chvDocE        : String                         read FchvDocE        write FchvDocE;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroC500>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroC500 }

constructor TJSSpedContribuicoesModelRegistroC500.create;
begin
  inherited;
  reg := 'C500';
end;

destructor TJSSpedContribuicoesModelRegistroC500.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroC500.getComparer: IComparer<TJSSpedContribuicoesModelRegistroC500>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroC500>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroC500): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codPart +
                Left.codMod  +
                Left.codSit.toString  +
                Left.ser     +
                Left.numDoc;

      RChave := Right.codPart +
                Right.codMod  +
                Right.codSit.toString  +
                Right.ser     +
                Right.numDoc;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
