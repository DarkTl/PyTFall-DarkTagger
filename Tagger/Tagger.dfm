object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'DarkTagger'
  ClientHeight = 652
  ClientWidth = 1234
  Color = clMenu
  Constraints.MinHeight = 690
  Constraints.MinWidth = 1250
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 755
    Top = 3
    Width = 475
    Height = 640
    Hint = 'Click to reload the image'
    Center = True
    ParentShowHint = False
    Proportional = True
    ShowHint = True
    OnClick = Image1Click
  end
  object RadioGroup2: TRadioGroup
    Left = 658
    Top = 0
    Width = 91
    Height = 248
    Caption = 'Special Clothes'
    Items.Strings = (
      'no clothes'
      'lingerie'
      'armor'
      'swimsuit'
      'maid'
      'miko'
      'nurse'
      'schoolgirl'
      'sportswear'
      'yukata'
      'bunny'
      'cat'
      'cow'
      'dog'
      'ninja')
    TabOrder = 13
    OnClick = CheckListBox1Click
  end
  object Panel1: TPanel
    Left = 196
    Top = 555
    Width = 82
    Height = 32
    Color = clGreen
    ParentBackground = False
    TabOrder = 21
  end
  object GroupBox5: TGroupBox
    Left = 382
    Top = 6
    Width = 91
    Height = 129
    TabOrder = 9
    Visible = False
    OnClick = CheckListBox1Click
    object RadioGroup10: TRadioGroup
      Left = 3
      Top = 3
      Width = 82
      Height = 94
      Caption = 'Outdoors'
      Items.Strings = (
        'Urban'
        'Wildness'
        'Suburb')
      TabOrder = 0
      Visible = False
      OnClick = RadioGroup10Click
    end
    object CheckBox6: TCheckBox
      Left = 11
      Top = 93
      Width = 50
      Height = 23
      Caption = 'Nature'
      TabOrder = 1
      OnClick = CheckBox6Click
    end
  end
  object FileListBox1: TFileListBox
    Left = 0
    Top = 0
    Width = 185
    Height = 657
    Color = clCream
    DoubleBuffered = False
    FileType = [ftReadOnly, ftHidden, ftNormal]
    ItemHeight = 13
    Mask = '*.jpg;*png;*.jpeg'
    ParentDoubleBuffered = False
    TabOrder = 0
    OnChange = FileListBox1Change
  end
  object Button1: TButton
    Left = 200
    Top = 624
    Width = 75
    Height = 25
    Hint = 'Open a folder'
    Caption = 'Open'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 191
    Top = 0
    Width = 97
    Height = 201
    Caption = 'Main tags'
    Items.Strings = (
      'SFW'
      'Nude'
      'Sex'
      'Battle Sprite'
      'Portrait'
      'Sprite')
    TabOrder = 2
    OnClick = CheckListBox1Click
  end
  object Button2: TButton
    Left = 200
    Top = 559
    Width = 75
    Height = 25
    Hint = 'Save tags'
    Caption = 'Save'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 479
    Top = 561
    Width = 75
    Height = 25
    Hint = 'Reset all filenames to default indexes'
    Caption = 'Purge'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 200
    Top = 593
    Width = 75
    Height = 25
    Hint = 'Delete selected file'
    Caption = 'Delete'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 479
    Top = 594
    Width = 75
    Height = 25
    Hint = 'Give default indexes to all untagged files'
    Caption = 'Normalize'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = Button5Click
  end
  object CheckListBox1: TCheckListBox
    Left = 479
    Top = 0
    Width = 77
    Height = 248
    Color = clMenu
    HeaderBackgroundColor = clInactiveCaption
    Items.Strings = (
      'Emotions:'
      'Angry'
      'Confident'
      'Defiant'
      'Ecstatic'
      'Happy'
      'Indifferent'
      'In pain'
      'Insane'
      'Sad'
      'Scared'
      'Shy'
      'Suggestive'
      'Tired'
      'Uncertain')
    Style = lbOwnerDrawFixed
    TabOrder = 7
    OnClick = CheckListBox1Click
  end
  object GroupBox1: TGroupBox
    Left = 294
    Top = 0
    Width = 82
    Height = 216
    Caption = 'Location'
    TabOrder = 8
    OnClick = CheckListBox1Click
    object CheckBox1: TCheckBox
      Left = 11
      Top = 16
      Width = 97
      Height = 17
      Caption = 'No bg'
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 11
      Top = 39
      Width = 97
      Height = 17
      Caption = 'Simple bg'
      TabOrder = 1
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 11
      Top = 62
      Width = 97
      Height = 17
      Caption = 'Outdoors'
      TabOrder = 2
      OnClick = CheckBox3Click
    end
    object CheckBox4: TCheckBox
      Left = 11
      Top = 85
      Width = 97
      Height = 17
      Caption = 'Indoors'
      TabOrder = 3
      OnClick = CheckBox4Click
    end
    object RadioGroup3: TRadioGroup
      Left = 3
      Top = 108
      Width = 73
      Height = 101
      Caption = 'Special place'
      Items.Strings = (
        'Beach'
        'Onsen'
        'Pool'
        'Stage')
      TabOrder = 4
      OnClick = RadioGroup3Click
    end
  end
  object RadioGroup4: TRadioGroup
    Left = 382
    Top = 141
    Width = 85
    Height = 75
    Caption = 'Indoors'
    Items.Strings = (
      'Dungeon'
      'Living'
      'Public')
    TabOrder = 10
    Visible = False
    OnClick = CheckListBox1Click
  end
  object GroupBox2: TGroupBox
    Left = 562
    Top = 143
    Width = 90
    Height = 105
    Caption = 'Time'
    TabOrder = 11
    OnClick = CheckListBox1Click
    object CheckBox5: TCheckBox
      Left = 3
      Top = 16
      Width = 97
      Height = 17
      Caption = 'Evening'
      TabOrder = 0
      OnClick = CheckBox5Click
    end
    object CheckBox7: TCheckBox
      Left = 3
      Top = 39
      Width = 97
      Height = 17
      Caption = 'Night'
      TabOrder = 1
      OnClick = CheckBox7Click
    end
    object CheckBox8: TCheckBox
      Left = 3
      Top = 62
      Width = 97
      Height = 17
      Caption = 'Autumn'
      TabOrder = 2
      OnClick = CheckBox8Click
    end
    object CheckBox9: TCheckBox
      Left = 3
      Top = 85
      Width = 97
      Height = 17
      Caption = 'Winter'
      TabOrder = 3
      OnClick = CheckBox9Click
    end
  end
  object CheckListBox3: TCheckListBox
    Left = 562
    Top = 0
    Width = 90
    Height = 137
    Color = clMenu
    HeaderBackgroundColor = clInactiveCaption
    Items.Strings = (
      'Clothes:'
      'Everyday'
      'Formal'
      'Indoor'
      'Revealing'
      'Ripped'
      'Cosplay'
      'Transformed')
    Style = lbOwnerDrawVariable
    TabOrder = 12
    OnClick = CheckListBox1Click
  end
  object CheckListBox4: TCheckListBox
    Left = 200
    Top = 218
    Width = 81
    Height = 328
    Color = clMenu
    HeaderBackgroundColor = clInactiveCaption
    Items.Strings = (
      'Actions:'
      'Striptease '
      'Bathing'
      'Cleaning'
      'Cooking'
      'Dancing'
      'Eating'
      'Exercising'
      'Fighting'
      'Gambling'
      'Healing'
      'Magic'
      'Musician'
      'Reading'
      'Sleeping'
      'Shopping'
      'Singing'
      'Sport'
      'Studing'
      'Waitress')
    Style = lbOwnerDrawVariable
    TabOrder = 14
    Visible = False
    OnClick = CheckListBox1Click
  end
  object GroupBox3: TGroupBox
    Left = 202
    Top = 217
    Width = 101
    Height = 99
    TabOrder = 15
    Visible = False
    OnClick = CheckListBox1Click
    object RadioGroup7: TRadioGroup
      Left = 3
      Top = 3
      Width = 94
      Height = 94
      Items.Strings = (
        'Normal'
        'Group'
        'BDSM'
        'After sex')
      TabOrder = 1
      OnClick = RadioGroup7Click
    end
    object CheckBox10: TCheckBox
      Left = 11
      Top = -1
      Width = 79
      Height = 20
      Caption = 'Masturbation'
      TabOrder = 0
      OnClick = CheckBox10Click
    end
  end
  object CheckListBox5: TCheckListBox
    Left = 205
    Top = 322
    Width = 98
    Height = 153
    Color = clMenu
    HeaderBackgroundColor = clInactiveCaption
    Items.Strings = (
      'Masturbation:'
      'Anal beads'
      'Anal plug'
      'Dildo'
      'Other toy'
      'Hand and such'
      'Vibrator'
      'Tits vibrator'
      'Forced')
    Style = lbOwnerDrawFixed
    TabOrder = 16
    Visible = False
    OnClick = CheckListBox1Click
  end
  object GroupBox4: TGroupBox
    Left = 309
    Top = 254
    Width = 225
    Height = 241
    Caption = 'Group'
    TabOrder = 17
    Visible = False
    OnClick = CheckListBox1Click
    object RadioGroup5: TRadioGroup
      Left = 16
      Top = 16
      Width = 57
      Height = 105
      Caption = 'Guys'
      Items.Strings = (
        'One'
        'Two'
        'Three'
        'More')
      TabOrder = 0
    end
    object RadioGroup6: TRadioGroup
      Left = 79
      Top = 16
      Width = 58
      Height = 105
      Caption = 'Girls'
      Items.Strings = (
        'One'
        'Two'
        'Three'
        'More')
      TabOrder = 1
    end
    object CheckBox11: TCheckBox
      Left = 143
      Top = 30
      Width = 73
      Height = 17
      Caption = 'Guy hidden'
      TabOrder = 2
    end
    object CheckBox12: TCheckBox
      Left = 143
      Top = 53
      Width = 73
      Height = 17
      Caption = 'Girl hidden'
      TabOrder = 3
    end
    object CheckBox13: TCheckBox
      Left = 16
      Top = 127
      Width = 97
      Height = 17
      Caption = 'Bukkake'
      TabOrder = 4
    end
    object CheckBox14: TCheckBox
      Left = 16
      Top = 150
      Width = 121
      Height = 17
      Caption = 'Not main participant'
      TabOrder = 5
    end
    object CheckBox15: TCheckBox
      Left = 16
      Top = 173
      Width = 113
      Height = 17
      Caption = 'Others masturbate'
      TabOrder = 6
    end
    object CheckBox16: TCheckBox
      Left = 16
      Top = 196
      Width = 97
      Height = 17
      Caption = 'Rape'
      TabOrder = 7
    end
    object CheckBox17: TCheckBox
      Left = 16
      Top = 219
      Width = 97
      Height = 17
      Caption = 'Restrained'
      TabOrder = 8
    end
    object CheckListBox6: TCheckListBox
      Left = 143
      Top = 127
      Width = 60
      Height = 106
      Color = clMenu
      Items.Strings = (
        'Ass'
        'Pussy'
        'Mouth'
        'Hands'
        'Feet'
        'Tits')
      Style = lbOwnerDrawVariable
      TabOrder = 9
    end
  end
  object GroupBox6: TGroupBox
    Left = 309
    Top = 254
    Width = 215
    Height = 163
    Caption = 'BDSM'
    TabOrder = 18
    Visible = False
    OnClick = CheckListBox1Click
    object CheckListBox7: TCheckListBox
      Left = 16
      Top = 24
      Width = 81
      Height = 105
      Color = clMenu
      Items.Strings = (
        'Leashed'
        'Restrained'
        'Spanked'
        'Suspended'
        'Whipped'
        'Tortured')
      Style = lbOwnerDrawVariable
      TabOrder = 0
    end
    object RadioGroup8: TRadioGroup
      Left = 119
      Top = 23
      Width = 90
      Height = 106
      Caption = 'Partner'
      Items.Strings = (
        'Alone'
        'Girl'
        'Hidden girl'
        'Guy'
        'Hidden Guy')
      TabOrder = 1
    end
    object CheckBox18: TCheckBox
      Left = 116
      Top = 135
      Width = 98
      Height = 18
      Caption = 'Girl is dominatrix'
      TabOrder = 2
    end
    object CheckBox20: TCheckBox
      Left = 16
      Top = 135
      Width = 81
      Height = 17
      Caption = 'Cumcovered'
      TabOrder = 3
    end
  end
  object GroupBox7: TGroupBox
    Left = 309
    Top = 254
    Width = 340
    Height = 275
    Caption = 'Normal sex'
    TabOrder = 19
    Visible = False
    OnClick = CheckListBox1Click
    object RadioGroup9: TRadioGroup
      Left = 3
      Top = 16
      Width = 78
      Height = 55
      Caption = 'Partner'
      Items.Strings = (
        'Girl'
        'Guy')
      TabOrder = 0
      OnClick = RadioGroup9Click
    end
    object CheckBox19: TCheckBox
      Left = 3
      Top = 72
      Width = 89
      Height = 17
      Caption = 'Partner hidden'
      TabOrder = 1
      OnClick = CheckBox19Click
    end
    object CheckListBox8: TCheckListBox
      Left = 3
      Top = 95
      Width = 78
      Height = 169
      Color = clMenu
      HeaderBackgroundColor = clInactiveCaption
      Items.Strings = (
        'Poses:'
        '69'
        'Doggy'
        'Missionary'
        'Onside'
        'Ontop'
        'Scissors'
        'Sitting'
        'Spooning'
        'Standing')
      Style = lbOwnerDrawVariable
      TabOrder = 2
      OnClick = CheckListBox8Click
    end
    object CheckListBox9: TCheckListBox
      Left = 98
      Top = 15
      Width = 122
      Height = 198
      Color = clMenu
      HeaderBackgroundColor = clInactiveCaption
      Items.Strings = (
        'Sex to girl:'
        'Anal fingering'
        'Vaginal fingering'
        'Lick anus'
        'Lick pussy'
        'Anal Toy'
        'Vaginal Toy'
        'Anus fucked'
        'Pussy fucked'
        'Kissed'
        'Hugged'
        'Caress tits')
      Style = lbOwnerDrawVariable
      TabOrder = 3
      OnClick = CheckListBox9Click
    end
    object CheckListBox10: TCheckListBox
      Left = 226
      Top = 15
      Width = 107
      Height = 134
      Color = clMenu
      HeaderBackgroundColor = clInactiveCaption
      Items.Strings = (
        'Performed by girl:'
        'Blowjob'
        'Deepthroat'
        'Footjob'
        'Handjob'
        'Hug'
        'Kiss'
        'Titsjob')
      Style = lbOwnerDrawVariable
      TabOrder = 4
      Visible = False
      OnClick = CheckListBox10Click
    end
    object CheckListBox11: TCheckListBox
      Left = 226
      Top = 15
      Width = 111
      Height = 234
      Color = clMenu
      HeaderBackgroundColor = clInactiveCaption
      Items.Strings = (
        'Performed by girl:'
        'Anal handjob'
        'Vaginal handjob'
        'Anal footjob'
        'Vaginal footjob'
        'Lick anus'
        'Lick pussy'
        'Fuck anal'
        'Fuck pussy'
        'Toy anal'
        'Toy pussy'
        'Kiss'
        'Hug'
        'Caress tits')
      Style = lbOwnerDrawVariable
      TabOrder = 5
      Visible = False
      OnClick = CheckListBox11Click
    end
    object CheckBox21: TCheckBox
      Left = 100
      Top = 218
      Width = 97
      Height = 17
      Caption = 'Rape'
      Color = clMenu
      ParentColor = False
      TabOrder = 6
      OnClick = CheckBox21Click
    end
    object CheckBox22: TCheckBox
      Left = 100
      Top = 239
      Width = 97
      Height = 17
      Caption = 'Restrained'
      TabOrder = 7
      OnClick = CheckBox22Click
    end
  end
  object CheckListBox2: TCheckListBox
    Left = 298
    Top = 217
    Width = 85
    Height = 103
    Color = clMenu
    Items.Strings = (
      'Profile'
      'Girlsmeets'
      'Battle'
      'Rest'
      'Beauty'
      'Etiquette')
    Style = lbOwnerDrawVariable
    TabOrder = 20
    Visible = False
    OnClick = CheckListBox1Click
  end
  object Button6: TButton
    Left = 284
    Top = 559
    Width = 75
    Height = 25
    Hint = 'Unset all flags'
    Caption = 'Reset tags'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 22
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 284
    Top = 593
    Width = 75
    Height = 25
    Hint = 'Refresh files list'
    Caption = 'Refresh'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 23
    OnClick = Button7Click
  end
  object RadioGroup11: TRadioGroup
    Left = 401
    Top = 559
    Width = 72
    Height = 90
    Hint = 'Types of shown files'
    Caption = 'Types'
    ItemIndex = 0
    Items.Strings = (
      'Both'
      'Jpg'
      'Png'
      'Mask')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 24
    OnClick = RadioGroup11Click
  end
  object MaskEdit1: TMaskEdit
    Left = 479
    Top = 625
    Width = 121
    Height = 21
    Hint = 'File mask field'
    Color = clCream
    ParentShowHint = False
    ShowHint = True
    TabOrder = 25
    Text = ''
    OnChange = MaskEdit1Change
  end
  object Edit1: TEdit
    Left = 287
    Top = 534
    Width = 457
    Height = 21
    Hint = 'File name without extension (read only)'
    Color = clCream
    ParentShowHint = False
    ReadOnly = True
    ShowHint = True
    TabOrder = 26
  end
  object Button8: TButton
    Left = 606
    Top = 623
    Width = 83
    Height = 26
    Hint = 'Create file mask based on selected tags'
    Caption = 'Generate Mask'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 27
    OnClick = Button8Click
  end
  object BitBtn1: TBitBtn
    Left = 284
    Top = 624
    Width = 48
    Height = 25
    Caption = 'Up'
    TabOrder = 28
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 341
    Top = 624
    Width = 47
    Height = 25
    Caption = 'Down'
    TabOrder = 29
    OnClick = BitBtn2Click
  end
  object Panel2: TPanel
    Left = 287
    Top = 242
    Width = 442
    Height = 74
    BorderStyle = bsSingle
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 30
    Visible = False
    object ProgressBar1: TProgressBar
      Left = 8
      Top = 10
      Width = 417
      Height = 44
      TabOrder = 0
    end
  end
  object Button9: TButton
    Left = 606
    Top = 594
    Width = 83
    Height = 25
    Hint = 'Show picture location'
    Caption = 'Show File'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 31
    OnClick = Button9Click
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders, fdoPathMustExist]
    Left = 16
    Top = 16
  end
end
