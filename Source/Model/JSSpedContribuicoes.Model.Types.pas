unit JSSpedContribuicoes.Model.Types;

interface

type
  TRecCodigoPorEst = record
  private
    FcodEst  : String;
    Fcodigo  : String;
  public
    constructor create(AcodEst: String; Acodigo: String);
    property codEst  : String read FcodEst write FcodEst;
    property codigo  : String read Fcodigo write Fcodigo;
  end;

  TJSSpedContribuicoesCodigoSituacaoDocumento = (csRegular,
                                    csRegularExtemporaneo,
                                    csCancelado,
                                    csCanceladoExtemporaneo,
                                    csDenegado,
                                    csInutilizado,
                                    csComplementar,
                                    csComplementarExtemporaneo,
                                    csRegimeEspecial);

  TJSSpedContribuicoesDocumentoImportacao = (diDeclaracaoDeImportacao, diDeclaracaoSimplificada, diDeclaracaoUnica);

  TJSSpedContribuicoesIndicadorAtividade = (iaIndustrial,
                                            iaPrestadorServicos,
                                            iaAtividadeComercio,
                                            iaPessoasJuridicas,
                                            iaAtividadeImobiliaria,
                                            iaOutros);

  TJSSpedContribuicoesIndicadorBemImob = (ibiEdificacoesBenfeitoriaaProp,
                                          ibiEdificacoesBenfeitoriaaTerc,
                                          ibiInstalacoes,
                                          ibiMaquinas,
                                          ibiEquipamentos,
                                          ibiVeiculos,
                                          ibiOutros);

  TJSSpedContribuicoesIndicadorCriterioEscrituracao = (iceRegimeCaixa,
                                                       iceRegimeCompetenciaConsolidada,
                                                       iceRegimeCompetenciaAnalitica,
                                                       iceNull);

  TJSSpedContribuicoesIndicadorDaConta = (icSintetica, icAnalitica);

  TJSSpedContribuicoesIndicadorEmitente = (iePropria, ieTerceiros);

  TJSSpedContribuicoesIndicadorEscrituracao = (ieApuracaoConsolidada, ieApuracaoIndividualizada);

  TJSSpedContribuicoesIndicadorFrete = (tfContratacaoRemetente,
                         tfContratacaoDestinatario,
                         tfContratacaoTerceiros,
                         tfSemTransporte);

  TJSSpedContribuicoesIndicadorNaturezaFrete = (infOnusEstabelecimento,
                         infOnusAdquirente,
                         infComprasComCredito,
                         infComprasSemCredito,
                         infTransfProdAcabados,
                         infTransfProdEmElaboracao,
                         infOutras);

  TJSSpedContribuicoesIndicadorIncidenciaTributaria = (iitRegimeNaoCumulativo,
                                                       iitRegimeCumulativo,
                                                       iitRegimeNaoCumulativoECumulativo);

  TJSSpedContribuicoesIndicadorIncidenciaTributariaPrev = (iitReceitaBruta,
                                                           iitReceitaBrutaERemuneracoes);

  TJSSpedContribuicoesIndicadorMetodoApropriacao = (imaDireta, imaRateioProporcional);

  TJSSpedContribuicoesIndicadorMovimentacao = (imSim, imNao);

  TJSSpedContribuicoesIndicadorMovimento = (imComDadosInformados, imSemDadosInformados);

  TJSSpedContribuicoesIndicadorOperImob = (ioiVendaVistaUnidadeConcluida,
                                           ioiVendaPrazoUnidadeConcluida,
                                           ioiVendaVistaUnidadeConstrucao,
                                           ioiVendaPrazoUnidadeConstrucao,
                                           ioiOutras);

  TJSSpedContribuicoesIndicadorUnidImob = (iuiTerrenoAdquiridoVenda,
                                           iuiTerrenoDecorrenteLoteamento,
                                           iuiLoteDesmembramentoTerreno,
                                           iuiUnidadeIncorporacaoImob,
                                           iuiPredioConstruidoVenda,
                                           iuiOutras);

  TJSSpedContribuicoesIndicadorNaturezaPJ = (inPessoaJuridicaNaoParticipante,
                                             inSociedadeCooperativaNaoParticipante,
                                             inPessoaJuridicaParticipante,
                                             inSociedadeCooperativaParticipante,
                                             inSociedadeContaDeParticipacao);

  TJSSpedContribuicoesIndicadorOrigemCredito = (iocMercadoInterno, iocMercadoExterno, iocNull);

  TJSSpedContribuicoesIndicadorPagamento = (ipAVista, ipAPrazo, ipOutros, ipSemPagamento);

  TJSSpedContribuicoesIndicadorSituacaoEspecial = (iseAbertura,
                                                   iseCisao,
                                                   iseFusao,
                                                   iseIncorporacao,
                                                   iesEncerramento);

  TJSSpedContribuicoesIndicadorTipoContribuicao = (itcAliquotaBasica,
                                                   itcAliquotaEspecifica);

  TJSSpedContribuicoesIndicadorUtilBemImob = (iubVenda, iubPrestacaoServico, iubLocacao, iubOutros);

  TJSSpedContribuicoesNaturezaDaConta = (ncContasDeAtivo,
                          ncContasDePassivo,
                          ncPatrimonioLiquido,
                          ncContasDeResultado,
                          ncContasDeCompensacao,
                          ncOutras);

  TJSSpedContribuicoesOrigemProcesso = (opJusticaFederal, opSecretariaRF, opOutros);

  TJSSpedContribuicoesTipoAjuste = (taAjuReducao, taAjuAcrescimo);

  TJSSpedContribuicoesTipoEnquadramento = (teReal, tePresumido, teSimples, teNull);

  TJSSpedContribuicoesTipoEscrituracao = (teOriginal, teRetificadora);

  TJSSpedContribuicoesTipoOperacao = (toEntrada, toSaida);

  TJSSpedContribuicoesTipoOperacaoF100 = (tofAquisicaoPisCofins, tofReceitaPisCofins, tofReceitaSemPisCofins);

  TJSSpedContribuicoesTipoOperacaoServico = (tosAquisicao, tosPrestacao);


  TJSSpedContribuicoesTipoItem = (tiMercadoriaRevenda,
                   tiMateriaPrima,
                   tiEmbalagem,
                   tiProdutoEmProcesso,
                   tiProdutoAcabado,
                   tiSubproduto,
                   tiProdutoIntermediario,
                   tiMaterialUsoConsumo,
                   tiAtivoImobilizado,
                   tiServicos,
                   tiOutrosInsumos,
                   tiOutras);

  TJSSpedContribuicoesVersaoPVA = (VersaoPva208, VersaoPva209, VersaoPva210);

  TJSSpedContribuicoesCodigoSituacaoDocumentoHelper = record helper for TJSSpedContribuicoesCodigoSituacaoDocumento
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesDocumentoImportacaoHelper = record helper for TJSSpedContribuicoesDocumentoImportacao
    public
      function toString: string;
      procedure fromString(s: String);
  end;

  TJSSpedContribuicoesIndicadorAtividadeHelper = record helper for TJSSpedContribuicoesIndicadorAtividade
    public
      function toString: string;
  end;

  TJSSpedContribuicoesIndicadorBemImobHelper = record helper for TJSSpedContribuicoesIndicadorBemImob
    public
      function toString: string;
      procedure fromString(s: String);
  end;

  TJSSpedContribuicoesIndicadorCriterioEscrituracaoHelper = record helper for TJSSpedContribuicoesIndicadorCriterioEscrituracao
    public
      procedure fromString(s: string);
      function toString: string;
      function Caption: string;
  end;

  TJSSpedContribuicoesIndicadorUnidImobHelper = record helper for TJSSpedContribuicoesIndicadorUnidImob
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesIndicadorOperImobHelper = record helper for TJSSpedContribuicoesIndicadorOperImob
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesIndicadorNaturezaFreteHelper = record helper for TJSSpedContribuicoesIndicadorNaturezaFrete
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesIndicadorDaContaHelper = record helper for TJSSpedContribuicoesIndicadorDaConta
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesIndicadorEscrituracaoHelper = record helper for TJSSpedContribuicoesIndicadorEscrituracao
    public
      function toString: string;
  end;

  TJSSpedContribuicoesIndicadorFreteHelper = record helper for TJSSpedContribuicoesIndicadorFrete
    public
      function toString: string;
      procedure fromString(s: String);
  end;

  TJSSpedContribuicoesIndicadorIncidenciaTributariaHelper = record helper for TJSSpedContribuicoesIndicadorIncidenciaTributaria
    public
      function toString: string;
  end;

  TJSSpedContribuicoesIndicadorIncidenciaTributariaPrevHelper = record helper for TJSSpedContribuicoesIndicadorIncidenciaTributariaPrev
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesIndicadorMetodoApropriacaoHelper = record helper for TJSSpedContribuicoesIndicadorMetodoApropriacao
    public
      function toString: string;
  end;

  TJSSpedContribuicoesIndicadorOrigemCreditoHelper = record helper for TJSSpedContribuicoesIndicadorOrigemCredito
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesIndicadorPagamentoHelper = record helper for TJSSpedContribuicoesIndicadorPagamento
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesIndicadorTipoContribuicaoHelper = record helper for TJSSpedContribuicoesIndicadorTipoContribuicao
    public
      function toString: string;
  end;

  TJSSpedContribuicoesIndicadorEmitenteHelper = record helper for TJSSpedContribuicoesIndicadorEmitente
    public
      function toString: string;
  end;

  TJSSpedContribuicoesIndicadorNaturezaPJHelper = record helper for TJSSpedContribuicoesIndicadorNaturezaPJ
    public
      function toString: string;
  end;

  TJSSpedContribuicoesIndicadorSituacaoEspecialHelper = record helper for TJSSpedContribuicoesIndicadorSituacaoEspecial
    public
      function toString: string;
  end;

  TJSSpedContribuicoesIndicadorUtilBemImobHelper = record helper for TJSSpedContribuicoesIndicadorUtilBemImob
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesNaturezaDaContaHelper = record helper for TJSSpedContribuicoesNaturezaDaConta
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesOrigemProcessoHelper = record helper for TJSSpedContribuicoesOrigemProcesso
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesTipoEnquadramentoHelper = record helper for TJSSpedContribuicoesTipoEnquadramento
    public
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesTipoAjusteHelper = record helper for TJSSpedContribuicoesTipoAjuste
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesTipoItemHelper = record helper for TJSSpedContribuicoesTipoItem
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesTipoOperacaoHelper = record helper for TJSSpedContribuicoesTipoOperacao
    public
      function toString: string;
      function Caption: string;
  end;

  TJSSpedContribuicoesTipoOperacaoF100Helper = record helper for TJSSpedContribuicoesTipoOperacaoF100
    public
      function toString: string;
      procedure fromString(s: string);
  end;

  TJSSpedContribuicoesTipoOperacaoServicoHelper = record helper for TJSSpedContribuicoesTipoOperacaoServico
    public
      function toString: string;
      function Caption: string;
  end;


