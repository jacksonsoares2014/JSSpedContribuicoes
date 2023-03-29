unit JSSpedContribuicoes.Reader.TXT.Base;

interface

uses
  JSSpedContribuicoes.Reader.Interfaces,
  JSSpedContribuicoes.Reader.TXT.Model,
  JSSpedContribuicoes.Model.Classes,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Format,
  JSSpedContribuicoes.Reader.TXT.Model.A100,
  JclStrings,
  System.SysUtils,
  System.Classes;

const
  cTamanhoRegistroInvalido    = 'O Tamanho do registro %s é inválido';

type
  TJSSCRTXTBase = class(TInterfacedObject, IJSSCRTXT)
  private
    procedure load0000(AValue: TStrings);
    procedure load0150(AValue: TStrings);
    procedure load0200(AValue: TStrings);
    procedure load0450(AValue: TStrings);
    procedure loadA100(AValue: TStrings);
    procedure loadA110(AValue: TStrings);
    procedure loadA170(AValue: TStrings);
    procedure loadF100(AValue: TStrings);

    procedure loadLinha(AValue: string);
  public
    FTXTModel: TJSSCRTXTModel;
    function LoadFromFile(AValue: string): TJSSCRTXTModel;

    constructor create;
    destructor  Destroy; override;
    class function New: IJSSCRTXT;
  end;

implementation

{ TJSSCRTXTBase }

constructor TJSSCRTXTBase.create;
begin

end;

destructor TJSSCRTXTBase.Destroy;
begin

  inherited;
end;

procedure TJSSCRTXTBase.load0000(AValue: TStrings);
begin
  if Pred(AValue.Count) < 14 then
    raise Exception.Create(Format(cTamanhoRegistroInvalido,['0000']));

  FTXTModel._0000.codVer := AValue.Strings[2];
  FTXTModel._0000.tipoEscrit.fromString(AValue.Strings[3]);
  FTXTModel._0000.indSitEsp.fromString(AValue.Strings[4]);
  FTXTModel._0000.numRecAnterior := AValue.Strings[5];
  FTXTModel._0000.dtIni    := JSSF.formatData(AValue.Strings[6]);
  FTXTModel._0000.dtFin    := JSSF.formatData(AValue.Strings[7]);
  FTXTModel._0000.nome     := AValue.Strings[8];
  FTXTModel._0000.cnpj     := AValue.Strings[9];
  FTXTModel._0000.uf       := AValue.Strings[0];
  FTXTModel._0000.codMun   := AValue.Strings[11];
  FTXTModel._0000.suframa  := AValue.Strings[12];
  FTXTModel._0000.indNatPj.fromString(AValue.Strings[13]);
  FTXTModel._0000.indAtiv.fromString(AValue.Strings[14]);

  FTXTModel.NumLinha := FTXTModel.NumLinha + 1;
end;

procedure TJSSCRTXTBase.load0150(AValue: TStrings);
begin
  if Pred(AValue.Count) < 13 then
    raise Exception.Create(Format(cTamanhoRegistroInvalido,['0150']));

  FTXTModel._0150.Add(TJSSpedContribuicoesModelRegistro0150.Create);
  FTXTModel._0150.Last.codPart  := AValue.Strings[2];
  FTXTModel._0150.Last.nome     := AValue.Strings[3];
  FTXTModel._0150.Last.codPais  := AValue.Strings[4];
  FTXTModel._0150.Last.cnpj     := AValue.Strings[5];
  FTXTModel._0150.Last.cpf      := AValue.Strings[6];
  FTXTModel._0150.Last.ie       := AValue.Strings[7];
  FTXTModel._0150.Last.codMun   := AValue.Strings[8];
  FTXTModel._0150.Last.suframa  := AValue.Strings[9];
  FTXTModel._0150.Last.endereco := AValue.Strings[10];
  FTXTModel._0150.Last.numero   := AValue.Strings[11];
  FTXTModel._0150.Last.compl    := AValue.Strings[12];
  FTXTModel._0150.Last.bairro   := AValue.Strings[13];

  FTXTModel.NumLinha := FTXTModel.NumLinha + 1;
end;

procedure TJSSCRTXTBase.load0200(AValue: TStrings);
begin
  if Pred(AValue.Count) < 12 then
    raise Exception.Create(Format(cTamanhoRegistroInvalido,['0200']));

  FTXTModel._0200.Add(TJSSpedContribuicoesModelRegistro0200.Create);
  FTXTModel._0200.Last.codItem    := AValue.Strings[2];
  FTXTModel._0200.Last.descrItem  := AValue.Strings[3];
  FTXTModel._0200.Last.codBarra   := AValue.Strings[4];
  FTXTModel._0200.Last.codAntItem := AValue.Strings[5];
  FTXTModel._0200.Last.unidInv    := AValue.Strings[6];
  FTXTModel._0200.Last.tipoItem.fromString(AValue.Strings[7]);
  FTXTModel._0200.Last.codNcm     := AValue.Strings[8];
  FTXTModel._0200.Last.exIpi      := AValue.Strings[9];
  FTXTModel._0200.Last.codGen     := AValue.Strings[10];
  FTXTModel._0200.Last.codLst     := AValue.Strings[11];
  FTXTModel._0200.Last.aliqIcms   := StrToCurrDef(AValue.Strings[12],0);

  FTXTModel.NumLinha := FTXTModel.NumLinha + 1;
