object ppEmailDialog: TppEmailDialog
  Left = 307
  Top = 156
  Width = 632
  Height = 439
  Caption = 'ReportBuilder Email'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object sbEmailStatus: TStatusBar
    Left = 0
    Top = 386
    Width = 624
    Height = 19
    Panels = <>
  end
  object dlgOpenAtt: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Title = 'Insert Attachment'
    Left = 544
    Top = 328
  end
  object dlgSaveFile: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Title = 'File Name'
    Left = 504
    Top = 328
  end
end