implementation

uses
  System.SysUtils;

var
  aStrTipoItem         : array of string = ['00','01','02','03','04','05','06','07','08','09','10','99'];
  aStrCodigoSituacao   : array of string = ['00','01','02','03','04','05','06','07','08'];
  aStrIndicadorBemImob : array of string = ['01','02','03','04','05','06','99'];
  aStrIndicadorUnidImob: array of string = ['01','02','03','04','05','06'];
  aStrIndicadorOperImob: array of string = ['01','02','03','04','05'];
  aStrNaturezaConta    : array of string = ['01','02','03','04','05','09'];
  aStrNaturezaFrete    : array of string = ['0','1','2','3','4','5','9'];
  aStrTipoFrete        : array of string = ['0','1','2','9'];
  aStrIndicadorPagto   : array of string = ['0','1','2','9'];
  aStrOrigemProcesso   : array of string = ['1','3','9'];
  aStrTipoOperacaoF100 : array of string = ['0','1','2'];


{ TJSSpedContribuicoesIndicadorPagamentoHelper }

procedure TJSSpedContribuicoesIndicadorPagamentoHelper.fromString(s: string);
var i: Integer;
begin
  Self := ipSemPagamento;
  for i := Low(aStrIndicadorPagto) to high(aStrIndicadorPagto) do
    if AnsiSameText(s, aStrIndicadorPagto[i]) then
      Self := TJSSpedContribuicoesIndicadorPagamento(i);
