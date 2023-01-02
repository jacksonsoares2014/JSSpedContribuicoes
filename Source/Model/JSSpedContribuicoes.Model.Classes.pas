unit JSSpedContribuicoes.Model.Classes;

interface

uses
  JSSpedContribuicoes.Model.Registro,

  JSSpedContribuicoes.Model.Registro0000,
  JSSpedContribuicoes.Model.Registro0001,
  JSSpedContribuicoes.Model.Registro0035,
  JSSpedContribuicoes.Model.Registro0100,
  JSSpedContribuicoes.Model.Registro0110,
  JSSpedContribuicoes.Model.Registro0111,
  JSSpedContribuicoes.Model.Registro0120,
  JSSpedContribuicoes.Model.Registro0140,
  JSSpedContribuicoes.Model.Registro0145,
  JSSpedContribuicoes.Model.Registro0150,
  JSSpedContribuicoes.Model.Registro0190,
  JSSpedContribuicoes.Model.Registro0200,
  JSSpedContribuicoes.Model.Registro0450,
  JSSpedContribuicoes.Model.Registro0500,
  JSSpedContribuicoes.Model.Registro0600,
  JSSpedContribuicoes.Model.Registro0900,
  JSSpedContribuicoes.Model.Registro0990,

  JSSpedContribuicoes.Model.RegistroA001,
  JSSpedContribuicoes.Model.RegistroA010,
  JSSpedContribuicoes.Model.RegistroA100,
  JSSpedContribuicoes.Model.RegistroA110,
  JSSpedContribuicoes.Model.RegistroA111,
  JSSpedContribuicoes.Model.RegistroA170,
  JSSpedContribuicoes.Model.RegistroA990,

  JSSpedContribuicoes.Model.RegistroC001,
  JSSpedContribuicoes.Model.RegistroC010,
  JSSpedContribuicoes.Model.RegistroC100,
  JSSpedContribuicoes.Model.RegistroC110,
  JSSpedContribuicoes.Model.RegistroC111,
  JSSpedContribuicoes.Model.RegistroC120,
  JSSpedContribuicoes.Model.RegistroC170,
  JSSpedContribuicoes.Model.RegistroC175,
  JSSpedContribuicoes.Model.RegistroC180,
  JSSpedContribuicoes.Model.RegistroC181,
  JSSpedContribuicoes.Model.RegistroC185,

  JSSpedContribuicoes.Model.RegistroC380,
  JSSpedContribuicoes.Model.RegistroC381,
  JSSpedContribuicoes.Model.RegistroC385,
  JSSpedContribuicoes.Model.RegistroC395,
  JSSpedContribuicoes.Model.RegistroC396,

  JSSpedContribuicoes.Model.RegistroC400,
  JSSpedContribuicoes.Model.RegistroC405,
  JSSpedContribuicoes.Model.RegistroC481,
  JSSpedContribuicoes.Model.RegistroC485,
  JSSpedContribuicoes.Model.RegistroC490,
  JSSpedContribuicoes.Model.RegistroC491,
  JSSpedContribuicoes.Model.RegistroC495,

  JSSpedContribuicoes.Model.RegistroC500,
  JSSpedContribuicoes.Model.RegistroC501,
  JSSpedContribuicoes.Model.RegistroC505,

  JSSpedContribuicoes.Model.RegistroC800,
  JSSpedContribuicoes.Model.RegistroC810,
  JSSpedContribuicoes.Model.RegistroC860,
  JSSpedContribuicoes.Model.RegistroC870,
  JSSpedContribuicoes.Model.RegistroC990,

  JSSpedContribuicoes.Model.RegistroD001,
  JSSpedContribuicoes.Model.RegistroD010,
  JSSpedContribuicoes.Model.RegistroD100,
  JSSpedContribuicoes.Model.RegistroD101,
  JSSpedContribuicoes.Model.RegistroD105,
  JSSpedContribuicoes.Model.RegistroD111,
  JSSpedContribuicoes.Model.RegistroD200,
  JSSpedContribuicoes.Model.RegistroD201,
  JSSpedContribuicoes.Model.RegistroD205,
  JSSpedContribuicoes.Model.RegistroD209,
  JSSpedContribuicoes.Model.RegistroD500,
  JSSpedContribuicoes.Model.RegistroD501,
  JSSpedContribuicoes.Model.RegistroD505,
  JSSpedContribuicoes.Model.RegistroD509,
  JSSpedContribuicoes.Model.RegistroD990,

  JSSpedContribuicoes.Model.RegistroF001,
  JSSpedContribuicoes.Model.RegistroF010,
  JSSpedContribuicoes.Model.RegistroF100,
  JSSpedContribuicoes.Model.RegistroF111,

  JSSpedContribuicoes.Model.RegistroF120,
  JSSpedContribuicoes.Model.RegistroF129,
  JSSpedContribuicoes.Model.RegistroF130,
  JSSpedContribuicoes.Model.RegistroF139,
  JSSpedContribuicoes.Model.RegistroF200,
  JSSpedContribuicoes.Model.RegistroF205,
  JSSpedContribuicoes.Model.RegistroF210,
  JSSpedContribuicoes.Model.RegistroF211,

  JSSpedContribuicoes.Model.RegistroF500,
  JSSpedContribuicoes.Model.RegistroF525,
  JSSpedContribuicoes.Model.RegistroF550,
  JSSpedContribuicoes.Model.RegistroF600,
  JSSpedContribuicoes.Model.RegistroF990,

  JSSpedContribuicoes.Model.RegistroM001,
  JSSpedContribuicoes.Model.RegistroM100,
  JSSpedContribuicoes.Model.RegistroM105,
  JSSpedContribuicoes.Model.RegistroM110,
  JSSpedContribuicoes.Model.RegistroM115,
  JSSpedContribuicoes.Model.RegistroM200,
  JSSpedContribuicoes.Model.RegistroM205,
  JSSpedContribuicoes.Model.RegistroM220,
  JSSpedContribuicoes.Model.RegistroM225,
  JSSpedContribuicoes.Model.RegistroM350,
  JSSpedContribuicoes.Model.RegistroM400,
  JSSpedContribuicoes.Model.RegistroM410,
  JSSpedContribuicoes.Model.RegistroM500,
  JSSpedContribuicoes.Model.RegistroM505,
  JSSpedContribuicoes.Model.RegistroM510,
  JSSpedContribuicoes.Model.RegistroM515,
  JSSpedContribuicoes.Model.RegistroM210,
  JSSpedContribuicoes.Model.RegistroM600,
  JSSpedContribuicoes.Model.RegistroM605,
  JSSpedContribuicoes.Model.RegistroM610,
  JSSpedContribuicoes.Model.RegistroM620,
  JSSpedContribuicoes.Model.RegistroM625,
  JSSpedContribuicoes.Model.RegistroM800,
  JSSpedContribuicoes.Model.RegistroM810,
  JSSpedContribuicoes.Model.RegistroM990,

  JSSpedContribuicoes.Model.RegistroP001,
  JSSpedContribuicoes.Model.RegistroP010,
  JSSpedContribuicoes.Model.RegistroP100,
  JSSpedContribuicoes.Model.RegistroP200,
  JSSpedContribuicoes.Model.RegistroP990,

  JSSpedContribuicoes.Model.Registro1001,
  JSSpedContribuicoes.Model.Registro1010,
  JSSpedContribuicoes.Model.Registro1011,
  JSSpedContribuicoes.Model.Registro1020,
  JSSpedContribuicoes.Model.Registro1050,
  JSSpedContribuicoes.Model.Registro1100,
  JSSpedContribuicoes.Model.Registro1101,
  JSSpedContribuicoes.Model.Registro1300,
  JSSpedContribuicoes.Model.Registro1500,
  JSSpedContribuicoes.Model.Registro1501,
  JSSpedContribuicoes.Model.Registro1700,
  JSSpedContribuicoes.Model.Registro1900,
  JSSpedContribuicoes.Model.Registro1990;

