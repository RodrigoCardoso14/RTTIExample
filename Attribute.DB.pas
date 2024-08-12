unit Attribute.DB;

interface

uses
  System.Rtti;

type
  TDataTableAttribute = class(TCustomAttribute)
  private
    FTable: string;
  public
    constructor Create(ATable: string);
    property Table: string read FTable write FTable;
  end;

  TDataFieldAttribute = class(TCustomAttribute)
  private
    FCampo: string;
    FValidarCampo: Boolean;
    FMensagem: string;
    FCampoObrigatorio: Boolean;
  public
    constructor Create(ACampo, AMensagem: string; AValidar: Boolean);
    function Validar(AValue: TValue): Boolean; virtual;

    property Campo: string read FCampo write FCampo;
    property ValidarCampo: Boolean read FValidarCampo write FValidarCampo;
    property Mensagem: string read FMensagem write FMensagem;
    property CampoObrigatorio: Boolean read FCampoObrigatorio write FCampoObrigatorio;
  end;

implementation

uses
  System.SysUtils;

{ TDataTableAttribute }

constructor TDataTableAttribute.Create(ATable: string);
begin
  FTable := ATable;
end;

{ TDataFieldAttribute }

constructor TDataFieldAttribute.Create(ACampo, AMensagem: string; AValidar: Boolean);
begin
  FCampo := ACampo;
  FValidarCampo := AValidar;
  FMensagem := AMensagem;
end;

function TDataFieldAttribute.Validar(AValue: TValue): Boolean;
begin
  Result := False;

  if FValidarCampo then
  begin
    FCampoObrigatorio := AValue.AsString = EmptyStr;

    Result := FCampoObrigatorio;
  end;
end;

end.