end;

function TJSSpedContribuicoesIndicadorPagamentoHelper.toString: string;
begin
  case Self of
    ipAVista       : result := '0';
    ipAPrazo       : result := '1';
    ipOutros       : result := '2';
    ipSemPagamento : result := '9';
  end;
end;

{ TJSSpedContribuicoesIndicadorFreteHelper }

procedure TJSSpedContribuicoesIndicadorFreteHelper.fromString(s: String);
var
  i: Integer;
begin
  Self := tfSemTransporte;
  for i := Low(aStrTipoFrete) to high(aStrTipoFrete) do
    if AnsiSameText(s, aStrTipoFrete[i]) then
      Self := TJSSpedContribuicoesIndicadorFrete(i);
end;

function TJSSpedContribuicoesIndicadorFreteHelper.toString: string;
begin
  case self of
    tfContratacaoRemetente           : Result := '0';
    tfContratacaoDestinatario        : Result := '1';
    tfContratacaoTerceiros           : Result := '2';
    tfSemTransporte                  : Result := '9';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesCodigoSituacaoDocumentoHelper }

procedure TJSSpedContribuicoesCodigoSituacaoDocumentoHelper.fromString(
  s: string);
var i: Integer;
begin
  Self := csRegular;
  for i := Low(aStrCodigoSituacao) to high(aStrCodigoSituacao) do
    if AnsiSameText(s, aStrCodigoSituacao[i]) then
      Self := TJSSpedContribuicoesCodigoSituacaoDocumento(i);
