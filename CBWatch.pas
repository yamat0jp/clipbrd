unit CBWatch;

interface

uses
  Windows, Messages, Classes, Forms;

type
  TClipboardWatcher = class(TComponent)
  private
    FWindowHandle: HWND;
    FNextWindowHandle: HWND;
    FOnChange: TNotifyEvent;
    FEnabled: Boolean;
    FRegistered: Boolean;
    procedure Update;
    procedure SetEnabled(Value: Boolean);
    procedure SetOnChange(Value: TNotifyEvent);
    procedure WndProc(var Message: TMessage);
  protected
    procedure ClipboardChanged; dynamic;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Enabled: Boolean read FEnabled write SetEnabled default True;
    property OnChange: TNotifyEvent read FOnChange write SetOnChange;
  end;

procedure Register;

implementation

{ TClipboardWatcher }

constructor TClipboardWatcher.Create(AOwner: TComponent); //override;
begin
  inherited Create(AOwner);
  FWindowHandle := AllocateHWnd(WndProc);
  FEnabled := True;
end;

destructor TClipboardWatcher.Destroy; //override;
begin
  SetEnabled(False);
  DeallocateHWnd(FWindowHandle);
  inherited Destroy;
end;

procedure TClipboardWatcher.Update;
begin
  if FRegistered = FEnabled and Assigned(FOnChange) then Exit;
  FRegistered := not FRegistered;
  if FRegistered then
    FNextWindowHandle := SetClipboardViewer(FWindowHandle)
  else
    ChangeClipboardChain(FWindowHandle, FNextWindowHandle);
end;

procedure TClipboardWatcher.SetEnabled(Value: Boolean);
begin
  FEnabled := Value;
  Update;
end;

procedure TClipboardWatcher.SetOnChange(Value: TNotifyEvent);
begin
  FOnChange := Value;
  Update;
end;

procedure TClipboardWatcher.WndProc(var Message: TMessage);
begin
  with Message do
    case Msg of
      WM_CHANGECBCHAIN:
        try
          with TWMChangeCBChain(Message) do
            if Remove = FNextWindowHandle then
              FNextWindowHandle := Next
            else if FNextWindowHandle <> 0 then
              SendMessage(FNextWindowHandle, Msg, wParam, lParam);
        except
          Application.HandleException(Self);
        end;
      WM_DRAWCLIPBOARD:
        try
          ClipboardChanged;
          SendMessage(FNextWindowHandle, Msg, wParam, lParam);
        except
          Application.HandleException(Self);
        end;
    else
      Result := DefWindowProc(FWindowHandle, Msg, wParam, lParam);
    end;
end;

procedure TClipboardWatcher.ClipboardChanged; //dynamic;
begin
  if Assigned(FOnChange) then FOnChange(Self);
end;

{ Register }

procedure Register;
begin
  RegisterComponents('Samples', [TClipboardWatcher]);
end;

end.
