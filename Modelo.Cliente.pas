unit Modelo.Cliente;

interface

uses
  System.Generics.Collections;

type
  TCliente = class;

  TClientes = class
  private
    { Private declarations }
    FClientes: TList<TCliente>;

    function GetItens: TList<TCliente>;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;

    property Itens: TList<TCliente> read GetItens;
  end;

  TCliente = class
  private
    { Private declarations }
    FCodigo: string;
    FNome: string;
    FTelefone: string;

    function GetCodigo: string;
    function GetNome: string;
    function GetTelefone: string;

    procedure SetCodigo(const Value: string);
    procedure SetNome(const Value: string);
    procedure SetTelefone(const Value: string);

    function GetBindText1: string;
    function GetBindText2: string;
    function GetBindText3: string;
  public
    { Public declarations }
    constructor Create(Codigo, Nome, Telefone: string);
    destructor Destroy; override;

    property Codigo: string read GetCodigo write SetCodigo;
    property Nome: string read GetNome write SetNome;
    property Telefone: string read GetTelefone write SetTelefone;

    property BindText1: string read GetBindText1;
    property BindText2: string read GetBindText2;
    property BindText3: string read GetBindText3;
  end;

implementation

uses
  System.MaskUtils;

{ ********************************* TClientes ******************************** }

constructor TClientes.Create;
begin
  Self.FClientes := TList<TCliente>.Create;
end;

destructor TClientes.Destroy;
begin
  Self.FClientes.Free;

  inherited;
end;

function TClientes.GetItens: TList<TCliente>;
begin
  Result := Self.FClientes;
end;

{ ********************************* TCliente ********************************* }

constructor TCliente.Create(Codigo, Nome, Telefone: string);
begin
  inherited Create;

  Self.Codigo := Codigo;
  Self.Nome := Nome;
  Self.Telefone := Telefone;
end;

destructor TCliente.Destroy;
begin
  inherited;
end;

function TCliente.GetBindText1: string;
begin
  Result := 'Código: ' + Self.Codigo;
end;

function TCliente.GetBindText2: string;
begin
  Result := 'Nome: ' + Self.Nome;
end;

function TCliente.GetBindText3: string;
begin
  Result := 'Telefone: ' + FormatMaskText('\(00\) 00000-0000;0;', Self.Telefone);
end;

function TCliente.GetCodigo: string;
begin
  Result := Self.FCodigo;
end;

function TCliente.GetNome: string;
begin
  Result := Self.FNome;
end;

function TCliente.GetTelefone: string;
begin
  Result := Self.FTelefone;
end;

procedure TCliente.SetCodigo(const Value: string);
begin
  if (Self.FCodigo <> Value) then
    Self.FCodigo := Value;
end;

procedure TCliente.SetNome(const Value: string);
begin
  if (Self.FNome <> Value) then
    Self.FNome := Value;
end;

procedure TCliente.SetTelefone(const Value: string);
begin
  if (Self.FTelefone <> Value) then
    Self.FTelefone := Value;
end;

end.
