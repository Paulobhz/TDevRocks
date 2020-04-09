unit UntPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Effects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects;

type
  TfrmPrincipal = class(TForm)
    tbCtrlPrincipal: TTabControl;
    tbItemMenu: TTabItem;
    tbItemApoio: TTabItem;
    lytBackgound: TLayout;
    lytPrincipal: TLayout;
    actAcoes: TActionList;
    actMudarAba: TChangeTabAction;
    lytSuperior: TLayout;
    lytInferior: TLayout;
    lytMenu: TGridLayout;
    lytBotao1: TLayout;
    rndBotao1: TRoundRect;
    imgBotao1: TImage;
    lytRotulos1: TLayout;
    lblTituloBtn1: TLabel;
    ShadowEffect1: TShadowEffect;
    lblDescBtn1: TLabel;
    lytBotao2: TLayout;
    RoundRect1: TRoundRect;
    imgBotao2: TImage;
    lytRotulos2: TLayout;
    lblTituloBtn2: TLabel;
    ShadowEffect2: TShadowEffect;
    lblDescBtn2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure imgBotao1Click(Sender: TObject);
  private
    { Private declarations }
    FActiveForm : TForm ;
  public
    { Public declarations }
    procedure MudarAba(ATabItem: TTabItem; Sender: TObject);
    procedure AbrirForm(AFormClass: TComponentClass);
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.AbrirForm(AFormClass: TComponentClass);
Var
    LayoutBase, BotaoMenu: TComponent;
begin
    if Assigned(FActiveForm)  then
    begin
        if FActiveForm.ClassType = AFormClass then
          exit
        else
        begin
          FActiveForm.DisposeOf; // Não usar o FREE
          FactiveForm := nil;
        end;
    end;
    Application.CreateForm(AFormClass, FActiveForm);

    //encontra o layoutBase no form a ser exibido para adicionar ao frmPrincipal
    LayoutBase := FActiveForm.FindComponent('lytBase');
    if Assigned(LayoutBase) then
      lytPrincipal.AddObject(TLayout(LayoutBase));

{Não vai usar
    //encontra o botão de controle do menu no form a ser exibido para
    //associa-lo ao multiview do frmPrincipal
    BotaoMenu := FACtiveForm.FindComponent('btnMenu');
    if Assigned(BotaoMenu) then
      mlvMenu.MasterButton := Tcontrol(BotaoMenu);
}


end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
      tbCtrlPrincipal.ActiveTab   :=  tbItemMenu;
      tbCtrlPrincipal.TabPosition :=  TTabPosition.None;
end;

procedure TfrmPrincipal.imgBotao1Click(Sender: TObject);
begin
  AbrirForm(TfrmClientes);       // Carrego o proximo Form
  MudarAba(tbItemApoio,Sender);  // Muda de aba para o apoio
end;

procedure TfrmPrincipal.MudarAba(ATabItem: TTabItem; Sender: TObject);
begin
  actMudarAba.Tab := ATabItem;
  actMudarAba.ExecuteTarget(Sender);
end;

end.