end;

function TJSSpedContribuicoesCodigoSituacaoDocumentoHelper.toString: string;
begin
  Result := aStrCodigoSituacao[Integer(Self)];
end;

{ TJSSpedContribuicoesIndicadorEmitenteHelper }

function TJSSpedContribuicoesIndicadorEmitenteHelper.toString: string;
begin
  case Self of
    iePropria   : result := '0';
    ieTerceiros : result := '1';
  end;
end;

{ TJSSpedContribuicoesOrigemProcessoHelper }

procedure TJSSpedContribuicoesOrigemProcessoHelper.fromString(s: string);
var i: Integer;
begin
  for i := Low(aStrOrigemProcesso) to high(aStrOrigemProcesso) do
    if AnsiSameText(s, aStrOrigemProcesso[i]) then
      Self := TJSSpedContribuicoesOrigemProcesso(i);
end;

function TJSSpedContribuicoesOrigemProcessoHelper.toString: string;
begin
  case Self of
    opJusticaFederal  : result := '1';
    opSecretariaRF    : result := '3';
    opOutros          : result := '9';
  else
    result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorUtilBemImobHelper }

procedure TJSSpedContribuicoesIndicadorUtilBemImobHelper.fromString(s: string);
begin
  if (s = '1') then
    Self := iubVenda
  else if (s = '2') then
    Self := iubPrestacaoServico
  else if (s = '3') then
    Self := iubLocacao
  else
    Self := iubOutros;
end;

function TJSSpedContribuicoesIndicadorUtilBemImobHelper.toString: string;
begin
  case Self of
    iubVenda            : result := '1';
    iubPrestacaoServico : result := '2';
    iubLocacao          : result := '3';
    iubOutros           : result := '9';
  else
    result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesTipoOperacaoHelper }

function TJSSpedContribuicoesTipoOperacaoHelper.Caption: string;
begin
  case Self of
    toEntrada : Result := 'Entrada';
    toSaida   : Result := 'Saída';
  end;
end;

function TJSSpedContribuicoesTipoOperacaoHelper.toString: string;
begin
  case Self of
    toEntrada : Result := '0';
    toSaida   : Result := '1';
  end;
end;

{ TJSSpedContribuicoesTipoOperacaoF100Helper }

procedure TJSSpedContribuicoesTipoOperacaoF100Helper.fromString(s: string);
var
  i: Integer;
begin
  for i := Low(aStrTipoOperacaoF100) to high(aStrTipoOperacaoF100) do
    if AnsiSameText(s, aStrTipoOperacaoF100[i]) then
      Self := TJSSpedContribuicoesTipoOperacaoF100(i);
end;

