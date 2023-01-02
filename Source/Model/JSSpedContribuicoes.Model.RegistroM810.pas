unit JSSpedContribuicoes.Model.RegistroM810;

interface

uses
  JSSpedContribuicoes.Model.Registro,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  System.Generics.Defaults,
  System.SysUtils;

type
  TJSSpedContribuicoesModelRegistroM810 = class(TJSSpedContribuicoesModelRegistro)
  private
    FnatRec    : String;
    FvlRec     : Currency;
    FcodCta    : String;
    FdescCompl : String;

  public
    property natRec    : String   read FnatRec    write FnatRec;
    property vlRec     : Currency read FvlRec     write FvlRec;
    property codCta    : String   read FcodCta    write FcodCta;
    property descCompl : String   read FdescCompl write FdescCompl;

    class function getComparer: IComparer<TJSSpedContribuicoesModelRegistroM810>;

    constructor create; override;
    destructor  Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesModelRegistroM810 }

constructor TJSSpedContribuicoesModelRegistroM810.create;
begin
  inherited;
  reg := 'M810';
end;

destructor TJSSpedContribuicoesModelRegistroM810.Destroy;
begin
  inherited;
end;

class function TJSSpedContribuicoesModelRegistroM810.getComparer: IComparer<TJSSpedContribuicoesModelRegistroM810>;
begin
  result := TComparer<TJSSpedContribuicoesModelRegistroM810>.Construct(
    function(const Left, Right: TJSSpedContribuicoesModelRegistroM810): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.GetValueStr('CSTCOFINS') + Left.natRec + Left.codCta;

      RChave := Right.GetValueStr('CSTCOFINS') + Right.natRec + Right.codCta;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