end;

procedure TJSSCRTXTBase.load0450(AValue: TStrings);
begin
  if Pred(AValue.Count) < 3 then
    raise Exception.Create(Format(cTamanhoRegistroInvalido,['0450']));

  FTXTModel._0450.Add(TJSSpedContribuicoesModelRegistro0450.Create);
  FTXTModel._0450.Last.codInf := AValue.Strings[2];
  FTXTModel._0450.Last.txt    := AValue.Strings[3];

  FTXTModel.NumLinha := FTXTModel.NumLinha + 1;
end;

procedure TJSSCRTXTBase.loadA100(AValue: TStrings);
begin
  if Pred(AValue.Count) < 21 then
    raise Exception.Create(Format(cTamanhoRegistroInvalido,['A100']));

  FTXTModel._A100.Add(TJSSCRTXTModelA100.Create);
  FTXTModel._A100.Last.A100.indOper.fromString(AValue.Strings[2]);
  FTXTModel._A100.Last.A100.indEmit.fromString(AValue.Strings[3]);
  FTXTModel._A100.Last.A100.codPart     := AValue.Strings[4];
  FTXTModel._A100.Last.A100.codSit.fromString(AValue.Strings[5]);
  FTXTModel._A100.Last.A100.serie       := AValue.Strings[6];
  FTXTModel._A100.Last.A100.subserie    := AValue.Strings[7];
  FTXTModel._A100.Last.A100.numDoc      := AValue.Strings[8];
  FTXTModel._A100.Last.A100.chvNfse     := AValue.Strings[9];
  FTXTModel._A100.Last.A100.dtDoc       := JSSF.formatData(AValue.Strings[10]);
  FTXTModel._A100.Last.A100.dtExeServ   := JSSF.formatData(AValue.Strings[11]);
  FTXTModel._A100.Last.A100.vlDoc       := StrToCurrDef(AValue.Strings[12],0);
  FTXTModel._A100.Last.A100.indPgto.fromString(AValue.Strings[13]);
  FTXTModel._A100.Last.A100.vlDesc      := StrToCurrDef(AValue.Strings[14],0);
  FTXTModel._A100.Last.A100.vlBcPis     := StrToCurrDef(AValue.Strings[15],0);
  FTXTModel._A100.Last.A100.vlPis       := StrToCurrDef(AValue.Strings[16],0);
  FTXTModel._A100.Last.A100.vlBcCofins  := StrToCurrDef(AValue.Strings[17],0);
  FTXTModel._A100.Last.A100.vlCofins    := StrToCurrDef(AValue.Strings[18],0);
  FTXTModel._A100.Last.A100.vlPisRet    := StrToCurrDef(AValue.Strings[19],0);
  FTXTModel._A100.Last.A100.vlCofinsRet := StrToCurrDef(AValue.Strings[20],0);
  FTXTModel._A100.Last.A100.vlIss       := StrToCurrDef(AValue.Strings[21],0);

  FTXTModel.NumLinha := FTXTModel.NumLinha + 1;
end;

procedure TJSSCRTXTBase.loadA110(AValue: TStrings);
var
  LA110: TJSSpedContribuicoesModelRegistroA110;
begin
  if Pred(AValue.Count) < 3 then
    raise Exception.Create(Format(cTamanhoRegistroInvalido,['A110']));

  LA110 := TJSSpedContribuicoesModelRegistroA110.Create;
  LA110.codInf   := AValue.Strings[2];
  LA110.txtCompl := AValue.Strings[3];

  FTXTModel._A100.Last.ListA110.Add(LA110);
  FTXTModel.NumLinha := FTXTModel.NumLinha + 1;
end;

procedure TJSSCRTXTBase.loadA170(AValue: TStrings);
var
  LA170: TJSSpedContribuicoesModelRegistroA170;