function TJSSpedContribuicoesTipoOperacaoF100Helper.toString: string;
begin
  case Self of
    tofAquisicaoPisCofins  : Result := '0';
    tofReceitaPisCofins    : Result := '1';
    tofReceitaSemPisCofins : Result := '2';
  end;
end;

{ TJSSpedContribuicoesTipoOperacaoServicoHelper }

function TJSSpedContribuicoesTipoOperacaoServicoHelper.Caption: string;
begin
  case self of
    tosAquisicao  : Result := 'Serviço Tomado';
    tosPrestacao  : Result := 'Serviço Prestado';
  end;
end;

function TJSSpedContribuicoesTipoOperacaoServicoHelper.toString: string;
begin
  case Self of
    tosAquisicao : Result := '0';
    tosPrestacao : Result := '1';
  end;
end;

{ TJSSpedContribuicoesIndicadorSituacaoEspecialHelper }

function TJSSpedContribuicoesIndicadorSituacaoEspecialHelper.toString: string;
begin
  case Self of
    iseAbertura      : result := '0';
    iseCisao         : result := '1';
    iseFusao         : result := '2';
    iseIncorporacao  : result := '3';
    iesEncerramento  : result := '4';
  else
    result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorAtividadeHelper }

function TJSSpedContribuicoesIndicadorAtividadeHelper.toString: string;
begin
  case self of
    iaIndustrial           : Result := '0';
    iaPrestadorServicos    : Result := '1';
    iaAtividadeComercio    : Result := '2';
    iaPessoasJuridicas     : Result := '3';
    iaAtividadeImobiliaria : Result := '4';
    iaOutros               : Result := '9';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorNaturezaPJHelper }

function TJSSpedContribuicoesIndicadorNaturezaPJHelper.toString: string;
begin
  case Self of
    inPessoaJuridicaNaoParticipante       : result := '00';
    inSociedadeCooperativaNaoParticipante : result := '01';
    inPessoaJuridicaParticipante          : result := '03';
    inSociedadeCooperativaParticipante    : result := '04';
    inSociedadeContaDeParticipacao        : result := '05';
  else
    result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesTipoItemHelper }

procedure TJSSpedContribuicoesTipoItemHelper.fromString(s: string);
var
  i: Integer;
begin
  Self := tiMercadoriaRevenda;
  for i := Low(aStrTipoItem) to high(aStrTipoItem) do
    if AnsiSameText(s, aStrTipoItem[i]) then
      Self := TJSSpedContribuicoesTipoItem(i);
end;

function TJSSpedContribuicoesTipoItemHelper.toString: string;
begin
  Result := aStrTipoItem[Integer(Self)];
end;

{ TJSSpedContribuicoesIndicadorTipoContribuicaoHelper }

function TJSSpedContribuicoesIndicadorTipoContribuicaoHelper.toString: string;
begin
  case Self of
    itcAliquotaBasica      : Result := '1';
    itcAliquotaEspecifica  : Result := '2';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorMetodoApropriacaoHelper }

function TJSSpedContribuicoesIndicadorMetodoApropriacaoHelper.toString: string;
begin
  case Self of
    imaDireta              : Result := '1';
    imaRateioProporcional  : Result := '2';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorIncidenciaTributariaHelper }

function TJSSpedContribuicoesIndicadorIncidenciaTributariaHelper.toString: string;
begin
  case Self of
    iitRegimeNaoCumulativo            : Result := '1';
    iitRegimeCumulativo               : Result := '2';
    iitRegimeNaoCumulativoECumulativo : Result := '3';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorCriterioEscrituracaoHelper }

function TJSSpedContribuicoesIndicadorCriterioEscrituracaoHelper.Caption: string;
begin
  case self of
    iceRegimeCaixa                  : Result := 'Regime de Caixa';
    iceRegimeCompetenciaConsolidada : Result := 'Regime de Competência Consolidada';
    iceRegimeCompetenciaAnalitica   : Result := 'Regime de Competência';
  else
    Result := 'Nenhum';
  end;
end;

procedure TJSSpedContribuicoesIndicadorCriterioEscrituracaoHelper.fromString(
  s: string);
begin
  if s = 'P' then
    Self := iceRegimeCompetenciaConsolidada
  else if s = 'A' then
    Self := iceRegimeCompetenciaAnalitica
  else if s = 'C' then
    Self := iceRegimeCaixa
  else
    Self := iceNull;
