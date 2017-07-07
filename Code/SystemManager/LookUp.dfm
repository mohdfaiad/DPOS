object Lkp: TLkp
  Left = 378
  Top = 145
  Width = 637
  Height = 539
  BiDiMode = bdRightToLeft
  Caption = #1575#1604#1606#1575#1601#1584#1577' '#1575#1604#1575#1587#1578#1593#1604#1575#1605#1610#1577
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ParentBiDiMode = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object LkpGrid: TDBGrid
    Left = 0
    Top = 30
    Width = 621
    Height = 470
    Align = alBottom
    Anchors = [akLeft, akTop, akRight, akBottom]
    BiDiMode = bdRightToLeft
    DataSource = DSRC
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentBiDiMode = False
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = LkpGridDblClick
    OnKeyDown = LkpGridKeyDown
  end
  object EdtSearch: TEdit
    Left = 86
    Top = 1
    Width = 453
    Height = 28
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnChange = EdtSearchChange
    OnKeyDown = EdtSearchKeyDown
  end
  object BtnSearch: TButton
    Left = 541
    Top = 1
    Width = 75
    Height = 25
    Caption = #1576#1581#1579
    TabOrder = 1
    OnClick = BtnSearchClick
  end
  object CkbAuto: TCheckBox
    Left = 0
    Top = 8
    Width = 81
    Height = 17
    Caption = #1576#1581#1579' '#1578#1604#1602#1575#1574#1609
    Checked = True
    State = cbChecked
    TabOrder = 3
  end
  object DSRC: TDataSource
    Left = 3
    Top = 48
  end
end
