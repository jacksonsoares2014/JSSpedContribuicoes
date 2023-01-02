unit JSSpedContribuicoes.Service.Bloco0;

interface

uses
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.Service.Counter,
  JSSpedContribuicoes.Service.Status,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.DAO.Interfaces,
  JSSpedContribuicoes.Export.Interfaces,
  System.Threading,
  System.Generics.Collections,
  System.Generics.Defaults,
  System.SysUtils,
  System.Classes;

type
  TJSSpedContribuicoesServiceBloco0 = class(TInterfacedObject, IJSSpedContribuicoesServiceBloco0)
  private
    [Weak]
    FSpedContribuicoesService: IJSSpedContribuicoesService;

    FStatus     : IJSSpedContribuicoesServiceStatus;
    FacadeExport: IJSSpedContribuicoesExportFacade;
    FArquivo    : TStrings;
    FCodPart    : TList<TRecCodigoPorEst>;
    FUnid       : TList<TRecCodigoPorEst>;
    FCodItem    : TList<TRecCodigoPorEst>;
    FCodInf     : TList<TRecCodigoPorEst>;
    FCodConta   : TList<string>;

    reg0111     : TJSSpedContribuicoesModelRegistro0111;
    reg0900     : TJSSpedContribuicoesModelRegistro0900;

    procedure AcumulaReceitaBruta0111(ArecBruNcumTribMi, ArecBruNcumNtMi, ArecBruNcumExp, ArecBruCum: Currency);
    procedure AcumulaReceitaBruta0900(ABloco: String; ArecTotalBloco: Currency);
    procedure AcumulaReceitaBrutaA170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaC170(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaC175(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaC181(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaC381(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaC481(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaC491(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaC810(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaC870(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaD201(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaF100(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaF200(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaF500(AModel: TJSSpedContribuicoesModelRegistro);
    procedure AcumulaReceitaBrutaF550(AModel: TJSSpedContribuicoesModelRegistro);

    procedure gerar0000;
    procedure gerar0035;
    procedure gerar0100;
    procedure gerar0110;
    procedure gerar0111;
    procedure gerar0120;
    procedure gerar0140;
    procedure gerar0145(AReg0140: TJSSpedContribuicoesModelRegistro0140);
    procedure gerar0150(AReg0140: TJSSpedContribuicoesModelRegistro0140);
    procedure gerar0190(AReg0140: TJSSpedContribuicoesModelRegistro0140; _0190List: TStrings);
    procedure gerar0200(AReg0140: TJSSpedContribuicoesModelRegistro0140; _0200List: TStrings);
    procedure gerar0450(AReg0140: TJSSpedContribuicoesModelRegistro0140);
    procedure gerar0500;
    procedure gerar0900;

    function validateInstance<T: TJSSpedContribuicoesModelRegistro, constructor>(AModel: TJSSpedContribuicoesModelRegistro): Boolean;

    procedure OnAddRegistro(Registro: TJSSpedContribuicoesModelRegistro);
    procedure OnLogErro(ALogErro: String);

    function AchouCodigoPorEst(AcodEst, Acodigo: String; ALista: TList<TRecCodigoPorEst>): boolean;
    procedure AdicionaLinhaSped(ARegistro: TJSSpedContribuicoesModelRegistro; AArquivo: TStrings);
    procedure addSped(AReg: TStrings);

  protected
    function Execute: TStrings;

    function AddCodPart         (AcodEst, Acodigo: String)                 : IJSSpedContribuicoesServiceBloco0;
    function AddUnid            (AcodEst, Acodigo: String)                 : IJSSpedContribuicoesServiceBloco0;
    function AddCodItem         (AcodEst, Acodigo: String)                 : IJSSpedContribuicoesServiceBloco0;
    function AddCodInf          (AcodEst, Acodigo: String)                 : IJSSpedContribuicoesServiceBloco0;
    function AddCodConta        (Value : String)                           : IJSSpedContribuicoesServiceBloco0;
    function AcumulaReceitaBruta(AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBloco0;

    function ReceitaBruta : TJSSpedContribuicoesModelRegistro0111;

    function &End: IJSSpedContribuicoesService;

  public
    constructor create(Parent: IJSSpedContribuicoesService);
    class function New(Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBloco0;
    destructor Destroy; override;
end;

implementation

{ TJSSpedContribuicoesServiceBloco0 }

function TJSSpedContribuicoesServiceBloco0.AchouCodigoPorEst(AcodEst, Acodigo: String;
  ALista: TList<TRecCodigoPorEst>): boolean;
var i: Integer;
begin
  Result := False;
  for i := 0 to Pred(ALista.Count) do
    if (AcodEst = ALista[i].codEst) and (Acodigo = ALista[i].codigo) then
      Exit(True);
end;

function TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBruta(
  AModel: TJSSpedContribuicoesModelRegistro): IJSSpedContribuicoesServiceBloco0;
begin
  result  := Self;
  AcumulaReceitaBrutaA170(AModel);
  AcumulaReceitaBrutaC170(AModel);
  AcumulaReceitaBrutaC175(AModel);
  AcumulaReceitaBrutaC181(AModel);
  AcumulaReceitaBrutaC381(AModel);
  AcumulaReceitaBrutaC481(AModel);
  AcumulaReceitaBrutaC491(AModel);
  AcumulaReceitaBrutaC810(AModel);
  AcumulaReceitaBrutaC870(AModel);
  AcumulaReceitaBrutaD201(AModel);
  AcumulaReceitaBrutaF100(AModel);
  AcumulaReceitaBrutaF200(AModel);
  AcumulaReceitaBrutaF500(AModel);
  AcumulaReceitaBrutaF550(AModel);
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBruta0111(
  ArecBruNcumTribMi, ArecBruNcumNtMi, ArecBruNcumExp, ArecBruCum: Currency);
begin
  if not Assigned(reg0111) then
    reg0111 := TJSSpedContribuicoesModelRegistro0111.create;

  reg0111.recBruNcumTribMi := reg0111.recBruNcumTribMi + ArecBruNcumTribMi;
  reg0111.recBruNcumNtMi   := reg0111.recBruNcumNtMi   + ArecBruNcumNtMi;
  reg0111.recBruNcumExp    := reg0111.recBruNcumExp    + ArecBruNcumExp;
  reg0111.recBruCum        := reg0111.recBruCum        + ArecBruCum;
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBruta0900(
  ABloco: String; ArecTotalBloco: Currency);
begin
  if not FSpedContribuicoesService.Config.Gerar0900 then
    Exit;

  if not Assigned(reg0900) then
    reg0900 := TJSSpedContribuicoesModelRegistro0900.create;

  if ABloco = 'A' then
    reg0900.recTotalBlocoA := reg0900.recTotalBlocoA + ArecTotalBloco;

  if ABloco = 'C' then
    reg0900.recTotalBlocoC := reg0900.recTotalBlocoC + ArecTotalBloco;

  if ABloco = 'D' then
    reg0900.recTotalBlocoD := reg0900.recTotalBlocoD + ArecTotalBloco;

  if ABloco = 'F' then
    reg0900.recTotalBlocoF := reg0900.recTotalBlocoF + ArecTotalBloco;
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaA170(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroA170>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroA170(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroA170(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroA170(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroA170(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('A', TJSSpedContribuicoesModelRegistroA170(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroA170(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroA170(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroA170(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaC170(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC170>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroC170(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroC170(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroC170(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroC170(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('C', TJSSpedContribuicoesModelRegistroC170(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroC170(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroC170(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroC170(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaC175(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC175>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroC175(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroC175(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroC175(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroC175(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('C', TJSSpedContribuicoesModelRegistroC175(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroC175(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroC175(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroC175(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaC181(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC181>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroC181(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroC181(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroC181(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroC181(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('C', TJSSpedContribuicoesModelRegistroC181(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroC181(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroC181(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroC181(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaC381(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC381>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroC381(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroC381(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroC381(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroC381(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('C', TJSSpedContribuicoesModelRegistroC381(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroC381(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroC381(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroC381(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaC481(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC481>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroC481(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroC481(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroC481(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroC481(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('C', TJSSpedContribuicoesModelRegistroC481(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroC481(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroC481(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroC481(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaC491(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC491>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroC491(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroC491(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroC491(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroC491(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('C', TJSSpedContribuicoesModelRegistroC491(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroC491(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroC491(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroC491(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaC810(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC810>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroC810(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroC810(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroC810(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroC810(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaC870(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroC870>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroC870(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroC870(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroC870(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroC870(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('C', TJSSpedContribuicoesModelRegistroC870(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroC870(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroC870(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroC870(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaD201(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroD201>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroD201(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroD201(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroD201(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroD201(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('D', TJSSpedContribuicoesModelRegistroD201(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroD201(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroD201(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroD201(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaF100(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF100>(AModel) then
    Exit;

  AcumulaReceitaBruta0111(TJSSpedContribuicoesModelRegistroF100(AModel).GetValueDouble('RECBRUNCUMTRIBMI'),
                          TJSSpedContribuicoesModelRegistroF100(AModel).GetValueDouble('RECBRUNCUMNTMI'),
                          TJSSpedContribuicoesModelRegistroF100(AModel).GetValueDouble('RECBRUNCUMEXP'),
                          TJSSpedContribuicoesModelRegistroF100(AModel).GetValueDouble('RECBRUCUM'));

  AcumulaReceitaBruta0900('F', TJSSpedContribuicoesModelRegistroF100(AModel).GetValueDouble('RECBRUNCUMTRIBMI') +
                               TJSSpedContribuicoesModelRegistroF100(AModel).GetValueDouble('RECBRUNCUMNTMI')   +
                               TJSSpedContribuicoesModelRegistroF100(AModel).GetValueDouble('RECBRUNCUMEXP')    +
                               TJSSpedContribuicoesModelRegistroF100(AModel).GetValueDouble('RECBRUCUM'));
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaF200(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF200>(AModel) then
    Exit;

  AcumulaReceitaBruta0900('F', TJSSpedContribuicoesModelRegistroF200(AModel).vlTotRec);
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaF500(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF500>(AModel) then
    Exit;

  AcumulaReceitaBruta0900('F', TJSSpedContribuicoesModelRegistroF500(AModel).vlRecCaixa);
end;

procedure TJSSpedContribuicoesServiceBloco0.AcumulaReceitaBrutaF550(
  AModel: TJSSpedContribuicoesModelRegistro);
begin
  if not validateInstance<TJSSpedContribuicoesModelRegistroF550>(AModel) then
    Exit;

  AcumulaReceitaBruta0900('F', TJSSpedContribuicoesModelRegistroF550(AModel).vlRecComp);
end;

function TJSSpedContribuicoesServiceBloco0.AddCodConta(
  Value: String): IJSSpedContribuicoesServiceBloco0;
begin
  result := Self;
  if not Assigned(FCodConta) then
    FCodConta := TList<string>.Create;

  if not Value.IsEmpty and not FCodConta.Contains(Value) then
    FCodConta.Add(Value);
end;

function TJSSpedContribuicoesServiceBloco0.AddCodInf(
  AcodEst, Acodigo: String): IJSSpedContribuicoesServiceBloco0;
begin
  result := Self;
  if not Assigned(FCodInf) then
    FCodInf := TList<TRecCodigoPorEst>.Create;

  if not AcodEst.IsEmpty and not Acodigo.IsEmpty then
  begin
    if not AchouCodigoPorEst(AcodEst, Acodigo, FCodInf) then
      FCodInf.Add(TRecCodigoPorEst.create(AcodEst,Acodigo));
  end;
end;

function TJSSpedContribuicoesServiceBloco0.AddCodItem(
  AcodEst, Acodigo: String): IJSSpedContribuicoesServiceBloco0;
begin
  result := Self;
  if not Assigned(FCodItem) then
    FCodItem := TList<TRecCodigoPorEst>.Create;

  if not AcodEst.IsEmpty and not Acodigo.IsEmpty then
  begin
    if not AchouCodigoPorEst(AcodEst, Acodigo, FCodItem) then
      FCodItem.Add(TRecCodigoPorEst.create(AcodEst, Acodigo));
  end;
end;

function TJSSpedContribuicoesServiceBloco0.AddCodPart(
  AcodEst, Acodigo: String): IJSSpedContribuicoesServiceBloco0;
begin
  result := Self;
  if not Assigned(FCodPart) then
    FCodPart := TList<TRecCodigoPorEst>.Create;

  if not AcodEst.IsEmpty and not Acodigo.IsEmpty then
  begin
    if not AchouCodigoPorEst(AcodEst, Acodigo, FCodPart) then
      FCodPart.Add(TRecCodigoPorEst.create(AcodEst, Acodigo));
  end;
end;

function TJSSpedContribuicoesServiceBloco0.AddUnid(
  AcodEst, Acodigo: String): IJSSpedContribuicoesServiceBloco0;
begin
  result := Self;
  if not Assigned(FUnid) then
    FUnid := TList<TRecCodigoPorEst>.Create;

  if not AcodEst.IsEmpty and not Acodigo.IsEmpty then
  begin
    if not AchouCodigoPorEst(AcodEst, Acodigo, FUnid) then
      FUnid.Add(TRecCodigoPorEst.create(AcodEst, Acodigo));
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.AdicionaLinhaSped(
  ARegistro: TJSSpedContribuicoesModelRegistro; AArquivo: TStrings);
var
  linhaSped: string;
begin
  linhaSped := FacadeExport.linhaSped(ARegistro);
  AArquivo.Add(linhaSped);
  Counter.AddCounter(ARegistro);
  OnAddRegistro(ARegistro);
end;

constructor TJSSpedContribuicoesServiceBloco0.create(
  Parent: IJSSpedContribuicoesService);
begin
  FSpedContribuicoesService := Parent;
  FArquivo                  := TStringList.Create;

  FStatus      := TJSSpedContribuicoesServiceStatus.New(Self.FSpedContribuicoesService).Bloco('0');
  FacadeExport := JSSpedContribuicoes.Export.Interfaces
                    .FacadeExport(FSpedContribuicoesService.Emitente, FSpedContribuicoesService.Config);
end;

destructor TJSSpedContribuicoesServiceBloco0.Destroy;
begin
  FCodPart.Free;
  FCodInf.Free;
  FUnid.Free;
  FCodConta.Free;
  FCodItem.Free;

  if Assigned(reg0111) then
    reg0111.Free;

  if Assigned(reg0900) then
    reg0900.Free;

  if Assigned(FArquivo) then
    FArquivo.Free;

  inherited;
end;

function TJSSpedContribuicoesServiceBloco0.&End: IJSSpedContribuicoesService;
begin
  result := FSpedContribuicoesService;
end;

procedure TJSSpedContribuicoesServiceBloco0.addSped(AReg: TStrings);
var
  i : Integer;
begin
  for i := 0 to Pred(AReg.Count) do
    FArquivo.Add(AReg[i]);
end;

function TJSSpedContribuicoesServiceBloco0.Execute: TStrings;
var
  reg0001: TJSSpedContribuicoesModelRegistro0001;
  reg0990: TJSSpedContribuicoesModelRegistro0990;
begin
  try
    reg0001 := TJSSpedContribuicoesModelRegistro0001.create;
    reg0990 := TJSSpedContribuicoesModelRegistro0990.create;

    try
      gerar0000;
      AdicionaLinhaSped(reg0001,FArquivo);

      gerar0035;
      gerar0100;
      gerar0110;
      gerar0111;
      gerar0120;
      gerar0140;
      gerar0500;
      gerar0900;

      reg0990.qtdLin0 := reg0990.qtdlin0 + FArquivo.Count;
      AdicionaLinhaSped(reg0990,FArquivo);

      result := FArquivo;
    finally
      reg0001.Free;
      reg0990.Free;
    end;
  except
    on e: Exception Do
    begin
      FArquivo.Free;
      OnLogErro('Houve erro na geração do blooo 0: ' + e.Message);
      Raise;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0000;
var
  reg0000 : TJSSpedContribuicoesModelRegistro0000;
begin
  reg0000 := FSpedContribuicoesService.DAO.Bloco0.DAO0000.load;
  try
    reg0000.codVer         := FSpedContribuicoesService.Config.Versao;
    reg0000.tipoEscrit     := FSpedContribuicoesService.Config.TipoEscrituracao;
    reg0000.indSitEsp      := FSpedContribuicoesService.Config.SituacaoEspecial;
    reg0000.numRecAnterior := FSpedContribuicoesService.Config.NumRecAnterior;
    reg0000.dtIni          := FSpedContribuicoesService.Config.DataInicial;
    reg0000.dtFin          := FSpedContribuicoesService.Config.DataFinal;
    reg0000.suframa        := FSpedContribuicoesService.Config.Suframa;
    reg0000.indNatPj       := FSpedContribuicoesService.Config.NaturezaPJ;
    reg0000.indAtiv        := FSpedContribuicoesService.Config.TipoAtividade;

    AdicionaLinhaSped(reg0000, FArquivo);
  finally
    reg0000.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0035;
var
  i       : Integer;
  _0035   : TObjectList<TJSSpedContribuicoesModelRegistro0035>;
  reg0035 : TJSSpedContribuicoesModelRegistro0035;
begin
  if not (FSpedContribuicoesService.Config.NaturezaPJ in [inPessoaJuridicaParticipante,
                                                          inSociedadeCooperativaParticipante,
                                                          inSociedadeContaDeParticipacao]) then
    Exit;


  _0035 := FSpedContribuicoesService.DAO.Bloco0.DAO0035.list;
  try
    for i := 0 to Pred(_0035.Count) do
    begin
      reg0035 := _0035[i];
      AdicionaLinhaSped(reg0035, FArquivo);
    end;
  finally
    _0035.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0100;
var
  i       : Integer;
  _0100   : TObjectList<TJSSpedContribuicoesModelRegistro0100>;
  reg0100 : TJSSpedContribuicoesModelRegistro0100;
begin
  _0100 := FSpedContribuicoesService.DAO.Bloco0.DAO0100.list;
  try
    for i := 0 to Pred(_0100.Count) do
    begin
      reg0100 := _0100[i];
      AdicionaLinhaSped(reg0100, FArquivo);
    end;
  finally
    _0100.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0110;
var
  reg0110: TJSSpedContribuicoesModelRegistro0110;
begin
  reg0110 := TJSSpedContribuicoesModelRegistro0110.create;
  try
    reg0110.codIncTrib  := FSpedContribuicoesService.Config.IncidenciaTributaria;
    reg0110.indAproCred := FSpedContribuicoesService.Config.MetodoApropriacao;
    reg0110.codTipoCont := FSpedContribuicoesService.Config.TipoContribuicao;
    reg0110.indRegCum   := FSpedContribuicoesService.Config.CriterioEscrituracao;

    AdicionaLinhaSped(reg0110, FArquivo);
  finally
    reg0110.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0111;
begin
  if not (FSpedContribuicoesService.Config.MetodoApropriacao = imaRateioProporcional) then
    Exit;

  if not Assigned(reg0111) then
    reg0111 := TJSSpedContribuicoesModelRegistro0111.create;

  if not FSpedContribuicoesService.Config.EmpresaInativa then
  begin
    reg0111.recBruNcumTribMi := reg0111.recBruNcumTribMi -
                                FSpedContribuicoesService.Config.DescontoRecBruNCumTrib -
                                FSpedContribuicoesService.Config.EstornoRecBruNCumTrib;

    reg0111.recBruNcumNtMi   := reg0111.recBruNcumNtMi -
                                FSpedContribuicoesService.Config.DescontoRecBruNCumNTrib -
                                FSpedContribuicoesService.Config.EstornoRecBruNCumNTrib;

    reg0111.recBruCum        := reg0111.recBruCum -
                                FSpedContribuicoesService.Config.DescontoRecBruCumTrib  -
                                FSpedContribuicoesService.Config.DescontoRecBruCumNTrib -
                                FSpedContribuicoesService.Config.EstornoRecBruCumTrib   -
                                FSpedContribuicoesService.Config.EstornoRecBruCumNTrib;

    reg0111.recBruNcumExp    := reg0111.recBruNcumExp                                  -
                                FSpedContribuicoesService.Config.DescontoRecBruNCumExp -
                                FSpedContribuicoesService.Config.EstornoRecBruNCumExp;

    reg0111.recBruTotal := reg0111.recBruNcumTribMi +
                           reg0111.recBruNcumNtMi   +
                           reg0111.recBruNcumExp    +
                           reg0111.recBruCum;
  end;

  AdicionaLinhaSped(reg0111, FArquivo);
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0120;
var
  reg0120: TJSSpedContribuicoesModelRegistro0120;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa and not FSpedContribuicoesService.Config.InformacaoCompl0120.IsEmpty then
  begin
    reg0120 := TJSSpedContribuicoesModelRegistro0120.create;
    try
      reg0120.mesRefer := FormatDateTime('mmyyyy',FSpedContribuicoesService.Config.DataInicial);
      reg0120.infComp  := FSpedContribuicoesService.Config.InformacaoCompl0120;

      AdicionaLinhaSped(reg0120, FArquivo);
    finally
      reg0120.Free;
    end;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0140;
var
  reg0140: TJSSpedContribuicoesModelRegistro0140;
  dao      : IJSSpedContribuicoesDAO0140;
  i        : Integer;
  _0140    : TObjectList<TJSSpedContribuicoesModelRegistro0140>;
  _0190    : TStrings;
  _0200    : TStrings;
begin
  dao := FSpedContribuicoesService.DAO.Bloco0.DAO0140;
  if not Assigned(dao) then
    Exit;

  _0140 := dao.list;
  _0190 := TStringList.Create;
  _0200 := TStringList.Create;
  try
    for i := 0 to Pred(_0140.Count) do
    begin
      reg0140 := _0140[i];
      AdicionaLinhaSped(reg0140, FArquivo);

      if FSpedContribuicoesService.Config.GerarBlocoP then
        gerar0145(reg0140);

      gerar0150(reg0140);


      //O 0200 tem que vir antes do 0190 pois possui unidades
      //que serão incluídas na lista FUnid do 0190.
      gerar0200(reg0140, _0200);
      gerar0190(reg0140, _0190);

      addSped(_0190);
      addSped(_0200);

      _0190.Clear;
      _0200.Clear;

      gerar0450(reg0140);
    end;
  finally
    _0140.Free;
    _0190.Free;
    _0200.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0145(AReg0140: TJSSpedContribuicoesModelRegistro0140);
var
  reg0145  : TJSSpedContribuicoesModelRegistro0145;
begin
  if FSpedContribuicoesService.Config.EmpresaInativa then
    Exit;

  if not FSpedContribuicoesService.Config.GerarBlocoP then
    Exit;

  reg0145 := FSpedContribuicoesService.DAO.Bloco0.DAO0145.load(AReg0140, FSpedContribuicoesService.Config.DataInicial);
  if not Assigned(reg0145) then
    Exit;

  AdicionaLinhaSped(reg0145, FArquivo);
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0150(AReg0140: TJSSpedContribuicoesModelRegistro0140);
var
  reg0150  : TJSSpedContribuicoesModelRegistro0150;
  dao      : IJSSpedContribuicoesDAO0150;
  i        : Integer;
  _0150    : TObjectList<TJSSpedContribuicoesModelRegistro0150>;
begin
  dao := FSpedContribuicoesService.DAO.Bloco0.DAO0150;
  if not Assigned(dao) or not Assigned(FCodPart) then
    Exit;

  FStatus
    .Registro('0150')
    .Aguarde(True)
    .ShowStatus;

  _0150 := dao.load(AReg0140, FCodPart);
  try
    FStatus
      .Aguarde(False)
      .TotalRegistros(_0150.Count);

    for i := 0 to Pred(_0150.Count) do
    begin
      FStatus.RegistroAtual(i + 1)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      reg0150 := _0150[i];
      AdicionaLinhaSped(reg0150, FArquivo);
    end;
  finally
    _0150.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0190(AReg0140: TJSSpedContribuicoesModelRegistro0140;
  _0190List: TStrings);
var
  reg0190  : TJSSpedContribuicoesModelRegistro0190;
  dao      : IJSSpedContribuicoesDAO0190;
  i        : Integer;
  _0190    : TObjectList<TJSSpedContribuicoesModelRegistro0190>;
begin
  dao := FSpedContribuicoesService.DAO.Bloco0.DAO0190;
  if not Assigned(dao) or not Assigned(FUnid) then
    Exit;

  FStatus
    .Registro('0190')
    .Aguarde(True)
    .ShowStatus;

  _0190 := dao.load(AReg0140, FUnid);
  try
    FStatus
      .Aguarde(False)
      .TotalRegistros(_0190.Count);

    for i := 0 to Pred(_0190.Count) do
    begin
      FStatus.RegistroAtual(i + 1)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      reg0190 := _0190[i];
      AdicionaLinhaSped(reg0190, _0190List);
    end;
  finally
    _0190.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0200(AReg0140: TJSSpedContribuicoesModelRegistro0140;
 _0200List: TStrings);
var
  reg0200  : TJSSpedContribuicoesModelRegistro0200;
  dao      : IJSSpedContribuicoesDAO0200;
  i        : Integer;
  _0200    : TObjectList<TJSSpedContribuicoesModelRegistro0200>;
begin
  dao := FSpedContribuicoesService.DAO.Bloco0.DAO0200;
  if not Assigned(dao) or not Assigned(FCodItem) then
    Exit;

  FStatus
    .Registro('0200')
    .Aguarde(True)
    .ShowStatus;

  _0200 := dao.load(AReg0140, FCodItem);
  try
    FStatus
      .Aguarde(False)
      .TotalRegistros(_0200.Count);

    for i := 0 to Pred(_0200.Count) do
    begin
      FStatus.RegistroAtual(i + 1)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      reg0200 := _0200[i];
      AdicionaLinhaSped(reg0200, _0200List);
      AddUnid(AReg0140.codEst, reg0200.unidInv);
    end;
  finally
    _0200.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0450(AReg0140: TJSSpedContribuicoesModelRegistro0140);
var
  reg0450  : TJSSpedContribuicoesModelRegistro0450;
  dao      : IJSSpedContribuicoesDAO0450;
  i        : Integer;
  _0450    : TObjectList<TJSSpedContribuicoesModelRegistro0450>;
begin
  dao := FSpedContribuicoesService.DAO.Bloco0.DAO0450;
  if not Assigned(dao) or not Assigned(FCodInf) then
    Exit;

  _0450 := dao.load(AReg0140, FCodInf);
  try
    FStatus
      .Registro('0450')
      .TotalRegistros(_0450.Count);

    for i := 0 to Pred(_0450.Count) do
    begin
      FStatus.RegistroAtual(i + 1)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      reg0450 := _0450[i];
      AdicionaLinhaSped(reg0450, FArquivo);
    end;
  finally
    _0450.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0500;
var
  reg0500  : TJSSpedContribuicoesModelRegistro0500;
  dao      : IJSSpedContribuicoesDAO0500;
  i        : Integer;
  _0500    : TObjectList<TJSSpedContribuicoesModelRegistro0500>;
begin
  dao := FSpedContribuicoesService.DAO.Bloco0.DAO0500;
  if not Assigned(dao) or not Assigned(FCodConta) then
    Exit;

  FStatus
    .Registro('0500')
    .Aguarde(True)
    .ShowStatus;

  _0500 := dao.load(FCodConta);
  try
    FStatus
      .Aguarde(False)
      .TotalRegistros(_0500.Count);

    for i := 0 to Pred(_0500.Count) do
    begin
      FStatus.RegistroAtual(i + 1)
             .RegistroFilho(EmptyStr)
             .ShowStatus;

      reg0500 := _0500[i];
      if (reg0500.dtAlt > FSpedContribuicoesService.Config.DataFinal) then
        reg0500.dtAlt := FSpedContribuicoesService.Config.DataFinal;

      AdicionaLinhaSped(reg0500, FArquivo);
    end;
  finally
    _0500.Free;
  end;
end;

procedure TJSSpedContribuicoesServiceBloco0.gerar0900;
begin
  if not FSpedContribuicoesService.Config.Gerar0900 then
    Exit;

  if not Assigned(reg0900) then
    reg0900 := TJSSpedContribuicoesModelRegistro0900.create;

  reg0900.recTotalPeriodo := reg0900.recTotalBlocoA +
                             reg0900.recTotalBlocoC +
                             reg0900.recTotalBlocoD +
                             reg0900.recTotalBlocoF +
                             reg0900.recTotalBlocoI +
                             reg0900.recTotalBloco1;

  reg0900.recTotalNrbPeriodo := reg0900.recNrbBlocoA +
                                reg0900.recNrbBlocoC +
                                reg0900.recNrbBlocoD +
                                reg0900.recNrbBlocoF +
                                reg0900.recNrbBlocoI +
                                reg0900.recNrbBloco1;

  AdicionaLinhaSped(reg0900, FArquivo);
end;

class function TJSSpedContribuicoesServiceBloco0.New(
  Parent: IJSSpedContribuicoesService): IJSSpedContribuicoesServiceBloco0;
begin
  Result := Self.create(Parent);
end;

procedure TJSSpedContribuicoesServiceBloco0.OnAddRegistro(
  Registro: TJSSpedContribuicoesModelRegistro);
var
  onAddRegistro: TOnSpedContribuicoesAddRegistro;
begin
  onAddRegistro := FSpedContribuicoesService.Config.OnAddRegistro;

  if Assigned(onAddRegistro) then
    onAddRegistro(Registro);
end;

procedure TJSSpedContribuicoesServiceBloco0.OnLogErro(ALogErro: String);
var
  onLogErro: TOnSpedContribuicoesLogErro;
begin
  onLogErro := FSpedContribuicoesService.Config.OnLogErro;

  if Assigned(onLogErro) then
    OnLogErro(ALogErro);
end;

function TJSSpedContribuicoesServiceBloco0.ReceitaBruta: TJSSpedContribuicoesModelRegistro0111;
begin
  if not Assigned(reg0111) then
    reg0111 := TJSSpedContribuicoesModelRegistro0111.create;

  Result := reg0111;
end;

function TJSSpedContribuicoesServiceBloco0.validateInstance<T>(
  AModel: TJSSpedContribuicoesModelRegistro): Boolean;
var
  model: T;
begin
  model := T.create;
  try
    Result := (AModel is T);
  finally
    model.free;
  end;
end;

end.
