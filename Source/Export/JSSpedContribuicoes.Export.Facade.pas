unit JSSpedContribuicoes.Export.Facade;

interface

uses
  System.SysUtils,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Export.Interfaces,
  JSSpedContribuicoes.Export.Classes,
  System.Generics.Collections;

type TJSSpedContribuicoesExportFacade = class(TInterfacedObject, IJSSpedContribuicoesExportFacade)

  private
    [Weak]
    FEmitente: IJSSpedContribuicoesEmitente;

    [Weak]
    FConfig: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>;

    FExports: TDictionary<String, IJSSpedContribuicoesExport>;

    procedure createExports;
    procedure createExportsBloco0;
    procedure createExportsBloco1;
    procedure createExportsBlocoA;
    procedure createExportsBlocoC;
    procedure createExportsBlocoD;
    procedure createExportsBlocoF;
    procedure createExportsBlocoM;
    procedure createExportsBlocoP;

    function GetExport(AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesExport;
  protected
    function linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string;

  public
    constructor create(Emitente: IJSSpedContribuicoesEmitente; Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>);
    class function New(Emitente: IJSSpedContribuicoesEmitente; Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>): IJSSpedContribuicoesExportFacade;
    destructor Destroy; override;

end;

implementation

{ TJSSpedContribuicoesExportFacade }

constructor TJSSpedContribuicoesExportFacade.create(Emitente: IJSSpedContribuicoesEmitente;
  Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>);
begin
  FEmitente := Emitente;
  FConfig   := Config;

  createExports;
end;

procedure TJSSpedContribuicoesExportFacade.createExports;
begin
  FExports := TDictionary<String, IJSSpedContribuicoesExport>.Create;
  createExportsBloco0;
  createExportsBloco1;
  createExportsBlocoA;
  createExportsBlocoC;
  createExportsBlocoD;
  createExportsBlocoF;
  createExportsBlocoM;
  createExportsBlocoP;
end;

procedure TJSSpedContribuicoesExportFacade.createExportsBloco0;
begin
  FExports.Add('0000', TJSSpedContribuicoesExportRegistro0000.New(FEmitente, FConfig));
  FExports.Add('0001', TJSSpedContribuicoesExportRegistro0001.New(FEmitente, FConfig));
  FExports.Add('0035', TJSSpedContribuicoesExportRegistro0035.New(FEmitente, FConfig));
  FExports.Add('0100', TJSSpedContribuicoesExportRegistro0100.New(FEmitente, FConfig));
  FExports.Add('0110', TJSSpedContribuicoesExportRegistro0110.New(FEmitente, FConfig));
  FExports.Add('0111', TJSSpedContribuicoesExportRegistro0111.New(FEmitente, FConfig));
  FExports.Add('0120', TJSSpedContribuicoesExportRegistro0120.New(FEmitente, FConfig));
  FExports.Add('0140', TJSSpedContribuicoesExportRegistro0140.New(FEmitente, FConfig));
  FExports.Add('0145', TJSSpedContribuicoesExportRegistro0145.New(FEmitente, FConfig));
  FExports.Add('0150', TJSSpedContribuicoesExportRegistro0150.New(FEmitente, FConfig));
  FExports.Add('0190', TJSSpedContribuicoesExportRegistro0190.New(FEmitente, FConfig));
  FExports.Add('0200', TJSSpedContribuicoesExportRegistro0200.New(FEmitente, FConfig));
  FExports.Add('0450', TJSSpedContribuicoesExportRegistro0450.New(FEmitente, FConfig));
  FExports.Add('0500', TJSSpedContribuicoesExportRegistro0500.New(FEmitente, FConfig));
  FExports.Add('0600', TJSSpedContribuicoesExportRegistro0600.New(FEmitente, FConfig));
  FExports.Add('0900', TJSSpedContribuicoesExportRegistro0900.New(FEmitente, FConfig));
  FExports.Add('0990', TJSSpedContribuicoesExportRegistro0990.New(FEmitente, FConfig));
end;

procedure TJSSpedContribuicoesExportFacade.createExportsBloco1;
begin
  FExports.Add('1001', TJSSpedContribuicoesExportRegistro1001.New(FEmitente, FConfig));
  FExports.Add('1010', TJSSpedContribuicoesExportRegistro1010.New(FEmitente, FConfig));
  FExports.Add('1011', TJSSpedContribuicoesExportRegistro1011.New(FEmitente, FConfig));
  FExports.Add('1020', TJSSpedContribuicoesExportRegistro1020.New(FEmitente, FConfig));
  FExports.Add('1050', TJSSpedContribuicoesExportRegistro1050.New(FEmitente, FConfig));
  FExports.Add('1100', TJSSpedContribuicoesExportRegistro1100.New(FEmitente, FConfig));
  FExports.Add('1101', TJSSpedContribuicoesExportRegistro1101.New(FEmitente, FConfig));
  FExports.Add('1300', TJSSpedContribuicoesExportRegistro1300.New(FEmitente, FConfig));
  FExports.Add('1500', TJSSpedContribuicoesExportRegistro1500.New(FEmitente, FConfig));
  FExports.Add('1501', TJSSpedContribuicoesExportRegistro1501.New(FEmitente, FConfig));
  FExports.Add('1700', TJSSpedContribuicoesExportRegistro1700.New(FEmitente, FConfig));
  FExports.Add('1900', TJSSpedContribuicoesExportRegistro1900.New(FEmitente, FConfig));
  FExports.Add('1990', TJSSpedContribuicoesExportRegistro1990.New(FEmitente, FConfig));
end;

procedure TJSSpedContribuicoesExportFacade.createExportsBlocoA;
begin
  FExports.Add('A001', TJSSpedContribuicoesExportRegistroA001.New(FEmitente, FConfig));
  FExports.Add('A010', TJSSpedContribuicoesExportRegistroA010.New(FEmitente, FConfig));
  FExports.Add('A100', TJSSpedContribuicoesExportRegistroA100.New(FEmitente, FConfig));
  FExports.Add('A110', TJSSpedContribuicoesExportRegistroA110.New(FEmitente, FConfig));
  FExports.Add('A111', TJSSpedContribuicoesExportRegistroA111.New(FEmitente, FConfig));
  FExports.Add('A170', TJSSpedContribuicoesExportRegistroA170.New(FEmitente, FConfig));
  FExports.Add('A990', TJSSpedContribuicoesExportRegistroA990.New(FEmitente, FConfig));
end;

procedure TJSSpedContribuicoesExportFacade.createExportsBlocoC;
begin
  FExports.Add('C001', TJSSpedContribuicoesExportRegistroC001.New(FEmitente, FConfig));
  FExports.Add('C010', TJSSpedContribuicoesExportRegistroC010.New(FEmitente, FConfig));
  FExports.Add('C100', TJSSpedContribuicoesExportRegistroC100.New(FEmitente, FConfig));
  FExports.Add('C110', TJSSpedContribuicoesExportRegistroC110.New(FEmitente, FConfig));
  FExports.Add('C111', TJSSpedContribuicoesExportRegistroC111.New(FEmitente, FConfig));
  FExports.Add('C120', TJSSpedContribuicoesExportRegistroC120.New(FEmitente, FConfig));
  FExports.Add('C170', TJSSpedContribuicoesExportRegistroC170.New(FEmitente, FConfig));
  FExports.Add('C175', TJSSpedContribuicoesExportRegistroC175.New(FEmitente, FConfig));
  FExports.Add('C180', TJSSpedContribuicoesExportRegistroC180.New(FEmitente, FConfig));
  FExports.Add('C181', TJSSpedContribuicoesExportRegistroC181.New(FEmitente, FConfig));
  FExports.Add('C185', TJSSpedContribuicoesExportRegistroC185.New(FEmitente, FConfig));
  FExports.Add('C380', TJSSpedContribuicoesExportRegistroC380.New(FEmitente, FConfig));
  FExports.Add('C381', TJSSpedContribuicoesExportRegistroC381.New(FEmitente, FConfig));
  FExports.Add('C385', TJSSpedContribuicoesExportRegistroC385.New(FEmitente, FConfig));
  FExports.Add('C400', TJSSpedContribuicoesExportRegistroC400.New(FEmitente, FConfig));
  FExports.Add('C405', TJSSpedContribuicoesExportRegistroC405.New(FEmitente, FConfig));
  FExports.Add('C481', TJSSpedContribuicoesExportRegistroC481.New(FEmitente, FConfig));
  FExports.Add('C485', TJSSpedContribuicoesExportRegistroC485.New(FEmitente, FConfig));
  FExports.Add('C490', TJSSpedContribuicoesExportRegistroC490.New(FEmitente, FConfig));
  FExports.Add('C491', TJSSpedContribuicoesExportRegistroC491.New(FEmitente, FConfig));
  FExports.Add('C495', TJSSpedContribuicoesExportRegistroC495.New(FEmitente, FConfig));
  FExports.Add('C500', TJSSpedContribuicoesExportRegistroC500.New(FEmitente, FConfig));
  FExports.Add('C501', TJSSpedContribuicoesExportRegistroC501.New(FEmitente, FConfig));
  FExports.Add('C505', TJSSpedContribuicoesExportRegistroC505.New(FEmitente, FConfig));
  FExports.Add('C800', TJSSpedContribuicoesExportRegistroC800.New(FEmitente, FConfig));
  FExports.Add('C810', TJSSpedContribuicoesExportRegistroC810.New(FEmitente, FConfig));
  FExports.Add('C860', TJSSpedContribuicoesExportRegistroC860.New(FEmitente, FConfig));
  FExports.Add('C870', TJSSpedContribuicoesExportRegistroC870.New(FEmitente, FConfig));
  FExports.Add('C990', TJSSpedContribuicoesExportRegistroC990.New(FEmitente, FConfig));
end;

procedure TJSSpedContribuicoesExportFacade.createExportsBlocoD;
begin
  FExports.Add('D001', TJSSpedContribuicoesExportRegistroD001.New(FEmitente, FConfig));
  FExports.Add('D010', TJSSpedContribuicoesExportRegistroD010.New(FEmitente, FConfig));
  FExports.Add('D100', TJSSpedContribuicoesExportRegistroD100.New(FEmitente, FConfig));
  FExports.Add('D101', TJSSpedContribuicoesExportRegistroD101.New(FEmitente, FConfig));
  FExports.Add('D105', TJSSpedContribuicoesExportRegistroD105.New(FEmitente, FConfig));
  FExports.Add('D111', TJSSpedContribuicoesExportRegistroD111.New(FEmitente, FConfig));
  FExports.Add('D200', TJSSpedContribuicoesExportRegistroD200.New(FEmitente, FConfig));
  FExports.Add('D201', TJSSpedContribuicoesExportRegistroD201.New(FEmitente, FConfig));
  FExports.Add('D205', TJSSpedContribuicoesExportRegistroD205.New(FEmitente, FConfig));
  FExports.Add('D209', TJSSpedContribuicoesExportRegistroD209.New(FEmitente, FConfig));
  FExports.Add('D500', TJSSpedContribuicoesExportRegistroD500.New(FEmitente, FConfig));
  FExports.Add('D501', TJSSpedContribuicoesExportRegistroD501.New(FEmitente, FConfig));
  FExports.Add('D505', TJSSpedContribuicoesExportRegistroD505.New(FEmitente, FConfig));
  FExports.Add('D509', TJSSpedContribuicoesExportRegistroD509.New(FEmitente, FConfig));
  FExports.Add('D990', TJSSpedContribuicoesExportRegistroD990.New(FEmitente, FConfig));
end;

procedure TJSSpedContribuicoesExportFacade.createExportsBlocoF;
begin
  FExports.Add('F001', TJSSpedContribuicoesExportRegistroF001.New(FEmitente, FConfig));
  FExports.Add('F010', TJSSpedContribuicoesExportRegistroF010.New(FEmitente, FConfig));
  FExports.Add('F100', TJSSpedContribuicoesExportRegistroF100.New(FEmitente, FConfig));
  FExports.Add('F120', TJSSpedContribuicoesExportRegistroF120.New(FEmitente, FConfig));
  FExports.Add('F129', TJSSpedContribuicoesExportRegistroF129.New(FEmitente, FConfig));
  FExports.Add('F130', TJSSpedContribuicoesExportRegistroF130.New(FEmitente, FConfig));
  FExports.Add('F139', TJSSpedContribuicoesExportRegistroF139.New(FEmitente, FConfig));
  FExports.Add('F111', TJSSpedContribuicoesExportRegistroF111.New(FEmitente, FConfig));
  FExports.Add('F200', TJSSpedContribuicoesExportRegistroF200.New(FEmitente, FConfig));
  FExports.Add('F205', TJSSpedContribuicoesExportRegistroF205.New(FEmitente, FConfig));
  FExports.Add('F210', TJSSpedContribuicoesExportRegistroF210.New(FEmitente, FConfig));
  FExports.Add('F211', TJSSpedContribuicoesExportRegistroF211.New(FEmitente, FConfig));
  FExports.Add('F500', TJSSpedContribuicoesExportRegistroF500.New(FEmitente, FConfig));
  FExports.Add('F525', TJSSpedContribuicoesExportRegistroF525.New(FEmitente, FConfig));
  FExports.Add('F550', TJSSpedContribuicoesExportRegistroF550.New(FEmitente, FConfig));
  FExports.Add('F600', TJSSpedContribuicoesExportRegistroF600.New(FEmitente, FConfig));
  FExports.Add('F990', TJSSpedContribuicoesExportRegistroF990.New(FEmitente, FConfig));
end;

procedure TJSSpedContribuicoesExportFacade.createExportsBlocoM;
begin
  FExports.Add('M001', TJSSpedContribuicoesExportRegistroM001.New(FEmitente, FConfig));
  FExports.Add('M100', TJSSpedContribuicoesExportRegistroM100.New(FEmitente, FConfig));
  FExports.Add('M105', TJSSpedContribuicoesExportRegistroM105.New(FEmitente, FConfig));
  FExports.Add('M110', TJSSpedContribuicoesExportRegistroM110.New(FEmitente, FConfig));
  FExports.Add('M115', TJSSpedContribuicoesExportRegistroM115.New(FEmitente, FConfig));
  FExports.Add('M200', TJSSpedContribuicoesExportRegistroM200.New(FEmitente, FConfig));
  FExports.Add('M205', TJSSpedContribuicoesExportRegistroM205.New(FEmitente, FConfig));
  FExports.Add('M210', TJSSpedContribuicoesExportRegistroM210.New(FEmitente, FConfig));
  //FExports.Add('M215', TJSSpedContribuicoesExportRegistroM215.New(FEmitente, FConfig));
  FExports.Add('M220', TJSSpedContribuicoesExportRegistroM220.New(FEmitente, FConfig));
  FExports.Add('M225', TJSSpedContribuicoesExportRegistroM225.New(FEmitente, FConfig));
  FExports.Add('M350', TJSSpedContribuicoesExportRegistroM350.New(FEmitente, FConfig));
  FExports.Add('M400', TJSSpedContribuicoesExportRegistroM400.New(FEmitente, FConfig));
  FExports.Add('M410', TJSSpedContribuicoesExportRegistroM410.New(FEmitente, FConfig));
  FExports.Add('M500', TJSSpedContribuicoesExportRegistroM500.New(FEmitente, FConfig));
  FExports.Add('M505', TJSSpedContribuicoesExportRegistroM505.New(FEmitente, FConfig));
  FExports.Add('M510', TJSSpedContribuicoesExportRegistroM510.New(FEmitente, FConfig));
  FExports.Add('M515', TJSSpedContribuicoesExportRegistroM515.New(FEmitente, FConfig));
  FExports.Add('M600', TJSSpedContribuicoesExportRegistroM600.New(FEmitente, FConfig));
  FExports.Add('M605', TJSSpedContribuicoesExportRegistroM605.New(FEmitente, FConfig));
  FExports.Add('M610', TJSSpedContribuicoesExportRegistroM610.New(FEmitente, FConfig));
  //FExports.Add('M615', TJSSpedContribuicoesExportRegistroM615.New(FEmitente, FConfig));
  FExports.Add('M620', TJSSpedContribuicoesExportRegistroM620.New(FEmitente, FConfig));
  FExports.Add('M625', TJSSpedContribuicoesExportRegistroM625.New(FEmitente, FConfig));
  FExports.Add('M800', TJSSpedContribuicoesExportRegistroM800.New(FEmitente, FConfig));
  FExports.Add('M810', TJSSpedContribuicoesExportRegistroM810.New(FEmitente, FConfig));
  FExports.Add('M990', TJSSpedContribuicoesExportRegistroM990.New(FEmitente, FConfig));
end;

procedure TJSSpedContribuicoesExportFacade.createExportsBlocoP;
begin
  FExports.Add('P001', TJSSpedContribuicoesExportRegistroP001.New(FEmitente, FConfig));
  FExports.Add('P010', TJSSpedContribuicoesExportRegistroP010.New(FEmitente, FConfig));
  FExports.Add('P100', TJSSpedContribuicoesExportRegistroP100.New(FEmitente, FConfig));
  FExports.Add('P200', TJSSpedContribuicoesExportRegistroP200.New(FEmitente, FConfig));
  FExports.Add('P990', TJSSpedContribuicoesExportRegistroP990.New(FEmitente, FConfig));
end;

destructor TJSSpedContribuicoesExportFacade.Destroy;
begin
  FExports.Free;
  inherited;
end;

function TJSSpedContribuicoesExportFacade.GetExport(AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesExport;
begin
  if not FExports.TryGetValue(AModel.reg, Result) then
    result := nil;
end;

function TJSSpedContribuicoesExportFacade.linhaSped(AModel: TJSSpedContribuicoesModelRegistro): string;
var
  &Export: IJSSpedContribuicoesExport;
begin
  &Export := GetExport(AModel);

  if not Assigned(&Export) then
    raise ENotImplemented.CreateFmt('Not implemented Export for Reg %s', [AModel.reg]);

  result := &Export.linhaSped(AModel);
end;

class function TJSSpedContribuicoesExportFacade.New(Emitente: IJSSpedContribuicoesEmitente;
  Config: IJSSpedContribuicoesConfig<IJSSpedContribuicoesService>): IJSSpedContribuicoesExportFacade;
begin
  result := Self.create(Emitente, Config);
end;

end.