end;

function TJSSpedContribuicoesIndicadorCriterioEscrituracaoHelper.toString: string;
begin
  case self of
    iceRegimeCaixa                  : Result := '1';
    iceRegimeCompetenciaConsolidada : Result := '2';
    iceRegimeCompetenciaAnalitica   : Result := '9';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorIncidenciaTributariaPrevHelper }

procedure TJSSpedContribuicoesIndicadorIncidenciaTributariaPrevHelper.fromString(
  s: string);
begin
  if (s = '1') or s.IsEmpty then
    Self := iitReceitaBruta
  else
    Self := iitReceitaBrutaERemuneracoes;
end;

function TJSSpedContribuicoesIndicadorIncidenciaTributariaPrevHelper.toString: string;
begin
  case Self of
    iitReceitaBruta              : Result := '1';
    iitReceitaBrutaERemuneracoes : Result := '2';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesNaturezaDaContaHelper }

procedure TJSSpedContribuicoesNaturezaDaContaHelper.fromString(s: string);
var
  i: Integer;
begin
  Self := ncOutras;
  for i := Low(aStrNaturezaConta) to high(aStrNaturezaConta) do
    if AnsiSameText(s, aStrNaturezaConta[i]) then
      Self := TJSSpedContribuicoesNaturezaDaConta(i);
end;

function TJSSpedContribuicoesNaturezaDaContaHelper.toString: string;
begin
  case Self of
    ncContasDeAtivo        : Result := '01';
    ncContasDePassivo      : Result := '02';
    ncPatrimonioLiquido    : Result := '03';
    ncContasDeResultado    : Result := '04';
    ncContasDeCompensacao  : Result := '05';
    ncOutras               : Result := '09';
  else
    result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorDaContaHelper }

procedure TJSSpedContribuicoesIndicadorDaContaHelper.fromString(s: string);
begin
  Self := icAnalitica;
  if s = 'S' then
    Self := icSintetica;
end;

function TJSSpedContribuicoesIndicadorDaContaHelper.toString: string;
begin
  case self of
    icSintetica : Result := 'S';
    icAnalitica : Result := 'A';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorNaturezaFreteHelper }

procedure TJSSpedContribuicoesIndicadorNaturezaFreteHelper.fromString(
  s: string);
var
  i: Integer;
begin
  Self := infOutras;
  for i := Low(aStrNaturezaFrete) to high(aStrNaturezaFrete) do
    if AnsiSameText(s, aStrNaturezaFrete[i]) then
      Self := TJSSpedContribuicoesIndicadorNaturezaFrete(i);
end;

function TJSSpedContribuicoesIndicadorNaturezaFreteHelper.toString: string;
begin
  case self of
    infOnusEstabelecimento     : Result := '0';
    infOnusAdquirente          : Result := '1';
    infComprasComCredito       : Result := '2';
    infComprasSemCredito       : Result := '3';
    infTransfProdAcabados      : Result := '4';
    infTransfProdEmElaboracao  : Result := '5';
    infOutras                  : Result := '9';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesIndicadorEscrituracaoHelper }

function TJSSpedContribuicoesIndicadorEscrituracaoHelper.toString: string;
begin
  case self of
    ieApuracaoConsolidada      : Result := '1';
    ieApuracaoIndividualizada  : Result := '2';
  end;
end;

{ TJSSpedContribuicoesDocumentoImportacaoHelper }

procedure TJSSpedContribuicoesDocumentoImportacaoHelper.fromString(s: String);
begin
  Self := TJSSpedContribuicoesDocumentoImportacao(StrToIntDef(s,0));
end;

function TJSSpedContribuicoesDocumentoImportacaoHelper.toString: string;
begin
  case self of
    diDeclaracaoDeImportacao  : Result := '0';
    diDeclaracaoSimplificada  : Result := '1';
    diDeclaracaoUnica         : Result := '2';
  end;
end;

{ TJSSpedContribuicoesIndicadorOrigemCreditoHelper }

procedure TJSSpedContribuicoesIndicadorOrigemCreditoHelper.fromString(
  s: string);
