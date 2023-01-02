unit JSSpedContribuicoes.DAO.Interfaces;

interface

uses
  System.Generics.Collections,
  JSSpedContribuicoes.Model.Types,
  JSSpedContribuicoes.Model.Classes;

type
  IJSSpedContribuicoesDAO0000 = interface
    ['{E865FA94-3927-4329-BD9C-646E616F1A6A}']
    function load: TJSSpedContribuicoesModelRegistro0000;
  end;

  IJSSpedContribuicoesDAO0035 = interface
    ['{3BA4B63D-63D8-4334-8C63-FE885B783A23}']
    function list: TObjectList<TJSSpedContribuicoesModelRegistro0035>;
  end;

  IJSSpedContribuicoesDAO0100 = interface
    ['{EB7AE606-1150-4908-9CA6-FF35404FD250}']
    function list: TObjectList<TJSSpedContribuicoesModelRegistro0100>;
  end;

  IJSSpedContribuicoesDAO0140 = interface
    ['{EB9B1034-9CFC-4E6F-A8B0-09312136A3B7}']
    function list: TObjectList<TJSSpedContribuicoesModelRegistro0140>;
  end;

  IJSSpedContribuicoesDAO0145 = interface
    ['{DC70B68C-0551-41F9-B83A-BD0867FFA634}']
    function load(Reg0140: TJSSpedContribuicoesModelRegistro0140; DataInicial: TDateTime): TJSSpedContribuicoesModelRegistro0145;
  end;

  IJSSpedContribuicoesDAO0150 = interface
    ['{065D97DE-00AB-42A2-8DEE-1F1A538F989C}']
    function load(Reg0140: TJSSpedContribuicoesModelRegistro0140; CodPart: TList<TRecCodigoPorEst>): TObjectList<TJSSpedContribuicoesModelRegistro0150>;
  end;

  IJSSpedContribuicoesDAO0190 = interface
    ['{1E44F5D1-BD10-44F9-ACED-A323DCDE914B}']
    function load(Reg0140: TJSSpedContribuicoesModelRegistro0140; Aunid : TList<TRecCodigoPorEst>): TObjectList<TJSSpedContribuicoesModelRegistro0190>;
  end;

  IJSSpedContribuicoesDAO0200 = interface
    ['{009D494B-4ED3-43CE-833C-5202614A67B2}']
    function load(Reg0140: TJSSpedContribuicoesModelRegistro0140; CodItem: TList<TRecCodigoPorEst>): TObjectList<TJSSpedContribuicoesModelRegistro0200>;
  end;

  IJSSpedContribuicoesDAO0450 = interface
    ['{7058C100-BBCE-435D-AF05-E85C92C00685}']
    function load(Reg0140: TJSSpedContribuicoesModelRegistro0140; Acodigo : TList<TRecCodigoPorEst>): TObjectList<TJSSpedContribuicoesModelRegistro0450>;
  end;

  IJSSpedContribuicoesDAO0500 = interface
    ['{B31861B0-EF92-46E1-8F19-65B0F5A34871}']
    function load(AcodConta : TList<String>): TObjectList<TJSSpedContribuicoesModelRegistro0500>;
  end;

  IJSSpedContribuicoesDAO1011 = interface
    ['{550AC0FF-7B19-4DE1-BD44-93F2BBEFAF7E}']
    function list(Reg1010: TJSSpedContribuicoesModelRegistro1010; ADataInicial, ADataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1011>;
  end;

  IJSSpedContribuicoesDAO1100 = interface
    ['{405DAE9C-C245-4B8A-95F8-E9263145C6C5}']
    function list(ADataInicial, ADataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1100>;
  end;

  IJSSpedContribuicoesDAO1101 = interface
    ['{FAC4A1B4-2024-48D5-A380-996A3544345B}']
    function list(Reg1100: TJSSpedContribuicoesModelRegistro1100; ADataInicial, ADataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1101>;
  end;

  IJSSpedContribuicoesDAO1300 = interface
    ['{164A1A09-961A-4B6B-B85B-0F0D475434A7}']
    function list(ADataInicial: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1300>;
    function listRegApu(ADataInicial: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1300>;
  end;

  IJSSpedContribuicoesDAO1500 = interface
    ['{405DAE9C-C245-4B8A-95F8-E9263145C6C5}']
    function list(ADataInicial, ADataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1500>;
  end;

  IJSSpedContribuicoesDAO1501 = interface
    ['{07067F79-F2FB-4065-88BB-B4F5180F8DA2}']
    function list(Reg1500: TJSSpedContribuicoesModelRegistro1500; ADataInicial, ADataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1501>;
  end;

  IJSSpedContribuicoesDAO1700 = interface
    ['{C72B718A-8059-4A05-BEF6-56D87585BC3F}']
    function list(ADataInicial: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1700>;
    function listRegApu(ADataInicial: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1700>;
  end;

  IJSSpedContribuicoesDAO1900 = interface
    ['{D519E98A-C343-41DD-8BD9-67B8AD76623C}']
    function list(ADataInicial, ADataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistro1900>;
  end;

  IJSSpedContribuicoesDAOA010 = interface
    ['{19F73F47-0B4B-49E1-A517-13A8001F5F9C}']
    function list: TObjectList<TJSSpedContribuicoesModelRegistroA010>;
  end;

  IJSSpedContribuicoesDAOA100 = interface
    ['{906C7B6C-C912-40DE-9A67-92922A13DC45}']
    function list(RegA010: TJSSpedContribuicoesModelRegistroA010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroA100>;
  end;

  IJSSpedContribuicoesDAOA110 = interface
    ['{9E3CDEB7-A516-488B-B1E6-D0CA8B94C7B6}']
    function list(RegA100: TJSSpedContribuicoesModelRegistroA100): TObjectList<TJSSpedContribuicoesModelRegistroA110>;
  end;

  IJSSpedContribuicoesDAOA111 = interface
    ['{331D91F5-2B88-455F-8E4A-150299B7FE0C}']
    function list(RegA100: TJSSpedContribuicoesModelRegistroA100): TObjectList<TJSSpedContribuicoesModelRegistroA111>;
  end;

  IJSSpedContribuicoesDAOA170 = interface
    ['{7705F06B-799A-4C45-A00B-453A4B76CD6E}']
    function list(RegA100: TJSSpedContribuicoesModelRegistroA100): TObjectList<TJSSpedContribuicoesModelRegistroA170>;
  end;

  IJSSpedContribuicoesDAOC010 = interface
    ['{3959AA22-4E12-46E2-B028-75BA13563A34}']
    function list: TObjectList<TJSSpedContribuicoesModelRegistroC010>;
  end;

  IJSSpedContribuicoesDAOC100 = interface
    ['{A5C2A96E-E803-40EB-B65A-2B26F664EBDA}']
    function list(RegC010: TJSSpedContribuicoesModelRegistroC010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroC100>;
  end;

  IJSSpedContribuicoesDAOC110 = interface
    ['{15B3B263-0137-4E24-91D9-514EC264A953}']
    function list(RegC100: TJSSpedContribuicoesModelRegistroC100): TObjectList<TJSSpedContribuicoesModelRegistroC110>;
  end;

  IJSSpedContribuicoesDAOC111 = interface
    ['{6E21B7F3-CF7F-4FA1-B756-7AD62DD142F7}']
    function list(RegC110: TJSSpedContribuicoesModelRegistroC110): TObjectList<TJSSpedContribuicoesModelRegistroC111>;
  end;

  IJSSpedContribuicoesDAOC120 = interface
    ['{E770D185-A5AD-4BB9-ACC3-29EA005E03D0}']
    function list(RegC100: TJSSpedContribuicoesModelRegistroC100): TObjectList<TJSSpedContribuicoesModelRegistroC120>;
  end;

  IJSSpedContribuicoesDAOC170 = interface
    ['{9D118CFB-1CFC-4D82-BF63-B5D9D2B20A76}']
    function list(RegC100: TJSSpedContribuicoesModelRegistroC100): TObjectList<TJSSpedContribuicoesModelRegistroC170>;
  end;

  IJSSpedContribuicoesDAOC175 = interface
    ['{9A8F7FBE-0493-48F3-9555-2C9ED0394F97}']
    function list(RegC100: TJSSpedContribuicoesModelRegistroC100): TObjectList<TJSSpedContribuicoesModelRegistroC175>;
  end;

  IJSSpedContribuicoesDAOC180 = interface
    ['{46B7B690-F240-45D4-9A23-C310D540924B}']
    function listC180(RegC010: TJSSpedContribuicoesModelRegistroC010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroC180>;
  end;

  IJSSpedContribuicoesDAOC181 = interface
    ['{F892C81E-06CF-44DA-A0F8-AF2B60B58160}']
    function listC181(RegC180: TJSSpedContribuicoesModelRegistroC180): TObjectList<TJSSpedContribuicoesModelRegistroC181>;
  end;

  IJSSpedContribuicoesDAOC185 = interface
    ['{23D5B973-8F0F-4CB2-9757-454A9773B697}']
    function listC185(RegC180: TJSSpedContribuicoesModelRegistroC180): TObjectList<TJSSpedContribuicoesModelRegistroC185>;
  end;

  IJSSpedContribuicoesDAOC380 = interface
    ['{80B70585-72EB-429C-BF85-2BE7343FE9B2}']
    function listC380(RegC010: TJSSpedContribuicoesModelRegistroC010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroC380>;
  end;

  IJSSpedContribuicoesDAOC381 = interface
    ['{2D781B32-1EF6-49B2-8DD6-CFED4BB971E9}']
    function listC381(RegC380: TJSSpedContribuicoesModelRegistroC380): TObjectList<TJSSpedContribuicoesModelRegistroC381>;
  end;

  IJSSpedContribuicoesDAOC385 = interface
    ['{492E7CAB-7C2B-484F-9C34-E1AB49AD6FB4}']
    function listC385(RegC380: TJSSpedContribuicoesModelRegistroC380): TObjectList<TJSSpedContribuicoesModelRegistroC385>;
  end;

  IJSSpedContribuicoesDAOC395 = interface
    ['{1A7EAE8A-3153-40A1-8362-5BB316F1F3D7}']
    function listC395(DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroC395>;
  end;

  IJSSpedContribuicoesDAOC396 = interface
    ['{30E0C6D6-9541-4C48-B62A-DE6795DBF76E}']
    function listC396(RegC395: TJSSpedContribuicoesModelRegistroC395): TObjectList<TJSSpedContribuicoesModelRegistroC396>;
  end;

  IJSSpedContribuicoesDAOC400 = interface
    ['{95565C48-0E35-45C7-9832-31F236D35956}']
    function listC400(RegC010: TJSSpedContribuicoesModelRegistroC010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroC400>;
  end;

  IJSSpedContribuicoesDAOC405 = interface
    ['{468E3A79-951E-4242-B077-C9C1E8C12AFB}']
    function listC405(RegC400: TJSSpedContribuicoesModelRegistroC400): TObjectList<TJSSpedContribuicoesModelRegistroC405>;
  end;

  IJSSpedContribuicoesDAOC481 = interface
    ['{0208DA6E-3996-4DEE-908F-D3495C8BE42C}']
    function listC481(RegC400: TJSSpedContribuicoesModelRegistroC400; RegC405: TJSSpedContribuicoesModelRegistroC405): TObjectList<TJSSpedContribuicoesModelRegistroC481>;
  end;

  IJSSpedContribuicoesDAOC485 = interface
    ['{145E6584-0F57-4968-A5C8-03087676206A}']
    function listC485(RegC400: TJSSpedContribuicoesModelRegistroC400; RegC405: TJSSpedContribuicoesModelRegistroC405): TObjectList<TJSSpedContribuicoesModelRegistroC485>;
  end;

  IJSSpedContribuicoesDAOC490 = interface
    ['{8B394BA9-B5AD-4962-AD30-F133D635B82E}']
    function listC490(RegC010: TJSSpedContribuicoesModelRegistroC010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroC490>;
  end;

  IJSSpedContribuicoesDAOC491 = interface
    ['{773C1483-FFE0-4FC2-83D1-D43DA574B35D}']
    function listC491(RegC490: TJSSpedContribuicoesModelRegistroC490): TObjectList<TJSSpedContribuicoesModelRegistroC491>;
  end;

  IJSSpedContribuicoesDAOC495 = interface
    ['{B42F2E29-F6C4-4E12-A35F-1341FFD515CA}']
    function listC495(RegC490: TJSSpedContribuicoesModelRegistroC490): TObjectList<TJSSpedContribuicoesModelRegistroC495>;
  end;

  IJSSpedContribuicoesDAOC500 = interface
    ['{60F3F35F-EEEC-48E8-BD4D-026E836AA22A}']
    function list(RegC010: TJSSpedContribuicoesModelRegistroC010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroC500>;
  end;

  IJSSpedContribuicoesDAOC501 = interface
    ['{02F4E362-D8B6-4FA9-A606-04934C2F54D4}']
    function listC501(RegC500: TJSSpedContribuicoesModelRegistroC500): TObjectList<TJSSpedContribuicoesModelRegistroC501>;
  end;

  IJSSpedContribuicoesDAOC505 = interface
    ['{EB81E74C-F995-42CB-B63A-18BA5ECE6D20}']
    function listC505(RegC500: TJSSpedContribuicoesModelRegistroC500): TObjectList<TJSSpedContribuicoesModelRegistroC505>;
  end;

  IJSSpedContribuicoesDAOC800 = interface
    ['{E627DA72-4669-48F6-BACF-B74FAA70FFF0}']
    function listC800(RegC010: TJSSpedContribuicoesModelRegistroC010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroC800>;
  end;

  IJSSpedContribuicoesDAOC810 = interface
    ['{8AE53598-10A6-48C0-841D-82A384D614BB}']
    function listC810(RegC800: TJSSpedContribuicoesModelRegistroC800): TObjectList<TJSSpedContribuicoesModelRegistroC810>;
  end;

  IJSSpedContribuicoesDAOC860 = interface
    ['{2602401C-6659-4903-8CBE-6BE4577FC69F}']
    function list(RegC010: TJSSpedContribuicoesModelRegistroC010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroC860>;
  end;

  IJSSpedContribuicoesDAOC870 = interface
    ['{E4639ABC-967A-41CA-91F3-DD5BFCD69B49}']
    function list(RegC010: TJSSpedContribuicoesModelRegistroC010; RegC860: TJSSpedContribuicoesModelRegistroC860): TObjectList<TJSSpedContribuicoesModelRegistroC870>;
  end;

  IJSSpedContribuicoesDAOD010 = interface
    ['{B0A92703-A033-4078-8CE4-1DD3BB81B725}']
    function list: TObjectList<TJSSpedContribuicoesModelRegistroD010>;
  end;

  IJSSpedContribuicoesDAOD100 = interface
    ['{5A166CCE-DA41-41E5-86A4-0FC48677D0E7}']
    function list(RegD010: TJSSpedContribuicoesModelRegistroD010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroD100>;
  end;

  IJSSpedContribuicoesDAOD101 = interface
    ['{FFDB04FF-315F-4C30-A8C2-4F76FBDEDC22}']
    function listD101(RegD100: TJSSpedContribuicoesModelRegistroD100): TObjectList<TJSSpedContribuicoesModelRegistroD101>;
  end;

  IJSSpedContribuicoesDAOD105 = interface
    ['{F342EAF7-F4B3-4D98-A2DE-373EB7ED57B5}']
    function listD105(RegD100: TJSSpedContribuicoesModelRegistroD100): TObjectList<TJSSpedContribuicoesModelRegistroD105>;
  end;

  IJSSpedContribuicoesDAOD111 = interface
    ['{7B633638-679D-4137-81A7-BFEE3074DE89}']
    function list(RegD100: TJSSpedContribuicoesModelRegistroD100): TObjectList<TJSSpedContribuicoesModelRegistroD111>;
  end;

  IJSSpedContribuicoesDAOD200 = interface
    ['{56A5696C-51E9-4100-8A77-A83DA7E34F21}']
    function list(RegD010: TJSSpedContribuicoesModelRegistroD010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroD200>;
  end;

  IJSSpedContribuicoesDAOD201 = interface
    ['{81D80003-40D6-4A3F-A29D-033A533FFB8C}']
    function listD201(RegD200: TJSSpedContribuicoesModelRegistroD200): TObjectList<TJSSpedContribuicoesModelRegistroD201>;
  end;

  IJSSpedContribuicoesDAOD205 = interface
    ['{0EA32A89-F08B-492D-B775-91ED306E43FD}']
    function listD205(RegD200: TJSSpedContribuicoesModelRegistroD200): TObjectList<TJSSpedContribuicoesModelRegistroD205>;
  end;

  IJSSpedContribuicoesDAOD500 = interface
    ['{284567F8-911A-44F3-908C-F5C7E3F93031}']
    function list(RegD010: TJSSpedContribuicoesModelRegistroD010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroD500>;
  end;

  IJSSpedContribuicoesDAOD501 = interface
    ['{FF3BF453-835B-4923-A963-2BC7A3245DD5}']
    function listD501(RegD500: TJSSpedContribuicoesModelRegistroD500): TObjectList<TJSSpedContribuicoesModelRegistroD501>;
  end;

  IJSSpedContribuicoesDAOD505 = interface
    ['{164AF477-7BD1-460D-B25E-97C7129B8066}']
    function listD505(RegD500: TJSSpedContribuicoesModelRegistroD500): TObjectList<TJSSpedContribuicoesModelRegistroD505>;
  end;

  IJSSpedContribuicoesDAOD509 = interface
    ['{447D8EE7-6884-4C0F-914F-C64D79DF0A0A}']
    function list(RegD500: TJSSpedContribuicoesModelRegistroD500): TObjectList<TJSSpedContribuicoesModelRegistroD509>;
  end;

  IJSSpedContribuicoesDAOF010 = interface
    ['{D0846093-3A7E-46B0-9BAC-911622D209CB}']
    function list: TObjectList<TJSSpedContribuicoesModelRegistroF010>;
  end;

  IJSSpedContribuicoesDAOF100 = interface
    ['{ABF901BA-AD4A-4825-9DAE-B328614B6EAE}']
    function list(RegF010: TJSSpedContribuicoesModelRegistroF010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroF100>;
  end;

  IJSSpedContribuicoesDAOF111 = interface
    ['{C21DC652-410F-471D-808B-8D40F80E8FDD}']
    function list(RegF100: TJSSpedContribuicoesModelRegistroF100): TObjectList<TJSSpedContribuicoesModelRegistroF111>;
  end;

  IJSSpedContribuicoesDAOF120 = interface
    ['{A4279D7D-5349-4AF2-B9BF-C139B18A0174}']
    function list(RegF010: TJSSpedContribuicoesModelRegistroF010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroF120>;
  end;

  IJSSpedContribuicoesDAOF129 = interface
    ['{BF410D57-FD23-49B2-9055-EEE0AC64820F}']
    function list(RegF120: TJSSpedContribuicoesModelRegistroF120): TObjectList<TJSSpedContribuicoesModelRegistroF129>;
  end;

  IJSSpedContribuicoesDAOF130 = interface
    ['{BA202F7E-709D-4080-AB72-1581AE0EBA01}']
    function list(RegF010: TJSSpedContribuicoesModelRegistroF010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroF130>;
  end;

  IJSSpedContribuicoesDAOF139 = interface
    ['{01722439-1256-483C-96F4-0F13AC823E55}']
    function list(RegF130: TJSSpedContribuicoesModelRegistroF130): TObjectList<TJSSpedContribuicoesModelRegistroF139>;
  end;

  IJSSpedContribuicoesDAOF200 = interface
    ['{35BDBBD3-98A9-42EF-BF19-14D038AC9C1B}']
    function listF200(RegF010: TJSSpedContribuicoesModelRegistroF010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroF200>;
  end;

  IJSSpedContribuicoesDAOF205 = interface
    ['{0CF889FB-A8F9-4063-B471-A985740FEA57}']
    function loadF205(RegF200: TJSSpedContribuicoesModelRegistroF200): TJSSpedContribuicoesModelRegistroF205;
  end;

  IJSSpedContribuicoesDAOF210 = interface
    ['{6C95A2F6-CD8A-4332-A841-4D9A24F10C83}']
    function list(RegF200: TJSSpedContribuicoesModelRegistroF200): TObjectList<TJSSpedContribuicoesModelRegistroF210>;
  end;

  IJSSpedContribuicoesDAOF211 = interface
    ['{F9C0E3ED-8743-45E4-9B26-02AA934B5F82}']
    function list(RegF200: TJSSpedContribuicoesModelRegistroF200): TObjectList<TJSSpedContribuicoesModelRegistroF211>;
  end;

  IJSSpedContribuicoesDAOF500 = interface
    ['{BE1C6111-77DD-4ECF-85CB-0E6EF347A707}']
    function list(RegF010: TJSSpedContribuicoesModelRegistroF010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroF500>;
  end;

  IJSSpedContribuicoesDAOF525 = interface
    ['{18701BAC-61E8-44B5-9DE8-9F1808307BC2}']
    function list(RegF010: TJSSpedContribuicoesModelRegistroF010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroF525>;
  end;

  IJSSpedContribuicoesDAOF550 = interface
    ['{71B1E5E9-E7D7-4C62-8F8A-E59C94D0D5FA}']
    function list(RegF010: TJSSpedContribuicoesModelRegistroF010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroF550>;
  end;

  IJSSpedContribuicoesDAOF600 = interface
    ['{CA2752CF-F1BB-425C-A76B-276ABD893C90}']
    function list(RegF010: TJSSpedContribuicoesModelRegistroF010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroF600>;
  end;

  IJSSpedContribuicoesDAOM110 = interface
    ['{ED96736F-C13E-4FEF-98DF-325A515A2C08}']
    function list(DataInicial: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroM110>;
  end;

  IJSSpedContribuicoesDAOM115 = interface
    ['{B21E458D-5C2C-4C97-862A-E2FE2D63BD2B}']
    function list(RegM110: TJSSpedContribuicoesModelRegistroM110): TObjectList<TJSSpedContribuicoesModelRegistroM115>;
  end;

  IJSSpedContribuicoesDAOM220 = interface
    ['{BD851E42-39D3-425E-87BC-A9F7B5FFC798}']
    function list(DataInicial: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroM220>;
  end;

  IJSSpedContribuicoesDAOM225 = interface
    ['{2CD4F0D8-3F4B-4A72-B698-0C796BDDF3E9}']
    function list(RegM220: TJSSpedContribuicoesModelRegistroM220): TObjectList<TJSSpedContribuicoesModelRegistroM225>;
  end;

  IJSSpedContribuicoesDAOM350 = interface
    ['{393D19DA-B58E-4C8F-8B94-69EAC350A5B0}']
    function load(DataInicial: TDateTime): TJSSpedContribuicoesModelRegistroM350;
  end;

  IJSSpedContribuicoesDAOM510 = interface
    ['{65099554-E07F-4DC1-AFD2-30B6BD0602FE}']
    function list(DataInicial: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroM510>;
  end;

  IJSSpedContribuicoesDAOM515 = interface
    ['{BCC3EC78-2886-474F-8294-F7E39924DF4C}']
    function list(RegM510: TJSSpedContribuicoesModelRegistroM510): TObjectList<TJSSpedContribuicoesModelRegistroM515>;
  end;

  IJSSpedContribuicoesDAOM620 = interface
    ['{B0D6E453-875F-48CC-A935-6BE07387FE7D}']
    function list(DataInicial: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroM620>;
  end;

  IJSSpedContribuicoesDAOM625 = interface
    ['{E397CB8C-25BD-44AA-BC57-B64AD4C39C55}']
    function list(RegM620: TJSSpedContribuicoesModelRegistroM620): TObjectList<TJSSpedContribuicoesModelRegistroM625>;
  end;

  IJSSpedContribuicoesDAOP010 = interface
    ['{FCE1FB28-2E07-4317-A74B-A42923456360}']
    function list: TObjectList<TJSSpedContribuicoesModelRegistroP010>;
  end;

  IJSSpedContribuicoesDAOP100 = interface
    ['{DE590425-46ED-4D70-BAAD-3DD5A8F2EEB2}']
    function listP100(RegP010: TJSSpedContribuicoesModelRegistroP010; DataInicial, DataFinal: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroP100>;
  end;

  IJSSpedContribuicoesDAOP200 = interface
    ['{B40B33F9-368E-4141-9F70-F4692DDDF3EF}']
    function listP200(RegP010: TJSSpedContribuicoesModelRegistroP010; DataInicial: TDateTime): TObjectList<TJSSpedContribuicoesModelRegistroP200>;
  end;


implementation

end.
