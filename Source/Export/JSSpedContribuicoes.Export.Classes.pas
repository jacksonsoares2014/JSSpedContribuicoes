unit JSSpedContribuicoes.Export.Classes;

interface

uses
  JSSpedContribuicoes.Export.Registro0000,
  JSSpedContribuicoes.Export.Registro0001,
  JSSpedContribuicoes.Export.Registro0035,
  JSSpedContribuicoes.Export.Registro0100,
  JSSpedContribuicoes.Export.Registro0110,
  JSSpedContribuicoes.Export.Registro0111,
  JSSpedContribuicoes.Export.Registro0120,
  JSSpedContribuicoes.Export.Registro0140,
  JSSpedContribuicoes.Export.Registro0145,
  JSSpedContribuicoes.Export.Registro0150,
  JSSpedContribuicoes.Export.Registro0190,
  JSSpedContribuicoes.Export.Registro0200,
  JSSpedContribuicoes.Export.Registro0450,
  JSSpedContribuicoes.Export.Registro0500,
  JSSpedContribuicoes.Export.Registro0600,
  JSSpedContribuicoes.Export.Registro0900,
  JSSpedContribuicoes.Export.Registro0990,

  JSSpedContribuicoes.Export.Registro1001,
  JSSpedContribuicoes.Export.Registro1010,
  JSSpedContribuicoes.Export.Registro1011,
  JSSpedContribuicoes.Export.Registro1020,
  JSSpedContribuicoes.Export.Registro1050,
  JSSpedContribuicoes.Export.Registro1100,
  JSSpedContribuicoes.Export.Registro1101,
  JSSpedContribuicoes.Export.Registro1300,
  JSSpedContribuicoes.Export.Registro1500,
  JSSpedContribuicoes.Export.Registro1501,
  JSSpedContribuicoes.Export.Registro1700,
  JSSpedContribuicoes.Export.Registro1900,
  JSSpedContribuicoes.Export.Registro1990,

  JSSpedContribuicoes.Export.RegistroA001,
  JSSpedContribuicoes.Export.RegistroA010,
  JSSpedContribuicoes.Export.RegistroA100,
  JSSpedContribuicoes.Export.RegistroA110,
  JSSpedContribuicoes.Export.RegistroA111,
  JSSpedContribuicoes.Export.RegistroA170,
  JSSpedContribuicoes.Export.RegistroA990,

  JSSpedContribuicoes.Export.RegistroC001,
  JSSpedContribuicoes.Export.RegistroC010,
  JSSpedContribuicoes.Export.RegistroC100,
  JSSpedContribuicoes.Export.RegistroC110,
  JSSpedContribuicoes.Export.RegistroC111,
  JSSpedContribuicoes.Export.RegistroC120,
  JSSpedContribuicoes.Export.RegistroC170,
  JSSpedContribuicoes.Export.RegistroC175,
  JSSpedContribuicoes.Export.RegistroC180,
  JSSpedContribuicoes.Export.RegistroC181,
  JSSpedContribuicoes.Export.RegistroC185,
  JSSpedContribuicoes.Export.RegistroC380,
  JSSpedContribuicoes.Export.RegistroC381,
  JSSpedContribuicoes.Export.RegistroC385,
  JSSpedContribuicoes.Export.RegistroC400,
  JSSpedContribuicoes.Export.RegistroC405,
  JSSpedContribuicoes.Export.RegistroC481,
  JSSpedContribuicoes.Export.RegistroC485,
  JSSpedContribuicoes.Export.RegistroC490,
  JSSpedContribuicoes.Export.RegistroC491,
  JSSpedContribuicoes.Export.RegistroC495,
  JSSpedContribuicoes.Export.RegistroC500,
  JSSpedContribuicoes.Export.RegistroC501,
  JSSpedContribuicoes.Export.RegistroC505,
  JSSpedContribuicoes.Export.RegistroC800,
  JSSpedContribuicoes.Export.RegistroC810,
  JSSpedContribuicoes.Export.RegistroC860,
  JSSpedContribuicoes.Export.RegistroC870,
  JSSpedContribuicoes.Export.RegistroC990,

  JSSpedContribuicoes.Export.RegistroD001,
  JSSpedContribuicoes.Export.RegistroD010,
  JSSpedContribuicoes.Export.RegistroD100,
  JSSpedContribuicoes.Export.RegistroD101,
  JSSpedContribuicoes.Export.RegistroD105,
  JSSpedContribuicoes.Export.RegistroD111,
  JSSpedContribuicoes.Export.RegistroD200,
  JSSpedContribuicoes.Export.RegistroD201,
  JSSpedContribuicoes.Export.RegistroD205,
  JSSpedContribuicoes.Export.RegistroD209,
  JSSpedContribuicoes.Export.RegistroD500,
  JSSpedContribuicoes.Export.RegistroD501,
  JSSpedContribuicoes.Export.RegistroD505,
  JSSpedContribuicoes.Export.RegistroD509,
  JSSpedContribuicoes.Export.RegistroD990,

  JSSpedContribuicoes.Export.RegistroF001,
  JSSpedContribuicoes.Export.RegistroF010,
  JSSpedContribuicoes.Export.RegistroF100,
  JSSpedContribuicoes.Export.RegistroF120,
  JSSpedContribuicoes.Export.RegistroF129,
  JSSpedContribuicoes.Export.RegistroF130,
  JSSpedContribuicoes.Export.RegistroF139,
  JSSpedContribuicoes.Export.RegistroF111,
  JSSpedContribuicoes.Export.RegistroF200,
  JSSpedContribuicoes.Export.RegistroF205,
  JSSpedContribuicoes.Export.RegistroF210,
  JSSpedContribuicoes.Export.RegistroF211,
  JSSpedContribuicoes.Export.RegistroF500,
  JSSpedContribuicoes.Export.RegistroF525,
  JSSpedContribuicoes.Export.RegistroF550,
  JSSpedContribuicoes.Export.RegistroF600,
  JSSpedContribuicoes.Export.RegistroF990,

  JSSpedContribuicoes.Export.RegistroM001,
  JSSpedContribuicoes.Export.RegistroM100,
  JSSpedContribuicoes.Export.RegistroM105,
  JSSpedContribuicoes.Export.RegistroM110,
  JSSpedContribuicoes.Export.RegistroM115,
  JSSpedContribuicoes.Export.RegistroM200,
  JSSpedContribuicoes.Export.RegistroM205,
  JSSpedContribuicoes.Export.RegistroM210,
  //JSSpedContribuicoes.Export.RegistroM215,
  JSSpedContribuicoes.Export.RegistroM220,
  JSSpedContribuicoes.Export.RegistroM225,
  JSSpedContribuicoes.Export.RegistroM350,
  JSSpedContribuicoes.Export.RegistroM400,
  JSSpedContribuicoes.Export.RegistroM410,
  JSSpedContribuicoes.Export.RegistroM500,
  JSSpedContribuicoes.Export.RegistroM505,
  JSSpedContribuicoes.Export.RegistroM510,
  JSSpedContribuicoes.Export.RegistroM515,
  JSSpedContribuicoes.Export.RegistroM600,
  JSSpedContribuicoes.Export.RegistroM605,
  JSSpedContribuicoes.Export.RegistroM610,
  //JSSpedContribuicoes.Export.RegistroM615,
  JSSpedContribuicoes.Export.RegistroM620,
  JSSpedContribuicoes.Export.RegistroM625,
  JSSpedContribuicoes.Export.RegistroM800,
  JSSpedContribuicoes.Export.RegistroM810,
  JSSpedContribuicoes.Export.RegistroM990,

  JSSpedContribuicoes.Export.RegistroP001,
  JSSpedContribuicoes.Export.RegistroP010,
  JSSpedContribuicoes.Export.RegistroP100,
  JSSpedContribuicoes.Export.RegistroP200,
  JSSpedContribuicoes.Export.RegistroP990;