begin
  Self := iocNull;
  if s = '0' then
    Self := iocMercadoInterno
  else if s = '1' then
    Self := iocMercadoExterno;
end;

function TJSSpedContribuicoesIndicadorOrigemCreditoHelper.toString: string;
begin
  case Self of
    iocMercadoInterno  : Result := '0';
    iocMercadoExterno  : Result := '1';
  else
    Result := EmptyStr;
  end;
end;

{ TJSSpedContribuicoesTipoAjusteHelper }

procedure TJSSpedContribuicoesTipoAjusteHelper.fromString(s: string);
begin
  Self := taAjuAcrescimo;
  if s = '0' then
    Self := taAjuReducao;
end;

function TJSSpedContribuicoesTipoAjusteHelper.toString: string;
begin
  Result := IntToStr(Integer(Self));
end;

{ TJSSpedContribuicoesIndicadorBemImobHelper }

procedure TJSSpedContribuicoesIndicadorBemImobHelper.fromString(s: String);
var
  i: Integer;
begin
  Self := ibiOutros;
  for i := Low(aStrIndicadorBemImob) to high(aStrIndicadorBemImob) do
    if AnsiSameText(s, aStrIndicadorBemImob[i]) then
      Self := TJSSpedContribuicoesIndicadorBemImob(i);
end;

function TJSSpedContribuicoesIndicadorBemImobHelper.toString: string;
begin
  case self of
    ibiEdificacoesBenfeitoriaaProp  : Result := '01';
    ibiEdificacoesBenfeitoriaaTerc  : Result := '02';
    ibiInstalacoes                  : Result := '03';
    ibiMaquinas                     : Result := '04';
    ibiEquipamentos                 : Result := '05';
    ibiVeiculos                     : Result := '06';
    ibiOutros                       : Result := '99';
  end;
end;

{ TJSSpedContribuicoesIndicadorOperImobHelper }

procedure TJSSpedContribuicoesIndicadorOperImobHelper.fromString(s: string);
var i: Integer;
begin
  self := ioiOutras;
  for i := Low(aStrIndicadorOperImob) to high(aStrIndicadorOperImob) do
    if AnsiSameText(s, aStrIndicadorOperImob[i]) then
      Self := TJSSpedContribuicoesIndicadorOperImob(i);
end;

function TJSSpedContribuicoesIndicadorOperImobHelper.toString: string;
begin
  case self of
    ioiVendaVistaUnidadeConcluida   : Result := '01';
    ioiVendaPrazoUnidadeConcluida   : Result := '02';
    ioiVendaVistaUnidadeConstrucao  : Result := '03';
    ioiVendaPrazoUnidadeConstrucao  : Result := '04';
    ioiOutras                       : Result := '05';
  end;
end;

{ TJSSpedContribuicoesIndicadorUnidImobHelper }

procedure TJSSpedContribuicoesIndicadorUnidImobHelper.fromString(s: string);
var i: Integer;
begin
  self := iuiOutras;
  for i := Low(aStrIndicadorUnidImob) to high(aStrIndicadorUnidImob) do
    if AnsiSameText(s, aStrIndicadorUnidImob[i]) then
      Self := TJSSpedContribuicoesIndicadorUnidImob(i);
end;

function TJSSpedContribuicoesIndicadorUnidImobHelper.toString: string;
begin
  case self of
    iuiTerrenoAdquiridoVenda       : Result := '01';
    iuiTerrenoDecorrenteLoteamento : Result := '02';
    iuiLoteDesmembramentoTerreno   : Result := '03';
    iuiUnidadeIncorporacaoImob     : Result := '04';
    iuiPredioConstruidoVenda       : Result := '05';
    iuiOutras                      : Result := '06';
  end;
end;

{ TJSSpedContribuicoesTipoEnquadramentoHelper }

procedure TJSSpedContribuicoesTipoEnquadramentoHelper.fromString(s: string);
begin
  if s = 'P' then
    Self := tePresumido
  else if s = 'S' then
    Self := teSimples
  else if s = 'R' then
    Self := teReal
  else
    Self := teNull;
end;

{ TRecCodigoPorEst }

constructor TRecCodigoPorEst.create(AcodEst: String; Acodigo: String);
begin
  FcodEst := AcodEst;
  Fcodigo := Acodigo;
end;

end.
