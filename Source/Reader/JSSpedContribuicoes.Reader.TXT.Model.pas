unit JSSpedContribuicoes.Reader.TXT.Model;

interface

uses
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Reader.TXT.Model.A100,
  System.Generics.Collections;

type
  TJSSCRTXTModel = class
  private
    F_A100: TObjectList<TJSSCRTXTModelA100>;
    F_0200: TObjectList<TJSSpedContribuicoesModelRegistro0200>;
    F_0000: TJSSpedContribuicoesModelRegistro0000;
    F_0150: TObjectList<TJSSpedContribuicoesModelRegistro0150>;
    FNumLinha: Integer;
    F_0450: TObjectList<TJSSpedContribuicoesModelRegistro0450>;
    F_F100: TObjectList<TJSSpedContribuicoesModelRegistroF100>;
  public
    property NumLinha: Integer                                         read FNumLinha write FNumLinha;
    property _0000: TJSSpedContribuicoesModelRegistro0000              read F_0000    write F_0000;
    property _0450: TObjectList<TJSSpedContribuicoesModelRegistro0450> read F_0450    write F_0450;
    property _0150: TObjectList<TJSSpedContribuicoesModelRegistro0150> read F_0150    write F_0150;
    property _0200: TObjectList<TJSSpedContribuicoesModelRegistro0200> read F_0200    write F_0200;
    property _A100: TObjectList<TJSSCRTXTModelA100>                    read F_A100    write F_A100;
    property _F100: TObjectList<TJSSpedContribuicoesModelRegistroF100> read F_F100    write F_F100;

    constructor create;
    destructor  Destroy; override;
  end;

implementation

{ TJSSCRTXTModel }

constructor TJSSCRTXTModel.create;
begin
  FNumLinha := 0;
  F_0000    := TJSSpedContribuicoesModelRegistro0000.Create;
  F_0150    := TObjectList<TJSSpedContribuicoesModelRegistro0150>.Create;
  F_0450    := TObjectList<TJSSpedContribuicoesModelRegistro0450>.Create;
  F_0200    := TObjectList<TJSSpedContribuicoesModelRegistro0200>.Create;
  F_A100    := TObjectList<TJSSCRTXTModelA100>.Create;
  F_F100    := TObjectList<TJSSpedContribuicoesModelRegistroF100>.Create;
end;

destructor TJSSCRTXTModel.Destroy;
begin
  F_0000.Free;
  F_0450.Free;
  F_0150.Free;
  F_0200.Free;
  F_A100.Free;
  F_F100.Free;
  inherited;
end;

end.
