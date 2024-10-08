unit Model.Pessoa;

interface

uses
  Attribute.DB;

type
  [TDataTableAttribute('PESSOA')]
  TPessoa = class
  private
    FCodigo: Integer;
    FNome: string;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Insert(AID: Integer);
    function Update(AID: Integer): Boolean;
    property Codigo: Integer read FCodigo write FCodigo;

    [TDataFieldAttribute('PESSOA_NOME', 'O campo Nome � de preenchimento obrigat�rio.', True)]
    property Nome: string read FNome write FNome;
  end;

implementation

uses
  SysUtils;

{ TPessoa }

constructor TPessoa.Create;
begin

end;

destructor TPessoa.Destroy;
begin

  inherited;
end;

procedure TPessoa.Insert(AID: Integer);
begin
  raise Exception.Create('Inserido com sucesso.');
end;

function TPessoa.Update(AID: Integer): Boolean;
begin

end;

end.
