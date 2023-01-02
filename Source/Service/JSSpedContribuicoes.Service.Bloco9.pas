unit JSSpedContribuicoes.Service.Bloco9;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Service.Counter,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  System.Generics.Collections,
  System.Math,
  System.SysUtils,
  System.Classes;

type
  TJSSpedContribuicoesServiceBloco9 = class(TInterfacedObject, IJSSpedContribuicoesServiceBloco9)
  private
    FSpedContribuicoesService : IJSSpedContribuicoesService;
    FArquivo      : TStrings;
  protected
    function Execute: TStrings;

    function &End: IJSSpedContribuicoesService;
  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBloco9;
    destructor Destroy; override;
  end;


implementation

{ TJSSpedContribuicoesServiceBloco9 }

constructor TJSSpedContribuicoesServiceBloco9.create(Parent: IJSSpedContribuicoesService);
begin
  FSpedContribuicoesService := Parent;
  FArquivo     := TStringList.Create;
end;

destructor TJSSpedContribuicoesServiceBloco9.Destroy;
begin
  if Assigned(FArquivo) then
    FArquivo.Free;

  inherited;
end;

function TJSSpedContribuicoesServiceBloco9.&End: IJSSpedContribuicoesService;
begin
  result := FSpedContribuicoesService;
end;

function TJSSpedContribuicoesServiceBloco9.Execute: TStrings;
var
  registros        : TArray<String>;
  reg              : string;
  indicador        : Integer;
  totalPorRegistro : Integer;
  totalSPED        : Integer;
  i                : Integer;
begin
  try
    totalSPED := 0;
    registros := Counter.GetCounter.Keys.ToArray;
    TArray.sort<String>(registros);

    indicador := IfThen(Counter.GetCounter.Count > 0, 0, 1);
    FArquivo.Add(Format( '|9001|%d|', [indicador]));
    Counter.AddCounter('9900');

    for i := 0 to Pred(Length(registros)) do
    begin
      reg              := registros[i];
      totalPorRegistro := Counter.GetCounter.Items[reg];
      totalSPED        := totalSPED + totalPorRegistro;

      FArquivo.Add(Format('|9900|%s|%d|', [registros[i], totalPorRegistro]));
      Counter.AddCounter('9900');
    end;

    FArquivo.Add('|9900|9001|1|');
    Counter.AddCounter('9900');
    FArquivo.Add(Format('|9900|9900|%d|',[Counter.GetCounter.Items['9900'] + 2]));
    Counter.AddCounter('9900');
    FArquivo.Add('|9900|9990|1|');
    Counter.AddCounter('9900');
    FArquivo.Add('|9900|9999|1|');
    Counter.AddCounter('9900');

    totalPorRegistro := Counter.GetCounter.Items['9900'] + 2;
    totalSPED        := totalSPED + totalPorRegistro;

    FArquivo.Add(Format( '|9990|%d|', [totalPorRegistro]));
    FArquivo.Add(Format( '|9999|%d|', [totalSPED]));

    result := FArquivo;
  except
    FArquivo.Free;
    raise;
  end;
end;

class function TJSSpedContribuicoesServiceBloco9.New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBloco9;
begin
  result := Self.create(Parent);
end;

end.