type
  TJSSpedContribuicoesModelRegistro     = JSSpedContribuicoes.Model.Registro.TJSSpedContribuicoesModelRegistro;

  TJSSpedContribuicoesModelRegistro0000 = JSSpedContribuicoes.Model.Registro0000.TJSSpedContribuicoesModelRegistro0000;
  TJSSpedContribuicoesModelRegistro0001 = JSSpedContribuicoes.Model.Registro0001.TJSSpedContribuicoesModelRegistro0001;
  TJSSpedContribuicoesModelRegistro0035 = JSSpedContribuicoes.Model.Registro0035.TJSSpedContribuicoesModelRegistro0035;
  TJSSpedContribuicoesModelRegistro0100 = JSSpedContribuicoes.Model.Registro0100.TJSSpedContribuicoesModelRegistro0100;
  TJSSpedContribuicoesModelRegistro0110 = JSSpedContribuicoes.Model.Registro0110.TJSSpedContribuicoesModelRegistro0110;
  TJSSpedContribuicoesModelRegistro0111 = JSSpedContribuicoes.Model.Registro0111.TJSSpedContribuicoesModelRegistro0111;
  TJSSpedContribuicoesModelRegistro0120 = JSSpedContribuicoes.Model.Registro0120.TJSSpedContribuicoesModelRegistro0120;
  TJSSpedContribuicoesModelRegistro0140 = JSSpedContribuicoes.Model.Registro0140.TJSSpedContribuicoesModelRegistro0140;
  TJSSpedContribuicoesModelRegistro0145 = JSSpedContribuicoes.Model.Registro0145.TJSSpedContribuicoesModelRegistro0145;
  TJSSpedContribuicoesModelRegistro0150 = JSSpedContribuicoes.Model.Registro0150.TJSSpedContribuicoesModelRegistro0150;
  TJSSpedContribuicoesModelRegistro0190 = JSSpedContribuicoes.Model.Registro0190.TJSSpedContribuicoesModelRegistro0190;
  TJSSpedContribuicoesModelRegistro0200 = JSSpedContribuicoes.Model.Registro0200.TJSSpedContribuicoesModelRegistro0200;
  TJSSpedContribuicoesModelRegistro0450 = JSSpedContribuicoes.Model.Registro0450.TJSSpedContribuicoesModelRegistro0450;
  TJSSpedContribuicoesModelRegistro0500 = JSSpedContribuicoes.Model.Registro0500.TJSSpedContribuicoesModelRegistro0500;
  TJSSpedContribuicoesModelRegistro0600 = JSSpedContribuicoes.Model.Registro0600.TJSSpedContribuicoesModelRegistro0600;
  TJSSpedContribuicoesModelRegistro0900 = JSSpedContribuicoes.Model.Registro0900.TJSSpedContribuicoesModelRegistro0900;
  TJSSpedContribuicoesModelRegistro0990 = JSSpedContribuicoes.Model.Registro0990.TJSSpedContribuicoesModelRegistro0990;

  TJSSpedContribuicoesModelRegistro1001 = JSSpedContribuicoes.Model.Registro1001.TJSSpedContribuicoesModelRegistro1001;
  TJSSpedContribuicoesModelRegistro1010 = JSSpedContribuicoes.Model.Registro1010.TJSSpedContribuicoesModelRegistro1010;
  TJSSpedContribuicoesModelRegistro1011 = JSSpedContribuicoes.Model.Registro1011.TJSSpedContribuicoesModelRegistro1011;
  TJSSpedContribuicoesModelRegistro1020 = JSSpedContribuicoes.Model.Registro1020.TJSSpedContribuicoesModelRegistro1020;
  TJSSpedContribuicoesModelRegistro1050 = JSSpedContribuicoes.Model.Registro1050.TJSSpedContribuicoesModelRegistro1050;
  TJSSpedContribuicoesModelRegistro1100 = JSSpedContribuicoes.Model.Registro1100.TJSSpedContribuicoesModelRegistro1100;
  TJSSpedContribuicoesModelRegistro1101 = JSSpedContribuicoes.Model.Registro1101.TJSSpedContribuicoesModelRegistro1101;
  TJSSpedContribuicoesModelRegistro1300 = JSSpedContribuicoes.Model.Registro1300.TJSSpedContribuicoesModelRegistro1300;
  TJSSpedContribuicoesModelRegistro1500 = JSSpedContribuicoes.Model.Registro1500.TJSSpedContribuicoesModelRegistro1500;
  TJSSpedContribuicoesModelRegistro1501 = JSSpedContribuicoes.Model.Registro1501.TJSSpedContribuicoesModelRegistro1501;
  TJSSpedContribuicoesModelRegistro1700 = JSSpedContribuicoes.Model.Registro1700.TJSSpedContribuicoesModelRegistro1700;
  TJSSpedContribuicoesModelRegistro1900 = JSSpedContribuicoes.Model.Registro1900.TJSSpedContribuicoesModelRegistro1900;
  TJSSpedContribuicoesModelRegistro1990 = JSSpedContribuicoes.Model.Registro1990.TJSSpedContribuicoesModelRegistro1990;

  TJSSpedContribuicoesModelRegistroA001 = JSSpedContribuicoes.Model.RegistroA001.TJSSpedContribuicoesModelRegistroA001;
  TJSSpedContribuicoesModelRegistroA010 = JSSpedContribuicoes.Model.RegistroA010.TJSSpedContribuicoesModelRegistroA010;
  TJSSpedContribuicoesModelRegistroA100 = JSSpedContribuicoes.Model.RegistroA100.TJSSpedContribuicoesModelRegistroA100;
  TJSSpedContribuicoesModelRegistroA110 = JSSpedContribuicoes.Model.RegistroA110.TJSSpedContribuicoesModelRegistroA110;
  TJSSpedContribuicoesModelRegistroA111 = JSSpedContribuicoes.Model.RegistroA111.TJSSpedContribuicoesModelRegistroA111;
  TJSSpedContribuicoesModelRegistroA170 = JSSpedContribuicoes.Model.RegistroA170.TJSSpedContribuicoesModelRegistroA170;
  TJSSpedContribuicoesModelRegistroA990 = JSSpedContribuicoes.Model.RegistroA990.TJSSpedContribuicoesModelRegistroA990;

  TJSSpedContribuicoesModelRegistroC001 = JSSpedContribuicoes.Model.RegistroC001.TJSSpedContribuicoesModelRegistroC001;
  TJSSpedContribuicoesModelRegistroC010 = JSSpedContribuicoes.Model.RegistroC010.TJSSpedContribuicoesModelRegistroC010;
  TJSSpedContribuicoesModelRegistroC100 = JSSpedContribuicoes.Model.RegistroC100.TJSSpedContribuicoesModelRegistroC100;
  TJSSpedContribuicoesModelRegistroC110 = JSSpedContribuicoes.Model.RegistroC110.TJSSpedContribuicoesModelRegistroC110;
  TJSSpedContribuicoesModelRegistroC111 = JSSpedContribuicoes.Model.RegistroC111.TJSSpedContribuicoesModelRegistroC111;
  TJSSpedContribuicoesModelRegistroC120 = JSSpedContribuicoes.Model.RegistroC120.TJSSpedContribuicoesModelRegistroC120;
  TJSSpedContribuicoesModelRegistroC170 = JSSpedContribuicoes.Model.RegistroC170.TJSSpedContribuicoesModelRegistroC170;
  TJSSpedContribuicoesModelRegistroC175 = JSSpedContribuicoes.Model.RegistroC175.TJSSpedContribuicoesModelRegistroC175;
  TJSSpedContribuicoesModelRegistroC180 = JSSpedContribuicoes.Model.RegistroC180.TJSSpedContribuicoesModelRegistroC180;
  TJSSpedContribuicoesModelRegistroC181 = JSSpedContribuicoes.Model.RegistroC181.TJSSpedContribuicoesModelRegistroC181;
  TJSSpedContribuicoesModelRegistroC185 = JSSpedContribuicoes.Model.RegistroC185.TJSSpedContribuicoesModelRegistroC185;

  TJSSpedContribuicoesModelRegistroC380 = JSSpedContribuicoes.Model.RegistroC380.TJSSpedContribuicoesModelRegistroC380;
  TJSSpedContribuicoesModelRegistroC381 = JSSpedContribuicoes.Model.RegistroC381.TJSSpedContribuicoesModelRegistroC381;
  TJSSpedContribuicoesModelRegistroC385 = JSSpedContribuicoes.Model.RegistroC385.TJSSpedContribuicoesModelRegistroC385;
  TJSSpedContribuicoesModelRegistroC395 = JSSpedContribuicoes.Model.RegistroC395.TJSSpedContribuicoesModelRegistroC395;
  TJSSpedContribuicoesModelRegistroC396 = JSSpedContribuicoes.Model.RegistroC396.TJSSpedContribuicoesModelRegistroC396;

  TJSSpedContribuicoesModelRegistroC400 = JSSpedContribuicoes.Model.RegistroC400.TJSSpedContribuicoesModelRegistroC400;
  TJSSpedContribuicoesModelRegistroC405 = JSSpedContribuicoes.Model.RegistroC405.TJSSpedContribuicoesModelRegistroC405;
  TJSSpedContribuicoesModelRegistroC481 = JSSpedContribuicoes.Model.RegistroC481.TJSSpedContribuicoesModelRegistroC481;
  TJSSpedContribuicoesModelRegistroC485 = JSSpedContribuicoes.Model.RegistroC485.TJSSpedContribuicoesModelRegistroC485;
  TJSSpedContribuicoesModelRegistroC490 = JSSpedContribuicoes.Model.RegistroC490.TJSSpedContribuicoesModelRegistroC490;
  TJSSpedContribuicoesModelRegistroC491 = JSSpedContribuicoes.Model.RegistroC491.TJSSpedContribuicoesModelRegistroC491;
  TJSSpedContribuicoesModelRegistroC495 = JSSpedContribuicoes.Model.RegistroC495.TJSSpedContribuicoesModelRegistroC495;

  TJSSpedContribuicoesModelRegistroC500 = JSSpedContribuicoes.Model.RegistroC500.TJSSpedContribuicoesModelRegistroC500;
  TJSSpedContribuicoesModelRegistroC501 = JSSpedContribuicoes.Model.RegistroC501.TJSSpedContribuicoesModelRegistroC501;
  TJSSpedContribuicoesModelRegistroC505 = JSSpedContribuicoes.Model.RegistroC505.TJSSpedContribuicoesModelRegistroC505;

  TJSSpedContribuicoesModelRegistroC800 = JSSpedContribuicoes.Model.RegistroC800.TJSSpedContribuicoesModelRegistroC800;
  TJSSpedContribuicoesModelRegistroC810 = JSSpedContribuicoes.Model.RegistroC810.TJSSpedContribuicoesModelRegistroC810;
  TJSSpedContribuicoesModelRegistroC860 = JSSpedContribuicoes.Model.RegistroC860.TJSSpedContribuicoesModelRegistroC860;
  TJSSpedContribuicoesModelRegistroC870 = JSSpedContribuicoes.Model.RegistroC870.TJSSpedContribuicoesModelRegistroC870;
  TJSSpedContribuicoesModelRegistroC990 = JSSpedContribuicoes.Model.RegistroC990.TJSSpedContribuicoesModelRegistroC990;

  TJSSpedContribuicoesModelRegistroD001 = JSSpedContribuicoes.Model.RegistroD001.TJSSpedContribuicoesModelRegistroD001;
  TJSSpedContribuicoesModelRegistroD010 = JSSpedContribuicoes.Model.RegistroD010.TJSSpedContribuicoesModelRegistroD010;
  TJSSpedContribuicoesModelRegistroD100 = JSSpedContribuicoes.Model.RegistroD100.TJSSpedContribuicoesModelRegistroD100;
  TJSSpedContribuicoesModelRegistroD101 = JSSpedContribuicoes.Model.RegistroD101.TJSSpedContribuicoesModelRegistroD101;
  TJSSpedContribuicoesModelRegistroD105 = JSSpedContribuicoes.Model.RegistroD105.TJSSpedContribuicoesModelRegistroD105;
  TJSSpedContribuicoesModelRegistroD111 = JSSpedContribuicoes.Model.RegistroD111.TJSSpedContribuicoesModelRegistroD111;
  TJSSpedContribuicoesModelRegistroD200 = JSSpedContribuicoes.Model.RegistroD200.TJSSpedContribuicoesModelRegistroD200;
  TJSSpedContribuicoesModelRegistroD201 = JSSpedContribuicoes.Model.RegistroD201.TJSSpedContribuicoesModelRegistroD201;
  TJSSpedContribuicoesModelRegistroD205 = JSSpedContribuicoes.Model.RegistroD205.TJSSpedContribuicoesModelRegistroD205;
  TJSSpedContribuicoesModelRegistroD209 = JSSpedContribuicoes.Model.RegistroD209.TJSSpedContribuicoesModelRegistroD209;
  TJSSpedContribuicoesModelRegistroD500 = JSSpedContribuicoes.Model.RegistroD500.TJSSpedContribuicoesModelRegistroD500;
  TJSSpedContribuicoesModelRegistroD501 = JSSpedContribuicoes.Model.RegistroD501.TJSSpedContribuicoesModelRegistroD501;
  TJSSpedContribuicoesModelRegistroD505 = JSSpedContribuicoes.Model.RegistroD505.TJSSpedContribuicoesModelRegistroD505;
  TJSSpedContribuicoesModelRegistroD509 = JSSpedContribuicoes.Model.RegistroD509.TJSSpedContribuicoesModelRegistroD509;
  TJSSpedContribuicoesModelRegistroD990 = JSSpedContribuicoes.Model.RegistroD990.TJSSpedContribuicoesModelRegistroD990;

  TJSSpedContribuicoesModelRegistroF001 = JSSpedContribuicoes.Model.RegistroF001.TJSSpedContribuicoesModelRegistroF001;
  TJSSpedContribuicoesModelRegistroF010 = JSSpedContribuicoes.Model.RegistroF010.TJSSpedContribuicoesModelRegistroF010;
  TJSSpedContribuicoesModelRegistroF100 = JSSpedContribuicoes.Model.RegistroF100.TJSSpedContribuicoesModelRegistroF100;
  TJSSpedContribuicoesModelRegistroF111 = JSSpedContribuicoes.Model.RegistroF111.TJSSpedContribuicoesModelRegistroF111;
  TJSSpedContribuicoesModelRegistroF120 = JSSpedContribuicoes.Model.RegistroF120.TJSSpedContribuicoesModelRegistroF120;
  TJSSpedContribuicoesModelRegistroF129 = JSSpedContribuicoes.Model.RegistroF129.TJSSpedContribuicoesModelRegistroF129;
  TJSSpedContribuicoesModelRegistroF130 = JSSpedContribuicoes.Model.RegistroF130.TJSSpedContribuicoesModelRegistroF130;
  TJSSpedContribuicoesModelRegistroF139 = JSSpedContribuicoes.Model.RegistroF139.TJSSpedContribuicoesModelRegistroF139;

  TJSSpedContribuicoesModelRegistroF200 = JSSpedContribuicoes.Model.RegistroF200.TJSSpedContribuicoesModelRegistroF200;
  TJSSpedContribuicoesModelRegistroF205 = JSSpedContribuicoes.Model.RegistroF205.TJSSpedContribuicoesModelRegistroF205;
  TJSSpedContribuicoesModelRegistroF210 = JSSpedContribuicoes.Model.RegistroF210.TJSSpedContribuicoesModelRegistroF210;
  TJSSpedContribuicoesModelRegistroF211 = JSSpedContribuicoes.Model.RegistroF211.TJSSpedContribuicoesModelRegistroF211;

  TJSSpedContribuicoesModelRegistroF500 = JSSpedContribuicoes.Model.RegistroF500.TJSSpedContribuicoesModelRegistroF500;
  TJSSpedContribuicoesModelRegistroF525 = JSSpedContribuicoes.Model.RegistroF525.TJSSpedContribuicoesModelRegistroF525;
  TJSSpedContribuicoesModelRegistroF550 = JSSpedContribuicoes.Model.RegistroF550.TJSSpedContribuicoesModelRegistroF550;
  TJSSpedContribuicoesModelRegistroF600 = JSSpedContribuicoes.Model.RegistroF600.TJSSpedContribuicoesModelRegistroF600;
  TJSSpedContribuicoesModelRegistroF990 = JSSpedContribuicoes.Model.RegistroF990.TJSSpedContribuicoesModelRegistroF990;

  TJSSpedContribuicoesModelRegistroM001 = JSSpedContribuicoes.Model.RegistroM001.TJSSpedContribuicoesModelRegistroM001;
  TJSSpedContribuicoesModelRegistroM100 = JSSpedContribuicoes.Model.RegistroM100.TJSSpedContribuicoesModelRegistroM100;
  TJSSpedContribuicoesModelRegistroM105 = JSSpedContribuicoes.Model.RegistroM105.TJSSpedContribuicoesModelRegistroM105;
  TJSSpedContribuicoesModelRegistroM110 = JSSpedContribuicoes.Model.RegistroM110.TJSSpedContribuicoesModelRegistroM110;
  TJSSpedContribuicoesModelRegistroM115 = JSSpedContribuicoes.Model.RegistroM115.TJSSpedContribuicoesModelRegistroM115;
  TJSSpedContribuicoesModelRegistroM200 = JSSpedContribuicoes.Model.RegistroM200.TJSSpedContribuicoesModelRegistroM200;
  TJSSpedContribuicoesModelRegistroM205 = JSSpedContribuicoes.Model.RegistroM205.TJSSpedContribuicoesModelRegistroM205;
  TJSSpedContribuicoesModelRegistroM210 = JSSpedContribuicoes.Model.RegistroM210.TJSSpedContribuicoesModelRegistroM210;
  TJSSpedContribuicoesModelRegistroM220 = JSSpedContribuicoes.Model.RegistroM220.TJSSpedContribuicoesModelRegistroM220;
  TJSSpedContribuicoesModelRegistroM225 = JSSpedContribuicoes.Model.RegistroM225.TJSSpedContribuicoesModelRegistroM225;
  TJSSpedContribuicoesModelRegistroM350 = JSSpedContribuicoes.Model.RegistroM350.TJSSpedContribuicoesModelRegistroM350;
  TJSSpedContribuicoesModelRegistroM400 = JSSpedContribuicoes.Model.RegistroM400.TJSSpedContribuicoesModelRegistroM400;
  TJSSpedContribuicoesModelRegistroM410 = JSSpedContribuicoes.Model.RegistroM410.TJSSpedContribuicoesModelRegistroM410;
  TJSSpedContribuicoesModelRegistroM500 = JSSpedContribuicoes.Model.RegistroM500.TJSSpedContribuicoesModelRegistroM500;
  TJSSpedContribuicoesModelRegistroM505 = JSSpedContribuicoes.Model.RegistroM505.TJSSpedContribuicoesModelRegistroM505;
  TJSSpedContribuicoesModelRegistroM510 = JSSpedContribuicoes.Model.RegistroM510.TJSSpedContribuicoesModelRegistroM510;
  TJSSpedContribuicoesModelRegistroM515 = JSSpedContribuicoes.Model.RegistroM515.TJSSpedContribuicoesModelRegistroM515;
  TJSSpedContribuicoesModelRegistroM600 = JSSpedContribuicoes.Model.RegistroM600.TJSSpedContribuicoesModelRegistroM600;
  TJSSpedContribuicoesModelRegistroM605 = JSSpedContribuicoes.Model.RegistroM605.TJSSpedContribuicoesModelRegistroM605;
  TJSSpedContribuicoesModelRegistroM610 = JSSpedContribuicoes.Model.RegistroM610.TJSSpedContribuicoesModelRegistroM610;
  TJSSpedContribuicoesModelRegistroM620 = JSSpedContribuicoes.Model.RegistroM620.TJSSpedContribuicoesModelRegistroM620;
  TJSSpedContribuicoesModelRegistroM625 = JSSpedContribuicoes.Model.RegistroM625.TJSSpedContribuicoesModelRegistroM625;
  TJSSpedContribuicoesModelRegistroM800 = JSSpedContribuicoes.Model.RegistroM800.TJSSpedContribuicoesModelRegistroM800;
  TJSSpedContribuicoesModelRegistroM810 = JSSpedContribuicoes.Model.RegistroM810.TJSSpedContribuicoesModelRegistroM810;
  TJSSpedContribuicoesModelRegistroM990 = JSSpedContribuicoes.Model.RegistroM990.TJSSpedContribuicoesModelRegistroM990;

  TJSSpedContribuicoesModelRegistroP001 = JSSpedContribuicoes.Model.RegistroP001.TJSSpedContribuicoesModelRegistroP001;
  TJSSpedContribuicoesModelRegistroP010 = JSSpedContribuicoes.Model.RegistroP010.TJSSpedContribuicoesModelRegistroP010;
  TJSSpedContribuicoesModelRegistroP100 = JSSpedContribuicoes.Model.RegistroP100.TJSSpedContribuicoesModelRegistroP100;
  TJSSpedContribuicoesModelRegistroP200 = JSSpedContribuicoes.Model.RegistroP200.TJSSpedContribuicoesModelRegistroP200;
  TJSSpedContribuicoesModelRegistroP990 = JSSpedContribuicoes.Model.RegistroP990.TJSSpedContribuicoesModelRegistroP990;

implementation

end.
