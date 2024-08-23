object file_viewer_form: Tfile_viewer_form
  Left = 596
  Top = 249
  Cursor = crArrow
  AutoScroll = False
  Caption = '          Templot2  BOX  file  viewer'
  ClientHeight = 748
  ClientWidth = 1000
  Color = 15794175
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clBlack
  Font.Height = -15
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnDeactivate = FormDeactivate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  PixelsPerInch = 120
  TextHeight = 18
  object Label1: TLabel
    Left = 8
    Top = 102
    Width = 129
    Height = 16
    AutoSize = False
    Caption = 'select a drive:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 162
    Width = 109
    Height = 16
    AutoSize = False
    Caption = 'select a folder:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
  end
  object help_shape: TShape
    Left = 210
    Top = 6
    Width = 64
    Height = 28
    Pen.Color = clLime
  end
  object Label3: TLabel
    Left = 40
    Top = 8
    Width = 165
    Height = 25
    AutoSize = False
    Caption = 'BOX file viewer'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 16711808
    Font.Height = -18
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 48
    Width = 228
    Height = 45
    AutoSize = False
    Caption = 'Use this viewer to find or load your BOX data files.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object folder_listbox: TDirectoryListBox
    Left = 8
    Top = 180
    Width = 266
    Height = 350
    Color = 14737632
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ItemHeight = 22
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    OnClick = folder_listboxClick
  end
  object disk_drive_combo: TDriveComboBox
    Left = 8
    Top = 120
    Width = 250
    Height = 24
    Color = 14737632
    Ctl3D = True
    DirList = folder_listbox
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TextCase = tcUpperCase
    OnChange = folder_listboxClick
  end
  object help_button: TButton
    Left = 213
    Top = 9
    Width = 58
    Height = 22
    Caption = '? help'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = help_buttonClick
  end
  object html_file_viewer: THTMLViewer
    Left = 280
    Top = 0
    Width = 720
    Height = 748
    OnImageRequest = html_file_viewerImageRequest
    TabStop = True
    TabOrder = 2
    ShowHint = True
    DefBackground = 15794175
    BorderStyle = htNone
    HistoryMaxCount = 10
    DefFontName = 'Arial'
    DefPreFontName = 'Courier New'
    DefFontSize = 8
    DefFontColor = clBlack
    DefVisitedLinkColor = clBlue
    DefOverLinkColor = clRed
    ImageCacheCount = 0
    NoSelect = False
    CharSet = DEFAULT_CHARSET
    MarginHeight = 0
    MarginWidth = 4
    PrintMarginLeft = 1
    PrintMarginRight = 1
    PrintMarginTop = 1
    PrintMarginBottom = 1
    PrintScale = 1.25
    htOptions = [htOverLinksActive, htPrintTableBackground, htPrintMonochromeBlack]
    OnMouseMove = html_file_viewerMouseMove
    object mouse_hover_panel: TPanel
      Left = 144
      Top = 96
      Width = 90
      Height = 22
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'reload this file'
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
  end
  object blue_corner_panel: TPanel
    Left = 0
    Top = 0
    Width = 19
    Height = 27
    BevelOuter = bvNone
    Color = clBlue
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    TabStop = True
    object size_updown: TUpDown
      Tag = 4
      Left = 1
      Top = 1
      Width = 16
      Height = 24
      Hint = ' enlarge / reduce  control  panel  '
      Min = 1
      Max = 10
      ParentShowHint = False
      Position = 4
      ShowHint = True
      TabOrder = 0
      Wrap = False
      OnClick = size_updownClick
    end
  end
  object controls_panel: TPanel
    Left = 0
    Top = 540
    Width = 278
    Height = 208
    BevelOuter = bvNone
    Ctl3D = False
    ParentColor = True
    ParentCtl3D = False
    TabOrder = 5
    object found_label: TLabel
      Left = 186
      Top = 56
      Width = 75
      Height = 18
      AutoSize = False
      Caption = 'files found'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object count_label: TLabel
      Left = 132
      Top = 56
      Width = 50
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = '0'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object images_label: TLabel
      Left = 2
      Top = 198
      Width = 90
      Height = 8
      AutoSize = False
      Caption = 'bitmaps'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -5
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object escape_label: TLabel
      Left = 24
      Top = 74
      Width = 220
      Height = 18
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'press ESC to stop searching'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object progress_bar: TProgressBar
      Left = 8
      Top = 34
      Width = 266
      Height = 16
      Min = 0
      Max = 100
      Smooth = True
      TabOrder = 2
    end
    object refresh_button: TButton
      Left = 172
      Top = 1
      Width = 100
      Height = 25
      Caption = 'show  files'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = refresh_buttonClick
    end
    object open_folder_button: TButton
      Left = 8
      Top = 3
      Width = 142
      Height = 21
      Caption = 'open folder in Windows'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = open_folder_buttonClick
    end
    object images_clickable_checkbox: TCheckBox
      Left = 18
      Top = 136
      Width = 134
      Height = 20
      Caption = 'images clickable'
      Checked = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      State = cbChecked
      TabOrder = 5
      OnClick = refresh_buttonClick
    end
    object name_labels_checkbox: TCheckBox
      Left = 18
      Top = 164
      Width = 190
      Height = 20
      Caption = 'template name labels'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = refresh_buttonClick
    end
    object instant_show_checkbox: TCheckBox
      Left = 18
      Top = 108
      Width = 136
      Height = 20
      Caption = 'instant show files'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = instant_show_checkboxClick
    end
    object close_panel: TPanel
      Left = 208
      Top = 178
      Width = 60
      Height = 24
      Alignment = taLeftJustify
      Caption = '  hide'
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = close_buttonClick
      object close_button: TButton
        Left = 43
        Top = 7
        Width = 14
        Height = 14
        Caption = '  '
        Default = True
        TabOrder = 0
        OnClick = close_buttonClick
      end
    end
  end
end
