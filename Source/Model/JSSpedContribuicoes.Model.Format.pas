unit JSSpedContribuicoes.Model.Format;

interface

uses
  System.SysUtils,
//  System.Helper.DateTime,
  System.Helper.Double;

type
  TJSSpedContribuicoesFormatZero = (fzFormatIfZero, fzNullIfZero, fzZeroIfZero);

  TJSSpedContribuicoesFormat = class
  public
    class function formatData    (AValue: TDateTime): String;
    class function formatCurrency(AValue: Double; ANumDecimais: Integer = 2; AFormatZero: TJSSpedContribuicoesFormatZero = fzFormatIfZero): String;
    class function PadL(AValue: String; ATam: Integer; ACaracter: Char = '0'): String;

//    class function formatNumber  (AValue: Double): string;
  end;

  JSSF = class(TJSSpedContribuicoesFormat);

implementation

{ TJSSpedContribuicoesFormat }

class function TJSSpedContribuicoesFormat.formatCurrency(AValue: Double;
  ANumDecimais: Integer; AFormatZero: TJSSpedContribuicoesFormatZero): String;
var
  decimais : string;
  i        : Integer;
  format   : TFormatSettings;
begin
  format := TFormatSettings.Create('pt-BR');
  AValue := AValue.roundABNT(ANumDecimais);
  if (AValue = 0) then
    case AFormatZero of
      fzNullIfZero : Exit(EmptyStr);
      fzZeroIfZero : Exit('0');
    end;

  for I := 1 to ANumDecimais do
    decimais := decimais + '0';

  result := FormatFloat(',0.' + decimais, AValue, format);

  result := Result.Replace('.', '');
end;

class function TJSSpedContribuicoesFormat.formatData(AValue: TDateTime): String;
begin
  Result := EmptyStr;
  if AValue > 0 then
    result := FormatDateTime('ddmmyyyy', AValue);
end;

class function TJSSpedContribuicoesFormat.PadL(AValue: String; ATam: Integer; ACaracter: Char): String;
begin
  Result := Copy(AValue,1,ATam);
  Result := StringOfChar(ACaracter, (Atam - Length(Result))) + Result;
end;

end.
