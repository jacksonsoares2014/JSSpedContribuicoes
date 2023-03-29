unit JSSpedContribuicoes.Reader.TXT.Model.A100;

interface

uses
  JSSpedContribuicoes.Model.Classes,
  System.Generics.Collections;

type
  TJSSCRTXTModelA100 = class
  private
    FListA110: TObjectList<TJSSpedContribuicoesModelRegistroA110>;
    FListA170: TObjectList<TJSSpedContribuicoesModelRegistroA170>;
    FA100: TJSSpedContribuicoesModelRegistroA100;
  public
    property A100: TJSSpedContribuicoesModelRegistroA100                  read FA100     write FA100;
    property ListA110: TObjectList<TJSSpedContribuicoesModelRegistroA110> read FListA110 write FListA110;
    property ListA170: TObjectList<TJSSpedContribuicoesModelRegistroA170> read FListA170 write FListA170;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TJSSCRTXTModelA100 }

constructor TJSSCRTXTModelA100.create;
begin
  FA100     := TJSSpedContribuicoesModelRegistroA100.Create;
  FListA110 := TObjectList<TJSSpedContribuicoesModelRegistroA110>.Create;
  FListA170 := TObjectList<TJSSpedContribuicoesModelRegistroA170>.Create;
end;

destructor TJSSCRTXTModelA100.Destroy;
begin
  FA100.Free;
  FListA110.Free;
  FListA170.Free;
  inherited;
end;


end.
