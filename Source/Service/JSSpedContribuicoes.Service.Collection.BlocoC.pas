unit JSSpedContribuicoes.Service.Collection.BlocoC;

interface

uses
  JSSpedContribuicoes.Service.Collection.Base,
  JSSpedContribuicoes.Service.Interfaces,
  JSSpedContribuicoes.DAO.Interfaces,
  System.Generics.Collections;

type
  TJSSpedContribuicoesServiceCollectionBlocoC = class(TJSSpedContribuicoesServiceCollectionBase, IJSSpedContribuicoesDAOCollectionBlocoC)
  private
    FCollectionDAOC100: TList<IJSSpedContribuicoesDAOC100>;
    FCollectionDAOC500: TList<IJSSpedContribuicoesDAOC500>;

    FDAOC010: IJSSpedContribuicoesDAOC010;
    FDAOC110: IJSSpedContribuicoesDAOC110;
    FDAOC111: IJSSpedContribuicoesDAOC111;
    FDAOC120: IJSSpedContribuicoesDAOC120;
    FDAOC170: IJSSpedContribuicoesDAOC170;
    FDAOC175: IJSSpedContribuicoesDAOC175;
    FDAOC180: IJSSpedContribuicoesDAOC180;
    FDAOC181: IJSSpedContribuicoesDAOC181;
    FDAOC185: IJSSpedContribuicoesDAOC185;
    FDAOC380: IJSSpedContribuicoesDAOC380;
    FDAOC381: IJSSpedContribuicoesDAOC381;
    FDAOC385: IJSSpedContribuicoesDAOC385;
    FDAOC395: IJSSpedContribuicoesDAOC395;
    FDAOC396: IJSSpedContribuicoesDAOC396;
    FDAOC400: IJSSpedContribuicoesDAOC400;
    FDAOC405: IJSSpedContribuicoesDAOC405;
    FDAOC481: IJSSpedContribuicoesDAOC481;
    FDAOC485: IJSSpedContribuicoesDAOC485;
    FDAOC490: IJSSpedContribuicoesDAOC490;
    FDAOC491: IJSSpedContribuicoesDAOC491;
    FDAOC495: IJSSpedContribuicoesDAOC495;
    FDAOC501: IJSSpedContribuicoesDAOC501;
    FDAOC505: IJSSpedContribuicoesDAOC505;
    FDAOC800: IJSSpedContribuicoesDAOC800;
    FDAOC810: IJSSpedContribuicoesDAOC810;
    FDAOC860: IJSSpedContribuicoesDAOC860;
    FDAOC870: IJSSpedContribuicoesDAOC870;

  public
    function AddC010(Value: IJSSpedContribuicoesDAOC010): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC100(Value: IJSSpedContribuicoesDAOC100): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC110(Value: IJSSpedContribuicoesDAOC110): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC111(Value: IJSSpedContribuicoesDAOC111): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC120(Value: IJSSpedContribuicoesDAOC120): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC170(Value: IJSSpedContribuicoesDAOC170): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC175(Value: IJSSpedContribuicoesDAOC175): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC180(Value: IJSSpedContribuicoesDAOC180): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC181(Value: IJSSpedContribuicoesDAOC181): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC185(Value: IJSSpedContribuicoesDAOC185): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC380(Value: IJSSpedContribuicoesDAOC380): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC381(Value: IJSSpedContribuicoesDAOC381): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC385(Value: IJSSpedContribuicoesDAOC385): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC395(Value: IJSSpedContribuicoesDAOC395): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC396(Value: IJSSpedContribuicoesDAOC396): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC400(Value: IJSSpedContribuicoesDAOC400): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC405(Value: IJSSpedContribuicoesDAOC405): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC481(Value: IJSSpedContribuicoesDAOC481): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC485(Value: IJSSpedContribuicoesDAOC485): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC490(Value: IJSSpedContribuicoesDAOC490): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC491(Value: IJSSpedContribuicoesDAOC491): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC495(Value: IJSSpedContribuicoesDAOC495): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC500(Value: IJSSpedContribuicoesDAOC500): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC501(Value: IJSSpedContribuicoesDAOC501): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC505(Value: IJSSpedContribuicoesDAOC505): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC800(Value: IJSSpedContribuicoesDAOC800): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC810(Value: IJSSpedContribuicoesDAOC810): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC860(Value: IJSSpedContribuicoesDAOC860): IJSSpedContribuicoesDAOCollectionBlocoC;
    function AddC870(Value: IJSSpedContribuicoesDAOC870): IJSSpedContribuicoesDAOCollectionBlocoC;

    function CountC100: Integer;
    function CountC500: Integer;

    function DAOC010: IJSSpedContribuicoesDAOC010;
    function DAOC100(Index: Integer): IJSSpedContribuicoesDAOC100;
    function DAOC110: IJSSpedContribuicoesDAOC110;
    function DAOC111: IJSSpedContribuicoesDAOC111;
    function DAOC120: IJSSpedContribuicoesDAOC120;
    function DAOC170: IJSSpedContribuicoesDAOC170;
    function DAOC175: IJSSpedContribuicoesDAOC175;
    function DAOC180: IJSSpedContribuicoesDAOC180;
    function DAOC181: IJSSpedContribuicoesDAOC181;
    function DAOC185: IJSSpedContribuicoesDAOC185;
    function DAOC380: IJSSpedContribuicoesDAOC380;
    function DAOC381: IJSSpedContribuicoesDAOC381;
    function DAOC385: IJSSpedContribuicoesDAOC385;
    function DAOC395: IJSSpedContribuicoesDAOC395;
    function DAOC396: IJSSpedContribuicoesDAOC396;
    function DAOC400: IJSSpedContribuicoesDAOC400;
    function DAOC405: IJSSpedContribuicoesDAOC405;
    function DAOC481: IJSSpedContribuicoesDAOC481;
    function DAOC485: IJSSpedContribuicoesDAOC485;
    function DAOC490: IJSSpedContribuicoesDAOC490;
    function DAOC491: IJSSpedContribuicoesDAOC491;
    function DAOC495: IJSSpedContribuicoesDAOC495;
    function DAOC500(Index: Integer): IJSSpedContribuicoesDAOC500;
    function DAOC501: IJSSpedContribuicoesDAOC501;
    function DAOC505: IJSSpedContribuicoesDAOC505;
    function DAOC800: IJSSpedContribuicoesDAOC800;
    function DAOC810: IJSSpedContribuicoesDAOC810;
    function DAOC860: IJSSpedContribuicoesDAOC860;
    function DAOC870: IJSSpedContribuicoesDAOC870;

    function &Begin: IJSSpedContribuicoesDAOCollectionBlocoC;

    constructor create(DAOCollection: IJSSpedContribuicoesDAOCollection); override;
    class function New(DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoC;
    destructor Destroy; override;
  end;

implementation

{ TJSSpedContribuicoesServiceCollectionBlocoC }

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC010(
  Value: IJSSpedContribuicoesDAOC010): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC010 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC100(
  Value: IJSSpedContribuicoesDAOC100): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FCollectionDAOC100.Add(Value);
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC110(
  Value: IJSSpedContribuicoesDAOC110): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC110 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC111(
  Value: IJSSpedContribuicoesDAOC111): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC111 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC120(
  Value: IJSSpedContribuicoesDAOC120): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC120 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC170(
  Value: IJSSpedContribuicoesDAOC170): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC170 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC175(
  Value: IJSSpedContribuicoesDAOC175): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC175 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC180(
  Value: IJSSpedContribuicoesDAOC180): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC180 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC181(
  Value: IJSSpedContribuicoesDAOC181): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC181 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC185(
  Value: IJSSpedContribuicoesDAOC185): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC185 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC380(
  Value: IJSSpedContribuicoesDAOC380): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC380 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC381(
  Value: IJSSpedContribuicoesDAOC381): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC381 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC385(
  Value: IJSSpedContribuicoesDAOC385): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC385 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC395(
  Value: IJSSpedContribuicoesDAOC395): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC395 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC396(
  Value: IJSSpedContribuicoesDAOC396): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC396 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC400(
  Value: IJSSpedContribuicoesDAOC400): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC400 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC405(
  Value: IJSSpedContribuicoesDAOC405): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC405 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC481(
  Value: IJSSpedContribuicoesDAOC481): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC481 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC485(
  Value: IJSSpedContribuicoesDAOC485): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC485 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC490(
  Value: IJSSpedContribuicoesDAOC490): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC490 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC491(
  Value: IJSSpedContribuicoesDAOC491): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC491 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC495(
  Value: IJSSpedContribuicoesDAOC495): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC495 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC500(
  Value: IJSSpedContribuicoesDAOC500): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FCollectionDAOC500.Add(Value);
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC501(
  Value: IJSSpedContribuicoesDAOC501): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC501 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC505(
  Value: IJSSpedContribuicoesDAOC505): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC505 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC800(
  Value: IJSSpedContribuicoesDAOC800): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC800 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC810(
  Value: IJSSpedContribuicoesDAOC810): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC810 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC860(
  Value: IJSSpedContribuicoesDAOC860): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC860 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.AddC870(
  Value: IJSSpedContribuicoesDAOC870): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result   := Self;
  FDAOC870 := Value;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.&Begin: IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result := Self;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.CountC100: Integer;
begin
  result := FCollectionDAOC100.Count;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.CountC500: Integer;
begin
  result := FCollectionDAOC500.Count;
end;

constructor TJSSpedContribuicoesServiceCollectionBlocoC.create(
  DAOCollection: IJSSpedContribuicoesDAOCollection);
begin
  inherited;
  FCollectionDAOC100 := TList<IJSSpedContribuicoesDAOC100>.Create;
  FCollectionDAOC500 := TList<IJSSpedContribuicoesDAOC500>.Create;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC800: IJSSpedContribuicoesDAOC800;
begin
  Result := FDAOC800;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC010: IJSSpedContribuicoesDAOC010;
begin
  Result := FDAOC010;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC100(Index: Integer): IJSSpedContribuicoesDAOC100;
begin
  Result := FCollectionDAOC100[Index];
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC110: IJSSpedContribuicoesDAOC110;
begin
  Result := FDAOC110;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC111: IJSSpedContribuicoesDAOC111;
begin
  Result := FDAOC111;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC120: IJSSpedContribuicoesDAOC120;
begin
  Result := FDAOC120;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC170: IJSSpedContribuicoesDAOC170;
begin
  Result := FDAOC170;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC175: IJSSpedContribuicoesDAOC175;
begin
  Result := FDAOC175;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC180: IJSSpedContribuicoesDAOC180;
begin
  Result := FDAOC180;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC181: IJSSpedContribuicoesDAOC181;
begin
  Result := FDAOC181;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC185: IJSSpedContribuicoesDAOC185;
begin
  Result := FDAOC185;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC380: IJSSpedContribuicoesDAOC380;
begin
  Result := FDAOC380;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC381: IJSSpedContribuicoesDAOC381;
begin
  Result := FDAOC381;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC385: IJSSpedContribuicoesDAOC385;
begin
  Result := FDAOC385;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC395: IJSSpedContribuicoesDAOC395;
begin
  Result := FDAOC395;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC396: IJSSpedContribuicoesDAOC396;
begin
  Result := FDAOC396;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC400: IJSSpedContribuicoesDAOC400;
begin
  Result := FDAOC400;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC405: IJSSpedContribuicoesDAOC405;
begin
  Result := FDAOC405;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC481: IJSSpedContribuicoesDAOC481;
begin
  Result := FDAOC481;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC485: IJSSpedContribuicoesDAOC485;
begin
  Result := FDAOC485;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC490: IJSSpedContribuicoesDAOC490;
begin
  Result := FDAOC490;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC491: IJSSpedContribuicoesDAOC491;
begin
  Result := FDAOC491;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC495: IJSSpedContribuicoesDAOC495;
begin
  Result := FDAOC495;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC500(Index: Integer): IJSSpedContribuicoesDAOC500;
begin
  Result := FCollectionDAOC500[Index];
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC501: IJSSpedContribuicoesDAOC501;
begin
  Result := FDAOC501;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC505: IJSSpedContribuicoesDAOC505;
begin
  Result := FDAOC505;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC810: IJSSpedContribuicoesDAOC810;
begin
  Result := FDAOC810;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC860: IJSSpedContribuicoesDAOC860;
begin
  Result := FDAOC860;
end;

function TJSSpedContribuicoesServiceCollectionBlocoC.DAOC870: IJSSpedContribuicoesDAOC870;
begin
  Result := FDAOC870;
end;

destructor TJSSpedContribuicoesServiceCollectionBlocoC.Destroy;
begin
  FCollectionDAOC100.Free;
  FCollectionDAOC500.Free;
  inherited;
end;

class function TJSSpedContribuicoesServiceCollectionBlocoC.New(
  DAOCollection: IJSSpedContribuicoesDAOCollection): IJSSpedContribuicoesDAOCollectionBlocoC;
begin
  result := Self.Create(DAOCollection);
end;

end.
