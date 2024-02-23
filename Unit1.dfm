object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsToolWindow
  Caption = 'ClipboardWatcher'
  ClientHeight = 303
  ClientWidth = 410
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
    Top = 25
    Width = 410
    Height = 237
    Align = alClient
    Proportional = True
    Stretch = True
    ExplicitLeft = 272
    ExplicitTop = 192
    ExplicitWidth = 105
    ExplicitHeight = 105
  end
  object Label1: TLabel
    Left = 112
    Top = 104
    Width = 185
    Height = 30
    Caption = 'FDELPHI Forum '#12380#12360#12383' (QZC05100) Unit CBWatch'
    WordWrap = True
  end
  object Label2: TLabel
    Left = 184
    Top = 64
    Width = 26
    Height = 15
    Caption = #21332#21147
  end
  object Panel1: TPanel
    Left = 0
    Top = 262
    Width = 410
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitTop = 250
    ExplicitWidth = 402
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
  object ActionToolBar1: TActionToolBar
    Left = 0
    Top = 0
    Width = 410
    Height = 25
    ActionManager = ActionManager1
    Caption = 'ActionToolBar1'
    Color = clMenuBar
    ColorMap.DisabledFontColor = 10461087
    ColorMap.HighlightColor = clWhite
    ColorMap.BtnSelectedFont = clWhite
    ColorMap.SelectedFontColor = clWhite
    ColorMap.UnusedColor = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    Spacing = 0
    ExplicitWidth = 402
  end
  object TrayIcon1: TTrayIcon
    PopupMenu = PopupMenu1
    Visible = True
    OnClick = TrayIcon1Click
    Left = 120
    Top = 200
  end
  object PopupMenu1: TPopupMenu
    Left = 296
    Top = 48
    object N1: TMenuItem
      Action = Action1
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object N3: TMenuItem
      Action = Action2
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 120
    Top = 128
  end
  object ActionManager1: TActionManager
    ActionBars = <
      item
        Items = <
          item
            Action = Action1
            Caption = #32066#20102'(&Y)'
          end
          item
            Caption = '-'
          end
          item
            Action = Action2
            Caption = #38283#12367'(&Z)'
          end
          item
            Action = Action3
            Caption = #38281#12376#12427'(&X)'
          end>
        ActionBar = ActionToolBar1
      end>
    Left = 336
    Top = 120
    StyleName = 'Platform Default'
    object Action1: TAction
      Caption = #32066#20102
      OnExecute = N1Click
    end
    object Action2: TAction
      Caption = #38283#12367
      OnExecute = N2Click
    end
    object Action3: TAction
      Caption = #38281#12376#12427
      OnExecute = Action3Execute
    end
  end
end
