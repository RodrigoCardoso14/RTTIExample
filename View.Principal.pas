unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Model.Pessoa;

type
  TFrmPrincipal = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    memoResults: TMemo;
    Button8: TButton;
    Button9: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Pessoa: TPessoa;
    function Validar(AObject: TObject): Boolean;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  System.Rtti, Attribute.DB;

{$R *.dfm}

procedure TFrmPrincipal.Button1Click(Sender: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LMethod: TRttiMethod;
begin
  memoResults.Lines.Clear;
  try
    LContext := TRttiContext.Create;
    LType := LContext.GetType(TPessoa);

    memoResults.Lines.Add('METHODS');

    for LMethod in LType.GetMethods do
    begin
      memoResults.Lines.Add(LMethod.Name);
    end;
  finally
    LContext.Free;
  end;
end;

procedure TFrmPrincipal.Button2Click(Sender: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LField: TRttiField;
begin
  memoResults.Lines.Clear;
  try
    LContext := TRttiContext.Create;

    LType := LContext.GetType(TPessoa);

    for LField in LType.GetFields do
    begin
      memoResults.Lines.Add(LField.Name);
    end;
  finally
    LContext.Free;
  end;
end;

procedure TFrmPrincipal.Button3Click(Sender: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LProperty: TRttiProperty;
begin
  memoResults.Lines.Clear;
  try
    LContext := TRttiContext.Create;

    LType := LContext.GetType(TPessoa);

    for LProperty in LType.GetProperties do
    begin
      memoResults.Lines.Add(LProperty.Name);
    end;
  finally
    LContext.Free;
  end;
end;

procedure TFrmPrincipal.Button4Click(Sender: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LProperty: TRttiProperty;
begin
  memoResults.Lines.Clear;
  try
    LContext := TRttiContext.Create;

    LType := LContext.GetType(TPessoa);

    for LProperty in LType.GetProperties do
    begin
      memoResults.Lines.Add(LProperty.Name + ': ' + LProperty.PropertyType.Name + ' = ' + LProperty.GetValue(Pessoa).ToString);
    end;
  finally
    LContext.Free;
  end;
end;

procedure TFrmPrincipal.Button5Click(Sender: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LProperty: TRttiProperty;
begin
  memoResults.Lines.Clear;
  try
    LContext := TRttiContext.Create;

    LType := LContext.GetType(Pessoa.ClassType);

    LProperty := LType.GetProperty('Nome');
    LProperty.SetValue(Pessoa, 'RCCS');

    memoResults.Lines.Add(LProperty.GetValue(Pessoa).ToString);
  finally
    LContext.Free;
  end;
end;

procedure TFrmPrincipal.Button6Click(Sender: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LMethod: TRttiMethod;
  LParameter: TRttiParameter;
begin
  memoResults.Lines.Clear;
  try
    LContext := TRttiContext.Create;

    LType := LContext.GetType(TPessoa);

    for LMethod in LType.GetMethods do
    begin
      if LMethod.Parent.Name <> 'TPessoa' then
        Continue;

      memoResults.Lines.Add('Method: ' + LMethod.Name);

      if Assigned(LMethod.ReturnType) then
        memoResults.Lines.Add('Return: ' + LMethod.ReturnType.ToString)
      else
        memoResults.Lines.Add('Return: Não tem. ');

      memoResults.Lines.Add('Parameters: ');
      for LParameter in LMethod.GetParameters do
      begin
        memoResults.Lines.Add('   ' + LParameter.Name + ': ' + LParameter.ParamType.Name);
      end;

      memoResults.Lines.Add('');
    end;
  finally
    LContext.Free;
  end;
end;

procedure TFrmPrincipal.Button7Click(Sender: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LMethod: TRttiMethod;
  LParameters: Array of TValue;
begin
  memoResults.Lines.Clear;
  try
    LContext := TRttiContext.Create;

    LType := LContext.GetType(TPessoa);

    LMethod := LType.GetMethod('Insert');

    SetLength(LParameters, 1);

    LParameters[0] := 10;

    LMethod.Invoke(Pessoa, LParameters);
  finally
    LContext.Free;
  end;
end;

procedure TFrmPrincipal.Button8Click(Sender: TObject);
begin
  Validar(Pessoa);
end;

procedure TFrmPrincipal.Button9Click(Sender: TObject);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LAttribute: TCustomAttribute;
begin
  memoResults.Lines.Clear;
  try
    LContext := TRttiContext.Create;

    LType := LContext.GetType(TPessoa);

    for LAttribute in LType.GetAttributes do
    begin
      if LAttribute is TDataTableAttribute then
      begin
        memoResults.Lines.Add(TDataTableAttribute(LAttribute).Table);
      end;
    end;
  finally
    LContext.Free;
  end;
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Pessoa := TPessoa.Create;
  Pessoa.Codigo := 14;
  Pessoa.Nome := 'Rodrigo Cardoso';
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  FreeAndNil(Pessoa);
end;

function TFrmPrincipal.Validar(AObject: TObject): Boolean;
var
  LContext: TRttiContext;
  LType: TRttiType;
  LProperty: TRttiProperty;
  LAttribute: TCustomAttribute;
begin
  Result := True;
  memoResults.Lines.Clear;
  try
    LContext := TRttiContext.Create;

    LType := LContext.GetType(AObject.ClassType);

    for LProperty in LType.GetProperties do
    begin
      for LAttribute in LProperty.GetAttributes do
      begin
        if LAttribute is TDataFieldAttribute then
        begin
          if not (LAttribute as TDataFieldAttribute).Validar(LProperty.GetValue(AObject)) then
          begin
            Result := False;
          end;

          memoResults.Lines.Add(TDataFieldAttribute(LAttribute).Campo);

          if TDataFieldAttribute(LAttribute).CampoObrigatorio then
          begin
            raise Exception.Create(TDataFieldAttribute(LAttribute).Mensagem);
          end;
        end;
      end;
    end;
  finally
    LContext.Free;
  end;
end;

end.
