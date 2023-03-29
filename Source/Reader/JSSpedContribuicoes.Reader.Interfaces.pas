unit JSSpedContribuicoes.Reader.Interfaces;

interface

uses
  JSSpedContribuicoes.Reader.TXT.Model,
  System.SysUtils,
  System.Classes;

type
  TJSSCRTXTModel = JSSpedContribuicoes.Reader.TXT.Model.TJSSCRTXTModel;

  IJSSCRTXT = interface
    ['{E9A57504-29DA-4AAF-8B74-F7DEB25CA121}']
    function LoadFromFile(AValue: string): TJSSCRTXTModel;
  end;

function SCTXTReader: IJSSCRTXT;

implementation

uses
  JSSpedContribuicoes.Reader.TXT.Base;

function SCTXTReader: IJSSCRTXT;
begin
  Result := TJSSCRTXTBase.New;
end;

end.