begin
  if Pred(AValue.Count) < 18 then
    raise Exception.Create(Format(cTamanhoRegistroInvalido,['A170']));

  LA170 := TJSSpedContribuicoesModelRegistroA170.Create;
  LA170.numItem     := StrToInt(AValue.Strings[2]);
  LA170.codItem     := AValue.Strings[3];
  LA170.descrCompl  := AValue.Strings[4];
  LA170.vlItem      := StrToCurrDef(AValue.Strings[5],0);
  LA170.vlDesc      := StrToCurrDef(AValue.Strings[6],0);
  LA170.natBcCred   := AValue.Strings[7];
  LA170.indOrigCred.fromString(AValue.Strings[8]);
  LA170.cstPis      := AValue.Strings[9];
  LA170.vlBcPis     := StrToCurrDef(AValue.Strings[10],0);
  LA170.aliqPis     := StrToFloatDef(AValue.Strings[11],0);
  LA170.vlPis       := StrToCurrDef(AValue.Strings[12],0);
  LA170.cstCofins   := AValue.Strings[13];
  LA170.vlBcCofins  := StrToCurrDef(AValue.Strings[14],0);
  LA170.aliqCofins  := StrToFloatDef(AValue.Strings[15],0);
  LA170.vlCofins    := StrToCurrDef(AValue.Strings[16],0);
  LA170.codCta      := AValue.Strings[17];
  LA170.codCcus     := AValue.Strings[18];

  FTXTModel._A100.Last.ListA170.Add(LA170);
  FTXTModel.NumLinha := FTXTModel.NumLinha + 1;
end;

procedure TJSSCRTXTBase.loadF100(AValue: TStrings);
begin
  if Pred(AValue.Count) < 19 then
    raise Exception.Create(Format(cTamanhoRegistroInvalido,['F100']));

  FTXTModel._F100.Add(TJSSpedContribuicoesModelRegistroF100.Create);
  FTXTModel._F100.Last.indOper.fromString(AValue.Strings[2]);
  FTXTModel._F100.Last.codPart     := AValue.Strings[3];
  FTXTModel._F100.Last.codItem     := AValue.Strings[4];
  FTXTModel._F100.Last.dtOper      := JSSF.formatData(AValue.Strings[5]);
  FTXTModel._F100.Last.vlOper      := StrToCurrDef(AValue.Strings[6],0);
  FTXTModel._F100.Last.cstPis      := AValue.Strings[7];
  FTXTModel._F100.Last.vlBcPis     := StrToCurrDef(AValue.Strings[8],0);
  FTXTModel._F100.Last.aliqPis     := StrToFloatDef(AValue.Strings[9],0);
  FTXTModel._F100.Last.vlPis       := StrToCurrDef(AValue.Strings[10],0);
  FTXTModel._F100.Last.cstCofins   := AValue.Strings[11];
  FTXTModel._F100.Last.vlBcCofins  := StrToCurrDef(AValue.Strings[12],0);
  FTXTModel._F100.Last.aliqCofins  := StrToFloatDef(AValue.Strings[13],0);
  FTXTModel._F100.Last.vlCofins    := StrToCurrDef(AValue.Strings[14],0);
  FTXTModel._F100.Last.natBcCred   := AValue.Strings[15];
  FTXTModel._F100.Last.indOrigCred.fromString(AValue.Strings[16]);
  FTXTModel._F100.Last.codCta      := AValue.Strings[17];
  FTXTModel._F100.Last.codCcus     := AValue.Strings[18];
  FTXTModel._F100.Last.descDocOper := AValue.Strings[19];

  FTXTModel.NumLinha := FTXTModel.NumLinha + 1;
end;

function TJSSCRTXTBase.LoadFromFile(AValue: string): TJSSCRTXTModel;
var
  LArquivo : TextFile;
  Linha: string;
begin
  result := TJSSCRTXTModel.create;
  AssignFile(LArquivo, AValue);
  Reset(LArquivo);
  try
    try
      FTXTModel := Result;
      while not EOF(LArquivo) do
      begin
        Readln(LArquivo, Linha);
        loadLinha(Linha);
      end;
    except
      Result.Free;
      raise;
    end;
  finally
    CloseFile(LArquivo);
  end;
end;

procedure TJSSCRTXTBase.loadLinha(AValue: string);
var
  LRegistro: TStrings;
begin
  if AValue = '' then
    Exit;

  LRegistro := TStringList.Create;
  try
    StrToStrings(AValue, '|', LRegistro);
    if LRegistro[1] = '0000' then
      load0000(LRegistro);

    if LRegistro[1] = '0150' then
      load0150(LRegistro);

    if LRegistro[1] = '0200' then
      load0200(LRegistro);

    if LRegistro[1] = '0450' then
      load0450(LRegistro);

    if LRegistro[1] = 'A100' then
      loadA100(LRegistro);

    if LRegistro[1] = 'A110' then
      loadA110(LRegistro);

    if LRegistro[1] = 'A170' then
      loadA170(LRegistro);

     if LRegistro[1] = 'F100' then
      loadF100(LRegistro);
 finally
    LRegistro.Free;
  end;
end;


class function TJSSCRTXTBase.New: IJSSCRTXT;
begin
  result := Self.create;
end;

end.
