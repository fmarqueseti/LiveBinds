unit View.Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.Edit,
  System.ImageList, FMX.ImgList, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  FMX.Objects, FMX.Effects, FMX.ListBox, Modelo.Cliente, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView, Data.Bind.ObjectScope;

type
  TViewPrincipal = class(TForm)
    Layout_Client: TLayout;
    Layout_Bottom: TLayout;
    ListView_ItensFatura: TListView;
    Button_Sair: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
    procedure Button_SairClick(Sender: TObject);
  private
    { Private declarations }
    FClientes: TClientes;
    procedure Bind;
  public
    { Public declarations }
  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

{$R *.fmx}

uses
  System.Generics.Collections, System.Math,
  System.StrUtils, FMX.DialogService, Data.Bind.Components,
  Fmx.Bind.Editors;

{ TViewPrincipal }

procedure TViewPrincipal.Bind;
var
  LinkFillControlToField: TLinkFillControlToField;
  FormatExpressionItem: TFormatExpressionItem;
  PrototypeBindSource: TPrototypeBindSource;
begin
  PrototypeBindSource := TPrototypeBindSource.Create(Self);
  PrototypeBindSource.OnCreateAdapter := Self.CreateAdapter;
  PrototypeBindSource.Active := False;
  PrototypeBindSource.Active := True;

  LinkFillControlToField := TLinkFillControlToField.Create(Nil);
  LinkFillControlToField.FillDataSource := PrototypeBindSource;
  LinkFillControlToField.Control := Self.ListView_ItensFatura;

  FormatExpressionItem := LinkFillControlToField.FillExpressions.AddExpression;
  FormatExpressionItem.SourceMemberName := 'BindText1';
  FormatExpressionItem.ControlMemberName := 'Text1';

  FormatExpressionItem := LinkFillControlToField.FillExpressions.AddExpression;
  FormatExpressionItem.SourceMemberName := 'BindText2';
  FormatExpressionItem.ControlMemberName := 'Text2';

  FormatExpressionItem := LinkFillControlToField.FillExpressions.AddExpression;
  FormatExpressionItem.SourceMemberName := 'BindText3';
  FormatExpressionItem.ControlMemberName := 'Text3';
end;

procedure TViewPrincipal.CreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  ABindSourceAdapter := TListBindSourceAdapter<TCliente>.Create(Self, Self.FClientes.Itens, False);
end;

procedure TViewPrincipal.FormCreate(Sender: TObject);
begin
  Self.FClientes := TClientes.Create;

  Self.FClientes.Itens.Add(TCliente.Create('1', 'Fabio', '91999999999'));
  Self.FClientes.Itens.Add(TCliente.Create('2', 'Mara', '91999999999'));
  Self.FClientes.Itens.Add(TCliente.Create('3', 'Fulano', '91999999999'));
  Self.FClientes.Itens.Add(TCliente.Create('4', 'Ciclano', '91999999999'));
  Self.FClientes.Itens.Add(TCliente.Create('5', 'Beltrano', '91999999999'));

  Self.Bind;
end;

procedure TViewPrincipal.Button_SairClick(Sender: TObject);
begin
  Self.FClientes.Free;
  Self.Close;
end;

end.
