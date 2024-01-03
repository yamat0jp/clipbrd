unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CBWatch, Vcl.ExtCtrls, Vcl.ExtDlgs,
  Vcl.Buttons, Vcl.StdCtrls, System.Win.TaskbarCore, Vcl.Taskbar, Vcl.Menus;

type
  TForm1 = class(TForm)
    ClipboardWatcher1: TClipboardWatcher;
    Image1: TImage;
    Panel1: TPanel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    TrayIcon1: TTrayIcon;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Timer1: TTimer;
    procedure ClipboardWatcher1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N1Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private êÈåæ }
    query: Boolean;
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Clipbrd, System.IOUtils, OKCANCL2, Winapi.ShellAPI, Vcl.Samples.DirOutln;

procedure TForm1.ClipboardWatcher1Change(Sender: TObject);
var
  name: string;
  cnt: integer;
begin
  if Clipboard.HasFormat(CF_BITMAP) then
  begin
    Timer1.Enabled := true;
    Image1.Picture.Assign(Clipboard);
    if DirectoryExists(Edit1.Text) then
    begin
      cnt := 1;
      repeat
        name := Edit1.Text + Format('\%d.png', [cnt]);
        inc(cnt);
      until not FileExists(name);
      Image1.Picture.SaveToFile(name);
    end;
  end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  if DirectoryExists(Edit1.Text) then
    Edit1.Font.Color := clBlack
  else
    Edit1.Font.Color := clRed;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  Hide;
  if not query then
    CanClose := false;
  TrayIcon1.Visible := not CanClose;
  query := false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  query := false;
  Edit1.Text := TPath.GetPicturesPath;
  SetCurrentDir(TPath.GetPicturesPath);
  Application.ShowMainForm:=false;
  Hide;
  TrayIcon1.Visible:=true;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
  query := true;
  Close;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  if DirectoryExists(Edit1.Text) then
    ShellExecute(0, 'open', 'explorer.exe', PChar(Edit1.Text), nil,
      SW_SHOWNORMAL);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  with OKRightDlg.DirectoryOutline1 do
    if OKRightDlg.ShowModal = mrOK then
      Edit1.Text := Items[SelectedItem].FullPath;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  if Image1.Picture.Graphic <> nil then
  begin
    FreeAndNil(Image1.Picture.Graphic);
    Image1.Refresh;
  end;
  Timer1.Enabled := false;
end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
  Show;
  TrayIcon1.Visible := false;
end;

end.