type
  TJSSpedContribuicoesExportRegistro0000 = JSSpedContribuicoes.Export.Registro0000.TJSSpedContribuicoesExportRegistro0000;
  TJSSpedContribuicoesExportRegistro0001 = JSSpedContribuicoes.Export.Registro0001.TJSSpedContribuicoesExportRegistro0001;
  TJSSpedContribuicoesExportRegistro0035 = JSSpedContribuicoes.Export.Registro0035.TJSSpedContribuicoesExportRegistro0035;
  TJSSpedContribuicoesExportRegistro0100 = JSSpedContribuicoes.Export.Registro0100.TJSSpedContribuicoesExportRegistro0100;
  TJSSpedContribuicoesExportRegistro0110 = JSSpedContribuicoes.Export.Registro0110.TJSSpedContribuicoesExportRegistro0110;
  TJSSpedContribuicoesExportRegistro0111 = JSSpedContribuicoes.Export.Registro0111.TJSSpedContribuicoesExportRegistro0111;
  TJSSpedContribuicoesExportRegistro0120 = JSSpedContribuicoes.Export.Registro0120.TJSSpedContribuicoesExportRegistro0120;
  TJSSpedContribuicoesExportRegistro0140 = JSSpedContribuicoes.Export.Registro0140.TJSSpedContribuicoesExportRegistro0140;
  TJSSpedContribuicoesExportRegistro0145 = JSSpedContribuicoes.Export.Registro0145.TJSSpedContribuicoesExportRegistro0145;
  TJSSpedContribuicoesExportRegistro0150 = JSSpedContribuicoes.Export.Registro0150.TJSSpedContribuicoesExportRegistro0150;
  TJSSpedContribuicoesExportRegistro0190 = JSSpedContribuicoes.Export.Registro0190.TJSSpedContribuicoesExportRegistro0190;
  TJSSpedContribuicoesExportRegistro0200 = JSSpedContribuicoes.Export.Registro0200.TJSSpedContribuicoesExportRegistro0200;
  TJSSpedContribuicoesExportRegistro0450 = JSSpedContribuicoes.Export.Registro0450.TJSSpedContribuicoesExportRegistro0450;
  TJSSpedContribuicoesExportRegistro0500 = JSSpedContribuicoes.Export.Registro0500.TJSSpedContribuicoesExportRegistro0500;
  TJSSpedContribuicoesExportRegistro0600 = JSSpedContribuicoes.Export.Registro0600.TJSSpedContribuicoesExportRegistro0600;
  TJSSpedContribuicoesExportRegistro0900 = JSSpedContribuicoes.Export.Registro0900.TJSSpedContribuicoesExportRegistro0900;
  TJSSpedContribuicoesExportRegistro0990 = JSSpedContribuicoes.Export.Registro0990.TJSSpedContribuicoesExportRegistro0990;

  TJSSpedContribuicoesExportRegistro1001 = JSSpedContribuicoes.Export.Registro1001.TJSSpedContribuicoesExportRegistro1001;
  TJSSpedContribuicoesExportRegistro1010 = JSSpedContribuicoes.Export.Registro1010.TJSSpedContribuicoesExportRegistro1010;
  TJSSpedContribuicoesExportRegistro1011 = JSSpedContribuicoes.Export.Registro1011.TJSSpedContribuicoesExportRegistro1011;
  TJSSpedContribuicoesExportRegistro1020 = JSSpedContribuicoes.Export.Registro1020.TJSSpedContribuicoesExportRegistro1020;
  TJSSpedContribuicoesExportRegistro1050 = JSSpedContribuicoes.Export.Registro1050.TJSSpedContribuicoesExportRegistro1050;
  TJSSpedContribuicoesExportRegistro1100 = JSSpedContribuicoes.Export.Registro1100.TJSSpedContribuicoesExportRegistro1100;
  TJSSpedContribuicoesExportRegistro1101 = JSSpedContribuicoes.Export.Registro1101.TJSSpedContribuicoesExportRegistro1101;
  TJSSpedContribuicoesExportRegistro1300 = JSSpedContribuicoes.Export.Registro1300.TJSSpedContribuicoesExportRegistro1300;
  TJSSpedContribuicoesExportRegistro1500 = JSSpedContribuicoes.Export.Registro1500.TJSSpedContribuicoesExportRegistro1500;
  TJSSpedContribuicoesExportRegistro1501 = JSSpedContribuicoes.Export.Registro1501.TJSSpedContribuicoesExportRegistro1501;
  TJSSpedContribuicoesExportRegistro1700 = JSSpedContribuicoes.Export.Registro1700.TJSSpedContribuicoesExportRegistro1700;
  TJSSpedContribuicoesExportRegistro1900 = JSSpedContribuicoes.Export.Registro1900.TJSSpedContribuicoesExportRegistro1900;
  TJSSpedContribuicoesExportRegistro1990 = JSSpedContribuicoes.Export.Registro1990.TJSSpedContribuicoesExportRegistro1990;

  TJSSpedContribuicoesExportRegistroA001 = JSSpedContribuicoes.Export.RegistroA001.TJSSpedContribuicoesExportRegistroA001;
  TJSSpedContribuicoesExportRegistroA010 = JSSpedContribuicoes.Export.RegistroA010.TJSSpedContribuicoesExportRegistroA010;
  TJSSpedContribuicoesExportRegistroA100 = JSSpedContribuicoes.Export.RegistroA100.TJSSpedContribuicoesExportRegistroA100;
  TJSSpedContribuicoesExportRegistroA110 = JSSpedContribuicoes.Export.RegistroA110.TJSSpedContribuicoesExportRegistroA110;
  TJSSpedContribuicoesExportRegistroA111 = JSSpedContribuicoes.Export.RegistroA111.TJSSpedContribuicoesExportRegistroA111;
  TJSSpedContribuicoesExportRegistroA170 = JSSpedContribuicoes.Export.RegistroA170.TJSSpedContribuicoesExportRegistroA170;
  TJSSpedContribuicoesExportRegistroA990 = JSSpedContribuicoes.Export.RegistroA990.TJSSpedContribuicoesExportRegistroA990;

  TJSSpedContribuicoesExportRegistroC001 = JSSpedContribuicoes.Export.RegistroC001.TJSSpedContribuicoesExportRegistroC001;
  TJSSpedContribuicoesExportRegistroC010 = JSSpedContribuicoes.Export.RegistroC010.TJSSpedContribuicoesExportRegistroC010;
  TJSSpedContribuicoesExportRegistroC100 = JSSpedContribuicoes.Export.RegistroC100.TJSSpedContribuicoesExportRegistroC100;
  TJSSpedContribuicoesExportRegistroC110 = JSSpedContribuicoes.Export.RegistroC110.TJSSpedContribuicoesExportRegistroC110;
  TJSSpedContribuicoesExportRegistroC111 = JSSpedContribuicoes.Export.RegistroC111.TJSSpedContribuicoesExportRegistroC111;
  TJSSpedContribuicoesExportRegistroC120 = JSSpedContribuicoes.Export.RegistroC120.TJSSpedContribuicoesExportRegistroC120;
  TJSSpedContribuicoesExportRegistroC170 = JSSpedContribuicoes.Export.RegistroC170.TJSSpedContribuicoesExportRegistroC170;
  TJSSpedContribuicoesExportRegistroC175 = JSSpedContribuicoes.Export.RegistroC175.TJSSpedContribuicoesExportRegistroC175;
  TJSSpedContribuicoesExportRegistroC180 = JSSpedContribuicoes.Export.RegistroC180.TJSSpedContribuicoesExportRegistroC180;
  TJSSpedContribuicoesExportRegistroC181 = JSSpedContribuicoes.Export.RegistroC181.TJSSpedContribuicoesExportRegistroC181;
  TJSSpedContribuicoesExportRegistroC185 = JSSpedContribuicoes.Export.RegistroC185.TJSSpedContribuicoesExportRegistroC185;
  TJSSpedContribuicoesExportRegistroC380 = JSSpedContribuicoes.Export.RegistroC380.TJSSpedContribuicoesExportRegistroC380;
  TJSSpedContribuicoesExportRegistroC381 = JSSpedContribuicoes.Export.RegistroC381.TJSSpedContribuicoesExportRegistroC381;
  TJSSpedContribuicoesExportRegistroC385 = JSSpedContribuicoes.Export.RegistroC385.TJSSpedContribuicoesExportRegistroC385;
  TJSSpedContribuicoesExportRegistroC400 = JSSpedContribuicoes.Export.RegistroC400.TJSSpedContribuicoesExportRegistroC400;
  TJSSpedContribuicoesExportRegistroC405 = JSSpedContribuicoes.Export.RegistroC405.TJSSpedContribuicoesExportRegistroC405;
  TJSSpedContribuicoesExportRegistroC481 = JSSpedContribuicoes.Export.RegistroC481.TJSSpedContribuicoesExportRegistroC481;
  TJSSpedContribuicoesExportRegistroC485 = JSSpedContribuicoes.Export.RegistroC485.TJSSpedContribuicoesExportRegistroC485;
  TJSSpedContribuicoesExportRegistroC490 = JSSpedContribuicoes.Export.RegistroC490.TJSSpedContribuicoesExportRegistroC490;
  TJSSpedContribuicoesExportRegistroC491 = JSSpedContribuicoes.Export.RegistroC491.TJSSpedContribuicoesExportRegistroC491;
  TJSSpedContribuicoesExportRegistroC495 = JSSpedContribuicoes.Export.RegistroC495.TJSSpedContribuicoesExportRegistroC495;
  TJSSpedContribuicoesExportRegistroC500 = JSSpedContribuicoes.Export.RegistroC500.TJSSpedContribuicoesExportRegistroC500;
  TJSSpedContribuicoesExportRegistroC501 = JSSpedContribuicoes.Export.RegistroC501.TJSSpedContribuicoesExportRegistroC501;
  TJSSpedContribuicoesExportRegistroC505 = JSSpedContribuicoes.Export.RegistroC505.TJSSpedContribuicoesExportRegistroC505;
  TJSSpedContribuicoesExportRegistroC800 = JSSpedContribuicoes.Export.RegistroC800.TJSSpedContribuicoesExportRegistroC800;
  TJSSpedContribuicoesExportRegistroC810 = JSSpedContribuicoes.Export.RegistroC810.TJSSpedContribuicoesExportRegistroC810;
  TJSSpedContribuicoesExportRegistroC860 = JSSpedContribuicoes.Export.RegistroC860.TJSSpedContribuicoesExportRegistroC860;
  TJSSpedContribuicoesExportRegistroC870 = JSSpedContribuicoes.Export.RegistroC870.TJSSpedContribuicoesExportRegistroC870;
  TJSSpedContribuicoesExportRegistroC990 = JSSpedContribuicoes.Export.RegistroC990.TJSSpedContribuicoesExportRegistroC990;

  TJSSpedContribuicoesExportRegistroD001 = JSSpedContribuicoes.Export.RegistroD001.TJSSpedContribuicoesExportRegistroD001;
  TJSSpedContribuicoesExportRegistroD010 = JSSpedContribuicoes.Export.RegistroD010.TJSSpedContribuicoesExportRegistroD010;
  TJSSpedContribuicoesExportRegistroD100 = JSSpedContribuicoes.Export.RegistroD100.TJSSpedContribuicoesExportRegistroD100;
  TJSSpedContribuicoesExportRegistroD101 = JSSpedContribuicoes.Export.RegistroD101.TJSSpedContribuicoesExportRegistroD101;
  TJSSpedContribuicoesExportRegistroD105 = JSSpedContribuicoes.Export.RegistroD105.TJSSpedContribuicoesExportRegistroD105;
  TJSSpedContribuicoesExportRegistroD111 = JSSpedContribuicoes.Export.RegistroD111.TJSSpedContribuicoesExportRegistroD111;
  TJSSpedContribuicoesExportRegistroD200 = JSSpedContribuicoes.Export.RegistroD200.TJSSpedContribuicoesExportRegistroD200;
  TJSSpedContribuicoesExportRegistroD201 = JSSpedContribuicoes.Export.RegistroD201.TJSSpedContribuicoesExportRegistroD201;
  TJSSpedContribuicoesExportRegistroD205 = JSSpedContribuicoes.Export.RegistroD205.TJSSpedContribuicoesExportRegistroD205;
  TJSSpedContribuicoesExportRegistroD209 = JSSpedContribuicoes.Export.RegistroD209.TJSSpedContribuicoesExportRegistroD209;
  TJSSpedContribuicoesExportRegistroD500 = JSSpedContribuicoes.Export.RegistroD500.TJSSpedContribuicoesExportRegistroD500;
  TJSSpedContribuicoesExportRegistroD501 = JSSpedContribuicoes.Export.RegistroD501.TJSSpedContribuicoesExportRegistroD501;
  TJSSpedContribuicoesExportRegistroD505 = JSSpedContribuicoes.Export.RegistroD505.TJSSpedContribuicoesExportRegistroD505;
  TJSSpedContribuicoesExportRegistroD509 = JSSpedContribuicoes.Export.RegistroD509.TJSSpedContribuicoesExportRegistroD509;
  TJSSpedContribuicoesExportRegistroD990 = JSSpedContribuicoes.Export.RegistroD990.TJSSpedContribuicoesExportRegistroD990;

  TJSSpedContribuicoesExportRegistroF001 = JSSpedContribuicoes.Export.RegistroF001.TJSSpedContribuicoesExportRegistroF001;
  TJSSpedContribuicoesExportRegistroF010 = JSSpedContribuicoes.Export.RegistroF010.TJSSpedContribuicoesExportRegistroF010;
  TJSSpedContribuicoesExportRegistroF100 = JSSpedContribuicoes.Export.RegistroF100.TJSSpedContribuicoesExportRegistroF100;
  TJSSpedContribuicoesExportRegistroF120 = JSSpedContribuicoes.Export.RegistroF120.TJSSpedContribuicoesExportRegistroF120;
  TJSSpedContribuicoesExportRegistroF129 = JSSpedContribuicoes.Export.RegistroF129.TJSSpedContribuicoesExportRegistroF129;
  TJSSpedContribuicoesExportRegistroF130 = JSSpedContribuicoes.Export.RegistroF130.TJSSpedContribuicoesExportRegistroF130;
  TJSSpedContribuicoesExportRegistroF139 = JSSpedContribuicoes.Export.RegistroF139.TJSSpedContribuicoesExportRegistroF139;
  TJSSpedContribuicoesExportRegistroF111 = JSSpedContribuicoes.Export.RegistroF111.TJSSpedContribuicoesExportRegistroF111;
  TJSSpedContribuicoesExportRegistroF200 = JSSpedContribuicoes.Export.RegistroF200.TJSSpedContribuicoesExportRegistroF200;
  TJSSpedContribuicoesExportRegistroF205 = JSSpedContribuicoes.Export.RegistroF205.TJSSpedContribuicoesExportRegistroF205;
  TJSSpedContribuicoesExportRegistroF210 = JSSpedContribuicoes.Export.RegistroF210.TJSSpedContribuicoesExportRegistroF210;
  TJSSpedContribuicoesExportRegistroF211 = JSSpedContribuicoes.Export.RegistroF211.TJSSpedContribuicoesExportRegistroF211;
  TJSSpedContribuicoesExportRegistroF500 = JSSpedContribuicoes.Export.RegistroF500.TJSSpedContribuicoesExportRegistroF500;
  TJSSpedContribuicoesExportRegistroF525 = JSSpedContribuicoes.Export.RegistroF525.TJSSpedContribuicoesExportRegistroF525;
  TJSSpedContribuicoesExportRegistroF550 = JSSpedContribuicoes.Export.RegistroF550.TJSSpedContribuicoesExportRegistroF550;
  TJSSpedContribuicoesExportRegistroF600 = JSSpedContribuicoes.Export.RegistroF600.TJSSpedContribuicoesExportRegistroF600;
  TJSSpedContribuicoesExportRegistroF990 = JSSpedContribuicoes.Export.RegistroF990.TJSSpedContribuicoesExportRegistroF990;

  TJSSpedContribuicoesExportRegistroM001 = JSSpedContribuicoes.Export.RegistroM001.TJSSpedContribuicoesExportRegistroM001;
  TJSSpedContribuicoesExportRegistroM100 = JSSpedContribuicoes.Export.RegistroM100.TJSSpedContribuicoesExportRegistroM100;
  TJSSpedContribuicoesExportRegistroM105 = JSSpedContribuicoes.Export.RegistroM105.TJSSpedContribuicoesExportRegistroM105;
  TJSSpedContribuicoesExportRegistroM110 = JSSpedContribuicoes.Export.RegistroM110.TJSSpedContribuicoesExportRegistroM110;
  TJSSpedContribuicoesExportRegistroM115 = JSSpedContribuicoes.Export.RegistroM115.TJSSpedContribuicoesExportRegistroM115;
  TJSSpedContribuicoesExportRegistroM200 = JSSpedContribuicoes.Export.RegistroM200.TJSSpedContribuicoesExportRegistroM200;
  TJSSpedContribuicoesExportRegistroM205 = JSSpedContribuicoes.Export.RegistroM205.TJSSpedContribuicoesExportRegistroM205;
  TJSSpedContribuicoesExportRegistroM210 = JSSpedContribuicoes.Export.RegistroM210.TJSSpedContribuicoesExportRegistroM210;
  //TJSSpedContribuicoesExportRegistroM215 = JSSpedContribuicoes.Export.RegistroM215.TJSSpedContribuicoesExportRegistroM201;
  TJSSpedContribuicoesExportRegistroM220 = JSSpedContribuicoes.Export.RegistroM220.TJSSpedContribuicoesExportRegistroM220;
  TJSSpedContribuicoesExportRegistroM225 = JSSpedContribuicoes.Export.RegistroM225.TJSSpedContribuicoesExportRegistroM225;
  TJSSpedContribuicoesExportRegistroM350 = JSSpedContribuicoes.Export.RegistroM350.TJSSpedContribuicoesExportRegistroM350;
  TJSSpedContribuicoesExportRegistroM400 = JSSpedContribuicoes.Export.RegistroM400.TJSSpedContribuicoesExportRegistroM400;
  TJSSpedContribuicoesExportRegistroM410 = JSSpedContribuicoes.Export.RegistroM410.TJSSpedContribuicoesExportRegistroM410;
  TJSSpedContribuicoesExportRegistroM500 = JSSpedContribuicoes.Export.RegistroM500.TJSSpedContribuicoesExportRegistroM500;
  TJSSpedContribuicoesExportRegistroM505 = JSSpedContribuicoes.Export.RegistroM505.TJSSpedContribuicoesExportRegistroM505;
  TJSSpedContribuicoesExportRegistroM510 = JSSpedContribuicoes.Export.RegistroM510.TJSSpedContribuicoesExportRegistroM510;
  TJSSpedContribuicoesExportRegistroM515 = JSSpedContribuicoes.Export.RegistroM515.TJSSpedContribuicoesExportRegistroM515;
  TJSSpedContribuicoesExportRegistroM600 = JSSpedContribuicoes.Export.RegistroM600.TJSSpedContribuicoesExportRegistroM600;
  TJSSpedContribuicoesExportRegistroM605 = JSSpedContribuicoes.Export.RegistroM605.TJSSpedContribuicoesExportRegistroM605;
  TJSSpedContribuicoesExportRegistroM610 = JSSpedContribuicoes.Export.RegistroM610.TJSSpedContribuicoesExportRegistroM610;
  //TJSSpedContribuicoesExportRegistroM615 = JSSpedContribuicoes.Export.RegistroM615.TJSSpedContribuicoesExportRegistroM615;
  TJSSpedContribuicoesExportRegistroM620 = JSSpedContribuicoes.Export.RegistroM620.TJSSpedContribuicoesExportRegistroM620;
  TJSSpedContribuicoesExportRegistroM625 = JSSpedContribuicoes.Export.RegistroM625.TJSSpedContribuicoesExportRegistroM625;
  TJSSpedContribuicoesExportRegistroM800 = JSSpedContribuicoes.Export.RegistroM800.TJSSpedContribuicoesExportRegistroM800;
  TJSSpedContribuicoesExportRegistroM810 = JSSpedContribuicoes.Export.RegistroM810.TJSSpedContribuicoesExportRegistroM810;
  TJSSpedContribuicoesExportRegistroM990 = JSSpedContribuicoes.Export.RegistroM990.TJSSpedContribuicoesExportRegistroM990;

  TJSSpedContribuicoesExportRegistroP001 = JSSpedContribuicoes.Export.RegistroP001.TJSSpedContribuicoesExportRegistroP001;
  TJSSpedContribuicoesExportRegistroP010 = JSSpedContribuicoes.Export.RegistroP010.TJSSpedContribuicoesExportRegistroP010;
  TJSSpedContribuicoesExportRegistroP100 = JSSpedContribuicoes.Export.RegistroP100.TJSSpedContribuicoesExportRegistroP100;
  TJSSpedContribuicoesExportRegistroP200 = JSSpedContribuicoes.Export.RegistroP200.TJSSpedContribuicoesExportRegistroP200;
  TJSSpedContribuicoesExportRegistroP990 = JSSpedContribuicoes.Export.RegistroP990.TJSSpedContribuicoesExportRegistroP990;

implementation

end.






