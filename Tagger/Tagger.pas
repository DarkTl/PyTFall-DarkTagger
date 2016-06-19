unit Tagger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, shellapi, System.Classes, Vcl.Graphics, IniFiles,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.FileCtrl, Vcl.StdCtrls, Vcl.ExtCtrls, JPEG, pngimage, StrUtils, System.UITypes,
  Vcl.CheckLst, Vcl.Mask, Vcl.Buttons, Vcl.ComCtrls, Masks;

type
  TForm1 = class(TForm)
    FileOpenDialog1: TFileOpenDialog;
    FileListBox1: TFileListBox;
    Image1: TImage;
    Button1: TButton;
    RadioGroup1: TRadioGroup;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    CheckListBox1: TCheckListBox;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    GroupBox5: TGroupBox;
    RadioGroup3: TRadioGroup;
    RadioGroup4: TRadioGroup;
    GroupBox2: TGroupBox;
    CheckBox5: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    CheckListBox3: TCheckListBox;
    RadioGroup2: TRadioGroup;
    CheckListBox4: TCheckListBox;
    GroupBox3: TGroupBox;
    CheckBox10: TCheckBox;
    CheckListBox5: TCheckListBox;
    GroupBox4: TGroupBox;
    RadioGroup5: TRadioGroup;
    RadioGroup6: TRadioGroup;
    CheckBox11: TCheckBox;
    CheckBox12: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox16: TCheckBox;
    CheckBox17: TCheckBox;
    CheckListBox6: TCheckListBox;
    RadioGroup7: TRadioGroup;
    GroupBox6: TGroupBox;
    CheckListBox7: TCheckListBox;
    RadioGroup8: TRadioGroup;
    CheckBox18: TCheckBox;
    GroupBox7: TGroupBox;
    RadioGroup9: TRadioGroup;
    CheckBox19: TCheckBox;
    CheckListBox8: TCheckListBox;
    CheckListBox9: TCheckListBox;
    CheckBox20: TCheckBox;
    CheckListBox10: TCheckListBox;
    CheckListBox11: TCheckListBox;
    RadioGroup10: TRadioGroup;
    CheckBox6: TCheckBox;
    CheckBox21: TCheckBox;
    CheckBox22: TCheckBox;
    CheckListBox2: TCheckListBox;
    Panel1: TPanel;
    Button6: TButton;
    Button7: TButton;
    RadioGroup11: TRadioGroup;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Button8: TButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel2: TPanel;
    ProgressBar1: TProgressBar;
    Button9: TButton;
    Button10: TButton;
    Image2: TImage;
    RadioGroup12: TRadioGroup;
    procedure Button1Click(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure ShowImage;
    procedure SaveName;
    procedure LoadName;
    procedure Delete;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Normalize;
    function Valid(name: string):boolean;
    function Avail(ext:string):string;
    procedure Button5Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure RadioGroup7Click(Sender: TObject);
    procedure ClearProfile;
    procedure ClearGroup;
    procedure ClearGeneralSex;
    Procedure ClearMast;
    Procedure ClearBDSM;
    procedure ClearSex;
    procedure ClearOutdoors;
    procedure ClearIndoors;
    procedure Watcher;
    procedure ClearAll;
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure SelectGuySex;
    procedure SelectGirlSex;
    procedure RadioGroup9Click(Sender: TObject);
    function formulate:string;
    procedure Button2Click(Sender: TObject);
    function ui(s:string):boolean;
    procedure CheckListBox1Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure RadioGroup11Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure RadioGroup10Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure CheckListBox8Click(Sender: TObject);
    procedure CheckBox21Click(Sender: TObject);
    procedure CheckBox22Click(Sender: TObject);
    procedure CheckListBox9Click(Sender: TObject);
    procedure CheckListBox11Click(Sender: TObject);
    procedure CheckListBox10Click(Sender: TObject);
    function customask:string;
    procedure Button8Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure RadioGroup3Enter(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure RadioGroup12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  cname, nname, ext, dir, exename: string;
  mfile: file;
  buttonSelected: integer;
  IniFile: TIniFile;


  function HexToInt(s: string):integer;
  function ExtractFileNameWithoutExt(const FileName: string): string;

implementation

{$R *.dfm}

procedure TForm1.ClearAll;  //removes all flags
 var i:integer;
begin
ClearProfile;
ClearGroup;
ClearGeneralSex;
ClearMast;
ClearBDSM;
ClearSex;
ClearOutdoors;
ClearIndoors;
radiogroup1.ItemIndex:=-1;
radiogroup2.ItemIndex:=-1;
radiogroup3.ItemIndex:=-1;
checkbox1.Checked:=false;
checkbox2.Checked:=false;
checkbox3.Checked:=false;
checkbox4.Checked:=false;
checkbox5.Checked:=false;
checkbox7.Checked:=false;
checkbox8.Checked:=false;
checkbox9.Checked:=false;
for i:= 1 to 14 do
 checklistbox1.Checked[i]:=false;
for i:= 1 to 7 do
 checklistbox3.Checked[i]:=false;
end;

function TForm1.ui(s: string):boolean;  //function checks if index is unique or not
var i,j:integer; s1:string;
begin
 i:= filelistbox1.ItemIndex;
 filelistbox1.Visible:=false;
 for j:=0 to filelistbox1.Count-1 do
 begin
   filelistbox1.ItemIndex:=j;
   if length(ExtractFileNameWithoutExt(filelistbox1.FileName))>3 then
   begin
    s1:= copy(ExtractFileNameWithoutExt(filelistbox1.FileName), 1, 4);
    if (hextoint(s1)<>-1) and (s1=s) then
    begin
     result:=false;
     filelistbox1.ItemIndex:=i;
     filelistbox1.Visible:=true;
     break;
     exit;
    end;
   end;
 end;
filelistbox1.ItemIndex:=i;
filelistbox1.Visible:=true;
result:=true;
end;

function TForm1.customask:string; //function creates a file mask based on se;ected tags flags
var A,B:string; i:integer;
begin
 A:= formulate;
 B:= '';
 for i := 1 to length(A) do
  begin
    if A[i] = '-' then B:= B+'*';
    B := B+A[i];
  end;
 B:=B+'*';
 result:=B;
end;

function TForm1.formulate:string;  //function reads all flags and returns a string of tags
var s:string;
begin
 s:='';
 if radiogroup1.ItemIndex = 0 then s:=s+'-nn';  //main tags
 if radiogroup1.ItemIndex = 1 then s:=s+'-nd';
 if radiogroup1.ItemIndex = 2 then s:=s+'-sx';
 if radiogroup1.ItemIndex = 3 then s:=s+'-bs';
 if radiogroup1.ItemIndex = 4 then s:=s+'-po';
 if radiogroup1.ItemIndex = 5 then s:=s+'-qs';

 if checklistbox1.Checked[1] then s:=s+'-e1';   //emotions
 if checklistbox1.Checked[2] then s:=s+'-e2';
 if checklistbox1.Checked[3] then s:=s+'-e3';
 if checklistbox1.Checked[4] then s:=s+'-e4';
 if checklistbox1.Checked[5] then s:=s+'-e5';
 if checklistbox1.Checked[6] then s:=s+'-e6';
 if checklistbox1.Checked[7] then s:=s+'-e7';
 if checklistbox1.Checked[8] then s:=s+'-e8';
 if checklistbox1.Checked[9] then s:=s+'-e9';
 if checklistbox1.Checked[10] then s:=s+'-ea';
 if checklistbox1.Checked[11] then s:=s+'-eb';
 if checklistbox1.Checked[12] then s:=s+'-ec';
 if checklistbox1.Checked[13] then s:=s+'-ed';
 if checklistbox1.Checked[14] then s:=s+'-ee';

 if checkbox5.Checked then s:=s+'-z1'; //Time
 if checkbox7.Checked then s:=s+'-z2';
 if checkbox8.Checked then s:=s+'-z3';
 if checkbox9.Checked then s:=s+'-z4';

 if checklistbox3.Checked[1] then s:=s+'-c1'; //clothes
 if checklistbox3.Checked[2] then s:=s+'-c2';
 if checklistbox3.Checked[3] then s:=s+'-c3';
 if checklistbox3.Checked[4] then s:=s+'-c4';
 if checklistbox3.Checked[5] then s:=s+'-c5';
 if checklistbox3.Checked[6] then s:=s+'-c6';
 if checklistbox3.Checked[7] then s:=s+'-c7';
 if radiogroup2.ItemIndex=0 then s:=s+'-c8';
 if radiogroup2.ItemIndex=1 then s:=s+'-c9';
 if radiogroup2.ItemIndex=2 then s:=s+'-ca';
 if radiogroup2.ItemIndex=3 then s:=s+'-cb';
 if radiogroup2.ItemIndex=4 then s:=s+'-cc';
 if radiogroup2.ItemIndex=5 then s:=s+'-cd';
 if radiogroup2.ItemIndex=6 then s:=s+'-ce';
 if radiogroup2.ItemIndex=7 then s:=s+'-cf';
 if radiogroup2.ItemIndex=8 then s:=s+'-cg';
 if radiogroup2.ItemIndex=9 then s:=s+'-ch';
 if radiogroup2.ItemIndex=10 then s:=s+'-ci';
 if radiogroup2.ItemIndex=11 then s:=s+'-cj';
 if radiogroup2.ItemIndex=12 then s:=s+'-ck';
 if radiogroup2.ItemIndex=13 then s:=s+'-cl';
 if radiogroup2.ItemIndex=14 then s:=s+'-cm';

 if checkbox1.Checked then s:=s+'-l1'; //location
 if checkbox2.Checked then s:=s+'-l2';
 if radiogroup3.ItemIndex=0 then s:=s+'-l5';
 if radiogroup3.ItemIndex=1 then s:=s+'-l6';
 if radiogroup3.ItemIndex=2 then s:=s+'-l7';
 if radiogroup3.ItemIndex=3 then s:=s+'-l8';
 if checkbox3.Checked then
 begin
   s:=s+'-l3';
   if radiogroup10.ItemIndex=0 then s:=s+'-l9';
   if radiogroup10.ItemIndex=1 then s:=s+'-la';
   if radiogroup10.ItemIndex=2 then s:=s+'-lb';
   if checkbox6.Checked then s:=s+'-lc';
 end;
 if checkbox4.Checked then
 begin
   s:=s+'-l4';
   if radiogroup4.ItemIndex=0 then s:=s+'-ld';
   if radiogroup4.ItemIndex=1 then s:=s+'-le';
   if radiogroup4.ItemIndex=2 then s:=s+'-lf';
 end;

 if (radiogroup1.ItemIndex=0) or (radiogroup1.ItemIndex=1) then
 begin
   if checklistbox2.Checked[0] then s:=s+'-pr';
   if checklistbox2.Checked[1] then s:=s+'-pa';  //profile subtags
   if checklistbox2.Checked[2] then s:=s+'-pb';
   if checklistbox2.Checked[3] then s:=s+'-pc';
   if checklistbox2.Checked[4] then s:=s+'-pd';
   if checklistbox2.Checked[5] then s:=s+'-pf';

   if checklistbox4.Checked[1] then s:=s+'-a1'; //actions
   if checklistbox4.Checked[2] then s:=s+'-a2';
   if checklistbox4.Checked[3] then s:=s+'-a3';
   if checklistbox4.Checked[4] then s:=s+'-a4';
   if checklistbox4.Checked[5] then s:=s+'-a5';
   if checklistbox4.Checked[6] then s:=s+'-a6';
   if checklistbox4.Checked[7] then s:=s+'-a7';
   if checklistbox4.Checked[8] then s:=s+'-a8';
   if checklistbox4.Checked[9] then s:=s+'-a9';
   if checklistbox4.Checked[10] then s:=s+'-aa';
   if checklistbox4.Checked[11] then s:=s+'-ab';
   if checklistbox4.Checked[12] then s:=s+'-ac';
   if checklistbox4.Checked[13] then s:=s+'-ad';
   if checklistbox4.Checked[14] then s:=s+'-ae';
   if checklistbox4.Checked[15] then s:=s+'-af';
   if checklistbox4.Checked[16] then s:=s+'-ag';
   if checklistbox4.Checked[17] then s:=s+'-ah';
   if checklistbox4.Checked[18] then s:=s+'-ai';
   if checklistbox4.Checked[19] then s:=s+'-aj';
 end;

 if radiogroup1.ItemIndex=2 then
 begin
   if checkbox10.Checked then  //masturbation
   begin
     s:=s+'-ma';
     if checklistbox5.Checked[1] then s:=s+'-m1';
     if checklistbox5.Checked[2] then s:=s+'-m2';
     if checklistbox5.Checked[3] then s:=s+'-m3';
     if checklistbox5.Checked[4] then s:=s+'-m4';
     if checklistbox5.Checked[5] then s:=s+'-m5';
     if checklistbox5.Checked[6] then s:=s+'-m6';
     if checklistbox5.Checked[7] then s:=s+'-m7';
     if checklistbox5.Checked[8] then s:=s+'-m8';
   end;
   if radiogroup7.ItemIndex=0 then   //normal sex
   begin
     s:=s+'-ns';
     if checkbox19.Checked then s:=s+'-p3';
     if checklistbox8.Checked[1] then s:=s+'-s1';
     if checklistbox8.Checked[2] then s:=s+'-s2';
     if checklistbox8.Checked[3] then s:=s+'-s3';
     if checklistbox8.Checked[4] then s:=s+'-s4';
     if checklistbox8.Checked[5] then s:=s+'-s5';
     if checklistbox8.Checked[6] then s:=s+'-s6';
     if checklistbox8.Checked[7] then s:=s+'-s7';
     if checklistbox8.Checked[8] then s:=s+'-s8';
     if checklistbox8.Checked[9] then s:=s+'-s9';
     if checkbox21.Checked then s:=s+'-sa';
     if checkbox22.Checked then s:=s+'-sb';
     if checklistbox9.Checked[1] then s:=s+'-sc';
     if checklistbox9.Checked[2] then s:=s+'-sd';
     if checklistbox9.Checked[3] then s:=s+'-se';
     if checklistbox9.Checked[4] then s:=s+'-sf';
     if checklistbox9.Checked[5] then s:=s+'-sg';
     if checklistbox9.Checked[6] then s:=s+'-sh';
     if checklistbox9.Checked[7] then s:=s+'-si';
     if checklistbox9.Checked[8] then s:=s+'-sj';
     if checklistbox9.Checked[9] then s:=s+'-sk';
     if checklistbox9.Checked[10] then s:=s+'-sl';
     if checklistbox9.Checked[11] then s:=s+'-sm';

     if radiogroup9.ItemIndex=0 then
     begin
       s:=s+'-p1';
       if checklistbox11.Checked[1] then s:=s+'-sv';
       if checklistbox11.Checked[2] then s:=s+'-sw';
       if checklistbox11.Checked[3] then s:=s+'-sy';
       if checklistbox11.Checked[4] then s:=s+'-sz';
       if checklistbox11.Checked[5] then s:=s+'-t1';
       if checklistbox11.Checked[6] then s:=s+'-t2';
       if checklistbox11.Checked[7] then s:=s+'-t3';
       if checklistbox11.Checked[8] then s:=s+'-t4';
       if checklistbox11.Checked[9] then s:=s+'-t5';
       if checklistbox11.Checked[10] then s:=s+'-t6';
       if checklistbox11.Checked[11] then s:=s+'-st';
       if checklistbox11.Checked[12] then s:=s+'-ss';
       if checklistbox11.Checked[13] then s:=s+'-t7';
     end;
     if radiogroup9.ItemIndex=1 then
     begin
       s:=s+'-p2';
       if checklistbox10.Checked[1] then s:=s+'-sn';
       if (checklistbox10.Checked[2]) and (checklistbox10.Checked[1]) then s:=s+'-so';
       if checklistbox10.Checked[3] then s:=s+'-sp';
       if checklistbox10.Checked[4] then s:=s+'-sr';
       if checklistbox10.Checked[5] then s:=s+'-ss';
       if checklistbox10.Checked[6] then s:=s+'-st';
       if checklistbox10.Checked[7] then s:=s+'-su';
     end;
   end;
   if radiogroup7.ItemIndex=1 then  //group
   begin
    s:=s+'-gr';
    if radiogroup5.ItemIndex=0 then s:=s+'-g1';
    if radiogroup5.ItemIndex=1 then s:=s+'-g2';
    if radiogroup5.ItemIndex=2 then s:=s+'-g3';
    if radiogroup5.ItemIndex=3 then s:=s+'-g4';
    if radiogroup6.ItemIndex=0 then s:=s+'-g5';
    if radiogroup6.ItemIndex=1 then s:=s+'-g6';
    if radiogroup6.ItemIndex=2 then s:=s+'-g7';
    if radiogroup6.ItemIndex=3 then s:=s+'-g8';
    if checkbox11.Checked then s:=s+'-g9';
    if checkbox12.Checked then s:=s+'-ga';
    if checkbox13.Checked then s:=s+'-gb';
    if checkbox14.Checked then s:=s+'-gc';
    if checkbox15.Checked then s:=s+'-gd';
    if checkbox16.Checked then s:=s+'-ge';
    if checkbox17.Checked then s:=s+'-gf';
    if checklistbox6.Checked[0] then s:=s+'-gg';
    if checklistbox6.Checked[1] then s:=s+'-gh';
    if checklistbox6.Checked[2] then s:=s+'-gi';
    if checklistbox6.Checked[3] then s:=s+'-gj';
    if checklistbox6.Checked[4] then s:=s+'-gk';
    if checklistbox6.Checked[5] then s:=s+'-gl';
   end;
   if radiogroup7.ItemIndex=2 then //bdsm
   begin
     s:=s+'-bd';
     if checklistbox7.Checked[0] then s:=s+'-b1';
     if checklistbox7.Checked[1] then s:=s+'-b2';
     if checklistbox7.Checked[2] then s:=s+'-b3';
     if checklistbox7.Checked[3] then s:=s+'-b4';
     if checklistbox7.Checked[4] then s:=s+'-b5';
     if checklistbox7.Checked[5] then s:=s+'-b6';
     if radiogroup8.ItemIndex=0 then s:=s+'-b7';
     if radiogroup8.ItemIndex=1 then s:=s+'-b8';
     if radiogroup8.ItemIndex=2 then s:=s+'-b9';
     if radiogroup8.ItemIndex=3 then s:=s+'-ba';
     if radiogroup8.ItemIndex=4 then s:=s+'-bb';
     if checkbox20.Checked then s:=s+'-bc';
     if checkbox18.Checked then s:=s+'-be';;
   end;
   if radiogroup7.ItemIndex=3 then s:=s+'-cu'; //cumcovered
 end;
 result:=s;
end;

procedure TForm1.Image1Click(Sender: TObject); //refreshing picture by click on it
begin
 ext:= ExtractFileExt(FileListBox1.FileName);
 if ext <> '' then Image1.Picture.LoadFromFile(FileListBox1.FileName);
 Filelistbox1.SetFocus;
end;

procedure TForm1.Watcher; // uptading window title when we move from one picture to another
var i,j,k:integer;
begin
 if FileListBox1.ItemIndex<>-1 then i:=FileListBox1.ItemIndex+1 else i:=0;
 j:= FileListBox1.Count;
 if (i<>0) and (j<>0) then k:=round(i/j*100) else k:=0;
 Form1.Caption:='DarkTagger '+ inttostr(i)+'/'+inttostr(j)+' '+inttostr(k)+'%';
end;

procedure TForm1.SelectGuySex; //showing male sex tags
var i:integer;
begin
 checklistbox11.Visible:=false;
 for i:=1 to 13 do
  checklistbox11.Checked[i]:=false;
 checklistbox10.Visible:=true;
end;

procedure TForm1.SelectGirlSex; //showing female sex tags
var i:integer;
begin
 checklistbox10.Visible:=false;
 for i:=1 to 7 do
  checklistbox10.Checked[i]:=false;
 checklistbox11.Visible:=true;
end;

procedure TForm1.ClearOutdoors; // resets outdoors flags
begin
  groupbox5.Visible:=false;
  radiogroup10.ItemIndex:=-1;
  checkbox6.Checked:=false;
end;

procedure TForm1.ClearIndoors; // resets indoors flags
begin
  radiogroup4.Visible:=false;
  radiogroup4.ItemIndex:=-1;
end;

procedure TForm1.ClearProfile; //removes all profile panels
var i:integer;
begin
 checklistbox2.Visible:=false;
 for i := 0 to 5 do
  CheckListBox2.Checked[i] := False;
 checklistbox4.Visible:=false;
 for i := 1 to 19 do
  CheckListBox4.Checked[i] := False;
end;

procedure TForm1.ClearGeneralSex; //removes general sex panel
begin
 groupbox3.Visible:=false;
 radiogroup7.ItemIndex:=-1;
 checkbox10.Checked:=false;
end;

procedure TForm1.ClearGroup; //removes group panel
var i:integer;
begin
 groupbox4.Visible:=false;
 checkbox11.Checked:=false;
 checkbox12.Checked:=false;
 checkbox13.Checked:=false;
 checkbox14.Checked:=false;
 checkbox15.Checked:=false;
 checkbox16.Checked:=false;
 checkbox17.Checked:=false;
 radiogroup5.ItemIndex:=-1;
 radiogroup6.ItemIndex:=-1;
 for i:=0 to 5 do
  checklistbox6.Checked[i]:=false;
end;

Procedure TForm1.ClearMast;  //removes masturbation panel
var i:integer;
begin
 checklistbox5.Visible:=false;
 for i := 1 to 8 do
  checklistbox5.Checked[i]:=false;
end;

Procedure TForm1.ClearBDSM;   //removes bdsm panel
var i:integer;
begin
  groupbox6.Visible:=false;
  checkbox18.Checked:=false;
  checkbox20.Checked:=false;
  radiogroup8.ItemIndex:=-1;
  for i:=0 to 5 do
   checklistbox7.Checked[i]:=false; 
end;

procedure TForm1.ClearSex; //reset all sex flags
var i:integer;
begin
  groupbox7.Visible:=false;
  radiogroup9.ItemIndex:=-1;
  checkbox19.Checked:=false;
  for i:=1 to 9 do
   checklistbox8.Checked[i]:=false;
  for i:=1 to 11 do
   checklistbox9.Checked[i]:=false;
  for i:=1 to 13 do
   checklistbox11.Checked[i]:=false;
  for i:=1 to 7 do
   checklistbox10.Checked[i]:=false;
  checklistbox11.Visible:=false;
  checklistbox10.Visible:=false;
  checkbox21.checked:=false;
  checkbox22.checked:=false;
end;

function ExtractFileNameWithoutExt(const FileName: string): string; //Gets filename without extension from filepath or filename
begin
result:= ChangeFileExt(ExtractFileName(FileName), '');
end;

function HexToInt(s: string):integer; //Hex to integer converting
var
i: integer;
begin
 s:='$'+s;
 try
 result:=StrToInt(s);
 except                                      //Returns -1 if string cannot be converted to integer
 on EConvertError do
 result:= -1
 end;
end;

function TForm1.Valid(name: string):boolean; //Determine whether file name looks like properly formatted or not
var
i:integer;
s:string;
label
 enough;
begin
 if (length(name)<4) or ((length(name)>4) and (length(name)<7)) then goto enough; //less than 4 characters or more than 4 and less than 7 characters (ie something is wrong with tags) means fail
 if HexToInt(Copy(name, 1, 4))=-1 then goto enough; //first 4 characters not a hex number mean fail
 System.Delete(name, 1, 4);
 for i:= 1 to length(name) do
 begin  //let's check if the remaining part of filename looks like a sequence of tags
  if (i=1) or ((i-1) mod 3= 0) then //in the remaining part the first character should be "-", and every third after it too
  begin
   if name[i]<>'-' then goto enough; //so let's check it for a start
  end;
 end;
 result:=true; //if all checks were passed, then filename is ok
 exit;
enough:
 result:=false; //filename failed
 exit;
end;

function TForm1.Avail(ext:string):string; //find an available filename with min possible index depending on extension
var
i: integer;
k: boolean;
s: string;
minimap: array of string; //array of all filenames in the current folder without pathes and tags
begin
 SetLength(minimap, filelistbox1.Count);
 for i := 0 to filelistbox1.Count-1 do
  if HexToInt(copy(filelistbox1.Items.Strings[i],1,4))<>-1 then
   minimap[i]:=copy(filelistbox1.Items.Strings[i],1,4)+extractfileext(filelistbox1.Items.Strings[i])//array is filled with valid filenames
   else minimap[i]:='nope'; //and nopes instead of invalid ones
 k:=false; //we going to check if it's possible at all to find an available filename yet
 for i := 0 to 65535 do
 begin
  s:= IntToHex(i, 4) + ext;
  if not(MatchText(s, minimap)) then //so the moment we see a hex number that does not exist in the array we return it
   begin
    k:=true;
    result:=s;
    break;
   end;
  end;
if not(k) then buttonSelected := MessageDlg('There are more than 65535 tagged files in the current folder!', mtError, [mbOK], 0);
end; //and if there is no a free hex number from 0 to ffff, then there are too many pictures


procedure TForm1.Delete; //deleting a selected file
var i:integer;
begin
 begin
  i:=FileListBox1.ItemIndex;
  DeleteFile(FileListBox1.FileName);
  FileListBox1.Update;
  if i+1<=filelistbox1.Count then FileListBox1.ItemIndex:=i;
  ShowImage;
 end;
end;

procedure TForm1.Normalize; //normalize files names without damaging tagged ones
var
i,j,k: integer;
s: string;
map: array of string; //dynamic array that will contain full pathes and names of "bad" files
label
enough;
begin
 k:=FileListBox1.ItemIndex;
 j:=0;
 SetLength(map, FileListBox1.Count);
 FileListBox1.Visible:=false;
 Panel2.Visible:=true;
 Progressbar1.Position:=0;
 for i:= 0 to FileListBox1.Count-1 do
 begin
  Progressbar1.Position:=Round(100*i/FileListBox1.Count);
  FileListBox1.ItemIndex:=i;
  if Valid(ExtractFileNameWithoutExt(FileListBox1.FileName))=false then //let's find all bad filenames and write their filenames into map array
  begin
    map[j]:= filelistbox1.FileName;
    j:=j+1;
  end;
 end;
 if j=0 then goto enough; //all filenames are good
 SetLength(map, j); //free some memory by decreasing array
 for i:= 0 to j-1 do
  begin
   Progressbar1.Position:=Round(100*i/j);
   s:=Avail(LowerCase(ExtractFileExt(map[i])));
   RenameFile(map[i], s);
   FileListBox1.Update;
  end;
Panel2.Visible:=false;
FileListBox1.Update;
FileListBox1.Visible:=true;
exit;
enough:
 FileListBox1.Visible:=true;
 FileListBox1.ItemIndex:=k;
 Panel2.Visible:=false;
end;

procedure TForm1.SaveName; //for saving tags into file name
var s1:string;
begin
 if (FileListBox1.ItemIndex <> -1) and (filelistbox1.FileName <> '') then
 begin
  nname:=formulate+extractfileext(filelistbox1.FileName);
  s1:=copy(ExtractFileNameWithoutExt(filelistbox1.FileName), 1, 4);
  if HexToInt(s1)<>-1 then
   if RenameFile(filelistbox1.FileName, (s1+nname)) then
   begin
     FileListBox1.Update;
     exit;
   end;
  nname:=ExtractFileNameWithoutExt(avail(extractfileext(filelistbox1.FileName)))+nname;
  renamefile(filelistbox1.FileName,nname);
  FileListBox1.Update;
 end;
end;

procedure TForm1.LoadName; //for loading tags from file name
var i,j:integer;
ctags: array [1..82] of string; //tags that we found in a file name
begin
 for i := 1 to 82 do
  ctags[i]:= '';
 j:=0;
 cname:= ExtractFileNamewithoutext(FileListBox1.FileName);
 for i:=0 to (length(cname)) do
  if cname[i]='-' then
   begin
    j:=j+1;
    ctags[j]:= cname[i+1]+cname[i+2]
   end;
 RadioGroup1.ItemIndex:=-1;
 for i:=1 to 82 do
   begin
     if MatchText('nn',ctags) then RadioGroup1.ItemIndex:=0;   //main tags
     if MatchText('nd',ctags) then RadioGroup1.ItemIndex:=1;
     if MatchText('sx',ctags) then RadioGroup1.ItemIndex:=2;
     if MatchText('bs',ctags) then RadioGroup1.ItemIndex:=3;
     if MatchText('po',ctags) then RadioGroup1.ItemIndex:=4;
     if MatchText('qs',ctags) then RadioGroup1.ItemIndex:=5;

     if MatchText('e1',ctags) then checklistbox1.Checked[1]:=true;   //emotions
     if MatchText('e2',ctags) then checklistbox1.Checked[2]:=true;
     if MatchText('e3',ctags) then checklistbox1.Checked[3]:=true;
     if MatchText('e4',ctags) then checklistbox1.Checked[4]:=true;
     if MatchText('e5',ctags) then checklistbox1.Checked[5]:=true;
     if MatchText('e6',ctags) then checklistbox1.Checked[6]:=true;
     if MatchText('e7',ctags) then checklistbox1.Checked[7]:=true;
     if MatchText('e8',ctags) then checklistbox1.Checked[8]:=true;
     if MatchText('e9',ctags) then checklistbox1.Checked[9]:=true;
     if MatchText('ea',ctags) then checklistbox1.Checked[10]:=true;
     if MatchText('eb',ctags) then checklistbox1.Checked[11]:=true;
     if MatchText('ec',ctags) then checklistbox1.Checked[12]:=true;
     if MatchText('ed',ctags) then checklistbox1.Checked[13]:=true;
     if MatchText('ee',ctags) then checklistbox1.Checked[14]:=true;

     if MatchText('z1',ctags) then checkbox5.Checked:=true;  //time
     if MatchText('z2',ctags) then checkbox7.Checked:=true;
     if MatchText('z3',ctags) then checkbox8.Checked:=true;
     if MatchText('z4',ctags) then checkbox9.Checked:=true;

     if MatchText('c1',ctags) then checklistbox3.Checked[1]:=true; //clothes
     if MatchText('c2',ctags) then checklistbox3.Checked[2]:=true;
     if MatchText('c3',ctags) then checklistbox3.Checked[3]:=true;
     if MatchText('c4',ctags) then checklistbox3.Checked[4]:=true;
     if MatchText('c5',ctags) then checklistbox3.Checked[5]:=true;
     if MatchText('c6',ctags) then checklistbox3.Checked[6]:=true;
     if MatchText('c7',ctags) then checklistbox3.Checked[7]:=true;
     if MatchText('c8',ctags) then radiogroup2.ItemIndex:=0;
     if MatchText('c9',ctags) then radiogroup2.ItemIndex:=1;
     if MatchText('ca',ctags) then radiogroup2.ItemIndex:=2;
     if MatchText('cb',ctags) then radiogroup2.ItemIndex:=3;
     if MatchText('cc',ctags) then radiogroup2.ItemIndex:=4;
     if MatchText('cd',ctags) then radiogroup2.ItemIndex:=5;
     if MatchText('ce',ctags) then radiogroup2.ItemIndex:=6;
     if MatchText('cf',ctags) then radiogroup2.ItemIndex:=7;
     if MatchText('cg',ctags) then radiogroup2.ItemIndex:=8;
     if MatchText('ch',ctags) then radiogroup2.ItemIndex:=9;
     if MatchText('ci',ctags) then radiogroup2.ItemIndex:=10;
     if MatchText('cj',ctags) then radiogroup2.ItemIndex:=11;
     if MatchText('ck',ctags) then radiogroup2.ItemIndex:=12;
     if MatchText('cl',ctags) then radiogroup2.ItemIndex:=13;
     if MatchText('cm',ctags) then radiogroup2.ItemIndex:=14;
                                                                    //location

     if MatchText('l5',ctags) then radiogroup3.ItemIndex:=0;
     if MatchText('l6',ctags) then radiogroup3.ItemIndex:=1;
     if MatchText('l7',ctags) then radiogroup3.ItemIndex:=2;
     if MatchText('l8',ctags) then radiogroup3.ItemIndex:=3;
     if MatchText('l1',ctags) then checkbox1.Checked:=true;
     if MatchText('l2',ctags) then checkbox2.Checked:=true;
     if MatchText('l3',ctags) then checkbox3.Checked:=true;
     if MatchText('l9',ctags) then radiogroup10.ItemIndex:=0;
     if MatchText('la',ctags) then radiogroup10.ItemIndex:=1;
     if MatchText('lb',ctags) then radiogroup10.ItemIndex:=2;
     if MatchText('lc',ctags) then checkbox6.Checked:=true;
     if MatchText('l4',ctags) then checkbox4.Checked:=true;
     if MatchText('ld',ctags) then radiogroup4.ItemIndex:=0;
     if MatchText('le',ctags) then radiogroup4.ItemIndex:=1;
     if MatchText('lf',ctags) then radiogroup4.ItemIndex:=2;

     if MatchText('pr',ctags) then checklistbox2.Checked[0]:=true; //profile subtags
     if MatchText('pa',ctags) then checklistbox2.Checked[1]:=true;
     if MatchText('pb',ctags) then checklistbox2.Checked[2]:=true;
     if MatchText('pc',ctags) then checklistbox2.Checked[3]:=true;
     if MatchText('pd',ctags) then checklistbox2.Checked[4]:=true;
     if MatchText('pf',ctags) then checklistbox2.Checked[5]:=true;

     if MatchText('a1',ctags) then checklistbox4.Checked[1]:=true; //actions
     if MatchText('a2',ctags) then checklistbox4.Checked[2]:=true;
     if MatchText('a3',ctags) then checklistbox4.Checked[3]:=true;
     if MatchText('a4',ctags) then checklistbox4.Checked[4]:=true;
     if MatchText('a5',ctags) then checklistbox4.Checked[5]:=true;
     if MatchText('a6',ctags) then checklistbox4.Checked[6]:=true;
     if MatchText('a7',ctags) then checklistbox4.Checked[7]:=true;
     if MatchText('a8',ctags) then checklistbox4.Checked[8]:=true;
     if MatchText('a9',ctags) then checklistbox4.Checked[9]:=true;
     if MatchText('aa',ctags) then checklistbox4.Checked[10]:=true;
     if MatchText('ab',ctags) then checklistbox4.Checked[11]:=true;
     if MatchText('ac',ctags) then checklistbox4.Checked[12]:=true;
     if MatchText('ad',ctags) then checklistbox4.Checked[13]:=true;
     if MatchText('ae',ctags) then checklistbox4.Checked[14]:=true;
     if MatchText('af',ctags) then checklistbox4.Checked[15]:=true;
     if MatchText('ag',ctags) then checklistbox4.Checked[16]:=true;
     if MatchText('ah',ctags) then checklistbox4.Checked[17]:=true;
     if MatchText('ai',ctags) then checklistbox4.Checked[18]:=true;
     if MatchText('aj',ctags) then checklistbox4.Checked[19]:=true;

     if MatchText('ma',ctags) then checkbox10.Checked:=true; //masturbation
     if MatchText('m1',ctags) then checklistbox5.Checked[1]:=true;
     if MatchText('m2',ctags) then checklistbox5.Checked[2]:=true;
     if MatchText('m3',ctags) then checklistbox5.Checked[3]:=true;
     if MatchText('m4',ctags) then checklistbox5.Checked[4]:=true;
     if MatchText('m5',ctags) then checklistbox5.Checked[5]:=true;
     if MatchText('m6',ctags) then checklistbox5.Checked[6]:=true;
     if MatchText('m7',ctags) then checklistbox5.Checked[7]:=true;
     if MatchText('m8',ctags) then checklistbox5.Checked[8]:=true;

     if MatchText('ns',ctags) then radiogroup7.ItemIndex:=0; //normal sex
     if MatchText('p3',ctags) then checkbox19.Checked:=true;
     if MatchText('s1',ctags) then checklistbox8.Checked[1]:=true;
     if MatchText('s2',ctags) then checklistbox8.Checked[2]:=true;
     if MatchText('s3',ctags) then checklistbox8.Checked[3]:=true;
     if MatchText('s4',ctags) then checklistbox8.Checked[4]:=true;
     if MatchText('s5',ctags) then checklistbox8.Checked[5]:=true;
     if MatchText('s6',ctags) then checklistbox8.Checked[6]:=true;
     if MatchText('s7',ctags) then checklistbox8.Checked[7]:=true;
     if MatchText('s8',ctags) then checklistbox8.Checked[8]:=true;
     if MatchText('s9',ctags) then checklistbox8.Checked[9]:=true;
     if MatchText('sa',ctags) then checkbox21.Checked:=true;
     if MatchText('sb',ctags) then checkbox22.Checked:=true;
     if MatchText('sc',ctags) then checklistbox9.Checked[1]:=true;
     if MatchText('sd',ctags) then checklistbox9.Checked[2]:=true;
     if MatchText('se',ctags) then checklistbox9.Checked[3]:=true;
     if MatchText('sf',ctags) then checklistbox9.Checked[4]:=true;
     if MatchText('sg',ctags) then checklistbox9.Checked[5]:=true;
     if MatchText('sh',ctags) then checklistbox9.Checked[6]:=true;
     if MatchText('si',ctags) then checklistbox9.Checked[7]:=true;
     if MatchText('sj',ctags) then checklistbox9.Checked[8]:=true;
     if MatchText('sk',ctags) then checklistbox9.Checked[9]:=true;
     if MatchText('sl',ctags) then checklistbox9.Checked[10]:=true;
     if MatchText('sm',ctags) then checklistbox9.Checked[11]:=true;
     if MatchText('p1',ctags) then radiogroup9.ItemIndex:=0;
     if (MatchText('sv',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[1]:=true;
     if (MatchText('sw',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[2]:=true;
     if (MatchText('sy',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[3]:=true;
     if (MatchText('sz',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[4]:=true;
     if (MatchText('t1',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[5]:=true;
     if (MatchText('t2',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[6]:=true;
     if (MatchText('t3',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[7]:=true;
     if (MatchText('t4',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[8]:=true;
     if (MatchText('t5',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[9]:=true;
     if (MatchText('t6',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[10]:=true;
     if (MatchText('st',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[11]:=true;
     if (MatchText('ss',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[12]:=true;
     if (MatchText('t7',ctags)) and (radiogroup9.ItemIndex=0) then checklistbox11.Checked[13]:=true;
     if MatchText('p2',ctags) then radiogroup9.ItemIndex:=1;
     if (MatchText('sn',ctags)) and (radiogroup9.ItemIndex=1) then checklistbox10.Checked[1]:=true;
     if (MatchText('so',ctags)) and (radiogroup9.ItemIndex=1) then checklistbox10.Checked[2]:=true;
     if (MatchText('sp',ctags)) and (radiogroup9.ItemIndex=1) then checklistbox10.Checked[3]:=true;
     if (MatchText('sr',ctags)) and (radiogroup9.ItemIndex=1) then checklistbox10.Checked[4]:=true;
     if (MatchText('ss',ctags)) and (radiogroup9.ItemIndex=1) then checklistbox10.Checked[5]:=true;
     if (MatchText('st',ctags)) and (radiogroup9.ItemIndex=1) then checklistbox10.Checked[6]:=true;
     if (MatchText('su',ctags)) and (radiogroup9.ItemIndex=1) then checklistbox10.Checked[7]:=true;

     if MatchText('gr',ctags) then radiogroup7.ItemIndex:=1;  //group
     if MatchText('g1',ctags) then radiogroup5.ItemIndex:=0;
     if MatchText('g2',ctags) then radiogroup5.ItemIndex:=1;
     if MatchText('g3',ctags) then radiogroup5.ItemIndex:=2;
     if MatchText('g4',ctags) then radiogroup5.ItemIndex:=3;
     if MatchText('g5',ctags) then radiogroup6.ItemIndex:=0;
     if MatchText('g6',ctags) then radiogroup6.ItemIndex:=1;
     if MatchText('g7',ctags) then radiogroup6.ItemIndex:=2;
     if MatchText('g8',ctags) then radiogroup6.ItemIndex:=3;
     if MatchText('g9',ctags) then checkbox11.Checked:=true;
     if MatchText('ga',ctags) then checkbox12.Checked:=true;
     if MatchText('gb',ctags) then checkbox13.Checked:=true;
     if MatchText('gc',ctags) then checkbox14.Checked:=true;
     if MatchText('gd',ctags) then checkbox15.Checked:=true;
     if MatchText('ge',ctags) then checkbox16.Checked:=true;
     if MatchText('gf',ctags) then checkbox17.Checked:=true;
     if MatchText('gg',ctags) then checklistbox6.Checked[0]:=true;
     if MatchText('gh',ctags) then checklistbox6.Checked[1]:=true;
     if MatchText('gi',ctags) then checklistbox6.Checked[2]:=true;
     if MatchText('gj',ctags) then checklistbox6.Checked[3]:=true;
     if MatchText('gk',ctags) then checklistbox6.Checked[4]:=true;
     if MatchText('gl',ctags) then checklistbox6.Checked[5]:=true;

     if MatchText('bd',ctags) then radiogroup7.ItemIndex:=2; //bdsm
     if MatchText('b1',ctags) then checklistbox7.Checked[0]:=true;
     if MatchText('b2',ctags) then checklistbox7.Checked[1]:=true;
     if MatchText('b3',ctags) then checklistbox7.Checked[2]:=true;
     if MatchText('b4',ctags) then checklistbox7.Checked[3]:=true;
     if MatchText('b5',ctags) then checklistbox7.Checked[4]:=true;
     if MatchText('b6',ctags) then checklistbox7.Checked[5]:=true;
     if MatchText('b7',ctags) then radiogroup8.ItemIndex:=0;
     if MatchText('b8',ctags) then radiogroup8.ItemIndex:=1;
     if MatchText('b9',ctags) then radiogroup8.ItemIndex:=2;
     if MatchText('ba',ctags) then radiogroup8.ItemIndex:=3;
     if MatchText('bb',ctags) then radiogroup8.ItemIndex:=4;
     if MatchText('bc',ctags) then checkbox20.Checked:=true;
     if MatchText('be',ctags) then checkbox18.Checked:=true;

     if MatchText('cu',ctags) then radiogroup7.ItemIndex:=3; //cumcovered
   end;
 panel1.Color:=clgreen;
end;

procedure TForm1.MaskEdit1Change(Sender: TObject);
begin
 if radiogroup11.ItemIndex=3 then
 begin
   filelistbox1.Mask:=maskedit1.Text;
   FileListBox1.Update;
 end;
end;

procedure TForm1.ShowImage; //showing currently selected picture
begin
 ext:= ExtractFileExt(FileListBox1.FileName);
 if (LowerCase(ext) = '.jpg') or (LowerCase(ext) = '.jpeg') or (LowerCase(ext) = '.png') then
  Image1.Picture.LoadFromFile(FileListBox1.FileName);
end;

procedure TForm1.BitBtn1Click(Sender: TObject); // arrow up
begin
if FileListBox1.ItemIndex=-1 then FileListBox1.ItemIndex:=0 else begin
if (FileListBox1.ItemIndex>0) then FileListBox1.ItemIndex:=FileListBox1.ItemIndex-1 else Filelistbox1.SetFocus; end;
ShowImage;
clearall;
if filelistbox1.FileName<>'' then
begin
 LoadName;
 Edit1.Text:= ExtractFileNameWithoutExt(Filelistbox1.FileName);
 Watcher;
 Filelistbox1.SetFocus;
end;
end;

procedure TForm1.BitBtn2Click(Sender: TObject); // arrow down
begin
if FileListBox1.ItemIndex=-1 then FileListBox1.ItemIndex:=0 else begin
if (FileListBox1.ItemIndex>-1) then FileListBox1.ItemIndex:=FileListBox1.ItemIndex+1 else Filelistbox1.SetFocus; end;
ShowImage;
clearall;
if filelistbox1.FileName<>'' then
begin
 LoadName;
 Edit1.Text:= ExtractFileNameWithoutExt(Filelistbox1.FileName);
 Watcher;
 Filelistbox1.SetFocus;
end;
end;


procedure TForm1.Button10Click(Sender: TObject);
begin
 RadioGroup2.ItemIndex:=-1;
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  Image2.Canvas.Brush.Color:= ($FFFFFF);
  image2.Canvas.Rectangle(0,0,image1. Width,image1.Height);
end;

procedure TForm1.Button1Click(Sender: TObject); //for selecting a folder
begin
 with TFileOpenDialog.Create(nil) do
  try
   Title := 'Select Directory';
   Options := [fdoPickFolders, fdoPathMustExist, fdoForceFileSystem];
   OkButtonLabel := 'Select';
   DefaultFolder := exename;
   if Execute then
    FileListBox1.Directory:=FileName;
   finally
      Free;
   end;
image1.Picture:=nil;
Filelistbox1.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject); //saving button
var i:integer;
begin
if filelistbox1.ItemIndex<>-1 then
begin
 i:=filelistbox1.ItemIndex;
 SaveName;
 filelistbox1.ItemIndex:=i;
 LoadName;
end;
panel1.Color:=clgreen;
ShowImage;
Filelistbox1.SetFocus;
Edit1.Text:= ExtractFileNameWithoutExt(Filelistbox1.FileName);
Watcher;
end;

procedure TForm1.Button3Click(Sender: TObject); //button clearing all tags and renaming files by default
var i:integer;
begin
buttonSelected := MessageDlg('This will rename all files in the folder and remove all tags from them. Continue?',mtCustom,[mbYes,mbCancel], 0);
if buttonSelected = mrYes then
if FileListBox1.Items.Count>0 then
begin
  Panel2.Visible:=true;
  Progressbar1.Position:=0;
  FileListBox1.Visible:=false;
  for i:= 0 to FileListBox1.Items.Count-1 do
   begin
    FileListBox1.ItemIndex:=i;
    nname:= IntToHex(i, 4) + LowerCase(ExtractFileExt(FileListBox1.FileName));
    Progressbar1.Position:=Round(100*i/FileListBox1.Count);
    RenameFile(FileListBox1.FileName, nname);
   end;
  FileListBox1.Update;
  FileListBox1.Visible:=true;
  Panel2.Visible:=false;
end;
Filelistbox1.SetFocus;
end;

procedure TForm1.Button4Click(Sender: TObject); //delete button
begin
if FileListBox1.ItemIndex<>-1 then Delete;
if (FileListBox1.ItemIndex<>-1) and (FileListBox1.FileName<>'') then LoadName;
Filelistbox1.SetFocus;
Watcher;
Edit1.Text:= ExtractFileNameWithoutExt(Filelistbox1.FileName);
end;

procedure SelectFileInExplorer(const Fn: string); //windows api call for selecting a file in a folder
begin
  ShellExecute(Application.Handle, 'open', 'explorer.exe',
    PChar('/select,"' + Fn+'"'), nil, SW_NORMAL);
end;

procedure TForm1.Button5Click(Sender: TObject); // normalize button
begin
buttonSelected := MessageDlg('This will rename all untagged files in the folder. Continue?',mtCustom,[mbYes,mbCancel], 0);
if buttonSelected = mrYes then
 if FileListBox1.Count>0 then Normalize;
Filelistbox1.SetFocus;
end;

procedure TForm1.Button6Click(Sender: TObject); // reset tags button
begin
 clearall;
end;

procedure TForm1.Button7Click(Sender: TObject); // refreshing the filelist with the button
var i:integer;
begin
 i:=filelistbox1.ItemIndex;
 FileListBox1.Update;
 filelistbox1.ItemIndex:=i;
 Watcher;
 Filelistbox1.SetFocus;
end;

procedure TForm1.Button8Click(Sender: TObject); // generate mask button
begin
MaskEdit1.Text:= Customask;
if radiogroup11.ItemIndex=3 then
 begin
   filelistbox1.Mask:=maskedit1.Text;
   FileListBox1.Update;
 end;
Filelistbox1.SetFocus;
end;

procedure TForm1.Button9Click(Sender: TObject); // show file button
begin
if filelistbox1.ItemIndex<>-1 then
SelectFileInExplorer(filelistbox1.FileName);
Filelistbox1.SetFocus;
end;

procedure TForm1.CheckBox10Click(Sender: TObject); // stuff below makes the panel around save button red when you clisk any tag flag
var i:integer;                                     // and also makes groups of flags appear and disappear when needed
begin
 if filelistbox1.Count>0 then panel1.Color:=clred;
 if checkbox10.Checked then checklistbox5.Visible:=true else
  begin
   ClearMast;
   exit;
  end;
end;

procedure TForm1.CheckBox19Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckBox21Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckBox22Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
 radiogroup3.ItemIndex:=-1;
 if filelistbox1.Count>0 then panel1.Color:=clred;
 if checkbox3.Checked then begin
  groupbox5.Visible:=true;
  checkbox6.Visible:=true;
  radiogroup10.Visible:=true; end
  else ClearOutdoors;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
 if filelistbox1.Count>0 then panel1.Color:=clred;
 radiogroup3.ItemIndex:=-1;
 if checkbox4.Checked then radiogroup4.Visible:=true else ClearIndoors;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckBox8Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckBox9Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckListBox10Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
if checklistbox10.Checked[2] and not(checklistbox10.Checked[1]) then checklistbox10.Checked[1]:= True; // makes sure we have dt together with bj

end;

procedure TForm1.CheckListBox11Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckListBox1Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
if (radiogroup1.ItemIndex = 0 ) or (radiogroup1.ItemIndex = 1) then
 begin
   cleargeneralsex;
   clearsex;
   cleargroup;
   clearbdsm;
   clearmast;
   checklistbox2.Visible:=true;
   checklistbox4.Visible:=true;
 end;
 if radiogroup1.ItemIndex = 2 then
 begin
   clearprofile;
   groupbox3.Visible:=true;
 end;
 if radiogroup1.ItemIndex > 2 then
 begin
   cleargeneralsex;
   clearprofile;
   clearsex;
   cleargroup;
   clearbdsm;
   clearmast;
 end;
end;

procedure TForm1.CheckListBox8Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.CheckListBox9Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.FileListBox1Change(Sender: TObject);
begin
ShowImage;
clearall;
if filelistbox1.FileName<>'' then
begin
 LoadName;
 Edit1.Text:= ExtractFileNameWithoutExt(Filelistbox1.FileName);
 Watcher;
end;

end;



procedure TForm1.FormCreate(Sender: TObject); // creating form
var
color_one, color_two: Tcolor;
begin
 if FileExists(ExtractFileDir(ExtractFilePath(ParamStr(0)))+'\settings.ini') then // if ini file exists in the folder
 begin
  IniFile:=TIniFile.Create(ExtractFileDir(ExtractFilePath(ParamStr(0)))+'\settings.ini'); // then we read settings and use them
  exename := IniFile.ReadString('Edit', 'Path', getcurrentdir);
  color_one := TColor(RGB(IniFile.ReadInteger('Form', 'Form_Color_R', 0),IniFile.ReadInteger('Form', 'Form_Color_G', 0),IniFile.ReadInteger('Form', 'Form_Color_B', 0)));
  color_two := TColor(RGB(IniFile.ReadInteger('Form', 'Edit_Color_R', 0),IniFile.ReadInteger('Form', 'Edit_Color_G', 0),IniFile.ReadInteger('Form', 'Edit_Color_B', 0)));
  Form1.Width := IniFile.ReadInteger('Form', 'width', 1250);
  Form1.Height := IniFile.ReadInteger('Form', 'height', 690);
  Image1.Height:=640+(form1.Height-690);
  Image1.Width:=475+(form1.Width-1250);
  FileListBox1.Height:=657+(form1.Height-690);
  Form1.color := color_one;
  CheckListBox1.Color := color_one;
  CheckListBox2.Color := color_one;
  CheckListBox3.Color := color_one;
  CheckListBox4.Color := color_one;
  CheckListBox5.Color := color_one;
  CheckListBox10.Color := color_one;
  CheckListBox11.Color := color_one;
  CheckListBox6.Color := color_one;
  CheckListBox7.Color := color_one;
  CheckListBox8.Color := color_one;
  CheckListBox9.Color := color_one;
  CheckListBox1.HeaderBackgroundColor := color_one;
  CheckListBox2.HeaderBackgroundColor := color_one;
  CheckListBox3.HeaderBackgroundColor := color_one;
  CheckListBox4.HeaderBackgroundColor := color_one;
  CheckListBox5.HeaderBackgroundColor := color_one;
  CheckListBox10.HeaderBackgroundColor := color_one;
  CheckListBox11.HeaderBackgroundColor := color_one;
  CheckListBox6.HeaderBackgroundColor := color_one;
  CheckListBox7.HeaderBackgroundColor := color_one;
  CheckListBox8.HeaderBackgroundColor := color_one;
  CheckListBox9.HeaderBackgroundColor := color_one;
  Panel2.Color := color_one;
  FileListBox1.Color := color_two;
  Edit1.Color := color_two;
  MaskEdit1.Color := color_two;


 end;
 checklistbox1.Header[0]:=true;
 checklistbox3.Header[0]:=true;
 checklistbox4.Header[0]:=true;
 checklistbox5.Header[0]:=true;
 checklistbox8.Header[0]:=true;
 checklistbox9.Header[0]:=true;
 checklistbox10.Header[0]:=true;
 checklistbox11.Header[0]:=true;
 dir := ExtractFileDir(Application.ExeName);
end;

procedure TForm1.FormResize(Sender: TObject); // when the window is resized, we resize some stuff on it
begin
 Image1.Height:=640+(form1.Height-690);
 Image1.Width:=475+(form1.Width-1250);
 Image2.Height:=Image1.Height;
 Image2.Width:=Image1.Width;
 FileListBox1.Height:=657+(form1.Height-690);
 Image2.Picture := nil;
 if radiogroup12.ItemIndex >0 then
  begin
    if radiogroup12.ItemIndex = 1 then Image2.Canvas.Brush.Color:= ($000000) else Image2.Canvas.Brush.Color:= ($FFFFFF);
    with Image2.Canvas do
     FillRect(Rect(0, 0, ClipRect.Right, ClipRect.Bottom));
  end
end;

procedure TForm1.RadioGroup10Click(Sender: TObject);
begin
if filelistbox1.Count>0 then panel1.Color:=clred;
end;

procedure TForm1.RadioGroup11Click(Sender: TObject); // masks logics
begin
 if radiogroup11.ItemIndex=0 then
 begin
   filelistbox1.Mask:='*.jpg;*png;*.jpeg';
 end;
 if radiogroup11.ItemIndex=1 then
 begin
   filelistbox1.Mask:='*.jpg;*.jpeg';
 end;
 if radiogroup11.ItemIndex=2 then
 begin
   filelistbox1.Mask:='*png;';
 end;
 if radiogroup11.ItemIndex=3 then
 begin
   filelistbox1.Mask:=maskedit1.Text;
 end;
 FileListBox1.Update;
end;

procedure TForm1.RadioGroup12Click(Sender: TObject);
begin
 Image2.Picture := nil;
 if radiogroup12.ItemIndex >0 then
  begin
    if radiogroup12.ItemIndex = 1 then Image2.Canvas.Brush.Color:= ($000000) else Image2.Canvas.Brush.Color:= ($FFFFFF);
    with Image2.Canvas do
     FillRect(Rect(0, 0, ClipRect.Right, ClipRect.Bottom));
  end
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);  // more stuff to make flags panels work
begin
if (radiogroup1.ItemIndex=1) or (radiogroup1.ItemIndex=2) or (radiogroup1.ItemIndex=0) then
 begin
  ClearGeneralSex;
  ClearSex;
  ClearBDSM;
  ClearGroup;
  ClearMast;
  CheckListBox2.Visible:=true;
  CheckListBox4.Visible:=true;
  exit;
 end;
if radiogroup1.ItemIndex=3 then
 begin
   ClearProfile;
   groupbox3.Visible:=true;
   exit;
 end;
if radiogroup1.ItemIndex>3 then
 begin
  ClearProfile;
  ClearGeneralSex;
  ClearSex;
  ClearBDSM;
  ClearGroup;
  ClearMast;
  exit;
 end;
end;


procedure TForm1.RadioGroup3Enter(Sender: TObject);
begin
 if filelistbox1.Count>0 then panel1.Color:=clred;
 ClearIndoors;
 ClearOutdoors;
 checkbox3.Checked:=false;
 checkbox4.Checked:=false;
end;

procedure TForm1.RadioGroup7Click(Sender: TObject);
var i:integer;
begin
 if filelistbox1.Count>0 then panel1.Color:=clred;
 if radiogroup7.ItemIndex=0 then
 begin
   ClearBDSM;
   ClearGroup;
   groupbox7.Visible:=true;
   exit;
 end;
 if radiogroup7.ItemIndex=1 then
 begin
   ClearSex;
   ClearBDSM;
   Groupbox4.Visible:=true;
   exit;
 end;
 if radiogroup7.ItemIndex=2 then
 begin
   ClearSex;
   ClearGroup;
   Groupbox6.Visible:=true;
   exit;
 end;
 if radiogroup7.ItemIndex=3 then
 begin
   ClearSex;
   ClearGroup;
   ClearBDSM;
 end;
end;

procedure TForm1.RadioGroup9Click(Sender: TObject);
begin
 if radiogroup9.ItemIndex=0 then SelectGirlSex;
 if radiogroup9.ItemIndex=1 then SelectGuySex;
 if filelistbox1.Count>0 then panel1.Color:=clred;
end;

end.
