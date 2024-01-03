object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'ClipboardWatcher'
  ClientHeight = 315
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PopupMenu = PopupMenu1
  PopupMode = pmExplicit
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  TextHeight = 15
  object Image1: TImage
    Left = 0
    Top = 0
    Width = 418
    Height = 274
    Align = alClient
    Proportional = True
    Stretch = True
    ExplicitLeft = 272
    ExplicitTop = 192
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object Panel1: TPanel
    Left = 0
    Top = 274
    Width = 418
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitTop = 262
    ExplicitWidth = 410
    object SpeedButton1: TSpeedButton
      Left = 378
      Top = 6
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object Edit1: TEdit
      Left = 24
      Top = 6
      Width = 337
      Height = 23
      Enabled = False
      TabOrder = 0
      OnChange = Edit1Change
    end
  end
  object ClipboardWatcher1: TClipboardWatcher
    OnChange = ClipboardWatcher1Change
    Left = 120
    Top = 48
  end
  object TrayIcon1: TTrayIcon
    PopupMenu = PopupMenu1
    OnClick = TrayIcon1Click
    Left = 120
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 48
    object N2: TMenuItem
      Caption = #38283#12367
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object N1: TMenuItem
      Caption = #32066#20102
      OnClick = N1Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 120
    Top = 128
  end
end
