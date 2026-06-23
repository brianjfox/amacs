;-*- Mode: Merlin -*-
;
; src/amacs.s -- AMACS main editor: reconstructed disassembly.
;
; *** GENERATED (tools/disasm.py). Operands carry original names from
;     DEFS/LINK.OUTPUT.S + DEFS/*.EQUS.S where known; the rest are bare
;     addresses. Reassembles byte-identical to BIN/AMACS.OBJ (make check). ***
; Origin $1000; 38136 bytes; last address $A4F7.
;
; ===================== symbol equates =====================
scrny              = $1F
WindowLft          = $20
WindowRgt          = $21
WindowTop          = $22
WindowBot          = $23
CH                 = $24
CV                 = $25
BASL               = $28
BASH               = $29
BuffPoint          = $5E
TheBuffer          = $60  ; = Point
PageTop            = $62
MarkPnt            = $64
BuffTop            = $66
BuffBot            = $68
GapTop             = $6A
GapBot             = $6C
PhysBuffTop        = $6E
PhysBuffBot        = $70
BuffData           = $72
TheBuffer_X        = $74
ThePathname        = $0301
PathStr            = $0302
ThePrefix          = $0341
PrefixName         = $0342
rm_PathComp        = $0381
TagSpace           = $03C1
LoRamPoint         = $0801  ; = RamBuffArea
RamBuffEnd         = $0F39
SelectedBuff       = $0F3A
LastBuffer         = $0F3B
BuffActList        = $0F3C
BuffList_X         = $0F4A
AMACSStack         = $1035
TopLoop            = $1061
ExitAMACS          = $1082
TopBlink           = $1085
InitAMACS          = $10A8
ResetBoot          = $10DD
WarmBoot           = $10E5
TwoWindows?        = $111B
WindowOne          = $111D
WindowTwo          = $1126
SelectedWind       = $112F
GetSelWind         = $1130
TwoWindows         = $1223
OtherWindow        = $12C1
EnsureWinds        = $1336
OneWindow          = $133F
GrowWindow         = $137F
PrintVar           = $13EF
SetVariable        = $14AF
AutoPushPoint      = $1585
Delete             = $1587
Rubout             = $161D
RubWithTab         = $168B
TabInsert          = $16CC
Insert             = $16CE
RightChar          = $173B
LeftChar           = $175E
NewCenter          = $1781
ScreenEdge         = $17E1
SkipComment?       = $1825
CRLF               = $1826
InsertReturn       = $1969
OpenLine           = $196E
GotoTop            = $1A41
GotoBot            = $1A5A
MovePush?          = $1A7A
PrefixMeta         = $1AD5
PrefixCtrl         = $1ADE
PrefixCMeta        = $1AEB
ControlX           = $1B00
RSrch              = $1B71
ISrch              = $1B79
RWordSearch        = $1B88
WordSearch         = $1B90
TabsIndent         = $1B9C
SetTabsIndent      = $1B9D
NotModified        = $1BA6
QuotedInsert       = $1BB1
UpLine             = $1BB7
DownLine           = $1BC2
TopAbort           = $1BF4
AtomMode           = $1C08
IndentMode         = $1C0C
AutoMode           = $1C10
CapsMode           = $1C14
ToggleMode         = $1C16
PointInfo          = $1C48
WhatLossage        = $1CCD
CommentColumn      = $1CFF
CommentBegin       = $1D00
CommentEnd         = $1D05
StringPntr         = $1D0A
StringInLine       = $1D0C
MakeComment        = $1D8C
KillComment        = $1E6A
CommentLine        = $1E7A
CommentLineI       = $1E93
UpCommLine         = $1E9E
DownCommLine       = $1EA6
FindComment        = $1EEA
DelBlankComm       = $1F3F
SpaceBar           = $1F9F
FillColumn         = $1FAC
AutoFill           = $1FAD
CleanBegLine       = $2089
FillPrefix         = $20A5
SetFillPrefix      = $20AC
WhatSpace          = $2113
Bottom?            = $2182
Top?               = $218D
LabelChars         = $2198
AlphaLabel         = $219D
LabelChar?         = $219E
DownPara           = $21CF
UpPara             = $2239
MarkPara           = $22B5
FillPara           = $22C7
NextLabel          = $22DD
PrevLabel          = $234C
RepoWind           = $23F0
XorASCII           = $242B
ASCIIBuff1         = $2430
ASCIIBuff          = $2438
IndentVbtm         = $24A5
IndentLine         = $24A6
BackToIndent       = $2526
PrevIndent         = $2548
GetPrevIndent      = $254F
OutdentCRLF        = $2572
OutdentLine        = $2578
AltmodeChar        = $2604
IIcMode?           = $2605
CoutDef            = $2606
CharOutXY          = $2608
CharOut            = $2611
SI:CharOut         = $2614
PrintCR            = $2679
PrintCR1           = $267C
UseTabTable?       = $2690
TabBump            = $2691
TabTable           = $26C5
PrintTab           = $26CF
vtab               = $26E9
vtab1              = $26EB
StoreChar          = $2703
PickChar           = $271A
KeyDownp           = $272F
KeyAvail?          = $273A
GetKey             = $2750
KeyClickp          = $275A
KeyClickVol        = $275B
IIgsMode?          = $275C
KeyModState        = $275D
GetKeyPress        = $275E
TYIBuff            = $27A7
TYI_PopIndex       = $27E7
TYI_PushIndex      = $27E8
KillTYI            = $27EA
AnyTYI?            = $27F1
UnTYI              = $27FF
PushTYI            = $280B
PopTYI             = $2824  ; = TYI
GatherTYI          = $2843
ClearEOL           = $2862
ClearEOL1          = $2864
ClearPage          = $2871
ClearEOP           = $2874
ClearEOP1          = $2876
Home               = $289E
ResetTTY           = $28A9
Cursor2            = $28B7
BlinkTime          = $28B9
TimedBlink         = $28BB
BlinkCursor        = $292E
AltBlink           = $293C
BlinkRate          = $2945
BlinkOnce          = $2946
CursorOff          = $2992  ; = CursorOn, InvertChar
BeepVector         = $29B7
Beep               = $29B9
Bell               = $29BC
Click              = $29BE
ParenFlag          = $29D5
ParenPos           = $29D6
BeepFlashes?       = $2A37
BeepRings?         = $2A38
SysBeep            = $2A39
TypeoutOpen        = $2A95
TypeoutFlag        = $2A96
TypeoutAbort       = $2A97
AbortedTO?         = $2A99
TOAbortStk         = $2A9A
TypeoutMax         = $2A9B
TypeoutCH          = $2A9F
InitTypeout        = $2AA1
OpenTypeout        = $2AC4
CloseTypeout       = $2B0F
CloseTypeout1      = $2B19
SaveWind           = $2B38
RstrWind           = $2B45
GetTypeWind        = $2B5B
PrepTO             = $2B93
UnPrepTO           = $2BB7
PointToCH          = $2D25
FindPoint          = $2D88
FindPoint1         = $2D93
GetXCharLen        = $2DE0
BumpXPos           = $2E13
BackLine           = $2E35
BackScrLine        = $2E63
SetTempBot         = $2EF3
FixText            = $2F21
CheckTop           = $2F5C
EnableKDisp        = $300B
DisplayPage        = $300C
DisplayPage1       = $300F
DisplayTemp        = $301D
DisplayDown        = $30C6
DispToPoint        = $30E0
DecrScreen         = $30EC
IncrScreen         = $3107
DisplayLine        = $3147
PrintTextLine      = $3164
LinesPastPnt       = $3191
FindPointCol       = $31E3
CenterLine         = $31F5
CenterPoint        = $31F6
CenterPage         = $31F7
CenterPage1        = $320D
GenDisplay         = $3238
DispVects          = $3262
DispPointEnd       = $3279
ScrollLineTop      = $32FF
ScrollLineBot      = $3300
ScrollDir          = $3301
ScrollDest         = $3302
Scroll             = $3304
TV:InsLine         = $337A
TV:InsLine1        = $337C
TV:DelLine         = $33AB
TV:DelLine1        = $33AD
PointToCol         = $33DC
GoalColumn         = $3406
UserGoal           = $3408
GetGoalColumn      = $340A
NewLineEOB         = $3438
DownRealLine       = $3439
UpRealLine         = $3477
BegOfLine          = $34A6
EndOfLine          = $34BA
ContextLines       = $34D3
DownScreen         = $34D4
UpScreen           = $354C
SetPopMark         = $35AB
LeftWord           = $35C2
IN:LeftWord        = $35C5
RightWord          = $3617
IN:RightWord       = $361A
UpperWord          = $3660
LowerWord          = $3674
CapWord            = $367D
IN:UpperReg        = $3686
IN:LowerReg        = $369F
IN:CapReg          = $36B8
EqTempPoint?       = $36F2
UpperCon           = $36FD
LowerCon           = $3708
Separator?         = $376A
WhiteSpace?        = $37A7
WhiteSpace1        = $37AF
SentDel?           = $37BB
DeleteWord         = $37E7
KillTempPoint      = $37FA
RuboutWord         = $37FE
KillLineBk         = $3826
KillLine           = $382E
IN:KillLine        = $386E
DeleteSpace        = $393C
GenSpaceDel        = $393F
DeleteLines        = $3955
DelForSpace        = $39BF
DelBacSpace        = $39DA
DelTempPoint       = $3A0A
RightSent          = $3A2E
IN:RightSent       = $3A31
LeftSent           = $3A6E
IN:LeftSent        = $3A71
KillSent           = $3AE0
KillSentB          = $3AF0
BlankLine?         = $3B0D
ReadLineHelp       = $3B20
ReadArgLine        = $3B23
ReadLine           = $3B2D
IN:ReadLine        = $3B2F
QuestionH?         = $3BB0
BufferRead         = $3D86
FileRead           = $3D87
MakeBuffList       = $3DE1
MakeFileList       = $3E37
GetBank1           = $3F09
GetBank2           = $3F10
MustComplete       = $3F17
ReadLineCH         = $3F18
CommandList        = $3F1A
CompLineHelp       = $3F1C
MetaX              = $3F1F
CharIndex          = $3F6D
ReadVariable       = $3F70
ReadFunction       = $3F8D
ReadComplete       = $3FA9
ReadCompLine       = $3FAE
TypeLine           = $3FC9
PushArg            = $42AE
GiveArgs           = $42B8
BotOfRam           = $42F8
TopOfRam           = $42FA
PointToBInfo       = $42FC
InitBuffers        = $4316
LogBuffer          = $4383
PhysBuffer         = $43B6
Deselect           = $43F0
ForceSelect        = $4432
SelectBuffer       = $45B1
SelectNamed        = $45B5
SI:OpenBuff        = $45EB
IN:OpenBuff        = $45F4
SI:SelectB         = $460F
CreateBuffer       = $4624
RenameBuffer       = $474A
FindBuffer         = $47E7
FindBuffFile       = $4829
ListBuffers        = $4874
MySize             = $49A4
PBuffName          = $49DC
PBuffName1         = $49DF
PBuffPoint         = $49E1
PBuffFile          = $49EC
PBuffFile1         = $49EF
IN:KillBuff        = $49F3
ZapBuff            = $49F6
KillBuffer         = $4A1F
DefBuffer          = $4B02
Modified?          = $4B83
BuffInsert         = $4B84
BuffRubout         = $4BBD
BuffDelete         = $4BE7
SetLastKill        = $4C15
SetBuffFlag        = $4C17
ClrLastKill        = $4C1E
ClrBuffFlag        = $4C20
OldKill?           = $4C29
BuffFlagOn?        = $4C2B
BuffFlagOff?       = $4C35
SetAModified       = $4C3A
SetModified        = $4C3C
ClrModified        = $4C45
SetGap             = $4C52
KillGap            = $4CBE
MarkStack          = $4CEA
MarkStackPntr      = $4CFA
PushMark           = $4CFB
MarkTemp           = $4D03
IN:MarkTemp        = $4D10
MarkBuffer         = $4D2F
PopMark            = $4D4A
PopTempMark        = $4D9C
GetTempMark        = $4DBA
SwapPointMark      = $4DCD
DeleteKill?        = $4DE4
YankKill           = $4EED
GenericKill        = $4F36
SetNewAppend       = $4F7E
ComTab             = $4F84
doc:ExitSafe       = $504E
Describe           = $5184
LastPercnt         = $52E5
ModeLineCV         = $52E6
ModeLineInv        = $52E7
ModeLineChar       = $52E8
DrawModeLine       = $52F8
ModeLineMsg        = $531C
InvModeLine        = $533B
InitModeLine       = $5356
ClearModeLine      = $535D
MajorNames         = $536A
MakeModeLine       = $537E
ModeInfo           = $5441
MinorNames         = $5528
PrintMinors        = $5538
TempToMode         = $5564
SI:Divide          = $5577
P:Offset           = $55CB
P:Total            = $55CD
BuffPercent        = $55CF
Percent            = $55EA
PreBlinkCount      = $56FB
PreCharGet         = $56FD
EchoAreaCH         = $5724
EchoOutput         = $5726
ClrEchoArea        = $579B
NewEchoArea        = $57CC
EchoAreaSave       = $57D2
OpenEchoArea       = $57D8
UseEchoArea        = $57E4
CloseEchoArea      = $57FA
EchoAreaMsg        = $5814
BadCharMsg         = $5833
PrUnDefined        = $5858
PrettyPrint        = $586C
print_control      = $5944
print_c_meta       = $5951
print_meta         = $5954
PrintMessage       = $5968
CompList           = $5987
CompOffset         = $5989
CompCount          = $598B
PrintCompDoc       = $598C
DCIStringOut       = $598F  ; = PrintComp
DCIStringOut1      = $5991
DocRef             = $5A12
DCIStringLen       = $5A24
FunctionRef        = $5A2E
PopCompPoint       = $5A3D
PushCompPoint      = $5A56
SkipEnt            = $5A68
CompareEnt         = $5A78
HighMatch          = $5AD3
GetCompLink        = $5AD4
SI:CompleteMe      = $5AE5
SI:CompleteSp      = $5AE9
SearchDefault      = $5BC8
SearchString       = $5BF1
ISearchStack       = $5C19
IStackPntr         = $5D09
ISearchDir         = $5D0A
SMoveMax           = $5D0F
IPopSearch         = $5D11
IPushSearch        = $5D64
ISearchChars       = $5DB0
ISearchVects       = $5DB8
SearchForward      = $5DC9
SearchBackwrd      = $5E31
CaseSearch         = $5E8D
SearchCase         = $5E8E
ISearch            = $5FD1
SearchKeyin        = $6085
SearchInit         = $617C
StringSearch       = $6220
RStrSearch         = $6224
StrSearch          = $6226
LabelSearch        = $63CA
Apropos            = $6491
ListVars           = $65B0
CheckString        = $6608
SI:Apropos         = $663D
GetAproArg         = $66E1
GetKeyFun          = $6704
GetKeyFun1         = $6708
AutoFileExt        = $674E
ShowExtension      = $6754
VisitFile          = $6756
SI:VisFile         = $6758
MaybeSave          = $681F
Default            = $68C0
SetFileDef         = $68E4
IN:SaveFile        = $6922
WriteFile          = $69CA
ReadFilename       = $69D0
SaveFile           = $6A7D
PrBuffName         = $6AC6
PrFileName         = $6ACC
InsertFile         = $6AD2
EORValue           = $6B26
FileLister         = $6B54
DirLister          = $6B58
SelfPath           = $6B9D
BackPath           = $6BAC
BeepFindPoint      = $6BB8
FindFile           = $6BBE
FixPath            = $6C38
SetPrefix          = $6CB7
DeleteFile         = $6D16
InitFiler          = $6D3C
OpCallMLI          = $6D61
CallMLI            = $6D64
MLIParams          = $6D71
DefFileType        = $6D83
GetPrefix          = $6D84
DSK:Quit           = $6D96
DSK:ChkExit        = $6DD1
DSK:SetPrefix      = $6DDB
SlotDrive          = $6DF0
MakeSD             = $6DF2
Time               = $6E0B
GetSysDate         = $6E0F
GetSystemTime      = $6E43
GetRealTime        = $6E4F
Months             = $6E61
PrintDate          = $6E9D
DSK:ModeTime       = $6F00
PrintTime          = $6F2A
BuffDateTime       = $6F7F
BuffPutOn          = $6FAC
BuffPutter         = $6FC3
BuffPutOff         = $6FD5
PushFilePath       = $6FE9
PushFilePath1      = $6FEB
PrintPath          = $7025
RBlock             = $7038
RBlock1            = $703B
VolInfo            = $7056
FileInfo           = $707E
MakePath           = $70AA
OpenPath           = $70DC
OpenPath1          = $70E2
GblLength          = $7126
CompFile           = $712A
GetDirInfo         = $715F
NextFile           = $71DC
GetOnline          = $7280
DSK:OpenFile       = $729D
DSK:ReadByte       = $72AB
PrepRead           = $72FE
PrepWrite          = $7321
DSK:WriteByte      = $732B
DSK:SaveFile       = $734A
DSK:CloseHere      = $73B4
DSK:CloseFile      = $73E5
DSK:DiskSpace      = $73F2
PrintPages         = $749B
DSK:ListDir        = $74BA
DSK:ListFiles      = $74BE
HexListing         = $753E
FTypeTable         = $7640
PrintType          = $7679
DSK:Create         = $76A6
DSK:Delete         = $76CA
Compiler           = $76E4
Compile            = $7724
ClockPatch         = $77BF
GetTheTime         = $77C0
DayOfWeek          = $77F0
ExitPrompt         = $77F1
SafetyCheck        = $77F2
CommandChar        = $7832
LastCommand        = $7833
CommandVector      = $7834
LastComVect        = $7836
DisplayCode        = $7838
DispatchTab        = $7839
Dispatch           = $783D
CallTemp           = $7898
CharError          = $789B
BadCharacter       = $789E
NextByte           = $78A2
UnMerlinify        = $78E0
Merlinify          = $7965
PrintDec           = $7A01
PD:Justify         = $7A54
ZeroJustify        = $7A55
Argument           = $7A5B
ExplicitArg        = $7A5D
ArgSign            = $7A5E
GetArgSign         = $7A60
InitArgument       = $7A6B
AnyArgument?       = $7A7F
AddArgDigit        = $7A9B
ArgumentDigit      = $7AD2
ZeroArg?           = $7AF6
NegativeArg        = $7B11
UniversalArg       = $7B1D
PrintArgument      = $7B9A
StringArgs         = $7BA7
ArgCount           = $7C27
ArgIndex           = $7C28
InitStrArgs        = $7C29
GetStrArg          = $7C32
PointForward       = $7C68
GapBotPoint        = $7CB4
PointBuffBot?      = $7CC2
PointBackward      = $7CCD
GetYOrNp           = $7D20
ReadAltKey         = $7D4A
HexByteOut         = $7D81
PrintDone          = $7D97
PrintReturn        = $7DA3
PrintSpace         = $7DA7
Plurilize          = $7DAC
C_XCharacters      = $7DB8
C_XVectors         = $7DDE
C_XCharCount       = $7E2A
SwapMark           = $7E2B
SetGoalCol         = $7E34
SetFillCol         = $7E3F
SetCommCol         = $7E4A
ToggleRO           = $7E7B
FunPtr             = $7E95
FindFunKey         = $7E97
FindFunRef         = $7EA8
GetFunName         = $7EC2
SetKey             = $7F0F
BindIfNot          = $7FB2
UnBindKey          = $7FCD
BindKey            = $7FD3
WhatKey            = $7FE8
PrFunDoc           = $8045
WhatCtrlX          = $8090
FindXKey           = $810B
PrCtrlXDoc         = $8135
DefMajor           = $8147
TheModes           = $8148
MODE:C             = $815A
MODE:Lisp          = $816D
MODE:Merlin        = $817D
MODE:Text          = $81B1
MODE:Pascal        = $81C6
BlockBind          = $81D9
SetMinorMd         = $81EB
MODE:Fund          = $81F2
ModeFinish         = $81FF
SetModeComm        = $8225
ParseMode          = $823F
SelectMode         = $829C
SI:ParseMode       = $82B7
SI:ListScan        = $82BF
HelpHelpFile       = $8312
SystemPath         = $8323
SetSysPath         = $8355
GetHelpFile        = $8375
Help               = $8391
SetMyFile          = $845A
QueryFlag          = $846F
CaseReplace        = $8470
QueryReplace       = $8475
Replace            = $8479
ReplaceEm          = $847B
AlphaChar?         = $867B
TecoSearch         = $86AB
CountOccurs        = $8768
Occur              = $876F
Bccur              = $8776
PrintOccurs        = $87AB
IN:Occur           = $87B1
AccumLines         = $8971
XCharMove          = $89DE
EOLorEOB?          = $89DF
XposeChars         = $89FA
XposeLines         = $8A7D
MacroExec          = $8AA5
MacroDef           = $8AA6
ViewKbdMacro       = $8AA7
DoLastMacro        = $8B04
KeyToMac           = $8B20
KeyFromMac         = $8B67
EndMacroExec       = $8BD3
StartMacro         = $8BD9
EndMacro           = $8C05
RegionQSize        = $8C2B
TheRegion          = $8CAE
OpenRegion         = $8CB3
CloseRegion        = $8CF5
LCaseRegion        = $8D61
UCaseRegion        = $8D75
CCaseRegion        = $8D83
CopyRegion         = $8D92
KRegion            = $8D9A
CLinesRegion       = $8DB0
CLInternal         = $8DDA
LsInReg            = $8E08
FillRegion         = $8E0A
PrintBuffer        = $8EAC
PrintRegion        = $8EB2
IndentReg          = $8EBB
PrinterSlot        = $8F34
SheetLines         = $8F35
PLinesPage         = $8F36
PrinterCols        = $8F37
PageNum            = $8F38
FileLine?          = $8F3A
AutoNumber         = $8F3B
HCEscape           = $8F3C
ContextBeg         = $8F3E
ContextEnd         = $8F48
PInitStr           = $8F54
LeftMargin         = $8F5E
RightMargin        = $8F5F
PrintOut           = $8FB9
PrintText          = $9176
BaseLibAddr        = $91D8
LibCount           = $91DA
LoadLibrary        = $91E6
SI:LoadLib         = $91F6
FlushLibs          = $92BB
SI:FlushLibs       = $92E0
CopyLibPfx         = $9310
GetLinkEnd         = $9339
IN:LibLoad         = $93A8
AddLibName         = $93FA
TheTag             = $9463
TagsFindFile       = $9481
GetTagBuff         = $9488
ScanForTag         = $94D2
WhatTagFile        = $94D6
VisitTags          = $9749
Variables          = $975D
VariableLink       = $9A6A
VarList            = $9A6D
VarDocList         = $9B15
CommandNames       = $9B37
CommandLink        = $A4E7
Documentation      = $A4F8
rm_FileBuffer      = $A500  ; = rm_DirectBuff
rm_ExcessComp      = $A700
rm_DataBuffer      = $A900  ; = rm_CompTable
MLI                = $BF00
SysDeath           = $BF03
ReadClock          = $BF06
SysError           = $BF09
SysDeath1          = $BF0C
SysErrorByte       = $BF0F
DriverList         = $BF10  ; = drvr_RAM
drvr_S1D1          = $BF12
drvr_S2D1          = $BF14
drvr_S3D1          = $BF16
drvr_S4D1          = $BF18
drvr_S5D1          = $BF1A
drvr_S6D1          = $BF1C
drvr_S7D1          = $BF1E
drvr_S0D2          = $BF20
drvr_S1D2          = $BF22
drvr_S2D2          = $BF24
drvr_S3D2          = $BF26
drvr_S4D2          = $BF28
drvr_S5D2          = $BF2A
drvr_S6D2          = $BF2C
drvr_S7D2          = $BF2E
LastUnit           = $BF30
ActDevCnt          = $BF31
ActDevLst          = $BF32
SysCopyRgt         = $BF40
SysCallIRQ         = $BF50
SysScratch1        = $BF56
SysMemMap          = $BF58
SysFileBuffs       = $BF70
SysIntAddrs        = $BF80
SysRegisters       = $BF88
SysWhatBank        = $BF8D
SysIntReturn       = $BF8E
SysTheDate         = $BF90
SysTheTime         = $BF92
SysFileLevel       = $BF94
SysBkpBit          = $BF95
SysScratch2        = $BF96
MachineID          = $BF98
SysSlotROM         = $BF99
SysPfxFlag         = $BF9A
SysMLIActive       = $BF9B
SysLastReturn      = $BF9C
SysMLI_X           = $BF9D
SysMLI_Y           = $BF9E
HiRamPoint         = $BFFF
HardKey            = $C000  ; = Store80Off
Store80On          = $C001
RdMainRam          = $C002
RdAltRam           = $C003
WrMainRam          = $C004
WrAltRam           = $C005
UseMainZP          = $C008
UseAuxZP           = $C009
HardKeyReset       = $C010
RdWhichRam?        = $C013  ; = RdMainRam?
WrWhichRam?        = $C014  ; = WrMainRam?
UseMainZP?         = $C016
Store80Off?        = $C018
Page1?             = $C01C
HardModState       = $C025
HardBeep           = $C030
Page1              = $C054
Page2              = $C055
HardMeta           = $C061
HardHyper          = $C062
RdWrBank2          = $C083
RdRomBank          = $C08A
RdWrBank1          = $C08B
SetParens          = $D0AD
Closes             = $D0F1
Opens              = $D0F4
CloseParen?        = $D0F7
CheckArrowKey      = $D10D
LibNames           = $D480
BufferLoad         = $D500
BufferDump         = $D503
BufferFName        = $D506
LibBase            = $D800
EditTabStops       = $DACD
SetSerialSlot      = $DB16
InitSerialIO       = $DB43
SetBaud            = $DB56
SerialInput        = $DB6C
ClearChannel       = $DBA2
SerialOutput       = $DBB8
WeekDays           = $DBC3
SendBuff           = $DBF7
SendRegion         = $DBFD
LibBase_X          = $E000
IIcLoc             = $FBC0
; ==========================================================
;
        org $1000
        dsk AMACS.OBJ
;
; ---- $1000-$1026  code ----
                jmp $1046    ; $1000
                jmp $1055    ; $1003
                jmp DSK:OpenFile    ; $1006
                jmp PrepRead    ; $1009
                jmp DSK:CloseFile    ; $100C
                jmp DSK:ReadByte    ; $100F
                jmp SI:CompleteMe    ; $1012
                jmp InitArgument    ; $1015
                jmp SetVariable    ; $1018
                jmp GiveArgs    ; $101B
                jmp FunctionRef    ; $101E
                jmp BindKey    ; $1021
                jmp PushTYI    ; $1024
; ---- $1027-$1034  data  entry pointer block (CompList,CommandNames,CharIndex,ComTab,C_XCharacters,C_XVectors,C_XCharCount) ----
        dfb $87,$59,$37,$9B,$6D,$3F,$84,$4F,$B8,$7D,$DE,$7D,$2A,$7E    ; $1027  .Y7.m?.O8}^}*~
; ---- $1035-$7DB7  code ----
;
; === AMACSStack ===
                brk    ; $1035
                lda #$55    ; $1036
                sta $03F2    ; $1038
                lda #$10    ; $103B
                sta $03F3    ; $103D
                eor #$A5    ; $1040
                sta $03F4    ; $1042
                rts    ; $1045
                tsx    ; $1046
                stx AMACSStack    ; $1047
                jsr $1036    ; $104A
                jsr InitAMACS    ; $104D
                lda #$06    ; $1050
                jmp TopLoop    ; $1052
                ldx AMACSStack    ; $1055
                txs    ; $1058
                jsr $1036    ; $1059
                jsr ResetBoot    ; $105C
                lda #$01    ; $105F
;
; === TopLoop ===
                pha    ; $1061
                jsr SetGap    ; $1062
                pla    ; $1065
                bit AbortedTO?    ; $1066
                bpl $1070    ; $1069
                inc AbortedTO?    ; $106B
                beq $1073    ; $106E
                jsr GenDisplay    ; $1070
                jsr InitArgument    ; $1073
                jsr InitStrArgs    ; $1076
                jsr TopBlink    ; $1079
                jsr Dispatch    ; $107C
                jmp TopLoop    ; $107F
;
; === ExitAMACS ===
                jmp DSK:Quit    ; $1082
;
; === TopBlink ===
                ldx #$29    ; $1085
                lda $00,x    ; $1087
                sta UseAuxZP    ; $1089   <== BANK: aux zero-page/stack (ALTZP on)
                sta $00,x    ; $108C
                sta UseMainZP    ; $108E   <== BANK: main zero-page/stack (ALTZP off)
                dex    ; $1091
                cpx #$1F    ; $1092
                bne $1087    ; $1094
                sta UseAuxZP    ; $1096   <== BANK: aux zero-page/stack (ALTZP on)
                jsr GetBank1    ; $1099
                jsr SetParens    ; $109C
                sta UseMainZP    ; $109F   <== BANK: main zero-page/stack (ALTZP off)
                jsr GetBank2    ; $10A2
                jmp BlinkCursor    ; $10A5
;
; === InitAMACS ===
                lda RdWrBank2    ; $10A8   <== BANK: language-card RAM bank 2 (read+write, BIT twice)
                lda RdWrBank2    ; $10AB   <== BANK: language-card RAM bank 2 (read+write, BIT twice)
                jsr InitFiler    ; $10AE
                jsr InitModeLine    ; $10B1
                jsr InitBuffers    ; $10B4
                ldx #$00    ; $10B7
                lda $1116,x    ; $10B9
                sta $0200,x    ; $10BC
                beq $10C4    ; $10BF
                inx    ; $10C1
                bne $10B9    ; $10C2
                jsr CreateBuffer    ; $10C4
                lda TYI_PushIndex    ; $10C7
                cmp TYI_PopIndex    ; $10CA
                bne $10DA    ; $10CD
                lda HardHyper    ; $10CF
                and HardMeta    ; $10D2
                bmi $10DA    ; $10D5
                jsr BufferLoad    ; $10D7
                jmp WarmBoot    ; $10DA
;
; === ResetBoot ===
                lda #$00    ; $10DD
                sta TYI_PushIndex    ; $10DF
                sta TYI_PopIndex    ; $10E2
;
; === WarmBoot ===
                lda RdRomBank    ; $10E5   <== BANK: language-card ROM (read)
                jsr ResetTTY    ; $10E8
                lda RdWrBank2    ; $10EB   <== BANK: language-card RAM bank 2 (read+write, BIT twice)
                lda RdWrBank2    ; $10EE   <== BANK: language-card RAM bank 2 (read+write, BIT twice)
                lda WindowBot    ; $10F1
                sec    ; $10F3
                sbc #$04    ; $10F4
                sta ModeLineCV    ; $10F6
                sta WindowBot    ; $10F9
                ldy #$3F    ; $10FB
                lda (BuffData),y    ; $10FD
                jsr SelectMode    ; $10FF
                jsr MakeModeLine    ; $1102
                lda #$14    ; $1105
                sta CoutDef    ; $1107
                lda #$26    ; $110A
                sta $2607    ; $110C
                jsr InitTypeout    ; $110F
                jsr DisplayPage    ; $1112
                rts    ; $1115
                cmp $E9E1    ; $1116
                inc: $0000    ; $1119
                brk    ; $111C
;
; === WindowOne ===
                brk    ; $111D
                bvc $1120    ; $111E
                asl    ; $1120
                brk    ; $1121
                brk    ; $1122
                brk    ; $1123
                brk    ; $1124
                brk    ; $1125
;
; === WindowTwo ===
                brk    ; $1126
                bvc $1134    ; $1127
                trb $00    ; $1129
                brk    ; $112B
                brk    ; $112C
                brk    ; $112D
                brk    ; $112E
;
; === SelectedWind ===
                brk    ; $112F
;
; === GetSelWind ===
                sta SelectedWind    ; $1130
                jsr $1293    ; $1133
                ldy #$00    ; $1136
                lda ($00),y    ; $1138
                sta: WindowLft,y    ; $113A
                iny    ; $113D
                cpy #$04    ; $113E
                bcc $1138    ; $1140
                lda WindowBot    ; $1142
                sta ModeLineCV    ; $1144
                ldy #$04    ; $1147
                lda ($00),y    ; $1149
                tax    ; $114B
                lda $01    ; $114C
                pha    ; $114E
                lda $00    ; $114F
                pha    ; $1151
                jsr $1370    ; $1152
                pla    ; $1155
                sta $00    ; $1156
                pla    ; $1158
                sta $01    ; $1159
                lda $1121    ; $115B
                cmp $112A    ; $115E
                beq $1164    ; $1161
                rts    ; $1163
                ldy #$05    ; $1164
                lda ($00),y    ; $1166
                sta $02    ; $1168
                iny    ; $116A
                lda ($00),y    ; $116B
                sta $03    ; $116D
                jsr $11C2    ; $116F
                lda $02    ; $1172
                sta TheBuffer    ; $1174
                lda $03    ; $1176
                sta $61    ; $1178
                lda $01    ; $117A
                pha    ; $117C
                lda $00    ; $117D
                pha    ; $117F
                jsr SetGap    ; $1180
                pla    ; $1183
                sta $00    ; $1184
                pla    ; $1186
                sta $01    ; $1187
                ldy #$07    ; $1189
                lda ($00),y    ; $118B
                sta $02    ; $118D
                iny    ; $118F
                lda ($00),y    ; $1190
                sta $03    ; $1192
                jsr $11C2    ; $1194
                lda $02    ; $1197
                sta $04    ; $1199
                lda $03    ; $119B
                sta $05    ; $119D
                jsr BackScrLine    ; $119F
                lda $04    ; $11A2
                sta PageTop    ; $11A4
                lda $05    ; $11A6
                sta $63    ; $11A8
                jsr FindPoint    ; $11AA
                beq $11B2    ; $11AD
                jmp CenterPage    ; $11AF
                lda CV    ; $11B2
                pha    ; $11B4
                lda CH    ; $11B5
                pha    ; $11B7
                jsr DisplayPage    ; $11B8
                pla    ; $11BB
                sta CH    ; $11BC
                pla    ; $11BE
                sta CV    ; $11BF
                rts    ; $11C1
                lda $02    ; $11C2
                clc    ; $11C4
                adc PhysBuffTop    ; $11C5
                sta $02    ; $11C7
                lda $03    ; $11C9
                adc $6F    ; $11CB
                sta $03    ; $11CD
                cmp $6F    ; $11CF
                bcc $11DB    ; $11D1
                bne $11E4    ; $11D3
                lda $02    ; $11D5
                cmp PhysBuffTop    ; $11D7
                bcs $11E4    ; $11D9
                lda PhysBuffTop    ; $11DB
                sta $02    ; $11DD
                lda $6F    ; $11DF
                sta $03    ; $11E1
                rts    ; $11E3
                lda $03    ; $11E4
                cmp $6B    ; $11E6
                bcc $1222    ; $11E8
                bne $11F4    ; $11EA
                lda $02    ; $11EC
                cmp GapTop    ; $11EE
                bcc $1222    ; $11F0
                beq $1222    ; $11F2
                lda $02    ; $11F4
                sec    ; $11F6
                sbc GapTop    ; $11F7
                sta $02    ; $11F9
                lda $03    ; $11FB
                sbc $6B    ; $11FD
                sta $03    ; $11FF
                lda $02    ; $1201
                sec    ; $1203
                adc GapBot    ; $1204
                sta $02    ; $1206
                lda $03    ; $1208
                adc $6D    ; $120A
                sta $03    ; $120C
                cmp $69    ; $120E
                bcc $1222    ; $1210
                bne $121A    ; $1212
                lda $02    ; $1214
                cmp BuffBot    ; $1216
                bcc $1222    ; $1218
                lda BuffBot    ; $121A
                sta $02    ; $121C
                lda $69    ; $121E
                sta $03    ; $1220
                rts    ; $1222
;
; === TwoWindows ===
                lda SelectedBuff    ; $1223
                sta $1292    ; $1226
                bit TwoWindows?    ; $1229
                bmi $123C    ; $122C
                sta $1121    ; $122E
                sta $112A    ; $1231
                bpl $123C    ; $1234
                jsr Beep    ; $1236
                lda #$01    ; $1239
                rts    ; $123B
                bit $111C    ; $123C
                bmi $1236    ; $123F
                lda #$18    ; $1241
                sta CenterLine    ; $1243
                lda $1292    ; $1246
                cmp $1121    ; $1249
                beq $1256    ; $124C
                cmp $112A    ; $124E
                beq $1256    ; $1251
                sta $1121    ; $1253
                lda #$FF    ; $1256
                sta $111C    ; $1258
                sta TwoWindows?    ; $125B
                ldy $1292    ; $125E
                ldx $1121    ; $1261
                lda BuffActList,x    ; $1264
                bmi $126C    ; $1267
                sty $1121    ; $1269
                ldx $112A    ; $126C
                lda BuffActList,x    ; $126F
                bmi $1277    ; $1272
                sty $112A    ; $1274
                lda $1121    ; $1277
                cmp $112A    ; $127A
                bne $1285    ; $127D
                jsr $1293    ; $127F
                jsr $130E    ; $1282
                lda #$01    ; $1285
                jsr GetSelWind    ; $1287
                lda #$02    ; $128A
                jsr GetSelWind    ; $128C
                jmp $1239    ; $128F
                brk    ; $1292
                lda #$1D    ; $1293
                sta $00    ; $1295
                lda #$11    ; $1297
                sta $01    ; $1299
                ldy SelectedWind    ; $129B
                dey    ; $129E
                beq $12A9    ; $129F
                lda #$26    ; $12A1
                sta $00    ; $12A3
                lda #$11    ; $12A5
                sta $01    ; $12A7
                ldy #$04    ; $12A9
                lda ($00),y    ; $12AB
                tay    ; $12AD
                lda BuffActList,y    ; $12AE
                bmi $12BF    ; $12B1
                lda SelectedBuff    ; $12B3
                ldy #$04    ; $12B6
                sta ($00),y    ; $12B8
                pha    ; $12BA
                jsr $130E    ; $12BB
                pla    ; $12BE
                tya    ; $12BF
                rts    ; $12C0
;
; === OtherWindow ===
                bit TwoWindows?    ; $12C1
                bmi $12C9    ; $12C4
                jmp $1330    ; $12C6
                bit $111C    ; $12C9
                bmi $12F6    ; $12CC
                lda SelectedBuff    ; $12CE
                cmp $1121    ; $12D1
                beq $12DF    ; $12D4
                cmp $112A    ; $12D6
                bne $12E4    ; $12D9
                lda #$02    ; $12DB
                bne $12E1    ; $12DD
                lda #$01    ; $12DF
                sta SelectedWind    ; $12E1
                lda SelectedWind    ; $12E4
                eor #$03    ; $12E7
                sta SelectedWind    ; $12E9
                jsr $1293    ; $12EC
                tax    ; $12EF
                jsr $1370    ; $12F0
                jmp $1333    ; $12F3
                jsr $1293    ; $12F6
                lda SelectedBuff    ; $12F9
                ldy #$04    ; $12FC
                sta ($00),y    ; $12FE
                jsr $130E    ; $1300
                lda SelectedWind    ; $1303
                eor #$03    ; $1306
                jsr GetSelWind    ; $1308
                jmp $1333    ; $130B
                ldy #$05    ; $130E
                lda TheBuffer    ; $1310
                sec    ; $1312
                sbc PhysBuffTop    ; $1313
                sta ($00),y    ; $1315
                iny    ; $1317
                lda $61    ; $1318
                sbc $6F    ; $131A
                sta ($00),y    ; $131C
                iny    ; $131E
                lda PageTop    ; $131F
                sec    ; $1321
                sbc PhysBuffTop    ; $1322
                sta ($00),y    ; $1324
                iny    ; $1326
                lda $63    ; $1327
                sbc $6F    ; $1329
                sta ($00),y    ; $132B
                rts    ; $132D
                pla    ; $132E
                pla    ; $132F
                jsr Beep    ; $1330
                lda #$01    ; $1333
                rts    ; $1335
;
; === EnsureWinds ===
                lda TwoWindows?    ; $1336
                and $111C    ; $1339
                bpl $132E    ; $133C
                rts    ; $133E
;
; === OneWindow ===
                jsr EnsureWinds    ; $133F
                lda #$09    ; $1342
                sta CenterLine    ; $1344
                lda #$00    ; $1347
                sta WindowTop    ; $1349
                sta WindowLft    ; $134B
                lda #$14    ; $134D
                sta WindowBot    ; $134F
                sta ModeLineCV    ; $1351
                jsr $1293    ; $1354
                lda SelectedBuff    ; $1357
                ldy #$04    ; $135A
                sta ($00),y    ; $135C
                tax    ; $135E
                jsr $130E    ; $135F
                jsr $1370    ; $1362
                jsr DisplayPage    ; $1365
                lda #$00    ; $1368
                sta $111C    ; $136A
                jmp $1333    ; $136D
                jsr IN:OpenBuff    ; $1370
                lda $1121    ; $1373
                cmp $112A    ; $1376
                beq $137E    ; $1379
                jsr DisplayPage    ; $137B
                rts    ; $137E
;
; === GrowWindow ===
                bit $111C    ; $137F
                bmi $1387    ; $1382
                jmp $1330    ; $1384
                jsr GetArgSign    ; $1387
                bpl $1396    ; $138A
                lda SelectedWind    ; $138C
                cmp #$01    ; $138F
                beq $13BE    ; $1391
                jmp $139D    ; $1393
                lda SelectedWind    ; $1396
                cmp #$01    ; $1399
                bne $13BE    ; $139B
                lda $1120    ; $139D
                clc    ; $13A0
                adc Argument    ; $13A1
                bcs $13BB    ; $13A4
                cmp #$10    ; $13A6
                bcc $13AC    ; $13A8
                lda #$10    ; $13AA
                sta $1120    ; $13AC
                sta $1128    ; $13AF
                inc $1128    ; $13B2
                jsr OtherWindow    ; $13B5
                jmp OtherWindow    ; $13B8
                lda #$01    ; $13BB
                rts    ; $13BD
                lda $1120    ; $13BE
                sec    ; $13C1
                sbc Argument    ; $13C2
                bcc $13BB    ; $13C5
                cmp #$03    ; $13C7
                bcs $13AC    ; $13C9
                lda #$03    ; $13CB
                bne $13AC    ; $13CD
                stz $14    ; $13CF
                sta ($14,x)    ; $13D1
        dfb $8F        ; $13D3  (data/65C02-bit)
                trb $A7    ; $13D4
                trb MarkPnt    ; $13D6
                trb $1C    ; $13D8
                trb $32    ; $13DA
                trb $3C    ; $13DC
                trb $51    ; $13DE
                trb WindowLft    ; $13E0
                rol $A05A    ; $13E2
        dfb $03        ; $13E5  (data/65C02-bit)
                lda ($00),y    ; $13E6
                sta: $00F0,y    ; $13E8
                dey    ; $13EB
                bpl $13E6    ; $13EC
                rts    ; $13EE
;
; === PrintVar ===
                jsr $13E1    ; $13EF
                lda $F0    ; $13F2
                asl    ; $13F4
                tax    ; $13F5
                ldy #$00    ; $13F6
                sty PD:Justify    ; $13F8
                lda $13D9,x    ; $13FB
                sta $02    ; $13FE
                lda $13DA,x    ; $1400
                sta $03    ; $1403
                jmp ($0002)    ; $1405
                jsr $13E1    ; $1408
                lda $F0    ; $140B
                asl    ; $140D
                tax    ; $140E
                lda $13CF,x    ; $140F
                sta $02    ; $1412
                lda $13D0,x    ; $1414
                sta $03    ; $1417
                jmp ($0002)    ; $1419
                lda ($F2),y    ; $141C
                bpl $142C    ; $141E
                eor #$FF    ; $1420
                clc    ; $1422
                adc #$01    ; $1423
                pha    ; $1425
                lda #$AD    ; $1426
                jsr CharOut    ; $1428
                pla    ; $142B
                tax    ; $142C
                lda #$00    ; $142D
                jmp PrintDec    ; $142F
                lda ($F2),y    ; $1432
                tax    ; $1434
                iny    ; $1435
                lda ($F2),y    ; $1436
                jsr PrintDec    ; $1438
                rts    ; $143B
                lda #$A2    ; $143C
                jsr CharOut    ; $143E
                lda ($F2),y    ; $1441
                beq $144B    ; $1443
                jsr CharOut    ; $1445
                iny    ; $1448
                bne $1441    ; $1449
                lda #$A2    ; $144B
                jsr CharOut    ; $144D
                rts    ; $1450
                lda ($F2),y    ; $1451
                bpl $145C    ; $1453
                jsr PrintMessage    ; $1455
        dfb $CF        ; $1458  (data/65C02-bit)
                inc $6000    ; $1459
                jsr PrintMessage    ; $145C
        dfb $CF        ; $145F  (data/65C02-bit)
                inc $E6    ; $1460
                brk    ; $1462
                rts    ; $1463
                lda $7A5C    ; $1464
                bne $1480    ; $1467
                lda Argument    ; $1469
                cmp $F1    ; $146C
                bcc $1472    ; $146E
                bne $1480    ; $1470
                ldy #$00    ; $1472
                bit ArgSign    ; $1474
                bpl $147E    ; $1477
                eor #$FF    ; $1479
                clc    ; $147B
                adc #$01    ; $147C
                sta ($F2),y    ; $147E
                rts    ; $1480
                ldy #$00    ; $1481
                lda Argument    ; $1483
                sta ($F2),y    ; $1486
                iny    ; $1488
                lda $7A5C    ; $1489
                sta ($F2),y    ; $148C
                rts    ; $148E
                ldy #$00    ; $148F
                lda $0200,y    ; $1491
                cmp #$9B    ; $1494
                beq $14A2    ; $1496
                sta ($F2),y    ; $1498
                iny    ; $149A
                cpy $F1    ; $149B
                bcc $1491    ; $149D
                dey    ; $149F
                beq $14A6    ; $14A0
                lda #$00    ; $14A2
                sta ($F2),y    ; $14A4
                rts    ; $14A6
                lda ArgSign    ; $14A7
                ldy #$00    ; $14AA
                sta ($F2),y    ; $14AC
                rts    ; $14AE
;
; === SetVariable ===
                jsr GetStrArg    ; $14AF
                beq $14B9    ; $14B2
                jsr ReadVariable    ; $14B4
                bne $14D0    ; $14B7
                lda #$5D    ; $14B9
                sta CompList    ; $14BB
                lda #$97    ; $14BE
                sta $5988    ; $14C0
                lda #$9B    ; $14C3
                sta $0200,x    ; $14C5
                jsr SI:CompleteMe    ; $14C8
                beq $14D3    ; $14CB
                jsr Beep    ; $14CD
                lda #$01    ; $14D0
                rts    ; $14D2
                jsr PopCompPoint    ; $14D3
                jsr PushCompPoint    ; $14D6
                jsr $13E1    ; $14D9
                lda $F0    ; $14DC
                cmp #$02    ; $14DE
                beq $14E7    ; $14E0
                jsr AnyArgument?    ; $14E2
                beq $1510    ; $14E5
                jsr GetStrArg    ; $14E7
                beq $150D    ; $14EA
                lda #$16    ; $14EC
                sta $5725    ; $14EE
                jsr OpenEchoArea    ; $14F1
                jsr PrintMessage    ; $14F4
                sta $E1D6    ; $14F7
                cpx $E5F5    ; $14FA
                tsx    ; $14FD
                brk    ; $14FE
                jsr ReadArgLine    ; $14FF
                php    ; $1502
                txa    ; $1503
                pha    ; $1504
                jsr CloseEchoArea    ; $1505
                pla    ; $1508
                tax    ; $1509
                plp    ; $150A
                bne $14CD    ; $150B
                jsr $1519    ; $150D
                jsr PopCompPoint    ; $1510
                jsr $1408    ; $1513
                lda #$01    ; $1516
                rts    ; $1518
                lda #$9B    ; $1519
                sta $0200,x    ; $151B
                lda $F0    ; $151E
                cmp #$02    ; $1520
                beq $1555    ; $1522
                cmp #$03    ; $1524
                bne $155E    ; $1526
                cpx #$02    ; $1528
                bcc $155E    ; $152A
                lda $0200    ; $152C
                cmp #$AD    ; $152F
                beq $155E    ; $1531
                cmp #$B0    ; $1533
                bcc $1556    ; $1535
                cmp #$BA    ; $1537
                bcc $155E    ; $1539
                jsr UpperCon    ; $153B
                cmp #$CF    ; $153E
                bne $1556    ; $1540
                lda $0202    ; $1542
                cmp #$9B    ; $1545
                beq $1550    ; $1547
                lda #$00    ; $1549
                sta ArgSign    ; $154B
                beq $1555    ; $154E
                lda #$FF    ; $1550
                sta ArgSign    ; $1552
                rts    ; $1555
                ldy #$00    ; $1556
                lda ($F2),y    ; $1558
                sta ArgSign    ; $155A
                rts    ; $155D
                ldx #$00    ; $155E
                stx Argument    ; $1560
                lda $0200    ; $1563
                cmp #$AD    ; $1566
                bne $1570    ; $1568
                lda #$FF    ; $156A
                sta ArgSign    ; $156C
                inx    ; $156F
                lda $0200,x    ; $1570
                cmp #$B0    ; $1573
                bcc $1555    ; $1575
                cmp #$BA    ; $1577
                bcs $1555    ; $1579
                sec    ; $157B
                sbc #$B0    ; $157C
                jsr AddArgDigit    ; $157E
                inx    ; $1581
                jmp $1570    ; $1582
;
; === AutoPushPoint ===
        dfb $F4        ; $1585  (data/65C02-bit)
                ora (WindowLft,x)    ; $1586
                rts    ; $1588
                ply    ; $1589
                bpl $158F    ; $158A
                jmp Rubout    ; $158C
                jsr AnyArgument?    ; $158F
                bne $15BE    ; $1592
                jsr SetGap    ; $1594
                lda $61    ; $1597
                pha    ; $1599
                lda TheBuffer    ; $159A
                pha    ; $159C
                ldy #$41    ; $159D
                lda (BuffData),y    ; $159F
                pha    ; $15A1
                jsr RightChar    ; $15A2
                pla    ; $15A5
                ldy #$41    ; $15A6
                sta (BuffData),y    ; $15A8
                jsr SetGap    ; $15AA
                pla    ; $15AD
                sta $00    ; $15AE
                pla    ; $15B0
                sta $01    ; $15B1
                lda #$00    ; $15B3
                jsr KillTempPoint    ; $15B5
                lda #$02    ; $15B8
                rts    ; $15BA
                lda #$01    ; $15BB
                rts    ; $15BD
                jsr ClrLastKill    ; $15BE
                jsr LinesPastPnt    ; $15C1
                sta $B5    ; $15C4
                jsr BuffDelete    ; $15C6
                bne $15BB    ; $15C9
                ldy #$00    ; $15CB
                jsr $D03F    ; $15CD
                cmp #$8D    ; $15D0
                bne $1613    ; $15D2
                lda CH    ; $15D4
                cmp WindowLft    ; $15D6
                bne $15B8    ; $15D8
                ldx CV    ; $15DA
                inx    ; $15DC
                inx    ; $15DD
                cpx WindowBot    ; $15DE
                bcs $15B8    ; $15E0
                lda CV    ; $15E2
                pha    ; $15E4
                lda CH    ; $15E5
                pha    ; $15E7
                jsr TV:DelLine    ; $15E8
                lda WindowBot    ; $15EB
                sta CV    ; $15ED
                dec CV    ; $15EF
                lda WindowLft    ; $15F1
                sta CH    ; $15F3
                lda $61    ; $15F5
                pha    ; $15F7
                lda TheBuffer    ; $15F8
                pha    ; $15FA
                jsr PointToCH    ; $15FB
                jsr DispPointEnd    ; $15FE
                pla    ; $1601
                sta TheBuffer    ; $1602
                pla    ; $1604
                sta $61    ; $1605
                pla    ; $1607
                sta CH    ; $1608
                pla    ; $160A
                sta CV    ; $160B
                jsr vtab    ; $160D
                lda #$00    ; $1610
                rts    ; $1612
                jsr LinesPastPnt    ; $1613
                cmp $B5    ; $1616
                bne $15B8    ; $1618
                lda #$05    ; $161A
                rts    ; $161C
;
; === Rubout ===
                jsr GetArgSign    ; $161D
                bpl $1625    ; $1620
                jmp Delete    ; $1622
                jsr AnyArgument?    ; $1625
                bne $165B    ; $1628
                lda $61    ; $162A
                pha    ; $162C
                lda TheBuffer    ; $162D
                pha    ; $162F
                ldy #$41    ; $1630
                lda (BuffData),y    ; $1632
                pha    ; $1634
                jsr LeftChar    ; $1635
                pla    ; $1638
                ldy #$41    ; $1639
                sta (BuffData),y    ; $163B
                lda TheBuffer    ; $163D
                sta $00    ; $163F
                lda $61    ; $1641
                sta $01    ; $1643
                pla    ; $1645
                sta TheBuffer    ; $1646
                pla    ; $1648
                sta $61    ; $1649
                lda #$FF    ; $164B
                jsr KillTempPoint    ; $164D
                jsr FindPoint    ; $1650
                beq $1658    ; $1653
                lda #$06    ; $1655
                rts    ; $1657
                lda #$02    ; $1658
                rts    ; $165A
                jsr ClrLastKill    ; $165B
                lda CV    ; $165E
                sta $168A    ; $1660
                jsr LinesPastPnt    ; $1663
                sta $B5    ; $1666
                jsr BuffRubout    ; $1668
                ldy #$00    ; $166B
                jsr $D01B    ; $166D
                cmp #$8D    ; $1670
                beq $1650    ; $1672
                jsr FindPoint    ; $1674
                bne $1655    ; $1677
                jsr LinesPastPnt    ; $1679
                cmp $B5    ; $167C
                bne $1658    ; $167E
                lda CV    ; $1680
                cmp $168A    ; $1682
                bne $1658    ; $1685
                lda #$05    ; $1687
                rts    ; $1689
                brk    ; $168A
;
; === RubWithTab ===
                jsr ClrLastKill    ; $168B
                lda ArgSign    ; $168E
                bmi $16C9    ; $1691
                jsr PointBackward    ; $1693
                bne $16C9    ; $1696
                ldy #$00    ; $1698
                jsr $D01B    ; $169A
                cmp #$89    ; $169D
                bne $16C3    ; $169F
                jsr FindPoint    ; $16A1
                lda CH    ; $16A4
                jsr TabBump    ; $16A6
                sec    ; $16A9
                sbc CH    ; $16AA
                sta $B5    ; $16AC
                jsr SetGap    ; $16AE
                inc GapBot    ; $16B1
                bne $16B7    ; $16B3
                inc $6D    ; $16B5
                lda #$A0    ; $16B7
                jsr BuffInsert    ; $16B9
                dec $B5    ; $16BC
                bne $16B7    ; $16BE
                jmp $16C9    ; $16C0
                jsr PointForward    ; $16C3
                jsr SetGap    ; $16C6
                jmp Rubout    ; $16C9
;
; === TabInsert ===
                lda #$89    ; $16CC
;
; === Insert ===
                sta $B6    ; $16CE
                jsr LinesPastPnt    ; $16D0
                sta $B4    ; $16D3
                jsr ClrLastKill    ; $16D5
                jsr ZeroArg?    ; $16D8
                beq $1738    ; $16DB
                lda $B6    ; $16DD
                jsr BuffInsert    ; $16DF
                bne $1735    ; $16E2
                lda $B6    ; $16E4
                jsr GetXCharLen    ; $16E6
                txa    ; $16E9
                sec    ; $16EA
                adc CH    ; $16EB
                cmp WindowRgt    ; $16ED
                bcc $1723    ; $16EF
                ldx CV    ; $16F1
                inx    ; $16F3
                cpx WindowBot    ; $16F4
                bcc $1709    ; $16F6
                jsr CenterPage    ; $16F8
                lda Argument    ; $16FB
                bne $1703    ; $16FE
                dec $7A5C    ; $1700
                dec Argument    ; $1703
                jmp $16D8    ; $1706
                lda $B6    ; $1709
                jsr CharOut    ; $170B
                jsr ClearEOL    ; $170E
                ldx WindowRgt    ; $1711
                dex    ; $1713
                stx CH    ; $1714
                lda #$A1    ; $1716
                jsr CharOut    ; $1718
                inc $B4    ; $171B
                jsr DisplayDown    ; $171D
                jmp $16FB    ; $1720
                lda $B6    ; $1723
                jsr CharOut    ; $1725
                jsr LinesPastPnt    ; $1728
                cmp $B4    ; $172B
                bne $171D    ; $172D
                jsr DispPointEnd    ; $172F
                jmp $16FB    ; $1732
                jsr Beep    ; $1735
                lda #$00    ; $1738
                rts    ; $173A
;
; === RightChar ===
                jsr GetArgSign    ; $173B
                bmi LeftChar    ; $173E
                jsr ClrLastKill    ; $1740
                jsr ZeroArg?    ; $1743
                beq $175B    ; $1746
                jsr PointForward    ; $1748
                bne $175B    ; $174B
                lda Argument    ; $174D
                bne $1755    ; $1750
                dec $7A5C    ; $1752
                dec Argument    ; $1755
                jmp $1743    ; $1758
                lda #$01    ; $175B
                rts    ; $175D
;
; === LeftChar ===
                jsr GetArgSign    ; $175E
                bmi RightChar    ; $1761
                jsr ClrLastKill    ; $1763
                jsr ZeroArg?    ; $1766
                beq $177E    ; $1769
                jsr PointBackward    ; $176B
                bne $177E    ; $176E
                lda Argument    ; $1770
                bne $1778    ; $1773
                dec $7A5C    ; $1775
                dec Argument    ; $1778
                jmp $1766    ; $177B
                lda #$01    ; $177E
                rts    ; $1780
;
; === NewCenter ===
                jsr GetArgSign    ; $1781
                bmi $179A    ; $1784
                bit ExplicitArg    ; $1786
                bpl $17A6    ; $1789
                jsr $17C2    ; $178B
                lda Argument    ; $178E
                sta CenterPoint    ; $1791
                jsr CenterPage1    ; $1794
                lda #$00    ; $1797
                rts    ; $1799
                jsr $17C2    ; $179A
                lda WindowBot    ; $179D
                clc    ; $179F
                sbc Argument    ; $17A0
                jmp $1791    ; $17A3
                lda Argument    ; $17A6
                bne $17AE    ; $17A9
                dec $7A5C    ; $17AB
                dec Argument    ; $17AE
                lda Argument    ; $17B1
                ora $7A5C    ; $17B4
                beq $17BC    ; $17B7
                lda #$03    ; $17B9
                rts    ; $17BB
                jsr ClearPage    ; $17BC
                lda #$06    ; $17BF
                rts    ; $17C1
                lda #$00    ; $17C2
                sta $7A5C    ; $17C4
                lda WindowBot    ; $17C7
                sec    ; $17C9
                sbc WindowTop    ; $17CA
                sta $17E0    ; $17CC
                lda Argument    ; $17CF
                cmp $17E0    ; $17D2
                bcc $17DC    ; $17D5
                sbc $17E0    ; $17D7
                bne $17D2    ; $17DA
                sta Argument    ; $17DC
                rts    ; $17DF
                brk    ; $17E0
;
; === ScreenEdge ===
                jsr GetArgSign    ; $17E1
                bmi $17FA    ; $17E4
                bit ExplicitArg    ; $17E6
                bpl $1806    ; $17E9
                jsr $17C2    ; $17EB
                sta CV    ; $17EE
                lda WindowLft    ; $17F0
                sta CH    ; $17F2
                jsr PointToCH    ; $17F4
                lda #$00    ; $17F7
                rts    ; $17F9
                jsr $17C2    ; $17FA
                lda WindowBot    ; $17FD
                clc    ; $17FF
                sbc Argument    ; $1800
                jmp $17EE    ; $1803
                lda Argument    ; $1806
                bne $180E    ; $1809
                dec $7A5C    ; $180B
                dec Argument    ; $180E
                jsr ZeroArg?    ; $1811
                beq $1820    ; $1814
                inc Argument    ; $1816
                bne $181E    ; $1819
                inc $7A5C    ; $181B
                bne $17EB    ; $181E
                lda CV    ; $1820
                jmp $17EE    ; $1822
;
; === SkipComment? ===
        dfb $FF        ; $1825  (data/65C02-bit)
;
; === CRLF ===
                jsr ClrLastKill    ; $1826
                jsr ZeroArg?    ; $1829
                beq $1882    ; $182C
                jsr PrintReturn    ; $182E
                jsr LinesPastPnt    ; $1831
                sta $1851    ; $1834
                jsr $188B    ; $1837
                beq $1866    ; $183A
                lda CV    ; $183C
                cmp WindowTop    ; $183E
                beq $1885    ; $1840
                cmp WindowBot    ; $1842
                bcs $1885    ; $1844
                ldx $1851    ; $1846
                beq $1852    ; $1849
                jsr DisplayDown    ; $184B
                jmp $1866    ; $184E
                brk    ; $1851
                pha    ; $1852
                jsr TV:InsLine    ; $1853
                jsr SetGap    ; $1856
                lda WindowLft    ; $1859
                sta CH    ; $185B
                pla    ; $185D
                sta CV    ; $185E
                jsr vtab1    ; $1860
                jsr DispPointEnd    ; $1863
                lda Argument    ; $1866
                bne $186E    ; $1869
                dec $7A5C    ; $186B
                dec Argument    ; $186E
                lda #$04    ; $1871
                ldy #$40    ; $1873
                and (BuffData),y    ; $1875
                beq $1829    ; $1877
                jsr PrevIndent    ; $1879
                jsr GenDisplay    ; $187C
                jmp $1829    ; $187F
                lda #$00    ; $1882
                rts    ; $1884
                jsr CenterPage    ; $1885
                jmp $1866    ; $1888
                jsr SetGap    ; $188B
                lda #$00    ; $188E
                sta $B6    ; $1890
                ldx GapBot    ; $1892
                ldy $6D    ; $1894
                inx    ; $1896
                bne $189A    ; $1897
                iny    ; $1899
                stx $02    ; $189A
                sty $03    ; $189C
                lda BuffBot    ; $189E
                sec    ; $18A0
                sbc GapBot    ; $18A1
                sta $00    ; $18A3
                lda $69    ; $18A5
                sbc $6D    ; $18A7
                sta $01    ; $18A9
                bne $1919    ; $18AB
                lda $00    ; $18AD
                cmp #$04    ; $18AF
                bcs $1919    ; $18B1
                bit SkipComment?    ; $18B3
                bpl $1913    ; $18B6
                ldy #$00    ; $18B8
                ldx #$00    ; $18BA
                cpx CommentEnd    ; $18BC
                beq $1913    ; $18BF
                bit $B6    ; $18C1
                bmi $1913    ; $18C3
                lda $03    ; $18C5
                cmp $69    ; $18C7
                bcc $18D1    ; $18C9
                lda $02    ; $18CB
                cmp BuffBot    ; $18CD
                bcs $18E6    ; $18CF
                jsr $D009    ; $18D1
                cmp #$8D    ; $18D4
                beq $18E6    ; $18D6
                cmp CommentEnd,x    ; $18D8
                bne $1913    ; $18DB
                inc $02    ; $18DD
                bne $18E3    ; $18DF
                inc $03    ; $18E1
                inx    ; $18E3
                bne $18C5    ; $18E4
                lda CommentEnd,x    ; $18E6
                bne $1913    ; $18E9
                lda $02    ; $18EB
                sta TheBuffer    ; $18ED
                lda $03    ; $18EF
                sta $61    ; $18F1
                jsr SetGap    ; $18F3
                jsr InsertReturn    ; $18F6
                jsr FindPoint    ; $18F9
                bne $1912    ; $18FC
                lda CV    ; $18FE
                pha    ; $1900
                lda CH    ; $1901
                pha    ; $1903
                jsr DisplayPage    ; $1904
                pla    ; $1907
                sta CH    ; $1908
                pla    ; $190A
                sta CV    ; $190B
                jsr vtab    ; $190D
                lda #$00    ; $1910
                rts    ; $1912
                jsr InsertReturn    ; $1913
                lda #$FF    ; $1916
                rts    ; $1918
                ldy #$00    ; $1919
                ldx #$03    ; $191B
                jsr $D009    ; $191D
                cmp #$89    ; $1920
                beq $192F    ; $1922
                cmp #$A0    ; $1924
                beq $192F    ; $1926
                cmp #$8D    ; $1928
                bne $18B3    ; $192A
                dex    ; $192C
                sta $B6    ; $192D
                inx    ; $192F
                dex    ; $1930
                beq $194A    ; $1931
                inc $02    ; $1933
                bne $1939    ; $1935
                inc $03    ; $1937
                lda $00    ; $1939
                bne $193F    ; $193B
                dec $01    ; $193D
                dec $00    ; $193F
                lda $00    ; $1941
                ora $01    ; $1943
                bne $191D    ; $1945
                jmp $18B3    ; $1947
                inc GapBot    ; $194A
                bne $1950    ; $194C
                inc $6D    ; $194E
                jsr $D03F    ; $1950
                cmp #$8D    ; $1953
                bne $194A    ; $1955
                lda GapBot    ; $1957
                bne $195D    ; $1959
                dec $6D    ; $195B
                dec GapBot    ; $195D
                jsr PointForward    ; $195F
                jsr SetGap    ; $1962
                jsr FindPoint    ; $1965
                rts    ; $1968
;
; === InsertReturn ===
                lda #$8D    ; $1969
                jmp BuffInsert    ; $196B
;
; === OpenLine ===
                jsr ClrLastKill    ; $196E
                lda $7A5C    ; $1971
                bne $1980    ; $1974
                lda WindowBot    ; $1976
                sec    ; $1978
                sbc CV    ; $1979
                cmp Argument    ; $197B
                bcs $19B1    ; $197E
                jsr SetGap    ; $1980
                lda $61    ; $1983
                pha    ; $1985
                lda TheBuffer    ; $1986
                pha    ; $1988
                lda Argument    ; $1989
                ora $7A5C    ; $198C
                beq $19A2    ; $198F
                jsr InsertReturn    ; $1991
                lda Argument    ; $1994
                bne $199C    ; $1997
                dec $7A5C    ; $1999
                dec Argument    ; $199C
                jmp $1989    ; $199F
                pla    ; $19A2
                sta TheBuffer    ; $19A3
                pla    ; $19A5
                sta $61    ; $19A6
                jsr SetGap    ; $19A8
                jsr ClearEOP    ; $19AB
                lda #$00    ; $19AE
                rts    ; $19B0
                jsr ZeroArg?    ; $19B1
                bne $19B9    ; $19B4
                jmp $1A3E    ; $19B6
                jsr LinesPastPnt    ; $19B9
                pha    ; $19BC
                jsr SetGap    ; $19BD
                lda $61    ; $19C0
                pha    ; $19C2
                lda TheBuffer    ; $19C3
                pha    ; $19C5
                jsr InsertReturn    ; $19C6
                pla    ; $19C9
                sta TheBuffer    ; $19CA
                pla    ; $19CC
                sta $61    ; $19CD
                jsr SetGap    ; $19CF
                jsr ClearEOL    ; $19D2
                ldx CV    ; $19D5
                inx    ; $19D7
                cpx WindowBot    ; $19D8
                bcs $1A3A    ; $19DA
                lda GapBot    ; $19DC
                clc    ; $19DE
                adc #$02    ; $19DF
                tax    ; $19E1
                lda $6D    ; $19E2
                adc #$00    ; $19E4
                cmp $69    ; $19E6
                bne $19EE    ; $19E8
                cpx BuffBot    ; $19EA
                beq $1A3A    ; $19EC
                pla    ; $19EE
                beq $19F7    ; $19EF
                jsr DisplayDown    ; $19F1
                jmp $1A2C    ; $19F4
                lda CV    ; $19F7
                pha    ; $19F9
                lda CH    ; $19FA
                pha    ; $19FC
                inc CV    ; $19FD
                jsr TV:InsLine    ; $19FF
                ldy #$02    ; $1A02
                jsr $D03F    ; $1A04
                cmp #$8D    ; $1A07
                beq $1A23    ; $1A09
                tya    ; $1A0B
                clc    ; $1A0C
                adc GapBot    ; $1A0D
                sta TheBuffer    ; $1A0F
                lda #$00    ; $1A11
                adc $6D    ; $1A13
                sta $61    ; $1A15
                jsr SetGap    ; $1A17
                jsr DispPointEnd    ; $1A1A
                jsr PointBackward    ; $1A1D
                jsr SetGap    ; $1A20
                pla    ; $1A23
                sta CH    ; $1A24
                pla    ; $1A26
                sta CV    ; $1A27
                jsr vtab1    ; $1A29
                lda Argument    ; $1A2C
                bne $1A34    ; $1A2F
                dec $7A5C    ; $1A31
                dec Argument    ; $1A34
                jmp $19B1    ; $1A37
                pla    ; $1A3A
                jmp $1A2C    ; $1A3B
                lda #$00    ; $1A3E
                rts    ; $1A40
;
; === GotoTop ===
                jsr ClrLastKill    ; $1A41
                lda TheBuffer    ; $1A44
                sta $00    ; $1A46
                lda $61    ; $1A48
                sta $01    ; $1A4A
                lda BuffTop    ; $1A4C
                sta TheBuffer    ; $1A4E
                lda $67    ; $1A50
                sta $61    ; $1A52
                jsr MovePush?    ; $1A54
                lda #$06    ; $1A57
                rts    ; $1A59
;
; === GotoBot ===
                jsr ClrLastKill    ; $1A5A
                lda $61    ; $1A5D
                pha    ; $1A5F
                lda TheBuffer    ; $1A60
                pha    ; $1A62
                lda BuffBot    ; $1A63
                sta TheBuffer    ; $1A65
                lda $69    ; $1A67
                sta $61    ; $1A69
                jsr SetGap    ; $1A6B
                pla    ; $1A6E
                sta $00    ; $1A6F
                pla    ; $1A71
                sta $01    ; $1A72
                jsr MovePush?    ; $1A74
                lda #$01    ; $1A77
                rts    ; $1A79
;
; === MovePush? ===
                lda $01    ; $1A7A
                cmp TheBuffer    ; $1A7C
                bcc $1A99    ; $1A7E
                beq $1A98    ; $1A80
                lda $00    ; $1A82
                sec    ; $1A84
                sbc TheBuffer    ; $1A85
                tax    ; $1A87
                lda $01    ; $1A88
                sbc $61    ; $1A8A
                cmp $1586    ; $1A8C
                bcc $1A98    ; $1A8F
                bne $1AA6    ; $1A91
                cpx AutoPushPoint    ; $1A93
                bcs $1AA6    ; $1A96
                rts    ; $1A98
                lda TheBuffer    ; $1A99
                sec    ; $1A9B
                sbc $00    ; $1A9C
                tax    ; $1A9E
                lda $61    ; $1A9F
                sbc $01    ; $1AA1
                jmp $1A8C    ; $1AA3
                lda $61    ; $1AA6
                pha    ; $1AA8
                lda TheBuffer    ; $1AA9
                pha    ; $1AAB
                lda $00    ; $1AAC
                sta TheBuffer    ; $1AAE
                lda $01    ; $1AB0
                sta $61    ; $1AB2
                jsr PushMark    ; $1AB4
                pla    ; $1AB7
                sta TheBuffer    ; $1AB8
                pla    ; $1ABA
                sta $61    ; $1ABB
                jsr NewEchoArea    ; $1ABD
                jsr PrintMessage    ; $1AC0
                bne $1AB4    ; $1AC3
                sbc #$EE    ; $1AC5
        dfb $F4        ; $1AC7  (data/65C02-bit)
                ldy #$F0    ; $1AC8
                sbc $F3,x    ; $1ACA
                inx    ; $1ACC
                sbc $E4    ; $1ACD
                ldx $2000    ; $1ACF
                plx    ; $1AD2
        dfb $57        ; $1AD3  (data/65C02-bit)
                rts    ; $1AD4
;
; === PrefixMeta ===
                lda #$00    ; $1AD5
                jsr $1B4E    ; $1AD7
                ldx #$01    ; $1ADA
                bne $1AF2    ; $1ADC
;
; === PrefixCtrl ===
                lda #$01    ; $1ADE
                jsr $1B4E    ; $1AE0
                ldx #$02    ; $1AE3
                cmp #$80    ; $1AE5
                bcc $1AF7    ; $1AE7
                bcs $1AF2    ; $1AE9
;
; === PrefixCMeta ===
                lda #$02    ; $1AEB
                jsr $1B4E    ; $1AED
                ldx #$00    ; $1AF0
                ora #$80    ; $1AF2
                jsr UpperCon    ; $1AF4
                and $1AFD,x    ; $1AF7
                jmp Dispatch    ; $1AFA
        dfb $3F        ; $1AFD  (data/65C02-bit)
        dfb $7F        ; $1AFE  (data/65C02-bit)
        dfb $BF        ; $1AFF  (data/65C02-bit)
;
; === ControlX ===
                lda #$04    ; $1B00
                jsr $1B4E    ; $1B02
                cmp #$80    ; $1B05
                bcc $1B32    ; $1B07
                ldx #$00    ; $1B09
                jsr UpperCon    ; $1B0B
                cmp C_XCharacters,x    ; $1B0E
                beq $1B1C    ; $1B11
                inx    ; $1B13
                cpx C_XCharCount    ; $1B14
                bcc $1B0E    ; $1B17
                jmp $1B32    ; $1B19
                txa    ; $1B1C
                asl    ; $1B1D
                tax    ; $1B1E
                lda C_XVectors,x    ; $1B1F
                sta $00    ; $1B22
                sta CommandVector    ; $1B24
                lda $7DDF,x    ; $1B27
                sta $01    ; $1B2A
                sta $7835    ; $1B2C
                jmp ($0000)    ; $1B2F
                pha    ; $1B32
                jsr NewEchoArea    ; $1B33
                jsr PrintMessage    ; $1B36
        dfb $C3        ; $1B39  (data/65C02-bit)
                lda $A0D8    ; $1B3A
                brk    ; $1B3D
                pla    ; $1B3E
                jsr PrettyPrint    ; $1B3F
                jsr PrUnDefined    ; $1B42
                jsr Beep    ; $1B45
                jsr CloseEchoArea    ; $1B48
                lda #$01    ; $1B4B
                rts    ; $1B4D
                jsr PreCharGet    ; $1B4E
                php    ; $1B51
                cmp #$87    ; $1B52
                beq $1B63    ; $1B54
                sta $00    ; $1B56
                plp    ; $1B58
                beq $1B62    ; $1B59
                ora #$80    ; $1B5B
                jsr EchoOutput    ; $1B5D
                lda $00    ; $1B60
                rts    ; $1B62
                jsr Beep    ; $1B63
                lda #$87    ; $1B66
                jsr EchoOutput    ; $1B68
                plp    ; $1B6B
                pla    ; $1B6C
                pla    ; $1B6D
                lda #$01    ; $1B6E
                rts    ; $1B70
;
; === RSrch ===
                lda #$FF    ; $1B71
                eor ArgSign    ; $1B73
                sta ArgSign    ; $1B76
;
; === ISrch ===
                lda ArgSign    ; $1B79
                sta ISearchDir    ; $1B7C
                jsr ClrLastKill    ; $1B7F
                jsr ISearch    ; $1B82
                lda #$01    ; $1B85
                rts    ; $1B87
;
; === RWordSearch ===
                lda ArgSign    ; $1B88
                eor #$FF    ; $1B8B
                sta ArgSign    ; $1B8D
;
; === WordSearch ===
                jsr ClrLastKill    ; $1B90
                lda ArgSign    ; $1B93
                jsr StrSearch    ; $1B96
                lda #$01    ; $1B99
                rts    ; $1B9B
;
; === TabsIndent ===
        dfb $FF        ; $1B9C  (data/65C02-bit)
;
; === SetTabsIndent ===
                lda ArgSign    ; $1B9D
                sta TabsIndent    ; $1BA0
                lda #$01    ; $1BA3
                rts    ; $1BA5
;
; === NotModified ===
                lda Modified?    ; $1BA6
                eor #$FF    ; $1BA9
                jsr SetAModified    ; $1BAB
                lda #$01    ; $1BAE
                rts    ; $1BB0
;
; === QuotedInsert ===
                jsr BlinkCursor    ; $1BB1
                jmp Insert    ; $1BB4
;
; === UpLine ===
                lda #$77    ; $1BB7
                sta $00    ; $1BB9
                lda #$34    ; $1BBB
                sta $01    ; $1BBD
                jmp $1BCA    ; $1BBF
;
; === DownLine ===
                lda #$39    ; $1BC2
                sta $00    ; $1BC4
                lda #$34    ; $1BC6
                sta $01    ; $1BC8
                jsr ClrLastKill    ; $1BCA
                lda #$1B    ; $1BCD
                cmp $7837    ; $1BCF
                bne $1BDB    ; $1BD2
                lda #$B7    ; $1BD4
                cmp LastComVect    ; $1BD6
                beq $1BF1    ; $1BD9
                lda #$1B    ; $1BDB
                cmp $7837    ; $1BDD
                bne $1BE9    ; $1BE0
                lda #$C2    ; $1BE2
                cmp LastComVect    ; $1BE4
                beq $1BF1    ; $1BE7
                lda #$00    ; $1BE9
                sta GoalColumn    ; $1BEB
                sta $3407    ; $1BEE
                jmp ($0000)    ; $1BF1
;
; === TopAbort ===
                jsr Beep    ; $1BF4
                jsr ClrEchoArea    ; $1BF7
                lda #$00    ; $1BFA
                sta MacroDef    ; $1BFC
                sta MacroExec    ; $1BFF
                jsr MakeModeLine    ; $1C02
                lda #$01    ; $1C05
                rts    ; $1C07
;
; === AtomMode ===
                lda #$01    ; $1C08
                bne ToggleMode    ; $1C0A
;
; === IndentMode ===
                lda #$04    ; $1C0C
                bne ToggleMode    ; $1C0E
;
; === AutoMode ===
                lda #$02    ; $1C10
                bne ToggleMode    ; $1C12
;
; === CapsMode ===
                lda #$10    ; $1C14
;
; === ToggleMode ===
                sta $1C47    ; $1C16
                ldy #$40    ; $1C19
                jsr AnyArgument?    ; $1C1B
                bne $1C27    ; $1C1E
                lda ArgSign    ; $1C20
                bpl $1C2E    ; $1C23
                bmi $1C3B    ; $1C25
                lda $1C47    ; $1C27
                and (BuffData),y    ; $1C2A
                bne $1C3B    ; $1C2C
                lda $1C47    ; $1C2E
                ora (BuffData),y    ; $1C31
                sta (BuffData),y    ; $1C33
                jsr MakeModeLine    ; $1C35
                lda #$01    ; $1C38
                rts    ; $1C3A
                lda $1C47    ; $1C3B
                eor #$FF    ; $1C3E
                and (BuffData),y    ; $1C40
                sta (BuffData),y    ; $1C42
                jmp $1C35    ; $1C44
                brk    ; $1C47
;
; === PointInfo ===
                jsr FindPoint    ; $1C48
                lda CV    ; $1C4B
                pha    ; $1C4D
                lda CH    ; $1C4E
                pha    ; $1C50
                jsr NewEchoArea    ; $1C51
                jsr PrintMessage    ; $1C54
                cld    ; $1C57
                ldy #$BD    ; $1C58
                brk    ; $1C5A
                pla    ; $1C5B
                jsr $1CC6    ; $1C5C
                jsr PrintMessage    ; $1C5F
                ldy $D9A0    ; $1C62
                ldy #$BD    ; $1C65
                brk    ; $1C67
                pla    ; $1C68
                jsr $1CC6    ; $1C69
                jsr PrintMessage    ; $1C6C
                ldy $A0A0    ; $1C6F
        dfb $C3        ; $1C72  (data/65C02-bit)
                iny    ; $1C73
                ldy #$BD    ; $1C74
                brk    ; $1C76
                iny    ; $1C77
                jsr $D03F    ; $1C78
                pha    ; $1C7B
                eor #$80    ; $1C7C
                jsr $1CC6    ; $1C7E
                jsr PrintMessage    ; $1C81
                ldy #$A8    ; $1C84
                brk    ; $1C86
                pla    ; $1C87
                jsr PrettyPrint    ; $1C88
                jsr PrintMessage    ; $1C8B
                lda #$89    ; $1C8E
                bne $1C81    ; $1C90
                sbc #$EE    ; $1C92
        dfb $F4        ; $1C94  (data/65C02-bit)
                ldy #$E9    ; $1C95
        dfb $F3        ; $1C97  (data/65C02-bit)
                ldy #$E1    ; $1C98
        dfb $F4        ; $1C9A  (data/65C02-bit)
                ldy #$00    ; $1C9B
                sec    ; $1C9D
                lda TheBuffer    ; $1C9E
                sbc BuffTop    ; $1CA0
                tax    ; $1CA2
                lda $61    ; $1CA3
                sbc $67    ; $1CA5
                jsr PrintDec    ; $1CA7
                jsr PrintMessage    ; $1CAA
                ldy #$EF    ; $1CAD
                inc $A0    ; $1CAF
                brk    ; $1CB1
                ldx SelectedBuff    ; $1CB2
                jsr MySize    ; $1CB5
                jsr PrintDec    ; $1CB8
                lda #$AE    ; $1CBB
                jsr CharOut    ; $1CBD
                jsr CloseEchoArea    ; $1CC0
                lda #$01    ; $1CC3
                rts    ; $1CC5
                tax    ; $1CC6
                jsr ZeroJustify    ; $1CC7
                jmp PrintDec    ; $1CCA
;
; === WhatLossage ===
                jsr OpenTypeout    ; $1CCD
                lda TYI_PopIndex    ; $1CD0
                sec    ; $1CD3
                sbc #$3C    ; $1CD4
                and #$3F    ; $1CD6
                sta $1CFE    ; $1CD8
                ldx $1CFE    ; $1CDB
                cpx TYI_PopIndex    ; $1CDE
                beq $1CF7    ; $1CE1
                lda TYIBuff,x    ; $1CE3
                beq $1CEE    ; $1CE6
                jsr PrettyPrint    ; $1CE8
                jsr PrintSpace    ; $1CEB
                inc $1CFE    ; $1CEE
                lda $1CFE    ; $1CF1
                jmp $1CD6    ; $1CF4
                jsr CloseTypeout    ; $1CF7
                lda #$01    ; $1CFA
                rts    ; $1CFC
                brk    ; $1CFD
                brk    ; $1CFE
;
; === CommentColumn ===
                jsr $00BB    ; $1CFF
                brk    ; $1D02
                brk    ; $1D03
                brk    ; $1D04
;
; === CommentEnd ===
                brk    ; $1D05
                brk    ; $1D06
                brk    ; $1D07
                brk    ; $1D08
                brk    ; $1D09
;
; === StringPntr ===
                brk    ; $1D0A
                brk    ; $1D0B
;
; === StringInLine ===
                jsr SetGap    ; $1D0C
                lda GapBot    ; $1D0F
                sta $00    ; $1D11
                lda $6D    ; $1D13
                sta $01    ; $1D15
                ldy #$00    ; $1D17
                lda StringPntr    ; $1D19
                sta $02    ; $1D1C
                lda $1D0B    ; $1D1E
                sta $03    ; $1D21
                inc $00    ; $1D23
                bne $1D29    ; $1D25
                inc $01    ; $1D27
                lda $00    ; $1D29
                cmp BuffBot    ; $1D2B
                bne $1D44    ; $1D2D
                lda $01    ; $1D2F
                cmp $69    ; $1D31
                bne $1D44    ; $1D33
                lda ($02),y    ; $1D35
                beq $1D67    ; $1D37
                lda $00    ; $1D39
                bne $1D3F    ; $1D3B
                dec $01    ; $1D3D
                dec $00    ; $1D3F
                lda #$FF    ; $1D41
                rts    ; $1D43
                lda ($02),y    ; $1D44
                beq $1D67    ; $1D46
                jsr UpperCon    ; $1D48
                sta $1D8A    ; $1D4B
                jsr $D000    ; $1D4E
                cmp #$8D    ; $1D51
                beq $1D41    ; $1D53
                ora #$80    ; $1D55
                jsr UpperCon    ; $1D57
                cmp $1D8A    ; $1D5A
                bne $1D19    ; $1D5D
                inc $02    ; $1D5F
                bne $1D65    ; $1D61
                inc $03    ; $1D63
                bne $1D23    ; $1D65
                lda StringPntr    ; $1D67
                sta $02    ; $1D6A
                lda $1D0B    ; $1D6C
                sta $03    ; $1D6F
                lda ($02),y    ; $1D71
                beq $1D78    ; $1D73
                iny    ; $1D75
                bne $1D71    ; $1D76
                sty $02    ; $1D78
                lda $00    ; $1D7A
                sec    ; $1D7C
                sbc $02    ; $1D7D
                sta $00    ; $1D7F
                lda $01    ; $1D81
                sbc #$00    ; $1D83
                sta $01    ; $1D85
                lda #$00    ; $1D87
                rts    ; $1D89
                brk    ; $1D8A
                brk    ; $1D8B
;
; === MakeComment ===
                jsr ClrLastKill    ; $1D8C
                jsr SetModified    ; $1D8F
                lda #$00    ; $1D92
                sta $1D8B    ; $1D94
                jsr FindComment    ; $1D97
                php    ; $1D9A
                jsr FindPoint    ; $1D9B
                jsr LinesPastPnt    ; $1D9E
                sta $1E69    ; $1DA1
                jsr DeleteSpace    ; $1DA4
                plp    ; $1DA7
                beq $1DC9    ; $1DA8
                ldy #$FF    ; $1DAA
                sty $1D8B    ; $1DAC
                iny    ; $1DAF
                lda CommentBegin,y    ; $1DB0
                beq $1DBA    ; $1DB3
                jsr $D06F    ; $1DB5
                bne $1DAF    ; $1DB8
                tya    ; $1DBA
                clc    ; $1DBB
                adc TheBuffer    ; $1DBC
                sta GapTop    ; $1DBE
                lda $61    ; $1DC0
                adc #$00    ; $1DC2
                sta $6B    ; $1DC4
                jsr SetGap    ; $1DC6
                jsr FindPoint    ; $1DC9
                beq $1DD6    ; $1DCC
                jsr CenterPage    ; $1DCE
                lda #$FF    ; $1DD1
                sta $1E69    ; $1DD3
                lda CH    ; $1DD6
                cmp WindowLft    ; $1DD8
                beq $1E1D    ; $1DDA
                cmp CommentColumn    ; $1DDC
                beq $1E1D    ; $1DDF
                bcs $1E10    ; $1DE1
                lda CommentColumn    ; $1DE3
                cmp WindowRgt    ; $1DE6
                bcs $1E1D    ; $1DE8
                bit TabsIndent    ; $1DEA
                bpl $1E09    ; $1DED
                lda #$89    ; $1DEF
                jsr GetXCharLen    ; $1DF1
                txa    ; $1DF4
                clc    ; $1DF5
                adc CH    ; $1DF6
                cmp CommentColumn    ; $1DF8
                beq $1DFF    ; $1DFB
                bcs $1E09    ; $1DFD
                jsr BumpXPos    ; $1DFF
                lda #$89    ; $1E02
                jsr BuffInsert    ; $1E04
                beq $1DEF    ; $1E07
                lda CH    ; $1E09
                cmp CommentColumn    ; $1E0B
                bcs $1E1D    ; $1E0E
                lda #$A0    ; $1E10
                jsr BuffInsert    ; $1E12
                ldx #$01    ; $1E15
                jsr BumpXPos    ; $1E17
                jmp $1E09    ; $1E1A
                jsr SetGap    ; $1E1D
                jsr $1F94    ; $1E20
                iny    ; $1E23
                tya    ; $1E24
                clc    ; $1E25
                adc GapBot    ; $1E26
                sta TheBuffer    ; $1E28
                lda $6D    ; $1E2A
                adc #$00    ; $1E2C
                sta $61    ; $1E2E
                jsr SetGap    ; $1E30
                bit $1D8B    ; $1E33
                bpl $1E4F    ; $1E36
                ldy #$00    ; $1E38
                lda CommentEnd,y    ; $1E3A
                beq $1E45    ; $1E3D
                jsr $D08A    ; $1E3F
                iny    ; $1E42
                bne $1E3A    ; $1E43
                tya    ; $1E45
                clc    ; $1E46
                adc GapTop    ; $1E47
                sta GapTop    ; $1E49
                bcc $1E4F    ; $1E4B
                inc $6B    ; $1E4D
                jsr SetGap    ; $1E4F
                jsr DisplayLine    ; $1E52
                bit $1E69    ; $1E55
                bmi $1E68    ; $1E58
                jsr FindPoint    ; $1E5A
                jsr LinesPastPnt    ; $1E5D
                cmp $1E69    ; $1E60
                beq $1E68    ; $1E63
                jsr DisplayDown    ; $1E65
                rts    ; $1E68
                brk    ; $1E69
;
; === KillComment ===
                jsr FindComment    ; $1E6A
                php    ; $1E6D
                jsr DeleteSpace    ; $1E6E
                plp    ; $1E71
                bne $1E77    ; $1E72
                jmp KillLine    ; $1E74
                lda #$01    ; $1E77
                rts    ; $1E79
;
; === CommentLine ===
                jsr AnyArgument?    ; $1E7A
                bne CommentLineI    ; $1E7D
                lda CommentColumn    ; $1E7F
                pha    ; $1E82
                lda Argument    ; $1E83
                sta CommentColumn    ; $1E86
                jsr CommentLineI    ; $1E89
                pla    ; $1E8C
                sta CommentColumn    ; $1E8D
                lda #$01    ; $1E90
                rts    ; $1E92
;
; === CommentLineI ===
                lda CommentBegin    ; $1E93
                beq $1E9D    ; $1E96
                jsr MakeComment    ; $1E98
                lda #$01    ; $1E9B
                rts    ; $1E9D
;
; === UpCommLine ===
                lda ArgSign    ; $1E9E
                eor #$FF    ; $1EA1
                sta ArgSign    ; $1EA3
;
; === DownCommLine ===
                lda CommentBegin    ; $1EA6
                beq $1EE6    ; $1EA9
                jsr GetArgSign    ; $1EAB
                sta $1EE9    ; $1EAE
                jsr ZeroArg?    ; $1EB1
                beq $1EE6    ; $1EB4
                lda $7A5C    ; $1EB6
                pha    ; $1EB9
                lda Argument    ; $1EBA
                pha    ; $1EBD
                jsr InitArgument    ; $1EBE
                lda $1EE9    ; $1EC1
                sta ArgSign    ; $1EC4
                jsr DelBlankComm    ; $1EC7
                jsr DownLine    ; $1ECA
                jsr CommentLineI    ; $1ECD
                pla    ; $1ED0
                sta Argument    ; $1ED1
                pla    ; $1ED4
                sta $7A5C    ; $1ED5
                lda Argument    ; $1ED8
                bne $1EE0    ; $1EDB
                dec $7A5C    ; $1EDD
                dec Argument    ; $1EE0
                jmp $1EB1    ; $1EE3
                lda #$01    ; $1EE6
                rts    ; $1EE8
                brk    ; $1EE9
;
; === FindComment ===
                lda CommentBegin    ; $1EEA
                cmp #$BB    ; $1EED
                bne $1F13    ; $1EEF
                lda $1D01    ; $1EF1
                ora CommentEnd    ; $1EF4
                bne $1F13    ; $1EF7
                jsr $1F13    ; $1EF9
                bne $1F30    ; $1EFC
                jsr PointBackward    ; $1EFE
                bne $1F31    ; $1F01
                jsr $D01B    ; $1F03
                jsr WhiteSpace?    ; $1F06
                beq $1F31    ; $1F09
                jsr PointForward    ; $1F0B
                jsr PointForward    ; $1F0E
                beq $1F20    ; $1F11
                lda #$00    ; $1F13
                sta StringPntr    ; $1F15
                lda #$1D    ; $1F18
                sta $1D0B    ; $1F1A
                jsr BegOfLine    ; $1F1D
                jsr SetGap    ; $1F20
                jsr StringInLine    ; $1F23
                beq $1F31    ; $1F26
                jsr EndOfLine    ; $1F28
                jsr SetGap    ; $1F2B
                lda #$FF    ; $1F2E
                rts    ; $1F30
                lda $00    ; $1F31
                sta TheBuffer    ; $1F33
                lda $01    ; $1F35
                sta $61    ; $1F37
                jsr SetGap    ; $1F39
                lda #$00    ; $1F3C
                rts    ; $1F3E
;
; === DelBlankComm ===
                jsr FindComment    ; $1F3F
                bne $1F7B    ; $1F42
                jsr $1F94    ; $1F44
                iny    ; $1F47
                ldx #$00    ; $1F48
                stx $1F93    ; $1F4A
                tya    ; $1F4D
                sec    ; $1F4E
                adc GapBot    ; $1F4F
                tax    ; $1F51
                lda $6D    ; $1F52
                adc #$00    ; $1F54
                cmp $69    ; $1F56
                bne $1F5E    ; $1F58
                cpx BuffBot    ; $1F5A
                beq $1F71    ; $1F5C
                jsr $D03F    ; $1F5E
                cmp #$8D    ; $1F61
                beq $1F70    ; $1F63
                cmp #$89    ; $1F65
                beq $1F6D    ; $1F67
                cmp #$A0    ; $1F69
                bne $1F82    ; $1F6B
                iny    ; $1F6D
                bne $1F4D    ; $1F6E
                dey    ; $1F70
                tya    ; $1F71
                clc    ; $1F72
                adc GapBot    ; $1F73
                sta GapBot    ; $1F75
                bcc $1F7B    ; $1F77
                inc $6D    ; $1F79
                jsr DeleteSpace    ; $1F7B
                jsr DisplayLine    ; $1F7E
                rts    ; $1F81
                ldx $1F93    ; $1F82
                inc $1F93    ; $1F85
                lda CommentEnd,x    ; $1F88
                beq $1F81    ; $1F8B
                jsr $D09C    ; $1F8D
                beq $1F6D    ; $1F90
                rts    ; $1F92
                brk    ; $1F93
                ldy #$00    ; $1F94
                lda CommentBegin,y    ; $1F96
                beq $1F9E    ; $1F99
                iny    ; $1F9B
                bne $1F96    ; $1F9C
                rts    ; $1F9E
;
; === SpaceBar ===
                lda #$02    ; $1F9F
                ldy #$40    ; $1FA1
                and (BuffData),y    ; $1FA3
                bne AutoFill    ; $1FA5
                lda #$A0    ; $1FA7
                jmp Insert    ; $1FA9
;
; === FillColumn ===
                lsr: $00A0    ; $1FAC
                jsr $20F6    ; $1FAF
                jsr CleanBegLine    ; $1FB2
                lda #$00    ; $1FB5
                sta $EB    ; $1FB7
                sta $EF    ; $1FB9
                jsr $2108    ; $1FBB
                bne $1FE9    ; $1FBE
                bit EnableKDisp    ; $1FC0
                bpl $1FA7    ; $1FC3
                jsr FindPoint    ; $1FC5
                beq $1FD4    ; $1FC8
                jsr CenterPage    ; $1FCA
                lda #$00    ; $1FCD
                sta EnableKDisp    ; $1FCF
                beq $1FA7    ; $1FD2
                lda CV    ; $1FD4
                pha    ; $1FD6
                lda CH    ; $1FD7
                pha    ; $1FD9
                jsr DisplayPage    ; $1FDA
                pla    ; $1FDD
                sta CH    ; $1FDE
                pla    ; $1FE0
                sta CV    ; $1FE1
                jsr vtab1    ; $1FE3
                jmp $1FCD    ; $1FE6
                jsr $D01B    ; $1FE9
                cmp #$A0    ; $1FEC
                bne $1FFA    ; $1FEE
                lda TheBuffer    ; $1FF0
                sta $EE    ; $1FF2
                lda $61    ; $1FF4
                sta $EF    ; $1FF6
                lda #$A0    ; $1FF8
                tax    ; $1FFA
                inc TheBuffer    ; $1FFB
                bne $2001    ; $1FFD
                inc $61    ; $1FFF
                jsr GatherTYI    ; $2001
                lda CH    ; $2004
                pha    ; $2006
                lda $EB    ; $2007
                sta CH    ; $2009
                txa    ; $200B
                jsr GetXCharLen    ; $200C
                pla    ; $200F
                sta CH    ; $2010
                txa    ; $2012
                clc    ; $2013
                adc $EB    ; $2014
                sta $EB    ; $2016
                cmp FillColumn    ; $2018
                bcc $1FBB    ; $201B
                lda $EF    ; $201D
                beq $1FBB    ; $201F
                sta $01    ; $2021
                lda $EE    ; $2023
                sta $00    ; $2025
                lda #$8D    ; $2027
                jsr $D054    ; $2029
                sta EnableKDisp    ; $202C
                lda $00    ; $202F
                sta TheBuffer    ; $2031
                lda $01    ; $2033
                sta $61    ; $2035
                inc TheBuffer    ; $2037
                bne $203D    ; $2039
                inc $61    ; $203B
                lda FillPrefix    ; $203D
                bne $2045    ; $2040
                jmp $1FB2    ; $2042
                lda $EC    ; $2045
                sec    ; $2047
                sbc TheBuffer    ; $2048
                sta $F0    ; $204A
                lda $ED    ; $204C
                sbc $61    ; $204E
                sta $F1    ; $2050
                lda #$00    ; $2052
                sta $EA    ; $2054
                jsr SetGap    ; $2056
                ldy $EA    ; $2059
                lda FillPrefix,y    ; $205B
                beq $2067    ; $205E
                jsr BuffInsert    ; $2060
                inc $EA    ; $2063
                bne $2059    ; $2065
                lda $61    ; $2067
                pha    ; $2069
                lda TheBuffer    ; $206A
                pha    ; $206C
                lda $F0    ; $206D
                sec    ; $206F
                adc GapBot    ; $2070
                sta TheBuffer    ; $2072
                lda $F1    ; $2074
                adc $6D    ; $2076
                sta $61    ; $2078
                jsr SetGap    ; $207A
                jsr $20F6    ; $207D
                pla    ; $2080
                sta TheBuffer    ; $2081
                pla    ; $2083
                sta $61    ; $2084
                jmp $1FB2    ; $2086
;
; === CleanBegLine ===
                jsr BegOfLine    ; $2089
                lda $61    ; $208C
                cmp $6B    ; $208E
                bcc $20A4    ; $2090
                bne $209C    ; $2092
                lda TheBuffer    ; $2094
                cmp GapTop    ; $2096
                beq $20A4    ; $2098
                bcc $20A4    ; $209A
                lda GapTop    ; $209C
                sta TheBuffer    ; $209E
                lda $6B    ; $20A0
                sta $61    ; $20A2
                rts    ; $20A4
;
; === FillPrefix ===
                brk    ; $20A5
                brk    ; $20A6
                brk    ; $20A7
                brk    ; $20A8
                brk    ; $20A9
                brk    ; $20AA
                brk    ; $20AB
;
; === SetFillPrefix ===
                jsr SetGap    ; $20AC
                jsr $20F6    ; $20AF
                jsr CleanBegLine    ; $20B2
                ldx #$00    ; $20B5
                jsr $2108    ; $20B7
                beq $20CD    ; $20BA
                jsr $D01B    ; $20BC
                sta FillPrefix,x    ; $20BF
                inc TheBuffer    ; $20C2
                bne $20C8    ; $20C4
                inc $61    ; $20C6
                inx    ; $20C8
                cpx #$06    ; $20C9
                bcc $20B7    ; $20CB
                lda #$00    ; $20CD
                sta FillPrefix,x    ; $20CF
                jsr NewEchoArea    ; $20D2
                jsr PrintMessage    ; $20D5
                ldx $A0BD    ; $20D8
                ldx #$00    ; $20DB
                lda FillPrefix,y    ; $20DD
                beq $20E8    ; $20E0
                jsr CharOut    ; $20E2
                iny    ; $20E5
                bne $20DD    ; $20E6
                lda #$A2    ; $20E8
                jsr CharOut    ; $20EA
                jsr CloseEchoArea    ; $20ED
                jsr $20FF    ; $20F0
                lda #$01    ; $20F3
                rts    ; $20F5
                lda TheBuffer    ; $20F6
                sta $EC    ; $20F8
                lda $61    ; $20FA
                sta $ED    ; $20FC
                rts    ; $20FE
                lda $EC    ; $20FF
                sta TheBuffer    ; $2101
                lda $ED    ; $2103
                sta $61    ; $2105
                rts    ; $2107
                lda TheBuffer    ; $2108
                cmp $EC    ; $210A
                bne $2112    ; $210C
                lda $61    ; $210E
                cmp $ED    ; $2110
                rts    ; $2112
;
; === WhatSpace ===
                ldx #$00    ; $2113
                stx $2181    ; $2115
                stx $2180    ; $2118
                ldx $2181    ; $211B
                lda BuffActList,x    ; $211E
                beq $212D    ; $2121
                jsr MySize    ; $2123
                clc    ; $2126
                adc $2180    ; $2127
                sta $2180    ; $212A
                inc $2181    ; $212D
                lda $2181    ; $2130
                cmp #$0E    ; $2133
                bcc $211B    ; $2135
                jsr NewEchoArea    ; $2137
                lda #$BF    ; $213A
                sec    ; $213C
                sbc #$08    ; $213D
                sbc $2180    ; $213F
                lsr    ; $2142
                tax    ; $2143
                jsr ZeroJustify    ; $2144
                jsr PrintPages    ; $2147
                jsr PrintMessage    ; $214A
                sbc ($F6,x)    ; $214D
                sbc ($E9,x)    ; $214F
                cpx $E2E1    ; $2151
                cpx $ACE5    ; $2154
                ldy #$00    ; $2157
                ldx SelectedBuff    ; $2159
                jsr MySize    ; $215C
                lsr    ; $215F
                tax    ; $2160
                lda #$00    ; $2161
                jsr PrintDec    ; $2163
                jsr PrintMessage    ; $2166
                ldy #$E9    ; $2169
                inc $E3A0    ; $216B
                sbc $F2,x    ; $216E
                sbc ($E5)    ; $2170
                inc $AEF4    ; $2172
                sta $2000    ; $2175
                sbc ($73)    ; $2178
                jsr CloseEchoArea    ; $217A
                lda #$01    ; $217D
                rts    ; $217F
                brk    ; $2180
                brk    ; $2181
;
; === Bottom? ===
                lda $00    ; $2182
                cmp BuffBot    ; $2184
                bne $218C    ; $2186
                lda $01    ; $2188
                cmp $69    ; $218A
                rts    ; $218C
;
; === Top? ===
                lda $00    ; $218D
                cmp BuffTop    ; $218F
                bne $2197    ; $2191
                lda $01    ; $2193
                cmp $67    ; $2195
                rts    ; $2197
;
; === LabelChars ===
                tay    ; $2198
        dfb $DB        ; $2199  (data/65C02-bit)
                brk    ; $219A
                brk    ; $219B
                brk    ; $219C
;
; === AlphaLabel ===
                brk    ; $219D
;
; === LabelChar? ===
                sta $21CE    ; $219E
                ldx #$00    ; $21A1
                lda LabelChars,x    ; $21A3
                beq $21B0    ; $21A6
                cmp $21CE    ; $21A8
                beq $21C8    ; $21AB
                inx    ; $21AD
                bne $21A3    ; $21AE
                bit AlphaLabel    ; $21B0
                bmi $21CB    ; $21B3
                lda $21CE    ; $21B5
                cmp #$C1    ; $21B8
                bcc $21CB    ; $21BA
                cmp #$FB    ; $21BC
                bcs $21CB    ; $21BE
                cmp #$E1    ; $21C0
                bcs $21C8    ; $21C2
                cmp #$DB    ; $21C4
                bcs $21CB    ; $21C6
                ldx #$00    ; $21C8
                rts    ; $21CA
                ldx #$FF    ; $21CB
                rts    ; $21CD
                brk    ; $21CE
;
; === DownPara ===
                jsr GetArgSign    ; $21CF
                bmi UpPara    ; $21D2
                jsr SetGap    ; $21D4
                lda GapBot    ; $21D7
                sta $00    ; $21D9
                lda $6D    ; $21DB
                sta $01    ; $21DD
                ldy #$00    ; $21DF
                jsr ZeroArg?    ; $21E1
                bne $21F4    ; $21E4
                lda $00    ; $21E6
                sta TheBuffer    ; $21E8
                lda $01    ; $21EA
                sta $61    ; $21EC
                jsr SetGap    ; $21EE
                lda #$01    ; $21F1
                rts    ; $21F3
                inc $00    ; $21F4
                bne $21FA    ; $21F6
                inc $01    ; $21F8
                jsr Bottom?    ; $21FA
                beq $21E6    ; $21FD
                jsr $D000    ; $21FF
                jsr WhiteSpace?    ; $2202
                beq $21F4    ; $2205
                inc $00    ; $2207
                bne $220D    ; $2209
                inc $01    ; $220B
                jsr Bottom?    ; $220D
                beq $21E6    ; $2210
                jsr $D000    ; $2212
                cmp #$8D    ; $2215
                bne $2207    ; $2217
                inc $00    ; $2219
                bne $221F    ; $221B
                inc $01    ; $221D
                jsr Bottom?    ; $221F
                beq $21E6    ; $2222
                jsr $D000    ; $2224
                cmp #$8D    ; $2227
                bne $2207    ; $2229
                lda Argument    ; $222B
                bne $2233    ; $222E
                dec $7A5C    ; $2230
                dec Argument    ; $2233
                jmp $21E1    ; $2236
;
; === UpPara ===
                jsr GetArgSign    ; $2239
                bmi DownPara    ; $223C
                jsr SetGap    ; $223E
                lda TheBuffer    ; $2241
                sta $00    ; $2243
                lda $61    ; $2245
                sta $01    ; $2247
                ldy #$00    ; $2249
                jsr ZeroArg?    ; $224B
                bne $225E    ; $224E
                lda $00    ; $2250
                sta TheBuffer    ; $2252
                lda $01    ; $2254
                sta $61    ; $2256
                jsr SetGap    ; $2258
                lda #$01    ; $225B
                rts    ; $225D
                jsr Top?    ; $225E
                beq $2250    ; $2261
                jsr $D000    ; $2263
                jsr WhiteSpace?    ; $2266
                bne $2276    ; $2269
                lda $00    ; $226B
                bne $2271    ; $226D
                dec $01    ; $226F
                dec $00    ; $2271
                jmp $225E    ; $2273
                jsr Top?    ; $2276
                beq $2250    ; $2279
                jsr $D000    ; $227B
                cmp #$8D    ; $227E
                bne $2296    ; $2280
                lda $00    ; $2282
                bne $2288    ; $2284
                dec $01    ; $2286
                dec $00    ; $2288
                jsr Top?    ; $228A
                beq $2250    ; $228D
                jsr $D000    ; $228F
                cmp #$8D    ; $2292
                beq $22A1    ; $2294
                lda $00    ; $2296
                bne $229C    ; $2298
                dec $01    ; $229A
                dec $00    ; $229C
                jmp $2276    ; $229E
                inc $00    ; $22A1
                bne $22A7    ; $22A3
                inc $01    ; $22A5
                lda Argument    ; $22A7
                bne $22AF    ; $22AA
                dec $7A5C    ; $22AC
                dec Argument    ; $22AF
                jmp $224B    ; $22B2
;
; === MarkPara ===
                jsr InitArgument    ; $22B5
                jsr DownPara    ; $22B8
                jsr SetGap    ; $22BB
                jsr PushMark    ; $22BE
                jsr InitArgument    ; $22C1
                jmp UpPara    ; $22C4
;
; === FillPara ===
                lda $7A5C    ; $22C7
                pha    ; $22CA
                lda Argument    ; $22CB
                pha    ; $22CE
                jsr MarkPara    ; $22CF
                pla    ; $22D2
                sta Argument    ; $22D3
                pla    ; $22D6
                sta $7A5C    ; $22D7
                jmp FillRegion    ; $22DA
;
; === NextLabel ===
                jsr GetArgSign    ; $22DD
                bmi PrevLabel    ; $22E0
                jsr SetGap    ; $22E2
                lda GapBot    ; $22E5
                sta $00    ; $22E7
                lda $6D    ; $22E9
                sta $01    ; $22EB
                ldy #$00    ; $22ED
                jsr ZeroArg?    ; $22EF
                bne $2302    ; $22F2
                lda $00    ; $22F4
                sta TheBuffer    ; $22F6
                lda $01    ; $22F8
                sta $61    ; $22FA
                jsr SetGap    ; $22FC
                lda #$01    ; $22FF
                rts    ; $2301
                inc $00    ; $2302
                bne $2308    ; $2304
                inc $01    ; $2306
                jsr Bottom?    ; $2308
                beq $22F4    ; $230B
                jsr $D000    ; $230D
                cmp #$8D    ; $2310
                bne $2302    ; $2312
                inc $00    ; $2314
                bne $231A    ; $2316
                inc $01    ; $2318
                jsr Bottom?    ; $231A
                beq $22F4    ; $231D
                jsr $D000    ; $231F
                cmp #$8D    ; $2322
                beq $2314    ; $2324
                jsr LabelChar?    ; $2326
                bne $2302    ; $2329
                inc $00    ; $232B
                bne $2331    ; $232D
                inc $01    ; $232F
                jsr Bottom?    ; $2331
                beq $22F4    ; $2334
                jsr $D000    ; $2336
                jsr WhiteSpace?    ; $2339
                bne $232B    ; $233C
                lda Argument    ; $233E
                bne $2346    ; $2341
                dec $7A5C    ; $2343
                dec Argument    ; $2346
                jmp $22EF    ; $2349
;
; === PrevLabel ===
                jsr GetArgSign    ; $234C
                bmi NextLabel    ; $234F
                jsr SetGap    ; $2351
                lda $61    ; $2354
                pha    ; $2356
                lda TheBuffer    ; $2357
                pha    ; $2359
                jsr EndOfLine    ; $235A
                jsr SetGap    ; $235D
                lda TheBuffer    ; $2360
                sta $00    ; $2362
                lda $61    ; $2364
                sta $01    ; $2366
                pla    ; $2368
                sta $00    ; $2369
                sta $2428    ; $236B
                pla    ; $236E
                sta $01    ; $236F
                sta $2429    ; $2371
                ldy #$00    ; $2374
                jsr ZeroArg?    ; $2376
                bne $2389    ; $2379
                lda $00    ; $237B
                sta TheBuffer    ; $237D
                lda $01    ; $237F
                sta $61    ; $2381
                jsr SetGap    ; $2383
                lda #$01    ; $2386
                rts    ; $2388
                bit $23EF    ; $2389
                bmi $23A2    ; $238C
                jsr Top?    ; $238E
                beq $237B    ; $2391
                lda $00    ; $2393
                bne $2399    ; $2395
                dec $01    ; $2397
                dec $00    ; $2399
                jsr $D000    ; $239B
                cmp #$8D    ; $239E
                bne $238E    ; $23A0
                jsr Top?    ; $23A2
                beq $237B    ; $23A5
                lda $00    ; $23A7
                bne $23AD    ; $23A9
                dec $01    ; $23AB
                dec $00    ; $23AD
                jsr $D000    ; $23AF
                cmp #$8D    ; $23B2
                bne $23A2    ; $23B4
                inc $00    ; $23B6
                bne $23BC    ; $23B8
                inc $01    ; $23BA
                jsr $D000    ; $23BC
                jsr LabelChar?    ; $23BF
                bne $238E    ; $23C2
                lda $00    ; $23C4
                sta $2428    ; $23C6
                lda $01    ; $23C9
                sta $2429    ; $23CB
                bit $23EF    ; $23CE
                bmi $237B    ; $23D1
                inc $00    ; $23D3
                bne $23D9    ; $23D5
                inc $01    ; $23D7
                jsr $D000    ; $23D9
                jsr WhiteSpace?    ; $23DC
                bne $23D3    ; $23DF
                lda Argument    ; $23E1
                bne $23E9    ; $23E4
                dec $7A5C    ; $23E6
                dec Argument    ; $23E9
                jmp $2376    ; $23EC
                brk    ; $23EF
;
; === RepoWind ===
                jsr SetGap    ; $23F0
                jsr InitArgument    ; $23F3
                jsr PushMark    ; $23F6
                dec $23EF    ; $23F9
                jsr PrevLabel    ; $23FC
                inc $23EF    ; $23FF
                lda $2428    ; $2402
                sta PageTop    ; $2405
                lda $2429    ; $2407
                sta $63    ; $240A
                jsr SwapPointMark    ; $240C
                jsr SetGap    ; $240F
                jsr FindPoint    ; $2412
                beq $2422    ; $2415
                lda WindowBot    ; $2417
                sec    ; $2419
                sbc #$01    ; $241A
                sta CenterPoint    ; $241C
                jmp CenterPage1    ; $241F
                jsr DisplayPage    ; $2422
                lda #$01    ; $2425
                rts    ; $2427
                brk    ; $2428
                brk    ; $2429
                brk    ; $242A
;
; === XorASCII ===
                dec $242A    ; $242B
                bmi ASCIIBuff    ; $242E
;
; === ASCIIBuff1 ===
                lda ArgSign    ; $2430
                eor #$FF    ; $2433
                sta ArgSign    ; $2435
;
; === ASCIIBuff ===
                lda BuffTop    ; $2438
                sta $00    ; $243A
                lda $67    ; $243C
                sta $01    ; $243E
                ldy #$00    ; $2440
                lda $01    ; $2442
                cmp $6B    ; $2444
                bcc $2482    ; $2446
                bne $2460    ; $2448
                lda $00    ; $244A
                cmp GapTop    ; $244C
                bcc $2482    ; $244E
                bne $2460    ; $2450
                lda GapBot    ; $2452
                sta $00    ; $2454
                lda $6D    ; $2456
                sta $01    ; $2458
                inc $00    ; $245A
                bne $2460    ; $245C
                inc $01    ; $245E
                lda $00    ; $2460
                cmp BuffBot    ; $2462
                bne $2482    ; $2464
                lda $01    ; $2466
                cmp $69    ; $2468
                bne $2482    ; $246A
                lda #$00    ; $246C
                sta $242A    ; $246E
                jsr SetModified    ; $2471
                jsr FindPoint    ; $2474
                beq $247C    ; $2477
                lda #$06    ; $2479
                rts    ; $247B
                jsr DisplayPage    ; $247C
                lda #$01    ; $247F
                rts    ; $2481
                jsr $D000    ; $2482
                bit $242A    ; $2485
                bpl $248F    ; $2488
                eor #$80    ; $248A
                jmp $249A    ; $248C
                bit ArgSign    ; $248F
                bmi $2498    ; $2492
                ora #$80    ; $2494
                bmi $249A    ; $2496
                and #$7F    ; $2498
                jsr $D054    ; $249A
                inc $00    ; $249D
                bne $24A3    ; $249F
                inc $01    ; $24A1
                bne $2442    ; $24A3
;
; === IndentVbtm ===
        dfb $FF        ; $24A5  (data/65C02-bit)
;
; === IndentLine ===
                sta $2522    ; $24A6
                jsr SetGap    ; $24A9
                jsr LinesPastPnt    ; $24AC
                sta $2524    ; $24AF
                jsr BegOfLine    ; $24B2
                jsr DeleteSpace    ; $24B5
                lda #$00    ; $24B8
                sta $2523    ; $24BA
                ldy #$01    ; $24BD
                jsr $D03F    ; $24BF
                cmp #$8D    ; $24C2
                bne $24CB    ; $24C4
                bit IndentVbtm    ; $24C6
                bpl $2507    ; $24C9
                lda $2523    ; $24CB
                jsr TabBump    ; $24CE
                sta $2525    ; $24D1
                cmp $2522    ; $24D4
                bcc $24EC    ; $24D7
                beq $24EC    ; $24D9
                lda $2522    ; $24DB
                sec    ; $24DE
                sbc $2523    ; $24DF
                beq $2507    ; $24E2
                bmi $2507    ; $24E4
                lda #$01    ; $24E6
                ldx #$A0    ; $24E8
                bne $24FA    ; $24EA
                lda $2525    ; $24EC
                sec    ; $24EF
                sbc $2523    ; $24F0
                bit TabsIndent    ; $24F3
                bpl $24E6    ; $24F6
                ldx #$89    ; $24F8
                clc    ; $24FA
                adc $2523    ; $24FB
                sta $2523    ; $24FE
                txa    ; $2501
                jsr BuffInsert    ; $2502
                beq $24CB    ; $2505
                jsr FindPoint    ; $2507
                beq $250F    ; $250A
                lda #$06    ; $250C
                rts    ; $250E
                jsr DisplayLine    ; $250F
                jsr LinesPastPnt    ; $2512
                tax    ; $2515
                lda #$00    ; $2516
                cpx $2524    ; $2518
                beq $251F    ; $251B
                lda #$02    ; $251D
                rts    ; $251F
                brk    ; $2520
                brk    ; $2521
                brk    ; $2522
                brk    ; $2523
                brk    ; $2524
                brk    ; $2525
;
; === BackToIndent ===
                jsr BegOfLine    ; $2526
                ldy #$00    ; $2529
                sty CH    ; $252B
                jsr $D01B    ; $252D
                cmp #$89    ; $2530
                beq $2538    ; $2532
                cmp #$A0    ; $2534
                bne $2543    ; $2536
                jsr GetXCharLen    ; $2538
                jsr BumpXPos    ; $253B
                jsr PointForward    ; $253E
                beq $252D    ; $2541
                ldy CH    ; $2543
                lda #$01    ; $2545
                rts    ; $2547
;
; === PrevIndent ===
                jsr GetPrevIndent    ; $2548
                jsr IndentLine    ; $254B
                rts    ; $254E
;
; === GetPrevIndent ===
                lda CV    ; $254F
                pha    ; $2551
                lda CH    ; $2552
                pha    ; $2554
                lda $61    ; $2555
                pha    ; $2557
                lda TheBuffer    ; $2558
                pha    ; $255A
                jsr BegOfLine    ; $255B
                jsr PointBackward    ; $255E
                jsr BackToIndent    ; $2561
                pla    ; $2564
                sta TheBuffer    ; $2565
                pla    ; $2567
                sta $61    ; $2568
                pla    ; $256A
                sta CH    ; $256B
                pla    ; $256D
                sta CV    ; $256E
                tya    ; $2570
                rts    ; $2571
;
; === OutdentCRLF ===
                jsr CRLF    ; $2572
                jsr GenDisplay    ; $2575
;
; === OutdentLine ===
                lda #$00    ; $2578
                sta $2600    ; $257A
                lda CV    ; $257D
                pha    ; $257F
                lda CH    ; $2580
                pha    ; $2582
                lda $61    ; $2583
                pha    ; $2585
                lda TheBuffer    ; $2586
                pha    ; $2588
                jsr BegOfLine    ; $2589
                jsr PointBackward    ; $258C
                lda TheBuffer    ; $258F
                sta $2601    ; $2591
                lda $61    ; $2594
                sta $2602    ; $2596
                jsr BackToIndent    ; $2599
                tya    ; $259C
                sta $2603    ; $259D
                bne $25BA    ; $25A0
                jsr $D01B    ; $25A2
                cmp #$8D    ; $25A5
                bne $25ED    ; $25A7
                lda $2601    ; $25A9
                cmp BuffTop    ; $25AC
                bne $2589    ; $25AE
                lda $2602    ; $25B0
                cmp $67    ; $25B3
                bne $2589    ; $25B5
                jmp $25ED    ; $25B7
                lda $2601    ; $25BA
                cmp BuffTop    ; $25BD
                bne $25C8    ; $25BF
                lda $2602    ; $25C1
                cmp $67    ; $25C4
                beq $25ED    ; $25C6
                jsr BegOfLine    ; $25C8
                jsr PointBackward    ; $25CB
                lda TheBuffer    ; $25CE
                sta $2601    ; $25D0
                lda $61    ; $25D3
                sta $2602    ; $25D5
                jsr BackToIndent    ; $25D8
                tya    ; $25DB
                bne $25E5    ; $25DC
                jsr $D01B    ; $25DE
                cmp #$8D    ; $25E1
                beq $25BA    ; $25E3
                cpy $2603    ; $25E5
                bcs $25BA    ; $25E8
                sty $2600    ; $25EA
                pla    ; $25ED
                sta TheBuffer    ; $25EE
                pla    ; $25F0
                sta $61    ; $25F1
                pla    ; $25F3
                sta CH    ; $25F4
                pla    ; $25F6
                sta CV    ; $25F7
                lda $2600    ; $25F9
                jsr IndentLine    ; $25FC
                rts    ; $25FF
                brk    ; $2600
                brk    ; $2601
                brk    ; $2602
                brk    ; $2603
;
; === AltmodeChar ===
                ldy $00    ; $2604
;
; === CoutDef ===
                trb $26    ; $2606
;
; === CharOutXY ===
                stx CH    ; $2608
                sty CV    ; $260A
                pha    ; $260C
                jsr vtab    ; $260D
                pla    ; $2610
;
; === CharOut ===
                jmp (CoutDef)    ; $2611
;
; === SI:CharOut ===
                sty $2677    ; $2614
                stx $2676    ; $2617
                sta $2675    ; $261A
                php    ; $261D
                pla    ; $261E
                sta $2678    ; $261F
                lda $2675    ; $2622
                cmp #$A0    ; $2625
                bcs $2656    ; $2627
                cmp #$9B    ; $2629
                bne $2632    ; $262B
                lda AltmodeChar    ; $262D
                bne $2656    ; $2630
                cmp #$8D    ; $2632
                bne $263C    ; $2634
                jsr PrintCR    ; $2636
                jmp $2666    ; $2639
                cmp #$89    ; $263C
                bne $2646    ; $263E
                jsr PrintTab    ; $2640
                jmp $2666    ; $2643
                lda #$DE    ; $2646
                jsr $2656    ; $2648
                ora #$80    ; $264B
                cmp #$E1    ; $264D
                bcc $2654    ; $264F
                sbc #$20    ; $2651
                clc    ; $2653
                adc #$40    ; $2654
                ldy CH    ; $2656
                jsr StoreChar    ; $2658
                inc CH    ; $265B
                lda CH    ; $265D
                cmp WindowRgt    ; $265F
                bcc $2666    ; $2661
                jsr PrintCR1    ; $2663
                lda $2678    ; $2666
                pha    ; $2669
                ldx $2676    ; $266A
                ldy $2677    ; $266D
                lda $2675    ; $2670
                plp    ; $2673
                rts    ; $2674
                brk    ; $2675
                brk    ; $2676
                brk    ; $2677
                brk    ; $2678
;
; === PrintCR ===
                jsr ClearEOL    ; $2679
;
; === PrintCR1 ===
                lda WindowLft    ; $267C
                sta CH    ; $267E
                inc CV    ; $2680
                lda CV    ; $2682
                cmp WindowBot    ; $2684
                bcc $268C    ; $2686
                lda WindowTop    ; $2688
                sta CV    ; $268A
                jsr vtab1    ; $268C
                rts    ; $268F
;
; === UseTabTable? ===
        dfb $FF        ; $2690  (data/65C02-bit)
;
; === TabBump ===
                bit UseTabTable?    ; $2691
                bmi $269C    ; $2694
                clc    ; $2696
                adc #$08    ; $2697
                and #$F8    ; $2699
                rts    ; $269B
                sty $B8    ; $269C
                stx $B9    ; $269E
                sta $BA    ; $26A0
                inc $BA    ; $26A2
                lda #$00    ; $26A4
                tax    ; $26A6
                tay    ; $26A7
                dey    ; $26A8
                sec    ; $26A9
                ror    ; $26AA
                bcc $26B0    ; $26AB
                inx    ; $26AD
                bcs $26AA    ; $26AE
                pha    ; $26B0
                iny    ; $26B1
                and TabTable,x    ; $26B2
                bne $26BA    ; $26B5
                cpy WindowRgt    ; $26B7
                bit $BAC4    ; $26B9
                pla    ; $26BC
                bcc $26AA    ; $26BD
                tya    ; $26BF
                ldx $B9    ; $26C0
                ldy $B8    ; $26C2
                rts    ; $26C4
;
; === TabTable ===
                brk    ; $26C5
                bra $2648    ; $26C6
                bra $264A    ; $26C8
                bra $264C    ; $26CA
                bra $264E    ; $26CC
                bra $2675    ; $26CE
                bit WindowLft    ; $26D0
                sta ($26),y    ; $26D2
                cmp WindowRgt    ; $26D4
                bcc $26DA    ; $26D6
                lda WindowLft    ; $26D8
                cmp CH    ; $26DA
                beq $26E8    ; $26DC
                pha    ; $26DE
                lda #$A0    ; $26DF
                jsr CharOut    ; $26E1
                pla    ; $26E4
                jmp $26DA    ; $26E5
                rts    ; $26E8
;
; === vtab ===
                lda CV    ; $26E9
;
; === vtab1 ===
                pha    ; $26EB
                lsr    ; $26EC
                and #$03    ; $26ED
                ora #$04    ; $26EF
                sta BASH    ; $26F1
                pla    ; $26F3
                and #$18    ; $26F4
                bcc $26FA    ; $26F6
                adc #$7F    ; $26F8
                sta BASL    ; $26FA
                asl    ; $26FC
                asl    ; $26FD
                ora BASL    ; $26FE
                sta BASL    ; $2700
                rts    ; $2702
;
; === StoreChar ===
                sty scrny    ; $2703
                pha    ; $2705
                tya    ; $2706
                lsr    ; $2707
                tay    ; $2708
                pla    ; $2709
                sta Page2    ; $270A   <== BANK: display page 2 / aux (PAGE2 on)
                bcc $2712    ; $270D
                sta Page1    ; $270F   <== BANK: display page 1 / main (PAGE2 off)
                sta (BASL),y    ; $2712
                sta Page1    ; $2714   <== BANK: display page 1 / main (PAGE2 off)
                ldy scrny    ; $2717
                rts    ; $2719
;
; === PickChar ===
                sty scrny    ; $271A
                tya    ; $271C
                lsr    ; $271D
                tay    ; $271E
                sta Page2    ; $271F   <== BANK: display page 2 / aux (PAGE2 on)
                bcc $2727    ; $2722
                sta Page1    ; $2724   <== BANK: display page 1 / main (PAGE2 off)
                lda (BASL),y    ; $2727
                ldy scrny    ; $2729
                sta Page1    ; $272B   <== BANK: display page 1 / main (PAGE2 off)
                rts    ; $272E
;
; === KeyDownp ===
                lda HardKey    ; $272F
                bpl $2737    ; $2732
                lda #$00    ; $2734
                rts    ; $2736
                lda #$FF    ; $2737
                rts    ; $2739
;
; === KeyAvail? ===
                jsr AnyTYI?    ; $273A
                beq $274F    ; $273D
                bit MacroExec    ; $273F
                bpl $274C    ; $2742
                jsr KeyFromMac    ; $2744
                jsr AnyTYI?    ; $2747
                beq $274F    ; $274A
                jsr KeyDownp    ; $274C
                rts    ; $274F
;
; === GetKey ===
                jsr GatherTYI    ; $2750
                jsr PopTYI    ; $2753
                jsr KeyToMac    ; $2756
                rts    ; $2759
;
; === KeyClickp ===
                brk    ; $275A
;
; === KeyClickVol ===
        dfb $03        ; $275B  (data/65C02-bit)
;
; === IIgsMode? ===
                brk    ; $275C
;
; === KeyModState ===
                brk    ; $275D
;
; === GetKeyPress ===
                jsr KeyDownp    ; $275E
                bne GetKeyPress    ; $2761
                lda HardMeta    ; $2763
                ora HardHyper    ; $2766
                and #$80    ; $2769
                eor HardKey    ; $276B
                pha    ; $276E
                lda HardModState    ; $276F
                sta KeyModState    ; $2772
                pla    ; $2775
                sta HardKeyReset    ; $2776
                bmi $2785    ; $2779
                cmp #$61    ; $277B
                bcc $2785    ; $277D
                cmp #$7B    ; $277F
                bcs $2785    ; $2781
                sbc #$1F    ; $2783
                bit IIgsMode?    ; $2785
                bpl $2799    ; $2788
                sta UseAuxZP    ; $278A   <== BANK: aux zero-page/stack (ALTZP on)
                jsr GetBank1    ; $278D
                jsr CheckArrowKey    ; $2790
                sta UseMainZP    ; $2793   <== BANK: main zero-page/stack (ALTZP off)
                jsr GetBank2    ; $2796
                bit KeyClickp    ; $2799
                bpl $27A6    ; $279C
                pha    ; $279E
                lda KeyClickVol    ; $279F
                jsr Click    ; $27A2
                pla    ; $27A5
                rts    ; $27A6
;
; === TYIBuff ===
                brk    ; $27A7
                brk    ; $27A8
                brk    ; $27A9
                brk    ; $27AA
                brk    ; $27AB
                brk    ; $27AC
                brk    ; $27AD
                brk    ; $27AE
                brk    ; $27AF
                brk    ; $27B0
                brk    ; $27B1
                brk    ; $27B2
                brk    ; $27B3
                brk    ; $27B4
                brk    ; $27B5
                brk    ; $27B6
                brk    ; $27B7
                brk    ; $27B8
                brk    ; $27B9
                brk    ; $27BA
                brk    ; $27BB
                brk    ; $27BC
                brk    ; $27BD
                brk    ; $27BE
                brk    ; $27BF
                brk    ; $27C0
                brk    ; $27C1
                brk    ; $27C2
                brk    ; $27C3
                brk    ; $27C4
                brk    ; $27C5
                brk    ; $27C6
                brk    ; $27C7
                brk    ; $27C8
                brk    ; $27C9
                brk    ; $27CA
                brk    ; $27CB
                brk    ; $27CC
                brk    ; $27CD
                brk    ; $27CE
                brk    ; $27CF
                brk    ; $27D0
                brk    ; $27D1
                brk    ; $27D2
                brk    ; $27D3
                brk    ; $27D4
                brk    ; $27D5
                brk    ; $27D6
                brk    ; $27D7
                brk    ; $27D8
                brk    ; $27D9
                brk    ; $27DA
                brk    ; $27DB
                brk    ; $27DC
                brk    ; $27DD
                brk    ; $27DE
                brk    ; $27DF
                brk    ; $27E0
                brk    ; $27E1
                brk    ; $27E2
                brk    ; $27E3
                brk    ; $27E4
                brk    ; $27E5
                brk    ; $27E6
;
; === TYI_PopIndex ===
                brk    ; $27E7
;
; === TYI_PushIndex ===
                brk    ; $27E8
                brk    ; $27E9
;
; === KillTYI ===
                lda TYI_PopIndex    ; $27EA
                sta TYI_PushIndex    ; $27ED
                rts    ; $27F0
;
; === AnyTYI? ===
                lda TYI_PopIndex    ; $27F1
                cmp TYI_PushIndex    ; $27F4
                beq $27FC    ; $27F7
                lda #$00    ; $27F9
                rts    ; $27FB
                lda #$FF    ; $27FC
                rts    ; $27FE
;
; === UnTYI ===
                dec TYI_PopIndex    ; $27FF
                lda TYI_PopIndex    ; $2802
                and #$3F    ; $2805
                sta TYI_PopIndex    ; $2807
                rts    ; $280A
;
; === PushTYI ===
                stx $27E9    ; $280B
                ldx TYI_PushIndex    ; $280E
                sta TYIBuff,x    ; $2811
                inx    ; $2814
                txa    ; $2815
                and #$3F    ; $2816
                cmp TYI_PopIndex    ; $2818
                beq $2820    ; $281B
                sta TYI_PushIndex    ; $281D
                ldx $27E9    ; $2820
                rts    ; $2823
;
; === PopTYI   (also TYI) ===
                jsr AnyTYI?    ; $2824
                bne $2842    ; $2827
                stx $27E9    ; $2829
                ldx TYI_PopIndex    ; $282C
                lda TYIBuff,x    ; $282F
                pha    ; $2832
                inx    ; $2833
                txa    ; $2834
                and #$3F    ; $2835
                sta TYI_PopIndex    ; $2837
                pla    ; $283A
                ldx #$00    ; $283B
                php    ; $283D
                ldx $27E9    ; $283E
                plp    ; $2841
                rts    ; $2842
;
; === GatherTYI ===
                jsr KeyDownp    ; $2843
                bne $2861    ; $2846
                jsr GetKeyPress    ; $2848
                cmp #$87    ; $284B
                bne $2856    ; $284D
                jsr KillTYI    ; $284F
                lda #$87    ; $2852
                bne $285C    ; $2854
                bit MacroExec    ; $2856
                bpl $285C    ; $2859
                rts    ; $285B
                jsr PushTYI    ; $285C
                lda #$00    ; $285F
                rts    ; $2861
;
; === ClearEOL ===
                lda #$A0    ; $2862
;
; === ClearEOL1 ===
                ldy CH    ; $2864
                cpy WindowRgt    ; $2866
                bcs $2870    ; $2868
                jsr StoreChar    ; $286A
                iny    ; $286D
                bne $2866    ; $286E
                rts    ; $2870
;
; === ClearPage ===
                jsr Home    ; $2871
;
; === ClearEOP ===
                lda #$A0    ; $2874
;
; === ClearEOP1 ===
                sta $289D    ; $2876
                lda CV    ; $2879
                pha    ; $287B
                lda CH    ; $287C
                pha    ; $287E
                lda $289D    ; $287F
                jsr ClearEOL1    ; $2882
                lda #$00    ; $2885
                sta CH    ; $2887
                inc CV    ; $2889
                jsr vtab    ; $288B
                lda CV    ; $288E
                cmp WindowBot    ; $2890
                bcc $287F    ; $2892
                pla    ; $2894
                sta CH    ; $2895
                pla    ; $2897
                sta CV    ; $2898
                jmp vtab    ; $289A
                brk    ; $289D
;
; === Home ===
                lda WindowTop    ; $289E
                sta CV    ; $28A0
                lda WindowLft    ; $28A2
                sta CH    ; $28A4
                jmp vtab    ; $28A6
;
; === ResetTTY ===
                jsr $C300    ; $28A9
                lda #$14    ; $28AC
                sta CoutDef    ; $28AE
                lda #$26    ; $28B1
                sta $2607    ; $28B3
                rts    ; $28B6
;
; === Cursor2 ===
                brk    ; $28B7
                brk    ; $28B8
;
; === BlinkTime ===
                brk    ; $28B9
                brk    ; $28BA
;
; === TimedBlink ===
                lda CV    ; $28BB
                pha    ; $28BD
                lda CH    ; $28BE
                pha    ; $28C0
                lda Cursor2    ; $28C1
                sta CH    ; $28C4
                lda $28B8    ; $28C6
                sta CV    ; $28C9
                jsr vtab    ; $28CB
                lda BlinkRate    ; $28CE
                beq $28D8    ; $28D1
                sec    ; $28D3
                sbc #$16    ; $28D4
                bne $28DA    ; $28D6
                lda #$58    ; $28D8
                sta BlinkRate    ; $28DA
                lda BlinkTime    ; $28DD
                ora $28BA    ; $28E0
                beq $28FB    ; $28E3
                jsr KeyAvail?    ; $28E5
                beq $290E    ; $28E8
                lda BlinkTime    ; $28EA
                bne $28F2    ; $28ED
                dec $28BA    ; $28EF
                dec BlinkTime    ; $28F2
                jsr BlinkOnce    ; $28F5
                jmp $28DD    ; $28F8
                pla    ; $28FB
                sta CH    ; $28FC
                pla    ; $28FE
                sta CV    ; $28FF
                jsr vtab    ; $2901
                lda BlinkRate    ; $2904
                clc    ; $2907
                adc #$16    ; $2908
                sta BlinkRate    ; $290A
                rts    ; $290D
                pla    ; $290E
                sta CH    ; $290F
                pla    ; $2911
                sta CV    ; $2912
                jsr vtab    ; $2914
                lda BlinkRate    ; $2917
                clc    ; $291A
                adc #$16    ; $291B
                sta BlinkRate    ; $291D
                lda #$00    ; $2920
                sta BlinkTime    ; $2922
                sta $28BA    ; $2925
                php    ; $2928
                jsr GetKey    ; $2929
                plp    ; $292C
                rts    ; $292D
;
; === BlinkCursor ===
                jsr KeyAvail?    ; $292E
                beq $2939    ; $2931
                jsr BlinkOnce    ; $2933
                jmp BlinkCursor    ; $2936
                jmp GetKey    ; $2939
;
; === AltBlink ===
                jsr TimedBlink    ; $293C
                beq $2944    ; $293F
                jmp BlinkCursor    ; $2941
                rts    ; $2944
;
; === BlinkRate ===
                cli    ; $2945
;
; === BlinkOnce ===
                jsr $29DA    ; $2946
                jsr $29FF    ; $2949
                jsr CursorOff    ; $294C
                lda BlinkRate    ; $294F
                pha    ; $2952
                pha    ; $2953
                jsr KeyAvail?    ; $2954
                beq $2984    ; $2957
                pla    ; $2959
                sec    ; $295A
                sbc #$01    ; $295B
                bne $2953    ; $295D
                pla    ; $295F
                sec    ; $2960
                sbc #$01    ; $2961
                bne $2952    ; $2963
                jsr $2A03    ; $2965
                jsr CursorOff    ; $2968
                lda BlinkRate    ; $296B
                pha    ; $296E
                pha    ; $296F
                jsr KeyAvail?    ; $2970
                beq $2987    ; $2973
                pla    ; $2975
                sec    ; $2976
                sbc #$01    ; $2977
                bne $296F    ; $2979
                pla    ; $297B
                sbc #$01    ; $297C
                bne $296E    ; $297E
                jsr $2A03    ; $2980
                rts    ; $2983
                jsr CursorOff    ; $2984
                jsr $2A03    ; $2987
                lda #$00    ; $298A
                sta ParenFlag    ; $298C
                pla    ; $298F
                pla    ; $2990
                rts    ; $2991
;
; === CursorOff   (also CursorOn, InvertChar) ===
                tya    ; $2992
                pha    ; $2993
                ldy CH    ; $2994
                jsr PickChar    ; $2996
                sta $29B6    ; $2999
                eor #$80    ; $299C
                bit IIcMode?    ; $299E
                bpl $29B0    ; $29A1
                cmp #$60    ; $29A3
                bcs $29B0    ; $29A5
                and #$3F    ; $29A7
                bit $29B6    ; $29A9
                bmi $29B0    ; $29AC
                ora #$80    ; $29AE
                jsr StoreChar    ; $29B0
                pla    ; $29B3
                tay    ; $29B4
                rts    ; $29B5
                brk    ; $29B6
;
; === BeepVector ===
                and $6C2A,y    ; $29B7
        dfb $B7        ; $29BA  (data/65C02-bit)
                and #$A9    ; $29BB
                bra $2A07    ; $29BD
                lda #$0C    ; $29BF
                pha    ; $29C1
                sec    ; $29C2
                sbc #$01    ; $29C3
                bne $29C3    ; $29C5
                pla    ; $29C7
                sbc #$01    ; $29C8
                bne $29C1    ; $29CA
                bit HardBeep    ; $29CC
                pla    ; $29CF
                sbc #$01    ; $29D0
                bne Click    ; $29D2
                rts    ; $29D4
;
; === ParenFlag ===
                brk    ; $29D5
;
; === ParenPos ===
                brk    ; $29D6
                brk    ; $29D7
                brk    ; $29D8
                brk    ; $29D9
                bit ParenFlag    ; $29DA
                bpl $2A36    ; $29DD
                tya    ; $29DF
                pha    ; $29E0
                lda CV    ; $29E1
                pha    ; $29E3
                lda CH    ; $29E4
                pha    ; $29E6
                lda ParenPos    ; $29E7
                sta CH    ; $29EA
                lda $29D7    ; $29EC
                sta CV    ; $29EF
                jsr vtab    ; $29F1
                ldy CH    ; $29F4
                jsr PickChar    ; $29F6
                sta $29D8    ; $29F9
                jmp $2A2B    ; $29FC
                lda #$A0    ; $29FF
                bne $2A06    ; $2A01
                lda $29D8    ; $2A03
                sta $29D9    ; $2A06
                bit ParenFlag    ; $2A09
                bpl $2A36    ; $2A0C
                tya    ; $2A0E
                pha    ; $2A0F
                lda CV    ; $2A10
                pha    ; $2A12
                lda CH    ; $2A13
                pha    ; $2A15
                lda ParenPos    ; $2A16
                sta CH    ; $2A19
                lda $29D7    ; $2A1B
                sta CV    ; $2A1E
                jsr vtab    ; $2A20
                ldy CH    ; $2A23
                lda $29D9    ; $2A25
                jsr StoreChar    ; $2A28
                pla    ; $2A2B
                sta CH    ; $2A2C
                pla    ; $2A2E
                sta CV    ; $2A2F
                jsr vtab    ; $2A31
                pla    ; $2A34
                tay    ; $2A35
                rts    ; $2A36
;
; === BeepFlashes? ===
                brk    ; $2A37
;
; === BeepRings? ===
        dfb $FF        ; $2A38  (data/65C02-bit)
;
; === SysBeep ===
                bit BeepRings?    ; $2A39
                bpl $2A65    ; $2A3C
                lda CV    ; $2A3E
                pha    ; $2A40
                lda CH    ; $2A41
                pha    ; $2A43
                bit BeepFlashes?    ; $2A44
                bpl $2A4C    ; $2A47
                jsr InvModeLine    ; $2A49
                bit BeepRings?    ; $2A4C
                bpl $2A54    ; $2A4F
                jsr Bell    ; $2A51
                bit BeepFlashes?    ; $2A54
                bpl $2A5C    ; $2A57
                jsr InvModeLine    ; $2A59
                pla    ; $2A5C
                sta CH    ; $2A5D
                pla    ; $2A5F
                sta CV    ; $2A60
                jmp vtab1    ; $2A62
                bit BeepFlashes?    ; $2A65
                bmi $2A6B    ; $2A68
                rts    ; $2A6A
                lda CV    ; $2A6B
                pha    ; $2A6D
                lda CH    ; $2A6E
                pha    ; $2A70
                jsr InvModeLine    ; $2A71
                lda #$80    ; $2A74
                pha    ; $2A76
                lda #$0C    ; $2A77
                pha    ; $2A79
                sec    ; $2A7A
                sbc #$01    ; $2A7B
                bne $2A7B    ; $2A7D
                pla    ; $2A7F
                sbc #$01    ; $2A80
                bne $2A79    ; $2A82
                pla    ; $2A84
                sbc #$01    ; $2A85
                bne $2A76    ; $2A87
                jsr InvModeLine    ; $2A89
                pla    ; $2A8C
                sta CH    ; $2A8D
                pla    ; $2A8F
                sta CV    ; $2A90
                jmp vtab1    ; $2A92
;
; === TypeoutOpen ===
                brk    ; $2A95
;
; === TypeoutFlag ===
                brk    ; $2A96
;
; === TypeoutAbort ===
                ora $2B    ; $2A97
;
; === AbortedTO? ===
                brk    ; $2A99
;
; === TOAbortStk ===
                brk    ; $2A9A
;
; === TypeoutMax ===
                brk    ; $2A9B
                brk    ; $2A9C
                brk    ; $2A9D
                brk    ; $2A9E
;
; === TypeoutCH ===
                brk    ; $2A9F
                brk    ; $2AA0
;
; === InitTypeout ===
                lda WindowTop    ; $2AA1
                sta $2AA0    ; $2AA3
                sta TypeoutMax    ; $2AA6
                lda WindowLft    ; $2AA9
                sta TypeoutCH    ; $2AAB
                lda #$00    ; $2AAE
                sta AbortedTO?    ; $2AB0
                sta TypeoutFlag    ; $2AB3
                cmp TypeoutOpen    ; $2AB6
                beq $2ABE    ; $2AB9
                jsr CloseTypeout1    ; $2ABB
                lda #$FF    ; $2ABE
                sta $2A9C    ; $2AC0
                rts    ; $2AC3
;
; === OpenTypeout ===
                bit TypeoutOpen    ; $2AC4
                bpl $2ACC    ; $2AC7
                jsr CloseTypeout1    ; $2AC9
                lda CoutDef    ; $2ACC
                sta $2A9D    ; $2ACF
                lda $2607    ; $2AD2
                sta $2A9E    ; $2AD5
                lda #$CD    ; $2AD8
                sta CoutDef    ; $2ADA
                lda #$2B    ; $2ADD
                sta $2607    ; $2ADF
                lda TypeoutCH    ; $2AE2
                sta CH    ; $2AE5
                lda $2AA0    ; $2AE7
                sta CV    ; $2AEA
                jsr vtab    ; $2AEC
                tsx    ; $2AEF
                inx    ; $2AF0
                inx    ; $2AF1
                stx TOAbortStk    ; $2AF2
                lda #$05    ; $2AF5
                sta TypeoutAbort    ; $2AF7
                lda #$2B    ; $2AFA
                sta $2A98    ; $2AFC
                lda #$FF    ; $2AFF
                sta TypeoutOpen    ; $2B01
                rts    ; $2B04
                jsr CloseTypeout1    ; $2B05
                ldx TOAbortStk    ; $2B08
                txs    ; $2B0B
                lda #$01    ; $2B0C
                rts    ; $2B0E
;
; === CloseTypeout ===
                jsr BlinkCursor    ; $2B0F
                cmp #$A0    ; $2B12
                beq CloseTypeout1    ; $2B14
                jsr $2BC4    ; $2B16
;
; === CloseTypeout1 ===
                lda $2A9D    ; $2B19
                sta CoutDef    ; $2B1C
                lda $2A9E    ; $2B1F
                sta $2607    ; $2B22
                lda CH    ; $2B25
                sta TypeoutCH    ; $2B27
                lda CV    ; $2B2A
                sta $2AA0    ; $2B2C
                jsr vtab    ; $2B2F
                lda #$00    ; $2B32
                sta TypeoutOpen    ; $2B34
                rts    ; $2B37
;
; === SaveWind ===
                ldx #$00    ; $2B38
                lda WindowLft,x    ; $2B3A
                sta $2B55,x    ; $2B3C
                inx    ; $2B3F
                cpx #$06    ; $2B40
                bcc $2B3A    ; $2B42
                rts    ; $2B44
;
; === RstrWind ===
                ldx #$00    ; $2B45
                lda $2B55,x    ; $2B47
                sta WindowLft,x    ; $2B4A
                inx    ; $2B4C
                cpx #$06    ; $2B4D
                bcc $2B47    ; $2B4F
                jsr vtab1    ; $2B51
                rts    ; $2B54
                brk    ; $2B55
                brk    ; $2B56
                brk    ; $2B57
                brk    ; $2B58
                brk    ; $2B59
                brk    ; $2B5A
;
; === GetTypeWind ===
                ldy #$00    ; $2B5B
                bit $111C    ; $2B5D
                bpl $2B84    ; $2B60
                lda #$1D    ; $2B62
                sta $00    ; $2B64
                lda #$11    ; $2B66
                sta $01    ; $2B68
                lda SelectedWind    ; $2B6A
                cmp #$01    ; $2B6D
                beq $2B79    ; $2B6F
                lda #$26    ; $2B71
                sta $00    ; $2B73
                lda #$11    ; $2B75
                sta $01    ; $2B77
                lda ($00),y    ; $2B79
                sta: WindowLft,y    ; $2B7B
                iny    ; $2B7E
                cpy #$04    ; $2B7F
                bcc $2B79    ; $2B81
                rts    ; $2B83
                lda #$00    ; $2B84
                sta WindowTop    ; $2B86
                sta WindowLft    ; $2B88
                lda #$14    ; $2B8A
                sta WindowBot    ; $2B8C
                lda #$50    ; $2B8E
                sta WindowRgt    ; $2B90
                rts    ; $2B92
;
; === PrepTO ===
                jsr SaveWind    ; $2B93
                jsr GetTypeWind    ; $2B96
                jsr OpenTypeout    ; $2B99
                lda #$AD    ; $2B9C
                sta TypeoutAbort    ; $2B9E
                lda #$2B    ; $2BA1
                sta $2A98    ; $2BA3
                tsx    ; $2BA6
                inx    ; $2BA7
                inx    ; $2BA8
                stx TOAbortStk    ; $2BA9
                rts    ; $2BAC
                ldx TOAbortStk    ; $2BAD
                txs    ; $2BB0
                jsr CloseTypeout1    ; $2BB1
                jmp $2BBA    ; $2BB4
;
; === UnPrepTO ===
                jsr CloseTypeout    ; $2BB7
                jsr RstrWind    ; $2BBA
                lda #$01    ; $2BBD
                rts    ; $2BBF
                brk    ; $2BC0
                brk    ; $2BC1
                brk    ; $2BC2
                brk    ; $2BC3
                jsr UnTYI    ; $2BC4
                ldx #$FF    ; $2BC7
                stx AbortedTO?    ; $2BC9
                rts    ; $2BCC
                sta $2BC2    ; $2BCD
                stx $2BC0    ; $2BD0
                sty $2BC1    ; $2BD3
                php    ; $2BD6
                pla    ; $2BD7
                sta $2BC3    ; $2BD8
                bit $2A9C    ; $2BDB
                bpl $2BF8    ; $2BDE
                inc $2A9C    ; $2BE0
                lda #$FF    ; $2BE3
                sta TypeoutFlag    ; $2BE5
                lda TypeoutCH    ; $2BE8
                sta CH    ; $2BEB
                lda $2AA0    ; $2BED
                sta CV    ; $2BF0
                jsr vtab    ; $2BF2
                jsr $2C5B    ; $2BF5
                lda $2BC2    ; $2BF8
                cmp #$A0    ; $2BFB
                bcs $2C29    ; $2BFD
                cmp #$9B    ; $2BFF
                bne $2C08    ; $2C01
                lda AltmodeChar    ; $2C03
                bne $2C29    ; $2C06
                cmp #$8D    ; $2C08
                bne $2C12    ; $2C0A
                jsr $2C5B    ; $2C0C
                jmp $2C2C    ; $2C0F
                cmp #$89    ; $2C12
                bne $2C1C    ; $2C14
                jsr $2C4C    ; $2C16
                jmp $2C2C    ; $2C19
                lda #$DE    ; $2C1C
                jsr $2C3B    ; $2C1E
                lda $2BC2    ; $2C21
                ora #$80    ; $2C24
                clc    ; $2C26
                adc #$40    ; $2C27
                jsr $2C3B    ; $2C29
                lda $2BC3    ; $2C2C
                pha    ; $2C2F
                lda $2BC2    ; $2C30
                ldx $2BC0    ; $2C33
                ldy $2BC1    ; $2C36
                plp    ; $2C39
                rts    ; $2C3A
                ldy CH    ; $2C3B
                jsr StoreChar    ; $2C3D
                inc CH    ; $2C40
                lda CH    ; $2C42
                cmp WindowRgt    ; $2C44
                bcc $2C4B    ; $2C46
                jsr $2C5E    ; $2C48
                rts    ; $2C4B
                lda CH    ; $2C4C
                jsr TabBump    ; $2C4E
                sta CH    ; $2C51
                cmp WindowRgt    ; $2C53
                bcc $2C5A    ; $2C55
                jsr $2C5B    ; $2C57
                rts    ; $2C5A
                jsr ClearEOL    ; $2C5B
                lda WindowLft    ; $2C5E
                sta CH    ; $2C60
                inc CV    ; $2C62
                ldx CV    ; $2C64
                inx    ; $2C66
                cpx WindowBot    ; $2C67
                bcc $2C79    ; $2C69
                bne $2CA7    ; $2C6B
                jsr vtab    ; $2C6D
                jsr ClearEOL    ; $2C70
                ldx WindowBot    ; $2C73
                stx TypeoutMax    ; $2C75
                rts    ; $2C78
                lda CV    ; $2C79
                pha    ; $2C7B
                lda CH    ; $2C7C
                pha    ; $2C7E
                jsr vtab    ; $2C7F
                jsr ClearEOL    ; $2C82
                inc CV    ; $2C85
                lda WindowLft    ; $2C87
                sta CH    ; $2C89
                jsr vtab    ; $2C8B
                lda #$DF    ; $2C8E
                ldx CV    ; $2C90
                cpx TypeoutMax    ; $2C92
                bcc $2C9D    ; $2C95
                stx TypeoutMax    ; $2C97
                jsr ClearEOL1    ; $2C9A
                pla    ; $2C9D
                sta CH    ; $2C9E
                pla    ; $2CA0
                sta CV    ; $2CA1
                jsr vtab    ; $2CA3
                rts    ; $2CA6
                lda ModeLineCV    ; $2CA7
                sta CV    ; $2CAA
                lda $2D22    ; $2CAC
                sta CH    ; $2CAF
                jsr vtab    ; $2CB1
                ldy CH    ; $2CB4
                jsr $2CE9    ; $2CB6
                sty CH    ; $2CB9
                jsr BlinkCursor    ; $2CBB
                pha    ; $2CBE
                ldy $2D22    ; $2CBF
                sty CH    ; $2CC2
                jsr $2CE9    ; $2CC4
                lda WindowTop    ; $2CC7
                sta $2AA0    ; $2CC9
                sta CV    ; $2CCC
                lda WindowLft    ; $2CCE
                sta TypeoutCH    ; $2CD0
                sta CH    ; $2CD3
                jsr vtab    ; $2CD5
                pla    ; $2CD8
                cmp #$A0    ; $2CD9
                bne $2CE3    ; $2CDB
                lda #$FF    ; $2CDD
                sta $2A9C    ; $2CDF
                rts    ; $2CE2
                jsr $2BC4    ; $2CE3
                jmp (TypeoutAbort)    ; $2CE6
                ldx #$00    ; $2CE9
                ldy CH    ; $2CEB
                jsr PickChar    ; $2CED
                pha    ; $2CF0
                lda $2D18,x    ; $2CF1
                bit ModeLineInv    ; $2CF4
                bmi $2D06    ; $2CF7
                bit IIcMode?    ; $2CF9
                bpl $2D08    ; $2CFC
                cmp #$4D    ; $2CFE
                bne $2D08    ; $2D00
                and #$3F    ; $2D02
                bne $2D08    ; $2D04
                ora #$80    ; $2D06
                jsr StoreChar    ; $2D08
                pla    ; $2D0B
                and #$7F    ; $2D0C
                sta $2D18,x    ; $2D0E
                iny    ; $2D11
                inx    ; $2D12
                cpx #$0A    ; $2D13
                bcc $2CED    ; $2D15
                rts    ; $2D17
                jsr $2D2D    ; $2D18
                eor $726F    ; $2D1B
                adc $2D    ; $2D1E
                and $4220    ; $2D20
                brk    ; $2D23
                brk    ; $2D24
;
; === PointToCH ===
                lda CH    ; $2D25
                sta $2D23    ; $2D27
                lda CV    ; $2D2A
                sta $2D24    ; $2D2C
                lda PageTop    ; $2D2F
                sta $04    ; $2D31
                lda $63    ; $2D33
                sta $05    ; $2D35
                jsr Home    ; $2D37
                ldy #$00    ; $2D3A
                lda CV    ; $2D3C
                cmp $2D24    ; $2D3E
                bcc $2D58    ; $2D41
                lda CH    ; $2D43
                cmp $2D23    ; $2D45
                bcc $2D58    ; $2D48
                lda $04    ; $2D4A
                sta TheBuffer    ; $2D4C
                lda $05    ; $2D4E
                sta $61    ; $2D50
                jsr vtab    ; $2D52
                lda #$00    ; $2D55
                rts    ; $2D57
                lda $05    ; $2D58
                cmp $6B    ; $2D5A
                bcc $2D70    ; $2D5C
                bne $2D6B    ; $2D5E
                lda $04    ; $2D60
                cmp GapTop    ; $2D62
                bcc $2D70    ; $2D64
                bne $2D6B    ; $2D66
                jsr $2EE5    ; $2D68
                jsr $2FC6    ; $2D6B
                beq $2D4A    ; $2D6E
                jsr $D012    ; $2D70
                jsr GetXCharLen    ; $2D73
                jsr BumpXPos    ; $2D76
                inc $04    ; $2D79
                bne $2D7F    ; $2D7B
                inc $05    ; $2D7D
                lda CV    ; $2D7F
                cmp WindowBot    ; $2D81
                bcc $2D3C    ; $2D83
                lda #$FF    ; $2D85
                rts    ; $2D87
;
; === FindPoint ===
                jsr Home    ; $2D88
                lda PageTop    ; $2D8B
                sta $00    ; $2D8D
                lda $63    ; $2D8F
                sta $01    ; $2D91
;
; === FindPoint1 ===
                ldy #$00    ; $2D93
                lda $00    ; $2D95
                cmp TheBuffer    ; $2D97
                bne $2DA7    ; $2D99
                lda $01    ; $2D9B
                cmp $61    ; $2D9D
                bne $2DA7    ; $2D9F
                jsr vtab    ; $2DA1
                lda #$00    ; $2DA4
                rts    ; $2DA6
                lda $01    ; $2DA7
                cmp $6B    ; $2DA9
                bcc $2DC9    ; $2DAB
                bne $2DBA    ; $2DAD
                lda $00    ; $2DAF
                cmp GapTop    ; $2DB1
                bcc $2DC9    ; $2DB3
                bne $2DBA    ; $2DB5
                jsr SetTempBot    ; $2DB7
                lda $00    ; $2DBA
                cmp BuffBot    ; $2DBC
                bne $2DC9    ; $2DBE
                lda $01    ; $2DC0
                cmp $69    ; $2DC2
                bne $2DC9    ; $2DC4
                lda #$FF    ; $2DC6
                rts    ; $2DC8
                jsr $D000    ; $2DC9
                jsr GetXCharLen    ; $2DCC
                jsr BumpXPos    ; $2DCF
                ldx CV    ; $2DD2
                cpx WindowBot    ; $2DD4
                bcs $2DC6    ; $2DD6
                inc $00    ; $2DD8
                bne $2DDE    ; $2DDA
                inc $01    ; $2DDC
                bne $2D95    ; $2DDE
;
; === GetXCharLen ===
                ldx #$01    ; $2DE0
                cmp #$A0    ; $2DE2
                bcs $2DF3    ; $2DE4
                cmp #$9B    ; $2DE6
                beq $2DF3    ; $2DE8
                cmp #$8D    ; $2DEA
                beq $2DF4    ; $2DEC
                cmp #$89    ; $2DEE
                beq $2DFD    ; $2DF0
                inx    ; $2DF2
                rts    ; $2DF3
                lda WindowRgt    ; $2DF4
                sec    ; $2DF6
                sbc CH    ; $2DF7
                tax    ; $2DF9
                lda #$8D    ; $2DFA
                rts    ; $2DFC
                lda CH    ; $2DFD
                jsr TabBump    ; $2DFF
                cmp WindowRgt    ; $2E02
                bcc $2E0C    ; $2E04
                jsr $2DF4    ; $2E06
                lda #$89    ; $2E09
                rts    ; $2E0B
                sec    ; $2E0C
                sbc CH    ; $2E0D
                tax    ; $2E0F
                lda #$89    ; $2E10
                rts    ; $2E12
;
; === BumpXPos ===
                cmp #$8D    ; $2E13
                beq $2E2E    ; $2E15
                txa    ; $2E17
                clc    ; $2E18
                adc CH    ; $2E19
                sta CH    ; $2E1B
                adc #$01    ; $2E1D
                cmp WindowRgt    ; $2E1F
                bcc $2E2D    ; $2E21
                sbc WindowRgt    ; $2E23
                sta CH    ; $2E25
                lda #$00    ; $2E27
                sta CH    ; $2E29
                inc CV    ; $2E2B
                rts    ; $2E2D
                lda #$00    ; $2E2E
                sta CH    ; $2E30
                inc CV    ; $2E32
                rts    ; $2E34
;
; === BackLine ===
                ldy #$00    ; $2E35
                jsr $2FBB    ; $2E37
                bne $2E3D    ; $2E3A
                rts    ; $2E3C
                jsr $2F9A    ; $2E3D
                bne $2E4F    ; $2E40
                lda GapTop    ; $2E42
                sta $04    ; $2E44
                lda $6B    ; $2E46
                sta $05    ; $2E48
                jsr $2FBB    ; $2E4A
                beq $2E5E    ; $2E4D
                lda $04    ; $2E4F
                bne $2E55    ; $2E51
                dec $05    ; $2E53
                dec $04    ; $2E55
                jsr $D012    ; $2E57
                cmp #$8D    ; $2E5A
                bne $2E37    ; $2E5C
                rts    ; $2E5E
                brk    ; $2E5F
                brk    ; $2E60
                brk    ; $2E61
                brk    ; $2E62
;
; === BackScrLine ===
                lda WindowTop    ; $2E63
                sta CV    ; $2E65
                lda WindowLft    ; $2E67
                sta CH    ; $2E69
                lda $04    ; $2E6B
                sta $2E5F    ; $2E6D
                lda $05    ; $2E70
                sta $2E60    ; $2E72
                jsr BackLine    ; $2E75
                jsr CheckTop    ; $2E78
                beq $2E80    ; $2E7B
                jsr $2ECC    ; $2E7D
                lda $04    ; $2E80
                sta $2E61    ; $2E82
                lda $05    ; $2E85
                sta $2E62    ; $2E87
                lda $04    ; $2E8A
                cmp $2E5F    ; $2E8C
                bne $2E98    ; $2E8F
                lda $05    ; $2E91
                cmp $2E60    ; $2E93
                beq $2EC1    ; $2E96
                ldy #$00    ; $2E98
                jsr $D012    ; $2E9A
                jsr GetXCharLen    ; $2E9D
                ldy CV    ; $2EA0
                jsr BumpXPos    ; $2EA2
                cpy CV    ; $2EA5
                beq $2EBB    ; $2EA7
                lda $04    ; $2EA9
                sta $2E61    ; $2EAB
                lda $05    ; $2EAE
                sta $2E62    ; $2EB0
                inc $2E61    ; $2EB3
                bne $2EBB    ; $2EB6
                inc $2E62    ; $2EB8
                jsr $2ECC    ; $2EBB
                jmp $2E8A    ; $2EBE
                lda $2E61    ; $2EC1
                sta $04    ; $2EC4
                lda $2E62    ; $2EC6
                sta $05    ; $2EC9
                rts    ; $2ECB
                jsr $2FD1    ; $2ECC
                beq $2EE2    ; $2ECF
                jsr $2FB0    ; $2ED1
                bne $2ED9    ; $2ED4
                jsr $2EE5    ; $2ED6
                inc $04    ; $2ED9
                bne $2EDF    ; $2EDB
                inc $05    ; $2EDD
                lda #$00    ; $2EDF
                rts    ; $2EE1
                lda #$FF    ; $2EE2
                rts    ; $2EE4
                lda GapBot    ; $2EE5
                clc    ; $2EE7
                adc #$01    ; $2EE8
                sta $04    ; $2EEA
                lda $6D    ; $2EEC
                adc #$00    ; $2EEE
                sta $05    ; $2EF0
                rts    ; $2EF2
;
; === SetTempBot ===
                lda GapBot    ; $2EF3
                clc    ; $2EF5
                adc #$01    ; $2EF6
                sta $00    ; $2EF8
                lda $6D    ; $2EFA
                adc #$00    ; $2EFC
                sta $01    ; $2EFE
                rts    ; $2F00
                jsr $2F9A    ; $2F01
                bne $2F0E    ; $2F04
                lda GapTop    ; $2F06
                sta $00    ; $2F08
                lda $6B    ; $2F0A
                sta $01    ; $2F0C
                jsr $2FBB    ; $2F0E
                beq $2F1E    ; $2F11
                lda $04    ; $2F13
                bne $2F19    ; $2F15
                dec $05    ; $2F17
                dec $04    ; $2F19
                lda #$00    ; $2F1B
                rts    ; $2F1D
                lda #$FF    ; $2F1E
                rts    ; $2F20
;
; === FixText ===
                txa    ; $2F21
                bpl $2F3C    ; $2F22
                jsr $2FB0    ; $2F24
                bne $2F36    ; $2F27
                jsr CheckTop    ; $2F29
                beq $2F39    ; $2F2C
                lda $04    ; $2F2E
                bne $2F34    ; $2F30
                dec $05    ; $2F32
                dec $04    ; $2F34
                lda #$00    ; $2F36
                rts    ; $2F38
                lda #$FF    ; $2F39
                rts    ; $2F3B
                jsr $2FB0    ; $2F3C
                bcc $2F59    ; $2F3F
                bne $2F51    ; $2F41
                lda GapBot    ; $2F43
                sta $04    ; $2F45
                lda $6D    ; $2F47
                sta $05    ; $2F49
                inc $04    ; $2F4B
                bne $2F51    ; $2F4D
                inc $05    ; $2F4F
                jsr $2FC6    ; $2F51
                bne $2F59    ; $2F54
                lda #$FF    ; $2F56
                rts    ; $2F58
                lda #$00    ; $2F59
                rts    ; $2F5B
;
; === CheckTop ===
                ldy $05    ; $2F5C
                ldx $04    ; $2F5E
                bne $2F63    ; $2F60
                dey    ; $2F62
                dex    ; $2F63
                cpy $6D    ; $2F64
                bcc $2F81    ; $2F66
                bne $2F70    ; $2F68
                cpx GapBot    ; $2F6A
                beq $2F74    ; $2F6C
                bcc $2F81    ; $2F6E
                lda #$FF    ; $2F70
                bmi $2F95    ; $2F72
                lda GapTop    ; $2F74
                cmp BuffTop    ; $2F76
                bne $2F95    ; $2F78
                lda $6B    ; $2F7A
                cmp $67    ; $2F7C
                jmp $2F95    ; $2F7E
                cpy $67    ; $2F81
                bcc $2F8B    ; $2F83
                bne $2F95    ; $2F85
                cpx BuffTop    ; $2F87
                bcs $2F95    ; $2F89
                lda BuffTop    ; $2F8B
                sta $04    ; $2F8D
                lda $67    ; $2F8F
                sta $05    ; $2F91
                lda #$00    ; $2F93
                php    ; $2F95
                ldy #$00    ; $2F96
                plp    ; $2F98
                rts    ; $2F99
                lda GapBot    ; $2F9A
                clc    ; $2F9C
                adc #$01    ; $2F9D
                php    ; $2F9F
                cmp $04    ; $2FA0
                bne $2FAC    ; $2FA2
                plp    ; $2FA4
                lda $6D    ; $2FA5
                adc #$00    ; $2FA7
                cmp $05    ; $2FA9
                rts    ; $2FAB
                plp    ; $2FAC
                lda #$FF    ; $2FAD
                rts    ; $2FAF
                lda $05    ; $2FB0
                cmp $6B    ; $2FB2
                bne $2FBA    ; $2FB4
                lda $04    ; $2FB6
                cmp GapTop    ; $2FB8
                rts    ; $2FBA
                lda $04    ; $2FBB
                cmp BuffTop    ; $2FBD
                bne $2FC5    ; $2FBF
                lda $05    ; $2FC1
                cmp $67    ; $2FC3
                rts    ; $2FC5
                lda $04    ; $2FC6
                cmp BuffBot    ; $2FC8
                bne $2FD0    ; $2FCA
                lda $05    ; $2FCC
                cmp $69    ; $2FCE
                rts    ; $2FD0
                jsr $2FB0    ; $2FD1
                bcc $2FFD    ; $2FD4
                bne $2FED    ; $2FD6
                lda GapBot    ; $2FD8
                clc    ; $2FDA
                adc #$01    ; $2FDB
                cmp BuffBot    ; $2FDD
                bne $2FFD    ; $2FDF
                cmp #$00    ; $2FE1
                beq $2FE6    ; $2FE3
                clc    ; $2FE5
                lda $6D    ; $2FE6
                adc #$00    ; $2FE8
                cmp $69    ; $2FEA
                rts    ; $2FEC
                lda $05    ; $2FED
                cmp $69    ; $2FEF
                bcc $2FFD    ; $2FF1
                bne $2FFE    ; $2FF3
                lda $04    ; $2FF5
                cmp BuffBot    ; $2FF7
                bcc $2FFD    ; $2FF9
                bne $2FFE    ; $2FFB
                rts    ; $2FFD
                lda BuffBot    ; $2FFE
                sta $04    ; $3000
                lda $69    ; $3002
                sta $05    ; $3004
                lda #$00    ; $3006
                rts    ; $3008
                brk    ; $3009
                brk    ; $300A
;
; === EnableKDisp ===
                brk    ; $300B
;
; === DisplayPage ===
                jsr InitTypeout    ; $300C
;
; === DisplayPage1 ===
                jsr ModeInfo    ; $300F
                jsr Home    ; $3012
                lda PageTop    ; $3015
                sta $00    ; $3017
                lda $63    ; $3019
                sta $01    ; $301B
;
; === DisplayTemp ===
                ldy #$00    ; $301D
                bit $300A    ; $301F
                bmi $3036    ; $3022
                bit $3009    ; $3024
                bpl $3036    ; $3027
                lda $00    ; $3029
                cmp TheBuffer    ; $302B
                bne $3036    ; $302D
                lda $01    ; $302F
                cmp $61    ; $3031
                bne $3036    ; $3033
                rts    ; $3035
                lda $01    ; $3036
                cmp $6B    ; $3038
                bcc $3059    ; $303A
                bne $3049    ; $303C
                lda $00    ; $303E
                cmp GapTop    ; $3040
                bcc $3059    ; $3042
                bne $3049    ; $3044
                jsr SetTempBot    ; $3046
                lda $00    ; $3049
                cmp BuffBot    ; $304B
                bne $3059    ; $304D
                lda $01    ; $304F
                cmp $69    ; $3051
                bne $3059    ; $3053
                jsr ClearEOP    ; $3055
                rts    ; $3058
                jsr $D000    ; $3059
                ldx CV    ; $305C
                inx    ; $305E
                cpx WindowBot    ; $305F
                bcc $309B    ; $3061
                cmp #$8D    ; $3063
                bne $306B    ; $3065
                jsr ClearEOL    ; $3067
                rts    ; $306A
                jsr GetXCharLen    ; $306B
                txa    ; $306E
                clc    ; $306F
                adc CH    ; $3070
                cmp WindowRgt    ; $3072
                bcs $308E    ; $3074
                jsr $D000    ; $3076
                jsr CharOut    ; $3079
                bit EnableKDisp    ; $307C
                bpl $3086    ; $307F
                pha    ; $3081
                jsr GatherTYI    ; $3082
                pla    ; $3085
                inc $00    ; $3086
                bne $308C    ; $3088
                inc $01    ; $308A
                bne $3024    ; $308C
                pha    ; $308E
                ldx WindowRgt    ; $308F
                dex    ; $3091
                stx CH    ; $3092
                lda #$A1    ; $3094
                jsr CharOut    ; $3096
                pla    ; $3099
                rts    ; $309A
                jsr GetXCharLen    ; $309B
                txa    ; $309E
                clc    ; $309F
                adc CH    ; $30A0
                cmp WindowRgt    ; $30A2
                php    ; $30A4
                jsr $D000    ; $30A5
                plp    ; $30A8
                bcc $3079    ; $30A9
                cmp #$8D    ; $30AB
                beq $30B9    ; $30AD
                jsr $308E    ; $30AF
                cmp #$89    ; $30B2
                bne $3079    ; $30B4
                jmp $307C    ; $30B6
                ldx CH    ; $30B9
                inx    ; $30BB
                cpx WindowRgt    ; $30BC
                bcc $3079    ; $30BE
                jsr $308E    ; $30C0
                jmp $3024    ; $30C3
;
; === DisplayDown ===
                lda CV    ; $30C6
                pha    ; $30C8
                lda CH    ; $30C9
                pha    ; $30CB
                lda TheBuffer    ; $30CC
                sta $00    ; $30CE
                lda $61    ; $30D0
                sta $01    ; $30D2
                jsr DisplayTemp    ; $30D4
                pla    ; $30D7
                sta CH    ; $30D8
                pla    ; $30DA
                sta CV    ; $30DB
                jmp vtab    ; $30DD
;
; === DispToPoint ===
                lda #$FF    ; $30E0
                sta $3009    ; $30E2
                jsr DisplayPage1    ; $30E5
                inc $3009    ; $30E8
                rts    ; $30EB
;
; === DecrScreen ===
                lda PageTop    ; $30EC
                sta $04    ; $30EE
                lda $63    ; $30F0
                sta $05    ; $30F2
                jsr $2F01    ; $30F4
                bne $3106    ; $30F7
                jsr BackScrLine    ; $30F9
                lda $04    ; $30FC
                sta PageTop    ; $30FE
                lda $05    ; $3100
                sta $63    ; $3102
                lda #$00    ; $3104
                rts    ; $3106
;
; === IncrScreen ===
                lda PageTop    ; $3107
                sta $04    ; $3109
                lda $63    ; $310B
                sta $05    ; $310D
                jsr $2F3C    ; $310F
                bne $3136    ; $3112
                ldy #$00    ; $3114
                lda WindowLft    ; $3116
                sta $3146    ; $3118
                jsr $D012    ; $311B
                cmp #$8D    ; $311E
                beq $3140    ; $3120
                jsr GetXCharLen    ; $3122
                txa    ; $3125
                clc    ; $3126
                adc $3146    ; $3127
                cmp WindowRgt    ; $312A
                bcs $3137    ; $312C
                sta $3146    ; $312E
                jsr $2ECC    ; $3131
                beq $311B    ; $3134
                rts    ; $3136
                lda $04    ; $3137
                sta PageTop    ; $3139
                lda $05    ; $313B
                sta $63    ; $313D
                rts    ; $313F
                jsr $2ECC    ; $3140
                beq $3137    ; $3143
                rts    ; $3145
                brk    ; $3146
;
; === DisplayLine ===
                lda TheBuffer    ; $3147
                sta $04    ; $3149
                lda $61    ; $314B
                sta $05    ; $314D
                lda CV    ; $314F
                pha    ; $3151
                lda CH    ; $3152
                pha    ; $3154
                jsr BackScrLine    ; $3155
                pla    ; $3158
                sta CH    ; $3159
                pla    ; $315B
                sta CV    ; $315C
                jsr PrintTextLine    ; $315E
                jmp vtab    ; $3161
;
; === PrintTextLine ===
                lda CV    ; $3164
                pha    ; $3166
                lda CH    ; $3167
                pha    ; $3169
                lda WindowLft    ; $316A
                sta CH    ; $316C
                jsr vtab    ; $316E
                ldx WindowBot    ; $3171
                inx    ; $3173
                stx CV    ; $3174
                lda $04    ; $3176
                sta $00    ; $3178
                lda $05    ; $317A
                sta $01    ; $317C
                dec $300A    ; $317E
                jsr DisplayTemp    ; $3181
                inc $300A    ; $3184
                pla    ; $3187
                sta CH    ; $3188
                pla    ; $318A
                sta CV    ; $318B
                jsr vtab    ; $318D
                rts    ; $3190
;
; === LinesPastPnt ===
                ldy #$01    ; $3191
                ldx #$00    ; $3193
                stx $00    ; $3195
                lda CV    ; $3197
                pha    ; $3199
                lda CH    ; $319A
                pha    ; $319C
                tya    ; $319D
                clc    ; $319E
                adc GapBot    ; $319F
                tax    ; $31A1
                lda $6D    ; $31A2
                adc #$00    ; $31A4
                cmp $69    ; $31A6
                bne $31AE    ; $31A8
                cpx BuffBot    ; $31AA
                beq $31D9    ; $31AC
                jsr $D03F    ; $31AE
                cmp #$8D    ; $31B1
                beq $31D9    ; $31B3
                jsr GetXCharLen    ; $31B5
                pha    ; $31B8
                lda CV    ; $31B9
                sta $00    ; $31BB
                pla    ; $31BD
                jsr BumpXPos    ; $31BE
                lda CV    ; $31C1
                cmp $00    ; $31C3
                beq $31C9    ; $31C5
                inc $00    ; $31C7
                iny    ; $31C9
                bne $319D    ; $31CA
                inc $31E2    ; $31CC
                pla    ; $31CF
                sta CH    ; $31D0
                pla    ; $31D2
                sta CV    ; $31D3
                lda $31E2    ; $31D5
                rts    ; $31D8
                pla    ; $31D9
                sta CH    ; $31DA
                pla    ; $31DC
                sta CV    ; $31DD
                lda $00    ; $31DF
                rts    ; $31E1
                brk    ; $31E2
;
; === FindPointCol ===
                lda CV    ; $31E3
                pha    ; $31E5
                lda CH    ; $31E6
                pha    ; $31E8
                jsr BackScrLine    ; $31E9
                ldx CH    ; $31EC
                pla    ; $31EE
                sta CH    ; $31EF
                pla    ; $31F1
                sta CV    ; $31F2
                rts    ; $31F4
;
; === CenterLine ===
                ora #$08    ; $31F5
;
; === CenterPage ===
                lda WindowTop    ; $31F7
                clc    ; $31F9
                adc CenterLine    ; $31FA
                cmp WindowBot    ; $31FD
                bcc $320A    ; $31FF
                lda WindowBot    ; $3201
                sec    ; $3203
                sbc WindowTop    ; $3204
                lsr    ; $3206
                sec    ; $3207
                sbc #$01    ; $3208
                sta CenterPoint    ; $320A
;
; === CenterPage1 ===
                lda TheBuffer    ; $320D
                sta $04    ; $320F
                lda $61    ; $3211
                sta $05    ; $3213
                jsr BackScrLine    ; $3215
                lda $04    ; $3218
                sta PageTop    ; $321A
                lda $05    ; $321C
                sta $63    ; $321E
                lda CenterPoint    ; $3220
                beq $322F    ; $3223
                jsr DecrScreen    ; $3225
                bne $322F    ; $3228
                dec CenterPoint    ; $322A
                bne $3225    ; $322D
                jsr DisplayPage    ; $322F
                jsr FindPoint    ; $3232
                lda #$00    ; $3235
                rts    ; $3237
;
; === GenDisplay ===
                bit TypeoutFlag    ; $3238
                bpl $324B    ; $323B
                pha    ; $323D
                jsr InitTypeout    ; $323E
                pla    ; $3241
                cmp #$06    ; $3242
                bcs $324B    ; $3244
                jsr DisplayPage    ; $3246
                lda #$01    ; $3249
                asl    ; $324B
                tax    ; $324C
                cpx #$0E    ; $324D
                bcs $325E    ; $324F
                lda DispVects,x    ; $3251
                sta $00    ; $3254
                lda $3263,x    ; $3256
                sta $01    ; $3259
                jmp ($0000)    ; $325B
                jsr Beep    ; $325E
                rts    ; $3261
;
; === DispVects ===
        dfb $37        ; $3262  (data/65C02-bit)
                and (PhysBuffBot)    ; $3263
                and ($C6)    ; $3265
                bmi $32B0    ; $3267
                and ($E0),y    ; $3269
                bmi $32E6    ; $326B
                and ($F7)    ; $326D
                and (WindowLft),y    ; $326F
                dey    ; $3271
                and $03F0    ; $3272
                jmp CenterPage    ; $3275
                rts    ; $3278
;
; === DispPointEnd ===
                jsr SetGap    ; $3279
                lda CV    ; $327C
                pha    ; $327E
                lda CH    ; $327F
                pha    ; $3281
                lda $6D    ; $3282
                pha    ; $3284
                lda GapBot    ; $3285
                pha    ; $3287
                inc GapBot    ; $3288
                bne $328E    ; $328A
                inc $6D    ; $328C
                ldy #$00    ; $328E
                lda GapBot    ; $3290
                cmp BuffBot    ; $3292
                bne $32AF    ; $3294
                lda $6D    ; $3296
                cmp $69    ; $3298
                bne $32AF    ; $329A
                jsr ClearEOL    ; $329C
                pla    ; $329F
                sta GapBot    ; $32A0
                pla    ; $32A2
                sta $6D    ; $32A3
                pla    ; $32A5
                sta CH    ; $32A6
                pla    ; $32A8
                sta CV    ; $32A9
                jsr vtab    ; $32AB
                rts    ; $32AE
                jsr $D03F    ; $32AF
                cmp #$8D    ; $32B2
                beq $32ED    ; $32B4
                jsr GetXCharLen    ; $32B6
                txa    ; $32B9
                clc    ; $32BA
                adc CH    ; $32BB
                cmp WindowRgt    ; $32BD
                bcs $32CF    ; $32BF
                jsr $D03F    ; $32C1
                jsr CharOut    ; $32C4
                inc GapBot    ; $32C7
                bne $32CD    ; $32C9
                inc $6D    ; $32CB
                bne $3290    ; $32CD
                jsr ClearEOL    ; $32CF
                ldy #$00    ; $32D2
                ldx WindowRgt    ; $32D4
                dex    ; $32D6
                stx CH    ; $32D7
                lda #$A1    ; $32D9
                jsr CharOut    ; $32DB
                lda CV    ; $32DE
                cmp WindowTop    ; $32E0
                beq $329F    ; $32E2
                jsr $D03F    ; $32E4
                cmp #$89    ; $32E7
                bne $32C1    ; $32E9
                beq $32C7    ; $32EB
                ldx CH    ; $32ED
                inx    ; $32EF
                cpx WindowRgt    ; $32F0
                bcc $329C    ; $32F2
                lda #$A1    ; $32F4
                jsr CharOut    ; $32F6
                jsr PrintReturn    ; $32F9
                jmp $329F    ; $32FC
;
; === ScrollLineTop ===
                brk    ; $32FF
;
; === ScrollLineBot ===
                brk    ; $3300
;
; === ScrollDir ===
                brk    ; $3301
;
; === ScrollDest ===
                brk    ; $3302
                brk    ; $3303
;
; === Scroll ===
                lda WindowRgt    ; $3304
                lsr    ; $3306
                sta $3303    ; $3307
                lda ScrollDir    ; $330A
                bpl $3337    ; $330D
                lda ScrollDest    ; $330F
                jsr vtab1    ; $3312
                lda BASL    ; $3315
                sta $2A    ; $3317
                lda BASH    ; $3319
                sta $2B    ; $331B
                lda ScrollLineTop    ; $331D
                jsr vtab1    ; $3320
                jsr $335F    ; $3323
                inc ScrollDest    ; $3326
                inc ScrollLineTop    ; $3329
                lda ScrollLineTop    ; $332C
                cmp ScrollLineBot    ; $332F
                bcc $330F    ; $3332
                beq $330F    ; $3334
                rts    ; $3336
                lda ScrollDest    ; $3337
                jsr vtab1    ; $333A
                lda BASL    ; $333D
                sta $2A    ; $333F
                lda BASH    ; $3341
                sta $2B    ; $3343
                lda ScrollLineBot    ; $3345
                jsr vtab1    ; $3348
                jsr $335F    ; $334B
                dec ScrollDest    ; $334E
                dec ScrollLineBot    ; $3351
                bmi $335E    ; $3354
                lda ScrollLineBot    ; $3356
                cmp ScrollLineTop    ; $3359
                bcs $3337    ; $335C
                rts    ; $335E
                ldy #$00    ; $335F
                sty Page2    ; $3361   <== BANK: display page 2 / aux (PAGE2 on)
                lda (BASL),y    ; $3364
                sta ($2A),y    ; $3366
                iny    ; $3368
                cpy $3303    ; $3369
                bcc $3364    ; $336C
                dey    ; $336E
                sty Page1    ; $336F   <== BANK: display page 1 / main (PAGE2 off)
                lda (BASL),y    ; $3372
                sta ($2A),y    ; $3374
                dey    ; $3376
                bpl $3372    ; $3377
                rts    ; $3379
;
; === TV:InsLine ===
                lda CV    ; $337A
;
; === TV:InsLine1 ===
                sta ScrollLineTop    ; $337C
                lda WindowBot    ; $337F
                sec    ; $3381
                sbc #$02    ; $3382
                sta ScrollLineBot    ; $3384
                sta ScrollDest    ; $3387
                inc ScrollDest    ; $338A
                cmp ScrollLineTop    ; $338D
                bcc $339B    ; $3390
                lda WindowRgt    ; $3392
                lsr    ; $3394
                sta $3303    ; $3395
                jsr $3337    ; $3398
                lda ScrollLineTop    ; $339B
                sta CV    ; $339E
                lda #$00    ; $33A0
                sta CH    ; $33A2
                jsr vtab    ; $33A4
                jsr ClearEOL    ; $33A7
                rts    ; $33AA
;
; === TV:DelLine ===
                lda CV    ; $33AB
;
; === TV:DelLine1 ===
                sta ScrollDest    ; $33AD
                sta ScrollLineTop    ; $33B0
                inc ScrollLineTop    ; $33B3
                lda WindowBot    ; $33B6
                sec    ; $33B8
                sbc #$01    ; $33B9
                sta ScrollLineBot    ; $33BB
                cmp ScrollLineTop    ; $33BE
                beq $33CC    ; $33C1
                lda WindowRgt    ; $33C3
                lsr    ; $33C5
                sta $3303    ; $33C6
                jsr $330F    ; $33C9
                lda ScrollLineBot    ; $33CC
                sta CV    ; $33CF
                lda #$00    ; $33D1
                sta CH    ; $33D3
                jsr vtab    ; $33D5
                jsr ClearEOL    ; $33D8
                rts    ; $33DB
;
; === PointToCol ===
                sta $3405    ; $33DC
                jsr BegOfLine    ; $33DF
                ldy #$00    ; $33E2
                sty CH    ; $33E4
                lda CH    ; $33E6
                cmp $3405    ; $33E8
                bcs $3402    ; $33EB
                jsr $D01B    ; $33ED
                cmp #$8D    ; $33F0
                beq $3402    ; $33F2
                jsr GetXCharLen    ; $33F4
                jsr BumpXPos    ; $33F7
                jsr PointForward    ; $33FA
                bne $3404    ; $33FD
                jmp $33E6    ; $33FF
                lda #$00    ; $3402
                rts    ; $3404
                brk    ; $3405
;
; === GoalColumn ===
                brk    ; $3406
                brk    ; $3407
;
; === UserGoal ===
                brk    ; $3408
                brk    ; $3409
;
; === GetGoalColumn ===
                lda UserGoal    ; $340A
                ora $3409    ; $340D
                beq $3421    ; $3410
                lda UserGoal    ; $3412
                sta GoalColumn    ; $3415
                lda $3409    ; $3418
                sta $3407    ; $341B
                jmp $3437    ; $341E
                lda GoalColumn    ; $3421
                ora $3407    ; $3424
                bne $3437    ; $3427
                lda TheBuffer    ; $3429
                sta $04    ; $342B
                lda $61    ; $342D
                sta $05    ; $342F
                jsr FindPointCol    ; $3431
                stx GoalColumn    ; $3434
                rts    ; $3437
;
; === NewLineEOB ===
                brk    ; $3438
;
; === DownRealLine ===
                jsr GetArgSign    ; $3439
                bmi UpRealLine    ; $343C
                jsr ZeroArg?    ; $343E
                beq $3462    ; $3441
                jsr GetGoalColumn    ; $3443
                jsr EndOfLine    ; $3446
                jsr PointForward    ; $3449
                bne $3465    ; $344C
                lda GoalColumn    ; $344E
                jsr PointToCol    ; $3451
                lda Argument    ; $3454
                bne $345C    ; $3457
                dec $7A5C    ; $3459
                dec Argument    ; $345C
                jmp $343E    ; $345F
                lda #$01    ; $3462
                rts    ; $3464
                jsr EndMacroExec    ; $3465
                lda NewLineEOB    ; $3468
                beq $3462    ; $346B
                jsr SetGap    ; $346D
                jsr InsertReturn    ; $3470
                jmp $3462    ; $3473
                brk    ; $3476
;
; === UpRealLine ===
                jsr GetArgSign    ; $3477
                bmi DownRealLine    ; $347A
                jsr ZeroArg?    ; $347C
                beq $34A3    ; $347F
                jsr GetGoalColumn    ; $3481
                jsr BegOfLine    ; $3484
                jsr PointBackward    ; $3487
                bne $34A0    ; $348A
                lda GoalColumn    ; $348C
                jsr PointToCol    ; $348F
                lda Argument    ; $3492
                bne $349A    ; $3495
                dec $7A5C    ; $3497
                dec Argument    ; $349A
                jmp $347C    ; $349D
                jsr EndMacroExec    ; $34A0
                lda #$01    ; $34A3
                rts    ; $34A5
;
; === BegOfLine ===
                ldy #$00    ; $34A6
                jsr PointBackward    ; $34A8
                bne $34B7    ; $34AB
                jsr $D01B    ; $34AD
                cmp #$8D    ; $34B0
                bne $34A8    ; $34B2
                jsr PointForward    ; $34B4
                lda #$01    ; $34B7
                rts    ; $34B9
;
; === EndOfLine ===
                jsr PointForward    ; $34BA
                bne $34D0    ; $34BD
                jsr PointBackward    ; $34BF
                ldy #$00    ; $34C2
                jsr $D01B    ; $34C4
                cmp #$8D    ; $34C7
                beq $34D0    ; $34C9
                jsr PointForward    ; $34CB
                beq $34C4    ; $34CE
                lda #$01    ; $34D0
                rts    ; $34D2
;
; === ContextLines ===
        dfb $02        ; $34D3  (data/65C02-bit)
;
; === DownScreen ===
                jsr GetArgSign    ; $34D4
                bmi UpScreen    ; $34D7
                jsr AnyArgument?    ; $34D9
                bne $3512    ; $34DC
                jsr ZeroArg?    ; $34DE
                beq $34F4    ; $34E1
                jsr IncrScreen    ; $34E3
                lda Argument    ; $34E6
                bne $34EE    ; $34E9
                dec $7A5C    ; $34EB
                dec Argument    ; $34EE
                jmp $34DE    ; $34F1
                jsr FindPoint    ; $34F4
                beq $350C    ; $34F7
                lda PageTop    ; $34F9
                sta TheBuffer    ; $34FB
                lda $63    ; $34FD
                sta $61    ; $34FF
                jsr SetGap    ; $3501
                lda TheBuffer    ; $3504
                sta PageTop    ; $3506
                lda $61    ; $3508
                sta $63    ; $350A
                jsr DisplayPage    ; $350C
                lda #$01    ; $350F
                rts    ; $3511
                lda WindowBot    ; $3512
                sec    ; $3514
                sbc ContextLines    ; $3515
                sta CV    ; $3518
                lda WindowLft    ; $351A
                sta CH    ; $351C
                jsr PointToCH    ; $351E
                lda TheBuffer    ; $3521
                cmp BuffBot    ; $3523
                bne $352D    ; $3525
                lda $61    ; $3527
                cmp $69    ; $3529
                beq $3546    ; $352B
                jsr SetGap    ; $352D
                lda #$00    ; $3530
                sta CenterPoint    ; $3532
                jsr CenterPage1    ; $3535
                lda TheBuffer    ; $3538
                sta PageTop    ; $353A
                lda $61    ; $353C
                sta $63    ; $353E
                jsr Home    ; $3540
                lda #$00    ; $3543
                rts    ; $3545
                jsr SetGap    ; $3546
                jmp CenterPage    ; $3549
;
; === UpScreen ===
                jsr GetArgSign    ; $354C
                bpl $3554    ; $354F
                jmp DownScreen    ; $3551
                jsr AnyArgument?    ; $3554
                bne $3587    ; $3557
                jsr ZeroArg?    ; $3559
                beq $356F    ; $355C
                jsr DecrScreen    ; $355E
                lda Argument    ; $3561
                bne $3569    ; $3564
                dec $7A5C    ; $3566
                dec Argument    ; $3569
                jmp $3559    ; $356C
                jsr FindPoint    ; $356F
                beq $3581    ; $3572
                lda WindowBot    ; $3574
                sta CV    ; $3576
                lda WindowLft    ; $3578
                sta CH    ; $357A
                dec CV    ; $357C
                jsr PointToCH    ; $357E
                jsr DisplayPage    ; $3581
                lda #$01    ; $3584
                rts    ; $3586
                lda WindowBot    ; $3587
                sec    ; $3589
                sbc WindowTop    ; $358A
                sbc ContextLines    ; $358C
                pha    ; $358F
                jsr DecrScreen    ; $3590
                pla    ; $3593
                sec    ; $3594
                sbc #$01    ; $3595
                bne $358F    ; $3597
                jsr DisplayPage    ; $3599
                ldx WindowBot    ; $359C
                dex    ; $359E
                stx CV    ; $359F
                lda WindowLft    ; $35A1
                sta CH    ; $35A3
                jsr PointToCH    ; $35A5
                lda #$00    ; $35A8
                rts    ; $35AA
;
; === SetPopMark ===
                jsr AnyArgument?    ; $35AB
                beq $35BC    ; $35AE
                jsr SetGap    ; $35B0
                jsr PushMark    ; $35B3
                jsr SetGap    ; $35B6
                lda #$01    ; $35B9
                rts    ; $35BB
                jsr PopMark    ; $35BC
                jmp $35B6    ; $35BF
;
; === LeftWord ===
                jsr ClrLastKill    ; $35C2
;
; === IN:LeftWord ===
                jsr GetArgSign    ; $35C5
                bmi IN:RightWord    ; $35C8
                jsr ZeroArg?    ; $35CA
                beq $3611    ; $35CD
                ldy #$00    ; $35CF
                jsr PointBackward    ; $35D1
                bne $3611    ; $35D4
                jsr $D01B    ; $35D6
                jsr Separator?    ; $35D9
                beq $35D1    ; $35DC
                jsr PointBackward    ; $35DE
                bne $3611    ; $35E1
                jsr $D01B    ; $35E3
                jsr Separator?    ; $35E6
                bne $35DE    ; $35E9
                ldy #$40    ; $35EB
                lda (BuffData),y    ; $35ED
                ldy #$00    ; $35EF
                and #$10    ; $35F1
                beq $3600    ; $35F3
                jsr $D01B    ; $35F5
                cmp #$C1    ; $35F8
                bcc $3600    ; $35FA
                cmp #$DB    ; $35FC
                bcc $3603    ; $35FE
                jsr PointForward    ; $3600
                lda Argument    ; $3603
                bne $360B    ; $3606
                dec $7A5C    ; $3608
                dec Argument    ; $360B
                jmp $35CA    ; $360E
                jsr SetGap    ; $3611
                lda #$01    ; $3614
                rts    ; $3616
;
; === RightWord ===
                jsr ClrLastKill    ; $3617
;
; === IN:RightWord ===
                jsr GetArgSign    ; $361A
                bmi IN:LeftWord    ; $361D
                jsr ZeroArg?    ; $361F
                beq $365A    ; $3622
                jsr SetGap    ; $3624
                ldy #$01    ; $3627
                jsr $D03F    ; $3629
                dey    ; $362C
                jsr Separator?    ; $362D
                bne $363F    ; $3630
                jsr PointForward    ; $3632
                bne $365A    ; $3635
                jsr $D01B    ; $3637
                jsr Separator?    ; $363A
                beq $3632    ; $363D
                jsr PointForward    ; $363F
                bne $365A    ; $3642
                jsr $D01B    ; $3644
                jsr Separator?    ; $3647
                bne $363F    ; $364A
                lda Argument    ; $364C
                bne $3654    ; $364F
                dec $7A5C    ; $3651
                dec Argument    ; $3654
                jmp $361F    ; $3657
                jsr SetGap    ; $365A
                lda #$01    ; $365D
                rts    ; $365F
;
; === UpperWord ===
                jsr $3713    ; $3660
                jsr IN:UpperReg    ; $3663
                jsr SetModified    ; $3666
                jsr FindPoint    ; $3669
                beq $3671    ; $366C
                lda #$06    ; $366E
                rts    ; $3670
                lda #$04    ; $3671
                rts    ; $3673
;
; === LowerWord ===
                jsr $3713    ; $3674
                jsr IN:LowerReg    ; $3677
                jmp $3666    ; $367A
;
; === CapWord ===
                jsr $3713    ; $367D
                jsr IN:CapReg    ; $3680
                jmp $3666    ; $3683
;
; === IN:UpperReg ===
                ldy #$00    ; $3686
                jsr EqTempPoint?    ; $3688
                beq $369E    ; $368B
                jsr $D000    ; $368D
                jsr UpperCon    ; $3690
                jsr $D054    ; $3693
                inc $00    ; $3696
                bne $369C    ; $3698
                inc $01    ; $369A
                bne $3688    ; $369C
                rts    ; $369E
;
; === IN:LowerReg ===
                ldy #$00    ; $369F
                jsr EqTempPoint?    ; $36A1
                beq $36B7    ; $36A4
                jsr $D000    ; $36A6
                jsr LowerCon    ; $36A9
                jsr $D054    ; $36AC
                inc $00    ; $36AF
                bne $36B5    ; $36B1
                inc $01    ; $36B3
                bne $36A1    ; $36B5
                rts    ; $36B7
;
; === IN:CapReg ===
                ldy #$00    ; $36B8
                jsr EqTempPoint?    ; $36BA
                beq $36F1    ; $36BD
                jsr $D000    ; $36BF
                jsr Separator?    ; $36C2
                beq $36E9    ; $36C5
                jsr UpperCon    ; $36C7
                jsr $D054    ; $36CA
                inc $00    ; $36CD
                bne $36D3    ; $36CF
                inc $01    ; $36D1
                jsr EqTempPoint?    ; $36D3
                beq $36F1    ; $36D6
                jsr $D000    ; $36D8
                jsr Separator?    ; $36DB
                beq $36BA    ; $36DE
                jsr LowerCon    ; $36E0
                jsr $D054    ; $36E3
                jmp $36CD    ; $36E6
                inc $00    ; $36E9
                bne $36EF    ; $36EB
                inc $01    ; $36ED
                bne $36BA    ; $36EF
                rts    ; $36F1
;
; === EqTempPoint? ===
                lda $00    ; $36F2
                cmp TheBuffer    ; $36F4
                bne $36FC    ; $36F6
                lda $01    ; $36F8
                cmp $61    ; $36FA
                rts    ; $36FC
;
; === UpperCon ===
                cmp #$E1    ; $36FD
                bcc $3707    ; $36FF
                cmp #$FB    ; $3701
                bcs $3707    ; $3703
                and #$DF    ; $3705
                rts    ; $3707
;
; === LowerCon ===
                cmp #$C1    ; $3708
                bcc $3712    ; $370A
                cmp #$DB    ; $370C
                bcs $3712    ; $370E
                adc #$20    ; $3710
                rts    ; $3712
                jsr SetGap    ; $3713
                lda $61    ; $3716
                pha    ; $3718
                lda TheBuffer    ; $3719
                pha    ; $371B
                lda ArgSign    ; $371C
                pha    ; $371F
                jsr IN:RightWord    ; $3720
                pla    ; $3723
                bmi $372F    ; $3724
                pla    ; $3726
                sta $00    ; $3727
                pla    ; $3729
                sta $01    ; $372A
                rts    ; $372C
                brk    ; $372D
                brk    ; $372E
                pla    ; $372F
                sta $00    ; $3730
                pla    ; $3732
                sta $01    ; $3733
                lda $00    ; $3735
                sec    ; $3737
                sbc TheBuffer    ; $3738
                sta $00    ; $373A
                lda $01    ; $373C
                sbc $61    ; $373E
                sta $01    ; $3740
                lda GapBot    ; $3742
                sec    ; $3744
                adc $00    ; $3745
                sta TheBuffer    ; $3747
                lda $6D    ; $3749
                adc $01    ; $374B
                sta $61    ; $374D
                lda $00    ; $374F
                sta $372D    ; $3751
                lda $01    ; $3754
                sta $372E    ; $3756
                jsr SetGap    ; $3759
                lda TheBuffer    ; $375C
                sec    ; $375E
                sbc $00    ; $375F
                sta $00    ; $3761
                lda $61    ; $3763
                sbc $01    ; $3765
                sta $01    ; $3767
                rts    ; $3769
;
; === Separator? ===
                ldx #$00    ; $376A
                sta $37A5    ; $376C
                tya    ; $376F
                pha    ; $3770
                ldy #$40    ; $3771
                lda (BuffData),y    ; $3773
                and #$10    ; $3775
                beq $378C    ; $3777
                lda $37A5    ; $3779
                cmp #$C1    ; $377C
                bcc $378C    ; $377E
                cmp #$DB    ; $3780
                bcs $378C    ; $3782
                pla    ; $3784
                tay    ; $3785
                lda $37A5    ; $3786
                ldx #$00    ; $3789
                rts    ; $378B
                lda (BuffData),y    ; $378C
                and #$01    ; $378E
                beq $3794    ; $3790
                ldx #$03    ; $3792
                pla    ; $3794
                tay    ; $3795
                lda $37A5    ; $3796
                cmp $37C9,x    ; $3799
                beq $37A4    ; $379C
                inx    ; $379E
                cpx #$1E    ; $379F
                bcc $3799    ; $37A1
                inx    ; $37A3
                rts    ; $37A4
                brk    ; $37A5
                brk    ; $37A6
;
; === WhiteSpace? ===
                ldx #$00    ; $37A7
                bit $37A6    ; $37A9
                bpl WhiteSpace1    ; $37AC
                inx    ; $37AE
;
; === WhiteSpace1 ===
                cmp $37E4,x    ; $37AF
                beq $37BA    ; $37B2
                inx    ; $37B4
                cpx #$03    ; $37B5
                bcc WhiteSpace1    ; $37B7
                inx    ; $37B9
                rts    ; $37BA
;
; === SentDel? ===
                ldx #$00    ; $37BB
                cmp $37E1,x    ; $37BD
                beq $37C8    ; $37C0
                inx    ; $37C2
                cpx #$03    ; $37C3
                bcc $37BD    ; $37C5
                inx    ; $37C7
                rts    ; $37C8
                lda $BADF    ; $37C9
                ldx #$BB    ; $37CC
        dfb $A7        ; $37CE  (data/65C02-bit)
        dfb $DB        ; $37CF  (data/65C02-bit)
                cmp $FDFB,x    ; $37D0
                tay    ; $37D3
                lda #$AB    ; $37D4
                lda $BEAF,x    ; $37D6
                ldy $A3AC,x    ; $37D9
                ldy $A5    ; $37DC
                tax    ; $37DE
                cpy #$FC    ; $37DF
        dfb $BF        ; $37E1  (data/65C02-bit)
                lda ($AE,x)    ; $37E2
                sta $A089    ; $37E4
;
; === DeleteWord ===
                jsr GetArgSign    ; $37E7
                bpl $37EF    ; $37EA
                jmp RuboutWord    ; $37EC
                jsr $3713    ; $37EF
                lda #$00    ; $37F2
                jsr KillTempPoint    ; $37F4
                lda #$02    ; $37F7
                rts    ; $37F9
;
; === KillTempPoint ===
                jsr GenericKill    ; $37FA
                rts    ; $37FD
;
; === RuboutWord ===
                jsr GetArgSign    ; $37FE
                bpl $3806    ; $3801
                jmp DeleteWord    ; $3803
                lda #$FF    ; $3806
                sta ArgSign    ; $3808
                jsr $3713    ; $380B
                jsr EqTempPoint?    ; $380E
                beq $3823    ; $3811
                lda #$FF    ; $3813
                jsr KillTempPoint    ; $3815
                jsr FindPoint    ; $3818
                beq $3820    ; $381B
                lda #$06    ; $381D
                rts    ; $381F
                lda #$02    ; $3820
                rts    ; $3822
                lda #$00    ; $3823
                rts    ; $3825
;
; === KillLineBk ===
                lda #$FF    ; $3826
                eor ArgSign    ; $3828
                sta ArgSign    ; $382B
;
; === KillLine ===
                jsr AnyArgument?    ; $382E
                beq $3846    ; $3831
                jsr IN:KillLine    ; $3833
                bit ArgSign    ; $3836
                bpl $3843    ; $3839
                jsr FindPoint    ; $383B
                beq $3843    ; $383E
                lda #$06    ; $3840
                rts    ; $3842
                lda #$02    ; $3843
                rts    ; $3845
                jsr ZeroArg?    ; $3846
                beq $3836    ; $3849
                lda DeleteKill?    ; $384B
                sta $386D    ; $384E
                jsr IN:KillLine    ; $3851
                beq $385F    ; $3854
                lda $386D    ; $3856
                sta DeleteKill?    ; $3859
                jsr IN:KillLine    ; $385C
                lda Argument    ; $385F
                bne $3867    ; $3862
                dec $7A5C    ; $3864
                dec Argument    ; $3867
                jmp $3846    ; $386A
                brk    ; $386D
;
; === IN:KillLine ===
                lda ArgSign    ; $386E
                bpl $3876    ; $3871
                jmp $38EE    ; $3873
                jsr SetGap    ; $3876
                lda $61    ; $3879
                pha    ; $387B
                lda TheBuffer    ; $387C
                pha    ; $387E
                jsr EndOfLine    ; $387F
                jsr SetGap    ; $3882
                pla    ; $3885
                sta $00    ; $3886
                pla    ; $3888
                sta $01    ; $3889
                jsr EqTempPoint?    ; $388B
                bne $38B7    ; $388E
                lda GapBot    ; $3890
                clc    ; $3892
                adc #$01    ; $3893
                tax    ; $3895
                lda $6D    ; $3896
                adc #$00    ; $3898
                cmp $69    ; $389A
                bne $38A3    ; $389C
                cpx BuffBot    ; $389E
                bne $38A3    ; $38A0
                rts    ; $38A2
                sta $61    ; $38A3
                inx    ; $38A5
                bne $38AA    ; $38A6
                inc $61    ; $38A8
                stx TheBuffer    ; $38AA
                jsr SetGap    ; $38AC
                lda #$00    ; $38AF
                jsr KillTempPoint    ; $38B1
                lda #$00    ; $38B4
                rts    ; $38B6
                ldy #$00    ; $38B7
                lda $01    ; $38B9
                pha    ; $38BB
                lda $00    ; $38BC
                pha    ; $38BE
                jsr EqTempPoint?    ; $38BF
                beq $38D4    ; $38C2
                jsr $D000    ; $38C4
                jsr WhiteSpace?    ; $38C7
                bne $38E0    ; $38CA
                inc $00    ; $38CC
                bne $38D2    ; $38CE
                inc $01    ; $38D0
                bne $38BF    ; $38D2
                pla    ; $38D4
                sta $00    ; $38D5
                pla    ; $38D7
                sta $01    ; $38D8
                jsr DelTempPoint    ; $38DA
                jmp $3890    ; $38DD
                pla    ; $38E0
                sta $00    ; $38E1
                pla    ; $38E3
                sta $01    ; $38E4
                lda #$00    ; $38E6
                jsr KillTempPoint    ; $38E8
                lda #$FF    ; $38EB
                rts    ; $38ED
                jsr SetGap    ; $38EE
                lda $61    ; $38F1
                pha    ; $38F3
                lda TheBuffer    ; $38F4
                pha    ; $38F6
                jsr BegOfLine    ; $38F7
                lda TheBuffer    ; $38FA
                sta $00    ; $38FC
                lda $61    ; $38FE
                sta $01    ; $3900
                pla    ; $3902
                sta TheBuffer    ; $3903
                pla    ; $3905
                sta $61    ; $3906
                lda $01    ; $3908
                cmp $61    ; $390A
                bcc $3934    ; $390C
                bne $3918    ; $390E
                lda $00    ; $3910
                cmp TheBuffer    ; $3912
                bcc $3934    ; $3914
                beq $3934    ; $3916
                lda $61    ; $3918
                pha    ; $391A
                lda TheBuffer    ; $391B
                pha    ; $391D
                jsr PointBackward    ; $391E
                bne $3939    ; $3921
                jsr BegOfLine    ; $3923
                lda TheBuffer    ; $3926
                sta $00    ; $3928
                lda $61    ; $392A
                sta $01    ; $392C
                pla    ; $392E
                sta TheBuffer    ; $392F
                pla    ; $3931
                sta $61    ; $3932
                lda #$FF    ; $3934
                jsr KillTempPoint    ; $3936
                lda #$00    ; $3939
                rts    ; $393B
;
; === DeleteSpace ===
                dec $37A6    ; $393C
;
; === GenSpaceDel ===
                jsr DelForSpace    ; $393F
                jsr DelBacSpace    ; $3942
                lda #$00    ; $3945
                sta $37A6    ; $3947
                jsr FindPoint    ; $394A
                beq $3952    ; $394D
                lda #$06    ; $394F
                rts    ; $3951
                lda #$02    ; $3952
                rts    ; $3954
;
; === DeleteLines ===
                jsr BlankLine?    ; $3955
                beq $3970    ; $3958
                jsr EndOfLine    ; $395A
                jsr DeleteSpace    ; $395D
                jsr PointForward    ; $3960
                bne $396D    ; $3963
                jsr BlankLine?    ; $3965
                beq $3970    ; $3968
                jsr PointBackward    ; $396A
                lda #$01    ; $396D
                rts    ; $396F
                jsr DelBacSpace    ; $3970
                jsr InsertReturn    ; $3973
                lda $61    ; $3976
                pha    ; $3978
                lda TheBuffer    ; $3979
                pha    ; $397B
                ldy #$00    ; $397C
                jsr PointForward    ; $397E
                bne $398E    ; $3981
                jsr $D01B    ; $3983
                jsr WhiteSpace?    ; $3986
                beq $397E    ; $3989
                jsr BegOfLine    ; $398B
                jsr SetGap    ; $398E
                pla    ; $3991
                sta $00    ; $3992
                pla    ; $3994
                sta $01    ; $3995
                jsr DelTempPoint    ; $3997
                jsr InsertReturn    ; $399A
                lda TheBuffer    ; $399D
                bne $39A3    ; $399F
                dec $61    ; $39A1
                dec TheBuffer    ; $39A3
                jsr FindPoint    ; $39A5
                beq $39AD    ; $39A8
                lda #$06    ; $39AA
                rts    ; $39AC
                lda #$02    ; $39AD
                rts    ; $39AF
                ldx GapBot    ; $39B0
                ldy $6D    ; $39B2
                inx    ; $39B4
                bne $39B8    ; $39B5
                iny    ; $39B7
                cpy $69    ; $39B8
                bcc $39BE    ; $39BA
                cpx BuffBot    ; $39BC
                rts    ; $39BE
;
; === DelForSpace ===
                jsr SetGap    ; $39BF
                jsr $39B0    ; $39C2
                bcs $39D9    ; $39C5
                ldy #$01    ; $39C7
                jsr $D03F    ; $39C9
                jsr WhiteSpace?    ; $39CC
                bne $39D9    ; $39CF
                inc GapBot    ; $39D1
                bne $39D7    ; $39D3
                inc $6D    ; $39D5
                bne $39C2    ; $39D7
                rts    ; $39D9
;
; === DelBacSpace ===
                jsr SetGap    ; $39DA
                ldy #$00    ; $39DD
                lda TheBuffer    ; $39DF
                cmp BuffTop    ; $39E1
                bne $39EB    ; $39E3
                lda $61    ; $39E5
                cmp $67    ; $39E7
                beq $3A01    ; $39E9
                lda TheBuffer    ; $39EB
                bne $39F1    ; $39ED
                dec $61    ; $39EF
                dec TheBuffer    ; $39F1
                jsr $D01B    ; $39F3
                jsr WhiteSpace?    ; $39F6
                beq $39DF    ; $39F9
                inc TheBuffer    ; $39FB
                bne $3A01    ; $39FD
                inc $61    ; $39FF
                lda TheBuffer    ; $3A01
                sta GapTop    ; $3A03
                lda $61    ; $3A05
                sta $6B    ; $3A07
                rts    ; $3A09
;
; === DelTempPoint ===
                lda $00    ; $3A0A
                sta TheBuffer    ; $3A0C
                sta GapTop    ; $3A0E
                lda $01    ; $3A10
                sta $61    ; $3A12
                sta $6B    ; $3A14
                jsr SetGap    ; $3A16
                rts    ; $3A19
                jsr SetGap    ; $3A1A
                lda $61    ; $3A1D
                pha    ; $3A1F
                lda TheBuffer    ; $3A20
                pha    ; $3A22
                lda ArgSign    ; $3A23
                pha    ; $3A26
                jsr IN:RightSent    ; $3A27
                pla    ; $3A2A
                jmp $3724    ; $3A2B
;
; === RightSent ===
                jsr ClrLastKill    ; $3A2E
;
; === IN:RightSent ===
                jsr GetArgSign    ; $3A31
                bmi IN:LeftSent    ; $3A34
                jsr SetGap    ; $3A36
                ldy #$00    ; $3A39
                jsr ZeroArg?    ; $3A3B
                bne $3A46    ; $3A3E
                jsr SetGap    ; $3A40
                lda #$01    ; $3A43
                rts    ; $3A45
                jsr PointForward    ; $3A46
                bne $3A40    ; $3A49
                jsr $D01B    ; $3A4B
                jsr SentDel?    ; $3A4E
                bne $3A46    ; $3A51
                jsr PointForward    ; $3A53
                bne $3A40    ; $3A56
                jsr $D01B    ; $3A58
                jsr WhiteSpace?    ; $3A5B
                bne $3A46    ; $3A5E
                lda Argument    ; $3A60
                bne $3A68    ; $3A63
                dec $7A5C    ; $3A65
                dec Argument    ; $3A68
                jmp $3A3B    ; $3A6B
;
; === LeftSent ===
                jsr ClrLastKill    ; $3A6E
;
; === IN:LeftSent ===
                jsr GetArgSign    ; $3A71
                bmi IN:RightSent    ; $3A74
                jsr SetGap    ; $3A76
                ldy #$00    ; $3A79
                jsr ZeroArg?    ; $3A7B
                bne $3A86    ; $3A7E
                jsr SetGap    ; $3A80
                lda #$01    ; $3A83
                rts    ; $3A85
                jsr PointBackward    ; $3A86
                bne $3A80    ; $3A89
                jsr $D01B    ; $3A8B
                jsr WhiteSpace?    ; $3A8E
                beq $3A86    ; $3A91
                jsr PointBackward    ; $3A93
                bne $3A80    ; $3A96
                jsr $D01B    ; $3A98
                jsr WhiteSpace?    ; $3A9B
                bne $3A93    ; $3A9E
                cmp #$8D    ; $3AA0
                bne $3AB0    ; $3AA2
                jsr PointBackward    ; $3AA4
                jsr $D01B    ; $3AA7
                cmp #$8D    ; $3AAA
                beq $3AC2    ; $3AAC
                bne $3AB8    ; $3AAE
                jsr PointBackward    ; $3AB0
                bne $3A80    ; $3AB3
                jsr $D01B    ; $3AB5
                jsr WhiteSpace?    ; $3AB8
                beq $3AB0    ; $3ABB
                jsr SentDel?    ; $3ABD
                bne $3A93    ; $3AC0
                jsr PointForward    ; $3AC2
                bne $3ACF    ; $3AC5
                jsr $D01B    ; $3AC7
                jsr WhiteSpace?    ; $3ACA
                beq $3AC2    ; $3ACD
                jsr SetGap    ; $3ACF
                lda Argument    ; $3AD2
                bne $3ADA    ; $3AD5
                dec $7A5C    ; $3AD7
                dec Argument    ; $3ADA
                jmp $3A7B    ; $3ADD
;
; === KillSent ===
                jsr GetArgSign    ; $3AE0
                bmi KillSentB    ; $3AE3
                jsr $3A1A    ; $3AE5
                lda #$00    ; $3AE8
                jsr KillTempPoint    ; $3AEA
                lda #$02    ; $3AED
                rts    ; $3AEF
;
; === KillSentB ===
                jsr GetArgSign    ; $3AF0
                bmi KillSent    ; $3AF3
                lda #$FF    ; $3AF5
                sta ArgSign    ; $3AF7
                jsr $3A1A    ; $3AFA
                lda #$FF    ; $3AFD
                jsr KillTempPoint    ; $3AFF
                jsr FindPoint    ; $3B02
                beq $3B0A    ; $3B05
                lda #$06    ; $3B07
                rts    ; $3B09
                lda #$02    ; $3B0A
                rts    ; $3B0C
;
; === BlankLine? ===
                jsr BackToIndent    ; $3B0D
                jsr SetGap    ; $3B10
                jsr $39B0    ; $3B13
                bcs $3B1F    ; $3B16
                ldy #$01    ; $3B18
                jsr $D03F    ; $3B1A
                cmp #$8D    ; $3B1D
                rts    ; $3B1F
;
; === ReadLineHelp ===
        dfb $22        ; $3B20  (data/65C02-bit)
        dfb $3B        ; $3B21  (data/65C02-bit)
                rts    ; $3B22
;
; === ReadArgLine ===
                lda #$D2    ; $3B23
                sta ReadLineHelp    ; $3B25
                lda #$3C    ; $3B28
                sta $3B21    ; $3B2A
;
; === ReadLine ===
                lda #$00    ; $3B2D
;
; === IN:ReadLine ===
                sta CharIndex    ; $3B2F
                lda CH    ; $3B32
                sta ReadLineCH    ; $3B34
                lda CV    ; $3B37
                sta $3F19    ; $3B39
                jsr vtab    ; $3B3C
                jsr TypeLine    ; $3B3F
                jsr BlinkCursor    ; $3B42
                jsr $3B69    ; $3B45
                jmp $3B51    ; $3B48
                jsr Beep    ; $3B4B
                jmp $3B3F    ; $3B4E
                pha    ; $3B51
                txa    ; $3B52
                asl    ; $3B53
                tax    ; $3B54
                lda $3B84,x    ; $3B55
                sta $00    ; $3B58
                lda $3B85,x    ; $3B5A
                sta $01    ; $3B5D
                pla    ; $3B5F
                jsr $3B66    ; $3B60
                jmp $3B3F    ; $3B63
                jmp ($0000)    ; $3B66
                ldx #$00    ; $3B69
                cmp $3B76,x    ; $3B6B
                beq $3B75    ; $3B6E
                inx    ; $3B70
                cpx #$0E    ; $3B71
                bcc $3B6B    ; $3B73
                rts    ; $3B75
                dey    ; $3B76
        dfb $FF        ; $3B77  (data/65C02-bit)
                adc ($8D,x)    ; $3B78
        dfb $87        ; $3B7A  (data/65C02-bit)
                sty $9F95    ; $3B7B
        dfb $BF        ; $3B7E  (data/65C02-bit)
                sta ($99),y    ; $3B7F
        dfb $97        ; $3B81  (data/65C02-bit)
        dfb $9B        ; $3B82  (data/65C02-bit)
                ldy #$A2    ; $3B83
        dfb $3B        ; $3B85  (data/65C02-bit)
                ldx #$3B    ; $3B86
                ldx #$3B    ; $3B88
        dfb $83        ; $3B8A  (data/65C02-bit)
                bit $3C94,x    ; $3B8B
                cmp #$3F    ; $3B8E
                sei    ; $3B90
                bit $3BB1,x    ; $3B91
        dfb $B7        ; $3B94  (data/65C02-bit)
        dfb $3B        ; $3B95  (data/65C02-bit)
        dfb $BB        ; $3B96  (data/65C02-bit)
                bit $3BD1,x    ; $3B97
        dfb $07        ; $3B9A  (data/65C02-bit)
                bit $3D88,x    ; $3B9B
                sta $BC3D    ; $3B9E
        dfb $3B        ; $3BA1  (data/65C02-bit)
                lda CharIndex    ; $3BA2
                beq $3BAD    ; $3BA5
                dec CharIndex    ; $3BA7
                jmp TypeLine    ; $3BAA
                jmp Beep    ; $3BAD
;
; === QuestionH? ===
        dfb $FF        ; $3BB0  (data/65C02-bit)
                ldx CharIndex    ; $3BB1
                jmp (ReadLineHelp)    ; $3BB4
                bit QuestionH?    ; $3BB7
                bmi $3BB1    ; $3BBA
                cmp #$80    ; $3BBC
                bcc $3BAD    ; $3BBE
                ldx CharIndex    ; $3BC0
                cpx #$4F    ; $3BC3
                beq $3BAD    ; $3BC5
                sta $0200,x    ; $3BC7
                jsr CharOut    ; $3BCA
                inc CharIndex    ; $3BCD
                rts    ; $3BD0
                ldy #$01    ; $3BD1
                ldx CharIndex    ; $3BD3
                tya    ; $3BD6
                clc    ; $3BD7
                adc GapBot    ; $3BD8
                sta $3C06    ; $3BDA
                lda $6D    ; $3BDD
                adc #$00    ; $3BDF
                cmp $69    ; $3BE1
                bcc $3BEE    ; $3BE3
                bne $3C00    ; $3BE5
                lda $3C06    ; $3BE7
                cmp BuffBot    ; $3BEA
                bcs $3C00    ; $3BEC
                jsr $D03F    ; $3BEE
                cmp #$8D    ; $3BF1
                beq $3C00    ; $3BF3
                cpx #$4F    ; $3BF5
                bcs $3C00    ; $3BF7
                sta $0200,x    ; $3BF9
                inx    ; $3BFC
                iny    ; $3BFD
                bne $3BD6    ; $3BFE
                stx CharIndex    ; $3C00
                jmp TypeLine    ; $3C03
                brk    ; $3C06
                jsr $3C46    ; $3C07
                jsr $3C4A    ; $3C0A
                lda $61    ; $3C0D
                pha    ; $3C0F
                lda TheBuffer    ; $3C10
                pha    ; $3C12
                jsr $3C46    ; $3C13
                pla    ; $3C16
                sta $00    ; $3C17
                pla    ; $3C19
                sta $01    ; $3C1A
                ldy #$00    ; $3C1C
                ldx CharIndex    ; $3C1E
                lda $00    ; $3C21
                cmp TheBuffer    ; $3C23
                bne $3C2D    ; $3C25
                lda $01    ; $3C27
                cmp $61    ; $3C29
                beq $3C40    ; $3C2B
                jsr $D000    ; $3C2D
                cpx #$4F    ; $3C30
                bcs $3C40    ; $3C32
                sta $0200,x    ; $3C34
                inc $00    ; $3C37
                bne $3C3D    ; $3C39
                inc $01    ; $3C3B
                inx    ; $3C3D
                bne $3C21    ; $3C3E
                stx CharIndex    ; $3C40
                jmp TypeLine    ; $3C43
                ldx #$00    ; $3C46
                beq $3C4C    ; $3C48
                ldx #$FF    ; $3C4A
                lda $7A5C    ; $3C4C
                pha    ; $3C4F
                lda Argument    ; $3C50
                pha    ; $3C53
                lda ArgSign    ; $3C54
                pha    ; $3C57
                stx ArgSign    ; $3C58
                lda #$00    ; $3C5B
                sta $7A5C    ; $3C5D
                lda #$01    ; $3C60
                sta Argument    ; $3C62
                jsr IN:RightWord    ; $3C65
                jsr SetGap    ; $3C68
                pla    ; $3C6B
                sta ArgSign    ; $3C6C
                pla    ; $3C6F
                sta Argument    ; $3C70
                pla    ; $3C73
                sta $7A5C    ; $3C74
                rts    ; $3C77
                lda #$00    ; $3C78
                sta CharIndex    ; $3C7A
                jsr TypeLine    ; $3C7D
                jmp $3BAD    ; $3C80
                ldx CharIndex    ; $3C83
                sta $0200,x    ; $3C86
                pla    ; $3C89
                pla    ; $3C8A
                lda #$00    ; $3C8B
                sta BufferRead    ; $3C8D
                sta FileRead    ; $3C90
                rts    ; $3C93
                lda CharIndex    ; $3C94
                bne $3C78    ; $3C97
                lda #$87    ; $3C99
                jsr CharOut    ; $3C9B
                lda ReadLineCH    ; $3C9E
                sta CH    ; $3CA1
                lda $3F19    ; $3CA3
                sta CV    ; $3CA6
                jsr vtab    ; $3CA8
                lda #$00    ; $3CAB
                sta CharIndex    ; $3CAD
                sta BufferRead    ; $3CB0
                sta FileRead    ; $3CB3
                pla    ; $3CB6
                pla    ; $3CB7
                lda #$FF    ; $3CB8
                rts    ; $3CBA
                jsr BlinkCursor    ; $3CBB
                ldx CharIndex    ; $3CBE
                cpx #$4F    ; $3CC1
                bcs $3CCE    ; $3CC3
                sta $0200,x    ; $3CC5
                inc CharIndex    ; $3CC8
                jmp CharOut    ; $3CCB
                jmp Beep    ; $3CCE
                brk    ; $3CD1
                tsx    ; $3CD2
                stx $3CD1    ; $3CD3
                jsr CloseEchoArea    ; $3CD6
                jsr OpenTypeout    ; $3CD9
                lda #$6C    ; $3CDC
                sta TypeoutAbort    ; $3CDE
                lda #$3D    ; $3CE1
                sta $2A98    ; $3CE3
                jsr PrintMessage    ; $3CE6
                cmp $F5EF,y    ; $3CE9
                ldy #$E1    ; $3CEC
                sbc ($E5)    ; $3CEE
                ldy #$F4    ; $3CF0
                sbc $E9F0,y    ; $3CF2
                inc $A0E7    ; $3CF5
        dfb $F4        ; $3CF8  (data/65C02-bit)
                inx    ; $3CF9
                sbc $A0    ; $3CFA
                sbc ($F2,x)    ; $3CFC
        dfb $E7        ; $3CFE  (data/65C02-bit)
                sbc $ED,x    ; $3CFF
                sbc $EE    ; $3D01
        dfb $F4        ; $3D03  (data/65C02-bit)
                ldy #$F4    ; $3D04
        dfb $EF        ; $3D06  (data/65C02-bit)
                ldy #$E1    ; $3D07
                inc $C1A0    ; $3D09
                cmp $C3C1    ; $3D0C
        dfb $D3        ; $3D0F  (data/65C02-bit)
                ldy #$E3    ; $3D10
        dfb $EF        ; $3D12  (data/65C02-bit)
                sbc $E1ED    ; $3D13
                inc $AEE4    ; $3D16
                sta $D48D    ; $3D19
                inx    ; $3D1C
                sbc $A0    ; $3D1D
        dfb $E3        ; $3D1F  (data/65C02-bit)
        dfb $EF        ; $3D20  (data/65C02-bit)
                sbc $E1ED    ; $3D21
                inc $A0E4    ; $3D24
                sbc #$F3    ; $3D27
                ldy #$00    ; $3D29
                lda CommandVector    ; $3D2B
                sta FunPtr    ; $3D2E
                lda $7835    ; $3D31
                sta $7E96    ; $3D34
                jsr GetFunName    ; $3D37
                bne $3D76    ; $3D3A
                jsr DCIStringOut    ; $3D3C
                jsr PrintMessage    ; $3D3F
        dfb $BB        ; $3D42  (data/65C02-bit)
                ldy #$A0    ; $3D43
                brk    ; $3D45
                jsr DocRef    ; $3D46
                lda WindowLft    ; $3D49
                jsr DCIStringOut1    ; $3D4B
                jsr PrintMessage    ; $3D4E
                ldx $8D8D    ; $3D51
                dec $F7EF    ; $3D54
                ldy #$F4    ; $3D57
                sbc $E5F0,y    ; $3D59
                ldy #$F4    ; $3D5C
                inx    ; $3D5E
                sbc $A0    ; $3D5F
                sbc ($F2,x)    ; $3D61
        dfb $E7        ; $3D63  (data/65C02-bit)
                sbc $ED,x    ; $3D64
                sbc $EE    ; $3D66
        dfb $F4        ; $3D68  (data/65C02-bit)
                ldx: $008D    ; $3D69
                ldx $3CD1    ; $3D6C
                txs    ; $3D6F
                jsr CloseTypeout1    ; $3D70
                jmp OpenEchoArea    ; $3D73
                jsr PrintMessage    ; $3D76
                inc $F4EF    ; $3D79
                ldy #$EE    ; $3D7C
                sbc ($ED,x)    ; $3D7E
                sbc $E4    ; $3D80
                brk    ; $3D82
                jmp $3D4E    ; $3D83
;
; === BufferRead ===
                brk    ; $3D86
;
; === FileRead ===
                brk    ; $3D87
                bit BufferRead    ; $3D88
                bmi $3D95    ; $3D8B
                bit FileRead    ; $3D8D
                bmi $3DA5    ; $3D90
                jmp $3BBC    ; $3D92
                jsr MakeBuffList    ; $3D95
                lda #$00    ; $3D98
                sta CompList    ; $3D9A
                lda #$A5    ; $3D9D
                sta $5988    ; $3D9F
                jmp $3DC4    ; $3DA2
                jsr MakeFileList    ; $3DA5
                lda #$C0    ; $3DA8
                sta CompList    ; $3DAA
                lda #$D1    ; $3DAD
                sta $5988    ; $3DAF
                ldx CharIndex    ; $3DB2
                bne $3DBE    ; $3DB5
                jsr SelfPath    ; $3DB7
                stx CharIndex    ; $3DBA
                inx    ; $3DBD
                jsr BackPath    ; $3DBE
                stx CompOffset    ; $3DC1
                ldx CharIndex    ; $3DC4
                lda #$9B    ; $3DC7
                sta $0200,x    ; $3DC9
                bit RdWrBank1    ; $3DCC   <== BANK: language-card RAM bank 1 (read+write, BIT twice)
                sta UseAuxZP    ; $3DCF   <== BANK: aux zero-page/stack (ALTZP on)
                jsr SI:CompleteSp    ; $3DD2
                jsr GetBank2    ; $3DD5
                sta UseMainZP    ; $3DD8   <== BANK: main zero-page/stack (ALTZP off)
                stx CharIndex    ; $3DDB
                jmp TypeLine    ; $3DDE
;
; === MakeBuffList ===
                ldx #$00    ; $3DE1
                stx $3E35    ; $3DE3
                lda #$00    ; $3DE6
                sta $00    ; $3DE8
                lda #$A5    ; $3DEA
                sta $01    ; $3DEC
                jsr PointToBInfo    ; $3DEE
                ldy #$66    ; $3DF1
                lda (BuffPoint),y    ; $3DF3
                beq $3E2A    ; $3DF5
                ldx #$00    ; $3DF7
                lda (BuffPoint),y    ; $3DF9
                sta ($00,x)    ; $3DFB
                beq $3E08    ; $3DFD
                inc $00    ; $3DFF
                bne $3E05    ; $3E01
                inc $01    ; $3E03
                iny    ; $3E05
                bne $3DF9    ; $3E06
                lda $00    ; $3E08
                bne $3E0E    ; $3E0A
                dec $01    ; $3E0C
                dec $00    ; $3E0E
                lda ($00,x)    ; $3E10
                and #$7F    ; $3E12
                sta ($00,x)    ; $3E14
                lda $00    ; $3E16
                clc    ; $3E18
                adc #$05    ; $3E19
                sta $00    ; $3E1B
                bcc $3E21    ; $3E1D
                inc $01    ; $3E1F
                ldy #$02    ; $3E21
                lda #$00    ; $3E23
                sta ($00),y    ; $3E25
                dey    ; $3E27
                bpl $3E25    ; $3E28
                inc $3E35    ; $3E2A
                ldx $3E35    ; $3E2D
                cpx #$0E    ; $3E30
                bcc $3DEE    ; $3E32
                rts    ; $3E34
                brk    ; $3E35
                brk    ; $3E36
;
; === MakeFileList ===
                ldx CharIndex    ; $3E37
                lda #$8D    ; $3E3A
                sta $0200,x    ; $3E3C
                jsr BackPath    ; $3E3F
                bit $3E36    ; $3E42
                bpl $3E73    ; $3E45
                sta UseAuxZP    ; $3E47   <== BANK: aux zero-page/stack (ALTZP on)
                stx $02    ; $3E4A
                jsr GetBank1    ; $3E4C
                lda #$80    ; $3E4F
                sta $00    ; $3E51
                lda #$D1    ; $3E53
                sta $01    ; $3E55
                ldy $02    ; $3E57
                lda ($00),y    ; $3E59
                bne $3E73    ; $3E5B
                dey    ; $3E5D
                bmi $3E6D    ; $3E5E
                lda $0200,y    ; $3E60
                jsr UpperCon    ; $3E63
                cmp $D180,y    ; $3E66
                bne $3E73    ; $3E69
                beq $3E5D    ; $3E6B
                sta UseMainZP    ; $3E6D   <== BANK: main zero-page/stack (ALTZP off)
                jmp GetBank2    ; $3E70
                sta UseAuxZP    ; $3E73   <== BANK: aux zero-page/stack (ALTZP on)
                jsr GetBank1    ; $3E76
                ldy $02    ; $3E79
                lda #$00    ; $3E7B
                sta ($00),y    ; $3E7D
                dey    ; $3E7F
                bmi $3E8C    ; $3E80
                lda $0200,y    ; $3E82
                jsr UpperCon    ; $3E85
                sta ($00),y    ; $3E88
                bne $3E7F    ; $3E8A
                sty $3E36    ; $3E8C
                sta UseMainZP    ; $3E8F   <== BANK: main zero-page/stack (ALTZP off)
                jsr GetBank2    ; $3E92
                sta UseAuxZP    ; $3E95   <== BANK: aux zero-page/stack (ALTZP on)
                lda #$C0    ; $3E98
                sta $00    ; $3E9A
                lda #$D1    ; $3E9C
                sta $01    ; $3E9E
                sta UseMainZP    ; $3EA0   <== BANK: main zero-page/stack (ALTZP off)
                jsr GetDirInfo    ; $3EA3
                bcs $3EF7    ; $3EA6
                jsr NextFile    ; $3EA8
                bcs $3EF7    ; $3EAB
                lda FileInfo    ; $3EAD
                and #$0F    ; $3EB0
                sta $3F08    ; $3EB2
                sta UseAuxZP    ; $3EB5   <== BANK: aux zero-page/stack (ALTZP on)
                jsr GetBank1    ; $3EB8
                ldy #$00    ; $3EBB
                lda $707F,y    ; $3EBD
                ora #$80    ; $3EC0
                jsr LowerCon    ; $3EC2
                sta ($00),y    ; $3EC5
                iny    ; $3EC7
                cpy $3F08    ; $3EC8
                bcc $3EBD    ; $3ECB
                lda FileInfo    ; $3ECD
                and #$F0    ; $3ED0
                cmp #$D0    ; $3ED2
                bcc $3EDB    ; $3ED4
                lda #$AF    ; $3ED6
                sta ($00),y    ; $3ED8
                iny    ; $3EDA
                dey    ; $3EDB
                lda ($00),y    ; $3EDC
                and #$7F    ; $3EDE
                sta ($00),y    ; $3EE0
                tya    ; $3EE2
                clc    ; $3EE3
                adc #$05    ; $3EE4
                adc $00    ; $3EE6
                sta $00    ; $3EE8
                bcc $3EEE    ; $3EEA
                inc $01    ; $3EEC
                sta UseMainZP    ; $3EEE   <== BANK: main zero-page/stack (ALTZP off)
                jsr GetBank2    ; $3EF1
                jmp $3EA8    ; $3EF4
                sta UseAuxZP    ; $3EF7   <== BANK: aux zero-page/stack (ALTZP on)
                jsr GetBank1    ; $3EFA
                ldy #$00    ; $3EFD
                tya    ; $3EFF
                sta ($00),y    ; $3F00
                sta UseMainZP    ; $3F02   <== BANK: main zero-page/stack (ALTZP off)
                jmp GetBank2    ; $3F05
                brk    ; $3F08
;
; === GetBank1 ===
                bit RdWrBank1    ; $3F09   <== BANK: language-card RAM bank 1 (read+write, BIT twice)
                bit RdWrBank1    ; $3F0C   <== BANK: language-card RAM bank 1 (read+write, BIT twice)
                rts    ; $3F0F
;
; === GetBank2 ===
                bit RdWrBank2    ; $3F10   <== BANK: language-card RAM bank 2 (read+write, BIT twice)
                bit RdWrBank2    ; $3F13   <== BANK: language-card RAM bank 2 (read+write, BIT twice)
                rts    ; $3F16
;
; === MustComplete ===
                brk    ; $3F17
;
; === ReadLineCH ===
                brk    ; $3F18
                brk    ; $3F19
;
; === CommandList ===
        dfb $37        ; $3F1A  (data/65C02-bit)
        dfb $9B        ; $3F1B  (data/65C02-bit)
;
; === CompLineHelp ===
                and ($41)    ; $3F1C
                brk    ; $3F1E
;
; === MetaX ===
                lda CommandList    ; $3F1F
                sta CompList    ; $3F22
                lda $3F1B    ; $3F25
                sta $5988    ; $3F28
                jsr NewEchoArea    ; $3F2B
                jsr AnyArgument?    ; $3F2E
                bne $3F43    ; $3F31
                lda ArgSign    ; $3F33
                bpl $3F3D    ; $3F36
                lda #$AD    ; $3F38
                jsr CharOut    ; $3F3A
                jsr PrintArgument    ; $3F3D
                jsr PrintSpace    ; $3F40
                jsr PrintMessage    ; $3F43
                cmp $D8AD    ; $3F46
                ldy #$00    ; $3F49
                lda #$32    ; $3F4B
                sta CompLineHelp    ; $3F4D
                lda #$41    ; $3F50
                sta $3F1D    ; $3F52
                jsr ReadComplete    ; $3F55
                bne $3F6A    ; $3F58
                jsr FunctionRef    ; $3F5A
                lda $00    ; $3F5D
                sta CommandVector    ; $3F5F
                lda $01    ; $3F62
                sta $7835    ; $3F64
                jmp CallTemp    ; $3F67
                lda #$01    ; $3F6A
                rts    ; $3F6C
;
; === CharIndex ===
                brk    ; $3F6D
                brk    ; $3F6E
                brk    ; $3F6F
;
; === ReadVariable ===
                lda #$5D    ; $3F70
                sta CompList    ; $3F72
                lda #$97    ; $3F75
                sta $5988    ; $3F77
                jsr NewEchoArea    ; $3F7A
                jsr PrintMessage    ; $3F7D
                dec $E1,x    ; $3F80
                sbc ($E9)    ; $3F82
                sbc ($E2,x)    ; $3F84
                cpx $BAE5    ; $3F86
                brk    ; $3F89
                jmp ReadComplete    ; $3F8A
;
; === ReadFunction ===
                lda CommandList    ; $3F8D
                sta CompList    ; $3F90
                lda $3F1B    ; $3F93
                sta $5988    ; $3F96
                jsr NewEchoArea    ; $3F99
                jsr PrintMessage    ; $3F9C
                dec $F5    ; $3F9F
                inc $F4E3    ; $3FA1
                sbc #$EF    ; $3FA4
                inc: $00BA    ; $3FA6
;
; === ReadComplete ===
                lda #$FF    ; $3FA9
                sta MustComplete    ; $3FAB
;
; === ReadCompLine ===
                lda CH    ; $3FAE
                sta ReadLineCH    ; $3FB0
                lda CV    ; $3FB3
                sta $3F19    ; $3FB5
                lda #$00    ; $3FB8
                sta CharIndex    ; $3FBA
                sta $3F6E    ; $3FBD
                jsr BlinkCursor    ; $3FC0
                jsr $3FE9    ; $3FC3
                jmp $3FC0    ; $3FC6
;
; === TypeLine ===
                lda ReadLineCH    ; $3FC9
                sta CH    ; $3FCC
                lda $3F19    ; $3FCE
                sta CV    ; $3FD1
                jsr vtab    ; $3FD3
                ldx #$00    ; $3FD6
                lda $0200,x    ; $3FD8
                cpx CharIndex    ; $3FDB
                bcs $3FE6    ; $3FDE
                jsr CharOut    ; $3FE0
                inx    ; $3FE3
                bne $3FD8    ; $3FE4
                jmp ClearEOP    ; $3FE6
                ldx #$00    ; $3FE9
                cmp $4007,x    ; $3FEB
                beq $3FF5    ; $3FEE
                inx    ; $3FF0
                cpx #$0C    ; $3FF1
                bcc $3FEB    ; $3FF3
                pha    ; $3FF5
                txa    ; $3FF6
                asl    ; $3FF7
                tax    ; $3FF8
                lda $4013,x    ; $3FF9
                sta $00    ; $3FFC
                lda $4014,x    ; $3FFE
                sta $01    ; $4001
                pla    ; $4003
                jmp CallTemp    ; $4004
        dfb $9B        ; $4007  (data/65C02-bit)
                ldy #$BF    ; $4008
        dfb $9F        ; $400A  (data/65C02-bit)
                dey    ; $400B
        dfb $FF        ; $400C  (data/65C02-bit)
                adc ($87,x)    ; $400D
                sta $8C,x    ; $400F
                sta ($8D),y    ; $4011
                lda $E640,y    ; $4013
                rti    ; $4016
                bit $41    ; $4017
                bit $41    ; $4019
        dfb $8F        ; $401B  (data/65C02-bit)
                rti    ; $401C
        dfb $8F        ; $401D  (data/65C02-bit)
                rti    ; $401E
        dfb $8F        ; $401F  (data/65C02-bit)
                rti    ; $4020
                ror    ; $4021
                rti    ; $4022
        dfb $4B        ; $4023  (data/65C02-bit)
                rti    ; $4024
                cmp #$3F    ; $4025
                eor $40    ; $4027
                pla    ; $4029
        dfb $42        ; $402A  (data/65C02-bit)
                and $C940    ; $402B
                bra $3FC0    ; $402E
                ora ($AE),y    ; $4030
                adc $E03F    ; $4032
        dfb $FF        ; $4035  (data/65C02-bit)
                beq $4042    ; $4036
                sta $0200,x    ; $4038
                inc CharIndex    ; $403B
                jsr CharOut    ; $403E
                rts    ; $4041
                jmp Beep    ; $4042
                jsr BlinkCursor    ; $4045
                jmp $402D    ; $4048
                jsr Beep    ; $404B
                ldx CharIndex    ; $404E
                beq $4067    ; $4051
                dex    ; $4053
                dex    ; $4054
                bmi $405E    ; $4055
                lda $0200,x    ; $4057
                cmp #$9B    ; $405A
                bne $4054    ; $405C
                inx    ; $405E
                stx CharIndex    ; $405F
                bne $4067    ; $4062
                stx $3F6E    ; $4064
                jmp TypeLine    ; $4067
                jsr Beep    ; $406A
                lda #$87    ; $406D
                jsr CharOut    ; $406F
                lda #$FF    ; $4072
                sta $3F6F    ; $4074
                pla    ; $4077
                pla    ; $4078
                lda $01    ; $4079
                pha    ; $407B
                lda $00    ; $407C
                pha    ; $407E
                jsr CloseEchoArea    ; $407F
                pla    ; $4082
                sta $00    ; $4083
                pla    ; $4085
                sta $01    ; $4086
                ldx CharIndex    ; $4088
                lda $3F6F    ; $408B
                rts    ; $408E
                ldx CharIndex    ; $408F
                beq $40B1    ; $4092
                dec CharIndex    ; $4094
                ldx #$00    ; $4097
                lda $0200,x    ; $4099
                cpx CharIndex    ; $409C
                bcs $40A8    ; $409F
                cmp #$9B    ; $40A1
                beq $40AD    ; $40A3
                inx    ; $40A5
                bne $4099    ; $40A6
                lda #$00    ; $40A8
                sta $3F6E    ; $40AA
                jsr TypeLine    ; $40AD
                rts    ; $40B0
                jsr ClearPage    ; $40B1
                lda #$FF    ; $40B4
                jmp $4074    ; $40B6
                bit $3F6E    ; $40B9
                bpl $40C1    ; $40BC
                jmp $402D    ; $40BE
                jsr $425F    ; $40C1
                jsr SI:CompleteMe    ; $40C4
                bne $40EE    ; $40C7
                lda #$FF    ; $40C9
                sta $3F6E    ; $40CB
                lda $00    ; $40CE
                sta $40E4    ; $40D0
                lda $01    ; $40D3
                sta $40E5    ; $40D5
                stx CharIndex    ; $40D8
                jsr $425F    ; $40DB
                inc CharIndex    ; $40DE
                jmp TypeLine    ; $40E1
                brk    ; $40E4
                brk    ; $40E5
                bit $3F6E    ; $40E6
                bpl $40EE    ; $40E9
                jmp $402D    ; $40EB
                jsr $425F    ; $40EE
                jsr SI:CompleteSp    ; $40F1
                beq $410D    ; $40F4
                ldx CharIndex    ; $40F6
                lda #$A0    ; $40F9
                sta $0200,x    ; $40FB
                lda #$9B    ; $40FE
                sta $0201,x    ; $4100
                jsr SI:CompleteSp    ; $4103
                beq $410D    ; $4106
                cpx CharIndex    ; $4108
                beq $411E    ; $410B
                stx CharIndex    ; $410D
                jsr TypeLine    ; $4110
                lda CompCount    ; $4113
                cmp #$01    ; $4116
                bne $411D    ; $4118
                jmp $40B9    ; $411A
                rts    ; $411D
                jsr Beep    ; $411E
                jmp TypeLine    ; $4121
                jmp (CompLineHelp)    ; $4124
                ldx $3F1E    ; $4127
                txs    ; $412A
                jsr CloseTypeout1    ; $412B
                jsr OpenEchoArea    ; $412E
                rts    ; $4131
                tsx    ; $4132
                stx $3F1E    ; $4133
                jsr CloseEchoArea    ; $4136
                jsr OpenTypeout    ; $4139
                lda #$27    ; $413C
                sta TypeoutAbort    ; $413E
                lda #$41    ; $4141
                sta $2A98    ; $4143
                jsr $425F    ; $4146
                jsr SI:CompleteMe    ; $4149
                lda CompCount    ; $414C
                bne $417F    ; $414F
                jsr PrintMessage    ; $4151
        dfb $D4        ; $4154  (data/65C02-bit)
                inx    ; $4155
                sbc $F2    ; $4156
                sbc $A0    ; $4158
                sbc ($F2,x)    ; $415A
                sbc $A0    ; $415C
                inc $A0EF    ; $415E
                beq $4152    ; $4161
        dfb $F3        ; $4163  (data/65C02-bit)
        dfb $F3        ; $4164  (data/65C02-bit)
                sbc #$E2    ; $4165
                cpx $A0E5    ; $4167
        dfb $E3        ; $416A  (data/65C02-bit)
        dfb $EF        ; $416B  (data/65C02-bit)
                sbc $ECF0    ; $416C
                sbc $F4    ; $416F
                sbc #$EF    ; $4171
                inc $AEF3    ; $4173
                sta $2000    ; $4176
                ora $202B,y    ; $4179
                cld    ; $417C
        dfb $57        ; $417D  (data/65C02-bit)
                rts    ; $417E
                cmp #$01    ; $417F
                beq $4186    ; $4181
                jmp $41EA    ; $4183
                jsr PrintMessage    ; $4186
                sta $E8D4    ; $4189
                sbc $A0    ; $418C
        dfb $EF        ; $418E  (data/65C02-bit)
                inc $F9EC    ; $418F
                ldy #$F0    ; $4192
        dfb $EF        ; $4194  (data/65C02-bit)
        dfb $F3        ; $4195  (data/65C02-bit)
        dfb $F3        ; $4196  (data/65C02-bit)
                sbc #$E2    ; $4197
                cpx $A0E5    ; $4199
        dfb $E3        ; $419C  (data/65C02-bit)
        dfb $EF        ; $419D  (data/65C02-bit)
                sbc $ECF0    ; $419E
                sbc $F4    ; $41A1
                sbc #$EF    ; $41A3
                inc $EFA0    ; $41A5
                inc $A0    ; $41A8
        dfb $F7        ; $41AA  (data/65C02-bit)
                inx    ; $41AB
                sbc ($F4,x)    ; $41AC
                ldy #$F9    ; $41AE
        dfb $EF        ; $41B0  (data/65C02-bit)
                sbc $A0,x    ; $41B1
                inx    ; $41B3
                sbc ($F6,x)    ; $41B4
                sbc $A0    ; $41B6
        dfb $F4        ; $41B8  (data/65C02-bit)
                sbc $E5F0,y    ; $41B9
                cpx $A0    ; $41BC
                sbc #$F3    ; $41BE
                tsx    ; $41C0
                sta: $008D    ; $41C1
                jsr PopCompPoint    ; $41C4
                lda PrintCompDoc    ; $41C7
                pha    ; $41CA
                lda CompCount    ; $41CB
                pha    ; $41CE
                jsr DCIStringOut    ; $41CF
                lda #$1E    ; $41D2
                sta CH    ; $41D4
                sta TypeoutCH    ; $41D6
                pla    ; $41D9
                sta CompCount    ; $41DA
                pla    ; $41DD
                sta PrintCompDoc    ; $41DE
                jsr PrintCompDoc    ; $41E1
                jsr PrintReturn    ; $41E4
                jmp $4178    ; $41E7
                jsr PrintMessage    ; $41EA
        dfb $D4        ; $41ED  (data/65C02-bit)
                inx    ; $41EE
                sbc $A0    ; $41EF
                beq $41E2    ; $41F1
        dfb $F3        ; $41F3  (data/65C02-bit)
        dfb $F3        ; $41F4  (data/65C02-bit)
                sbc #$E2    ; $41F5
                cpx $A0E5    ; $41F7
        dfb $E3        ; $41FA  (data/65C02-bit)
        dfb $EF        ; $41FB  (data/65C02-bit)
                sbc $ECF0    ; $41FC
                sbc $F4    ; $41FF
                sbc #$EF    ; $4201
                inc $A0F3    ; $4203
        dfb $EF        ; $4206  (data/65C02-bit)
                inc $A0    ; $4207
        dfb $F7        ; $4209  (data/65C02-bit)
                inx    ; $420A
                sbc ($F4,x)    ; $420B
                ldy #$F9    ; $420D
        dfb $EF        ; $420F  (data/65C02-bit)
                sbc $A0,x    ; $4210
                inx    ; $4212
                sbc ($F6,x)    ; $4213
                sbc $A0    ; $4215
        dfb $F4        ; $4217  (data/65C02-bit)
                sbc $E5F0,y    ; $4218
                cpx $A0    ; $421B
                sbc ($F2,x)    ; $421D
                sbc $BA    ; $421F
                sta: $008D    ; $4221
                lda #$00    ; $4224
                sta $425E    ; $4226
                jsr PopCompPoint    ; $4229
                bne $424C    ; $422C
                jsr DCIStringOut    ; $422E
                lda $425E    ; $4231
                eor #$FF    ; $4234
                sta $425E    ; $4236
                bne $4241    ; $4239
                jsr PrintReturn    ; $423B
                jmp $4229    ; $423E
                lda WindowRgt    ; $4241
                lsr    ; $4243
                sta CH    ; $4244
                sta TypeoutCH    ; $4246
                jmp $4229    ; $4249
                lda $425E    ; $424C
                beq $4254    ; $424F
                jsr PrintReturn    ; $4251
                jsr PrintDone    ; $4254
                jsr CloseTypeout1    ; $4257
                jsr OpenEchoArea    ; $425A
                rts    ; $425D
                brk    ; $425E
                ldx CharIndex    ; $425F
                lda #$9B    ; $4262
                sta $0200,x    ; $4264
                rts    ; $4267
                jsr $425F    ; $4268
                lda $3F6E    ; $426B
                bmi $4281    ; $426E
                jsr SI:CompleteMe    ; $4270
                bne $42A1    ; $4273
                stx CharIndex    ; $4275
                jsr $425F    ; $4278
                jsr PopCompPoint    ; $427B
                jmp $428B    ; $427E
                lda $40E4    ; $4281
                sta $00    ; $4284
                lda $40E5    ; $4286
                sta $01    ; $4289
                lda $01    ; $428B
                pha    ; $428D
                lda $00    ; $428E
                pha    ; $4290
                lda #$FF    ; $4291
                jsr GiveArgs    ; $4293
                pla    ; $4296
                sta $00    ; $4297
                pla    ; $4299
                sta $01    ; $429A
                lda #$00    ; $429C
                jmp $4074    ; $429E
                lda MustComplete    ; $42A1
                bmi $42AA    ; $42A4
                lda #$FF    ; $42A6
                bne $429E    ; $42A8
                jsr Beep    ; $42AA
                rts    ; $42AD
;
; === PushArg ===
                stx CharIndex    ; $42AE
                jsr $425F    ; $42B1
                ldx #$FF    ; $42B4
                ldy #$00    ; $42B6
;
; === GiveArgs ===
                php    ; $42B8
                jsr InitStrArgs    ; $42B9
                plp    ; $42BC
                beq $42D1    ; $42BD
                ldx #$00    ; $42BF
                lda $0200,x    ; $42C1
                cpx CharIndex    ; $42C4
                bcs $42D0    ; $42C7
                cmp #$9B    ; $42C9
                beq $42D1    ; $42CB
                inx    ; $42CD
                bne $42C1    ; $42CE
                rts    ; $42D0
                ldy #$00    ; $42D1
                inx    ; $42D3
                cpx CharIndex    ; $42D4
                beq $42EF    ; $42D7
                inc ArgCount    ; $42D9
                lda $0200,x    ; $42DC
                sta StringArgs,y    ; $42DF
                iny    ; $42E2
                bmi $42F5    ; $42E3
                inx    ; $42E5
                cmp #$9B    ; $42E6
                beq $42D4    ; $42E8
                cpx CharIndex    ; $42EA
                bcc $42DC    ; $42ED
                lda #$9B    ; $42EF
                sta StringArgs,y    ; $42F1
                rts    ; $42F4
                dey    ; $42F5
                bne $42EF    ; $42F6
;
; === BotOfRam ===
                ora ($08,x)    ; $42F8
;
; === TopOfRam ===
        dfb $FF        ; $42FA  (data/65C02-bit)
        dfb $BF        ; $42FB  (data/65C02-bit)
;
; === PointToBInfo ===
                lda #$01    ; $42FC
                sta BuffPoint    ; $42FE
                lda #$08    ; $4300
                sta $5F    ; $4302
                txa    ; $4304
                beq $4315    ; $4305
                lda BuffPoint    ; $4307
                clc    ; $4309
                adc #$84    ; $430A
                sta BuffPoint    ; $430C
                bcc $4312    ; $430E
                inc $5F    ; $4310
                dex    ; $4312
                bne $4307    ; $4313
                rts    ; $4315
;
; === InitBuffers ===
                ldx #$00    ; $4316
                stx $00    ; $4318
                stx LastBuffer    ; $431A
                stx SelectedBuff    ; $431D
                lda #$00    ; $4320
                sta BuffActList,x    ; $4322
                jsr PointToBInfo    ; $4325
                ldy #$00    ; $4328
                tya    ; $432A
                sta (BuffPoint),y    ; $432B
                iny    ; $432D
                cpy #$84    ; $432E
                bcc $432B    ; $4330
                ldy #$12    ; $4332
                lda #$14    ; $4334
                clc    ; $4336
                adc BuffPoint    ; $4337
                sta (BuffPoint),y    ; $4339
                iny    ; $433B
                lda $5F    ; $433C
                adc #$00    ; $433E
                sta (BuffPoint),y    ; $4340
                inc $00    ; $4342
                ldx $00    ; $4344
                cpx #$0E    ; $4346
                bcc $4320    ; $4348
                rts    ; $434A
                brk    ; $434B
                brk    ; $434C
                jsr PointToBInfo    ; $434D
                ldy #$0E    ; $4350
                jsr $4357    ; $4352
                ldy #$10    ; $4355
                lda (BuffPoint),y    ; $4357
                sec    ; $4359
                sbc $434B    ; $435A
                sta (BuffPoint),y    ; $435D
                iny    ; $435F
                lda (BuffPoint),y    ; $4360
                sbc $434C    ; $4362
                sta (BuffPoint),y    ; $4365
                rts    ; $4367
                jsr PointToBInfo    ; $4368
                ldy #$0E    ; $436B
                jsr $4372    ; $436D
                ldy #$10    ; $4370
                lda (BuffPoint),y    ; $4372
                clc    ; $4374
                adc $434B    ; $4375
                sta (BuffPoint),y    ; $4378
                iny    ; $437A
                lda (BuffPoint),y    ; $437B
                adc $434C    ; $437D
                sta (BuffPoint),y    ; $4380
                rts    ; $4382
;
; === LogBuffer ===
                jsr PointToBInfo    ; $4383
                ldy #$06    ; $4386
                lda #$00    ; $4388
                sta (BuffPoint),y    ; $438A
                iny    ; $438C
                sta (BuffPoint),y    ; $438D
                ldy #$00    ; $438F
                jsr $439B    ; $4391
                ldy #$0A    ; $4394
                jsr $439B    ; $4396
                ldy #$02    ; $4399
                sty TheBuffer    ; $439B
                lda (BuffPoint),y    ; $439D
                sec    ; $439F
                ldy #$0E    ; $43A0
                sbc (BuffPoint),y    ; $43A2
                ldy TheBuffer    ; $43A4
                sta (BuffPoint),y    ; $43A6
                iny    ; $43A8
                sty TheBuffer    ; $43A9
                lda (BuffPoint),y    ; $43AB
                ldy #$0F    ; $43AD
                sbc (BuffPoint),y    ; $43AF
                ldy TheBuffer    ; $43B1
                sta (BuffPoint),y    ; $43B3
                rts    ; $43B5
;
; === PhysBuffer ===
                jsr PointToBInfo    ; $43B6
                ldy #$0E    ; $43B9
                lda (BuffPoint),y    ; $43BB
                pha    ; $43BD
                iny    ; $43BE
                lda (BuffPoint),y    ; $43BF
                ldy #$07    ; $43C1
                sta (BuffPoint),y    ; $43C3
                dey    ; $43C5
                pla    ; $43C6
                sta (BuffPoint),y    ; $43C7
                ldy #$00    ; $43C9
                jsr $43D5    ; $43CB
                ldy #$0A    ; $43CE
                jsr $43D5    ; $43D0
                ldy #$02    ; $43D3
                sty TheBuffer    ; $43D5
                lda (BuffPoint),y    ; $43D7
                clc    ; $43D9
                ldy #$0E    ; $43DA
                adc (BuffPoint),y    ; $43DC
                ldy TheBuffer    ; $43DE
                sta (BuffPoint),y    ; $43E0
                iny    ; $43E2
                sty TheBuffer    ; $43E3
                lda (BuffPoint),y    ; $43E5
                ldy #$0F    ; $43E7
                adc (BuffPoint),y    ; $43E9
                ldy TheBuffer    ; $43EB
                sta (BuffPoint),y    ; $43ED
                rts    ; $43EF
;
; === Deselect ===
                jsr KillGap    ; $43F0
                ldx SelectedBuff    ; $43F3
                stx LastBuffer    ; $43F6
                jsr PointToBInfo    ; $43F9
                lda MarkStackPntr    ; $43FC
                sta MarkPnt    ; $43FF
                ldy #$00    ; $4401
                lda: TheBuffer,y    ; $4403
                sta (BuffPoint),y    ; $4406
                iny    ; $4408
                cpy #$12    ; $4409
                bcc $4403    ; $440B
                ldy #$10    ; $440D
                lda GapTop    ; $440F
                sta (BuffPoint),y    ; $4411
                iny    ; $4413
                lda $6B    ; $4414
                sta (BuffPoint),y    ; $4416
                ldy #$56    ; $4418
                ldx #$00    ; $441A
                lda MarkStack,x    ; $441C
                sta (BuffPoint),y    ; $441F
                iny    ; $4421
                inx    ; $4422
                cpx #$10    ; $4423
                bcc $441C    ; $4425
                jsr $4386    ; $4427
                rts    ; $442A
                brk    ; $442B
                cpx SelectedBuff    ; $442C
                bne ForceSelect    ; $442F
                rts    ; $4431
;
; === ForceSelect ===
                clv    ; $4432
                stx $442B    ; $4433
                jmp $4442    ; $4436
                ldx SelectedBuff    ; $4439
                stx $442B    ; $443C
                bit $4431    ; $443F
                bvs $44A9    ; $4442
                bcs $4449    ; $4444
                jmp $452B    ; $4446
                ldx SelectedBuff    ; $4449
                jsr PointToBInfo    ; $444C
                ldy #$10    ; $444F
                lda (BuffPoint),y    ; $4451
                sta $475E    ; $4453
                iny    ; $4456
                lda (BuffPoint),y    ; $4457
                sta $475F    ; $4459
                ldx SelectedBuff    ; $445C
                inx    ; $445F
                jsr PointToBInfo    ; $4460
                ldy #$0E    ; $4463
                lda (BuffPoint),y    ; $4465
                sta $475A    ; $4467
                iny    ; $446A
                lda (BuffPoint),y    ; $446B
                sta $475B    ; $446D
                ldx $442B    ; $4470
                jsr PointToBInfo    ; $4473
                ldy #$10    ; $4476
                lda (BuffPoint),y    ; $4478
                sta $475C    ; $447A
                iny    ; $447D
                lda (BuffPoint),y    ; $447E
                sta $475D    ; $4480
                lda $475A    ; $4483
                sec    ; $4486
                sbc $475E    ; $4487
                sta $434B    ; $448A
                lda $475B    ; $448D
                sbc $475F    ; $4490
                sta $434C    ; $4493
                jsr $4760    ; $4496
                ldx SelectedBuff    ; $4499
                inx    ; $449C
                txa    ; $449D
                pha    ; $449E
                jsr $434D    ; $449F
                pla    ; $44A2
                tax    ; $44A3
                cpx $442B    ; $44A4
                bcc $449C    ; $44A7
                ldx $442B    ; $44A9
                stx SelectedBuff    ; $44AC
                jsr PhysBuffer    ; $44AF
                ldx SelectedBuff    ; $44B2
                inx    ; $44B5
                lda TopOfRam    ; $44B6
                sta $00    ; $44B9
                lda $42FB    ; $44BB
                sta $01    ; $44BE
                cpx #$0E    ; $44C0
                bcs $44D7    ; $44C2
                lda BuffActList,x    ; $44C4
                beq $44D7    ; $44C7
                jsr PointToBInfo    ; $44C9
                ldy #$0E    ; $44CC
                lda (BuffPoint),y    ; $44CE
                sta $00    ; $44D0
                iny    ; $44D2
                lda (BuffPoint),y    ; $44D3
                sta $01    ; $44D5
                ldx SelectedBuff    ; $44D7
                jsr PointToBInfo    ; $44DA
                ldy #$00    ; $44DD
                lda (BuffPoint),y    ; $44DF
                sta: TheBuffer,y    ; $44E1
                iny    ; $44E4
                cpy #$14    ; $44E5
                bcc $44DF    ; $44E7
                ldy #$56    ; $44E9
                ldx #$00    ; $44EB
                lda (BuffPoint),y    ; $44ED
                sta MarkStack,x    ; $44EF
                iny    ; $44F2
                inx    ; $44F3
                cpx #$10    ; $44F4
                bcc $44ED    ; $44F6
                lda MarkPnt    ; $44F8
                sta MarkStackPntr    ; $44FA
                ldx #$FF    ; $44FD
                lda #$02    ; $44FF
                jsr BuffFlagOff?    ; $4501
                beq $4507    ; $4504
                txa    ; $4506
                sta Modified?    ; $4507
                lda $00    ; $450A
                bne $4510    ; $450C
                dec $01    ; $450E
                dec $00    ; $4510
                lda $00    ; $4512
                sta BuffBot    ; $4514
                sta PhysBuffBot    ; $4516
                sta GapBot    ; $4518
                lda $01    ; $451A
                sta $69    ; $451C
                sta $71    ; $451E
                sta $6D    ; $4520
                lda GapBot    ; $4522
                bne $4528    ; $4524
                dec $6D    ; $4526
                dec GapBot    ; $4528
                rts    ; $452A
                ldx SelectedBuff    ; $452B
                inx    ; $452E
                lda TopOfRam    ; $452F
                sta $00    ; $4532
                lda $42FB    ; $4534
                sta $01    ; $4537
                cpx #$0E    ; $4539
                bcs $4558    ; $453B
                lda BuffActList,x    ; $453D
                beq $4558    ; $4540
                jsr PointToBInfo    ; $4542
                ldy #$0E    ; $4545
                lda (BuffPoint),y    ; $4547
                sta $00    ; $4549
                iny    ; $454B
                lda (BuffPoint),y    ; $454C
                sta $01    ; $454E
                lda $00    ; $4550
                bne $4556    ; $4552
                dec $01    ; $4554
                dec $00    ; $4556
                lda $00    ; $4558
                sta $475E    ; $455A
                lda $01    ; $455D
                sta $475F    ; $455F
                ldx SelectedBuff    ; $4562
                jsr PointToBInfo    ; $4565
                ldy #$10    ; $4568
                lda (BuffPoint),y    ; $456A
                sta $475A    ; $456C
                iny    ; $456F
                lda (BuffPoint),y    ; $4570
                sta $475B    ; $4572
                ldx $442B    ; $4575
                jsr PointToBInfo    ; $4578
                ldy #$10    ; $457B
                lda (BuffPoint),y    ; $457D
                sta $475C    ; $457F
                iny    ; $4582
                lda (BuffPoint),y    ; $4583
                sta $475D    ; $4585
                lda $475E    ; $4588
                sec    ; $458B
                sbc $475A    ; $458C
                sta $434B    ; $458F
                lda $475F    ; $4592
                sbc $475B    ; $4595
                sta $434C    ; $4598
                jsr $4796    ; $459B
                ldx SelectedBuff    ; $459E
                txa    ; $45A1
                pha    ; $45A2
                jsr $4368    ; $45A3
                pla    ; $45A6
                tax    ; $45A7
                dex    ; $45A8
                cpx $442B    ; $45A9
                bne $45A1    ; $45AC
                jmp $44A9    ; $45AE
;
; === SelectBuffer ===
                lda #$00    ; $45B1
                beq $45B7    ; $45B3
;
; === SelectNamed ===
                lda #$FF    ; $45B5
                bmi $45E0    ; $45B7
                jsr GetStrArg    ; $45B9
                beq $45D2    ; $45BC
                jsr DefBuffer    ; $45BE
                jsr $4B2A    ; $45C1
        dfb $D3        ; $45C4  (data/65C02-bit)
                sbc $EC    ; $45C5
                sbc $E3    ; $45C7
                stz $F0,x    ; $45C9
                asl WindowLft    ; $45CB
                lda $A929,y    ; $45CD
                ora (TheBuffer,x)    ; $45D0
                lda #$00    ; $45D2
                sta $0200,x    ; $45D4
                txa    ; $45D7
                bne $45E0    ; $45D8
                ldx LastBuffer    ; $45DA
                jmp SI:OpenBuff    ; $45DD
                jsr FindBuffer    ; $45E0
                beq SI:OpenBuff    ; $45E3
                jsr Deselect    ; $45E5
                jmp CreateBuffer    ; $45E8
;
; === SI:OpenBuff ===
                jsr IN:OpenBuff    ; $45EB
                jsr DisplayPage    ; $45EE
                lda #$01    ; $45F1
                rts    ; $45F3
;
; === IN:OpenBuff ===
                jsr SI:SelectB    ; $45F4
                jsr SetGap    ; $45F7
                ldy #$40    ; $45FA
                lda (BuffData),y    ; $45FC
                pha    ; $45FE
                ldy #$3F    ; $45FF
                lda (BuffData),y    ; $4601
                jsr SelectMode    ; $4603
                ldy #$40    ; $4606
                pla    ; $4608
                sta (BuffData),y    ; $4609
                jsr MakeModeLine    ; $460B
                rts    ; $460E
;
; === SI:SelectB ===
                txa    ; $460F
                pha    ; $4610
                jsr ClrLastKill    ; $4611
                pla    ; $4614
                cmp SelectedBuff    ; $4615
                beq $4623    ; $4618
                pha    ; $461A
                jsr Deselect    ; $461B
                pla    ; $461E
                tax    ; $461F
                jsr $442C    ; $4620
                rts    ; $4623
;
; === CreateBuffer ===
                lda SelectedBuff    ; $4624
                sta $472C    ; $4627
                ldy #$3F    ; $462A
                lda (BuffData),y    ; $462C
                sta $472B    ; $462E
                ldx #$00    ; $4631
                stx $472D    ; $4633
                lda BuffActList,x    ; $4636
                ora $472D    ; $4639
                sta $472D    ; $463C
                inx    ; $463F
                cpx #$0E    ; $4640
                bcc $4636    ; $4642
                lda $472D    ; $4644
                bmi $4651    ; $4647
                lda #$00    ; $4649
                sta LastBuffer,x    ; $464B
                dex    ; $464E
                bne $464B    ; $464F
                ldx #$00    ; $4651
                lda BuffActList,x    ; $4653
                bpl $4666    ; $4656
                inx    ; $4658
                cpx #$0E    ; $4659
                bcc $4653    ; $465B
                jsr Beep    ; $465D
                jsr $4439    ; $4660
                lda #$01    ; $4663
                rts    ; $4665
                lda #$FF    ; $4666
                sta BuffActList,x    ; $4668
                stx $472E    ; $466B
                txa    ; $466E
                bne $467E    ; $466F
                lda DefMajor    ; $4671
                sta $472B    ; $4674
                bit $472D    ; $4677
                bpl $468A    ; $467A
                bmi $4684    ; $467C
                dex    ; $467E
                cpx SelectedBuff    ; $467F
                beq $468A    ; $4682
                jsr $442C    ; $4684
                jsr Deselect    ; $4687
                ldx $472E    ; $468A
                bne $4699    ; $468D
                lda BotOfRam    ; $468F
                sta GapTop    ; $4692
                lda $42F9    ; $4694
                sta $6B    ; $4697
                lda GapTop    ; $4699
                sta BuffTop    ; $469B
                sta TheBuffer    ; $469D
                sta PageTop    ; $469F
                sta PhysBuffTop    ; $46A1
                lda $6B    ; $46A3
                sta $67    ; $46A5
                sta $61    ; $46A7
                sta $63    ; $46A9
                sta $6F    ; $46AB
                lda TopOfRam    ; $46AD
                sta $00    ; $46B0
                lda $42FB    ; $46B2
                sta $01    ; $46B5
                ldx $472E    ; $46B7
                inx    ; $46BA
                cpx #$0E    ; $46BB
                beq $46D2    ; $46BD
                lda BuffActList,x    ; $46BF
                beq $46D2    ; $46C2
                jsr PointToBInfo    ; $46C4
                ldy #$0E    ; $46C7
                lda (BuffPoint),y    ; $46C9
                sta $00    ; $46CB
                iny    ; $46CD
                lda (BuffPoint),y    ; $46CE
                sta $01    ; $46D0
                lda $01    ; $46D2
                sta $71    ; $46D4
                sta $6D    ; $46D6
                sta $69    ; $46D8
                lda $00    ; $46DA
                sta PhysBuffBot    ; $46DC
                sta GapBot    ; $46DE
                sta BuffBot    ; $46E0
                lda GapBot    ; $46E2
                bne $46E8    ; $46E4
                dec $6D    ; $46E6
                dec GapBot    ; $46E8
                lda $472C    ; $46EA
                sta LastBuffer    ; $46ED
                ldx $472E    ; $46F0
                stx SelectedBuff    ; $46F3
                jsr PointToBInfo    ; $46F6
                ldy #$00    ; $46F9
                lda: TheBuffer,y    ; $46FB
                sta (BuffPoint),y    ; $46FE
                iny    ; $4700
                cpy #$12    ; $4701
                bcc $46FB    ; $4703
                lda (BuffPoint),y    ; $4705
                sta BuffData    ; $4707
                iny    ; $4709
                lda (BuffPoint),y    ; $470A
                sta $73    ; $470C
                lda #$00    ; $470E
                ldy #$40    ; $4710
                sta (BuffData),y    ; $4712
                ldy #$41    ; $4714
                sta (BuffData),y    ; $4716
                ldy #$00    ; $4718
                sta (BuffData),y    ; $471A
                sta Modified?    ; $471C
                lda $472B    ; $471F
                jsr SelectMode    ; $4722
                jsr $472F    ; $4725
                lda #$06    ; $4728
                rts    ; $472A
                brk    ; $472B
                brk    ; $472C
                brk    ; $472D
                brk    ; $472E
                ldy #$52    ; $472F
                ldx #$00    ; $4731
                lda $0200,x    ; $4733
                beq $4742    ; $4736
                cpx #$1D    ; $4738
                bcs $4742    ; $473A
                sta (BuffData),y    ; $473C
                inx    ; $473E
                iny    ; $473F
                bne $4733    ; $4740
                lda #$00    ; $4742
                sta (BuffData),y    ; $4744
                jsr MakeModeLine    ; $4746
                rts    ; $4749
;
; === RenameBuffer ===
                jsr GetStrArg    ; $474A
                bne $4757    ; $474D
                lda #$00    ; $474F
                sta $0200,x    ; $4751
                jsr $472F    ; $4754
                lda #$01    ; $4757
                rts    ; $4759
                brk    ; $475A
                brk    ; $475B
                brk    ; $475C
                brk    ; $475D
                brk    ; $475E
                brk    ; $475F
                lda $475E    ; $4760
                sta $00    ; $4763
                lda $475F    ; $4765
                sta $01    ; $4768
                lda $475A    ; $476A
                sta $02    ; $476D
                lda $475B    ; $476F
                sta $03    ; $4772
                ldy #$00    ; $4774
                lda $02    ; $4776
                cmp $00    ; $4778
                bne $4782    ; $477A
                lda $03    ; $477C
                cmp $01    ; $477E
                beq $4787    ; $4780
                jsr $47D1    ; $4782
                bne $4788    ; $4785
                rts    ; $4787
                inc $02    ; $4788
                bne $478E    ; $478A
                inc $03    ; $478C
                inc $00    ; $478E
                bne $4794    ; $4790
                inc $01    ; $4792
                bne $4782    ; $4794
                lda $475E    ; $4796
                sta $00    ; $4799
                lda $475F    ; $479B
                sta $01    ; $479E
                lda $475A    ; $47A0
                sta $02    ; $47A3
                lda $475B    ; $47A5
                sta $03    ; $47A8
                ldy #$00    ; $47AA
                lda $02    ; $47AC
                cmp $00    ; $47AE
                bne $47B8    ; $47B0
                lda $03    ; $47B2
                cmp $01    ; $47B4
                beq $47BD    ; $47B6
                jsr $47D1    ; $47B8
                bne $47BE    ; $47BB
                rts    ; $47BD
                lda $02    ; $47BE
                bne $47C4    ; $47C0
                dec $03    ; $47C2
                dec $02    ; $47C4
                lda $00    ; $47C6
                bne $47CC    ; $47C8
                dec $01    ; $47CA
                dec $00    ; $47CC
                jmp $47B8    ; $47CE
                jsr $D009    ; $47D1
                jsr $D054    ; $47D4
                jsr GatherTYI    ; $47D7
                lda $02    ; $47DA
                cmp $475C    ; $47DC
                bne $47E6    ; $47DF
                lda $03    ; $47E1
                cmp $475D    ; $47E3
                rts    ; $47E6
;
; === FindBuffer ===
                ldx #$00    ; $47E7
                stx $4828    ; $47E9
                ldx $4828    ; $47EC
                lda BuffActList,x    ; $47EF
                bpl $481A    ; $47F2
                jsr PointToBInfo    ; $47F4
                ldy #$66    ; $47F7
                ldx #$00    ; $47F9
                lda $0200,x    ; $47FB
                jsr UpperCon    ; $47FE
                sta $4827    ; $4801
                lda (BuffPoint),y    ; $4804
                jsr UpperCon    ; $4806
                cmp $4827    ; $4809
                bne $481A    ; $480C
                inx    ; $480E
                iny    ; $480F
                cmp #$00    ; $4810
                bne $47FB    ; $4812
                ldx $4828    ; $4814
                lda #$00    ; $4817
                rts    ; $4819
                inc $4828    ; $481A
                lda $4828    ; $481D
                cmp #$0E    ; $4820
                bcc $47EC    ; $4822
                lda #$FF    ; $4824
                rts    ; $4826
                brk    ; $4827
                brk    ; $4828
;
; === FindBuffFile ===
                ldx #$00    ; $4829
                stx $4828    ; $482B
                ldx $4828    ; $482E
                lda BuffActList,x    ; $4831
                bpl $4867    ; $4834
                jsr PointToBInfo    ; $4836
                ldx #$00    ; $4839
                ldy #$14    ; $483B
                lda (BuffPoint),y    ; $483D
                bne $484A    ; $483F
                lda $0200,x    ; $4841
                cmp #$8D    ; $4844
                beq $4861    ; $4846
                lda (BuffPoint),y    ; $4848
                jsr UpperCon    ; $484A
                sta $4827    ; $484D
                lda $0200,x    ; $4850
                jsr UpperCon    ; $4853
                cmp $4827    ; $4856
                bne $4867    ; $4859
                iny    ; $485B
                inx    ; $485C
                cpx #$3F    ; $485D
                bcc $483D    ; $485F
                ldx $4828    ; $4861
                lda #$00    ; $4864
                rts    ; $4866
                inc $4828    ; $4867
                lda $4828    ; $486A
                cmp #$0E    ; $486D
                bcc $482E    ; $486F
                lda #$FF    ; $4871
                rts    ; $4873
;
; === ListBuffers ===
                lda #$00    ; $4874
                sta $49A1    ; $4876
                jsr PrepTO    ; $4879
                lda #$A0    ; $487C
                sta PD:Justify    ; $487E
                ldx #$00    ; $4881
                stx $4828    ; $4883
                stx $49A2    ; $4886
                jsr PrintMessage    ; $4889
                ldy #$A0    ; $488C
        dfb $C2        ; $488E  (data/65C02-bit)
                sbc $E6,x    ; $488F
                inc $E5    ; $4891
                sbc ($00)    ; $4893
                lda #$24    ; $4895
                sta CH    ; $4897
                sta TypeoutCH    ; $4899
                jsr PrintMessage    ; $489C
                dec $E9,x    ; $489F
        dfb $F3        ; $48A1  (data/65C02-bit)
                sbc #$F4    ; $48A2
                sbc #$EE    ; $48A4
        dfb $E7        ; $48A6  (data/65C02-bit)
                ldy #$C6    ; $48A7
                sbc #$EC    ; $48A9
                sbc $00    ; $48AB
                lda #$43    ; $48AD
                sta CH    ; $48AF
                sta TypeoutCH    ; $48B1
                jsr PrintMessage    ; $48B4
        dfb $D3        ; $48B7  (data/65C02-bit)
                sbc #$FA    ; $48B8
                sbc $8D    ; $48BA
                sta $AE00    ; $48BC
                plp    ; $48BF
                pha    ; $48C0
                lda BuffActList,x    ; $48C1
                bpl $492B    ; $48C4
                inc $49A1    ; $48C6
                jsr PointToBInfo    ; $48C9
                lda #$A0    ; $48CC
                ldx $4828    ; $48CE
                cpx SelectedBuff    ; $48D1
                bne $48D8    ; $48D4
                lda #$AE    ; $48D6
                jsr CharOut    ; $48D8
                lda #$A0    ; $48DB
                jsr CharOut    ; $48DD
                ldy #$55    ; $48E0
                lda (BuffPoint),y    ; $48E2
                and #$02    ; $48E4
                php    ; $48E6
                lda #$A0    ; $48E7
                plp    ; $48E9
                beq $48EE    ; $48EA
                lda #$AA    ; $48EC
                jsr CharOut    ; $48EE
                lda #$A0    ; $48F1
                jsr CharOut    ; $48F3
                jsr PBuffName1    ; $48F6
                ldy #$66    ; $48F9
                lda #$1E    ; $48FB
                sta CH    ; $48FD
                sta TypeoutCH    ; $48FF
                lda #$A0    ; $4902
                jsr CharOut    ; $4904
                jsr PBuffFile1    ; $4907
                lda #$42    ; $490A
                sta CH    ; $490C
                sta TypeoutCH    ; $490E
                lda #$A0    ; $4911
                jsr CharOut    ; $4913
                ldx $4828    ; $4916
                jsr MySize    ; $4919
                pha    ; $491C
                clc    ; $491D
                adc $49A2    ; $491E
                sta $49A2    ; $4921
                pla    ; $4924
                jsr PrintDec    ; $4925
                jsr PrintReturn    ; $4928
                inc $4828    ; $492B
                lda $4828    ; $492E
                cmp #$0E    ; $4931
                bcc $48BE    ; $4933
                jsr PrintReturn    ; $4935
                lda $49A2    ; $4938
                lsr    ; $493B
                lsr    ; $493C
                tax    ; $493D
                jsr ZeroJustify    ; $493E
                jsr PrintDec    ; $4941
                jsr PrintMessage    ; $4944
        dfb $EB        ; $4947  (data/65C02-bit)
                ldy #$E9    ; $4948
                inc $F5A0    ; $494A
        dfb $F3        ; $494D  (data/65C02-bit)
                sbc $A0    ; $494E
        dfb $E2        ; $4950  (data/65C02-bit)
                sbc: $00A0,y    ; $4951
                lda #$00    ; $4954
                ldx $49A1    ; $4956
                jsr PrintDec    ; $4959
                jsr PrintMessage    ; $495C
                ldy #$E2    ; $495F
                sbc $E6,x    ; $4961
                inc $E5    ; $4963
                sbc ($00)    ; $4965
                ldx $49A1    ; $4967
                dex    ; $496A
                beq $4972    ; $496B
                lda #$F3    ; $496D
                jsr CharOut    ; $496F
                jsr PrintMessage    ; $4972
                ldy: $00A0    ; $4975
                sec    ; $4978
                lda $42FB    ; $4979
                sbc $42F9    ; $497C
                sbc $49A2    ; $497F
                lsr    ; $4982
                lsr    ; $4983
                tax    ; $4984
                lda #$00    ; $4985
                jsr PrintDec    ; $4987
                jsr PrintMessage    ; $498A
        dfb $EB        ; $498D  (data/65C02-bit)
                ldy #$F2    ; $498E
                sbc $ED    ; $4990
                sbc ($E9,x)    ; $4992
                inc $EEE9    ; $4994
        dfb $E7        ; $4997  (data/65C02-bit)
                ldx: $008D    ; $4998
                jsr PrintDone    ; $499B
                jmp UnPrepTO    ; $499E
                brk    ; $49A1
                brk    ; $49A2
                brk    ; $49A3
;
; === MySize ===
                cpx SelectedBuff    ; $49A4
                beq $49B5    ; $49A7
                jsr PointToBInfo    ; $49A9
                ldy #$0A    ; $49AC
                lda (BuffPoint),y    ; $49AE
                tax    ; $49B0
                iny    ; $49B1
                lda (BuffPoint),y    ; $49B2
                rts    ; $49B4
                lda GapTop    ; $49B5
                sec    ; $49B7
                sbc PhysBuffTop    ; $49B8
                tax    ; $49BA
                lda $6B    ; $49BB
                sbc $6F    ; $49BD
                pha    ; $49BF
                lda PhysBuffBot    ; $49C0
                clc    ; $49C2
                sbc GapBot    ; $49C3
                sta $49A3    ; $49C5
                lda $71    ; $49C8
                sbc $6D    ; $49CA
                pha    ; $49CC
                clc    ; $49CD
                txa    ; $49CE
                adc $49A3    ; $49CF
                tax    ; $49D2
                pla    ; $49D3
                sta $49A3    ; $49D4
                pla    ; $49D7
                adc $49A3    ; $49D8
                rts    ; $49DB
;
; === PBuffName ===
                jsr PointToBInfo    ; $49DC
;
; === PBuffName1 ===
                ldy #$66    ; $49DF
;
; === PBuffPoint ===
                lda (BuffPoint),y    ; $49E1
                beq $49EB    ; $49E3
                jsr CharOut    ; $49E5
                iny    ; $49E8
                bne PBuffPoint    ; $49E9
                rts    ; $49EB
;
; === PBuffFile ===
                jsr PointToBInfo    ; $49EC
;
; === PBuffFile1 ===
                ldy #$14    ; $49EF
                bne PBuffPoint    ; $49F1
;
; === IN:KillBuff ===
                jsr SI:SelectB    ; $49F3
;
; === ZapBuff ===
                lda PhysBuffTop    ; $49F6
                sta BuffTop    ; $49F8
                sta GapTop    ; $49FA
                sta TheBuffer    ; $49FC
                sta PageTop    ; $49FE
                lda $6F    ; $4A00
                sta $67    ; $4A02
                sta $6B    ; $4A04
                sta $61    ; $4A06
                sta $63    ; $4A08
                lda PhysBuffBot    ; $4A0A
                sta BuffBot    ; $4A0C
                sta GapBot    ; $4A0E
                lda $71    ; $4A10
                sta $69    ; $4A12
                sta $6D    ; $4A14
                lda GapBot    ; $4A16
                bne $4A1C    ; $4A18
                dec $6D    ; $4A1A
                dec GapBot    ; $4A1C
                rts    ; $4A1E
;
; === KillBuffer ===
                ldx SelectedBuff    ; $4A1F
                stx $4A86    ; $4A22
                jsr GetStrArg    ; $4A25
                beq $4A3C    ; $4A28
                ldx $4A86    ; $4A2A
                jsr $4B2A    ; $4A2D
        dfb $CB        ; $4A30  (data/65C02-bit)
                sbc #$EC    ; $4A31
                jmp ($06F0)    ; $4A33
                jsr Beep    ; $4A36
                lda #$01    ; $4A39
                rts    ; $4A3B
                lda #$00    ; $4A3C
                sta $0200,x    ; $4A3E
                txa    ; $4A41
                bne $4A87    ; $4A42
                jsr NewEchoArea    ; $4A44
                jsr PrintMessage    ; $4A47
        dfb $CB        ; $4A4A  (data/65C02-bit)
                sbc #$EC    ; $4A4B
                cpx $EEE9    ; $4A4D
        dfb $E7        ; $4A50  (data/65C02-bit)
                ldy #$F4    ; $4A51
                inx    ; $4A53
                sbc $A0    ; $4A54
        dfb $E3        ; $4A56  (data/65C02-bit)
                sbc $F2,x    ; $4A57
                sbc ($E5)    ; $4A59
                inc $A0F4    ; $4A5B
        dfb $E2        ; $4A5E  (data/65C02-bit)
                sbc $E6,x    ; $4A5F
                inc $E5    ; $4A61
                sbc ($AE)    ; $4A63
                brk    ; $4A65
                jsr DefBuffer    ; $4A66
                stx $4B82    ; $4A69
                jsr PrintMessage    ; $4A6C
                ldy #$A0    ; $4A6F
        dfb $D3        ; $4A71  (data/65C02-bit)
                sbc $EC    ; $4A72
                sbc $E3    ; $4A74
        dfb $F4        ; $4A76  (data/65C02-bit)
                brk    ; $4A77
                jsr $4B59    ; $4A78
                bne $4A36    ; $4A7B
                lda #$00    ; $4A7D
                sta $0200,x    ; $4A7F
                txa    ; $4A82
                jmp $4AD0    ; $4A83
                brk    ; $4A86
                jsr FindBuffer    ; $4A87
                bne $4A36    ; $4A8A
                cpx $4A86    ; $4A8C
                beq $4A44    ; $4A8F
                stx $4A86    ; $4A91
                cpx SelectedBuff    ; $4A94
                bne $4A9C    ; $4A97
                jmp $4A44    ; $4A99
                cpx LastBuffer    ; $4A9C
                bne $4AA7    ; $4A9F
                lda SelectedBuff    ; $4AA1
                sta LastBuffer    ; $4AA4
                lda LastBuffer    ; $4AA7
                pha    ; $4AAA
                jsr IN:KillBuff    ; $4AAB
                ldx LastBuffer    ; $4AAE
                jsr SI:SelectB    ; $4AB1
                pla    ; $4AB4
                sta LastBuffer    ; $4AB5
                ldx $4A86    ; $4AB8
                lda #$01    ; $4ABB
                sta BuffActList,x    ; $4ABD
                jsr PointToBInfo    ; $4AC0
                lda #$00    ; $4AC3
                ldy #$14    ; $4AC5
                sta (BuffPoint),y    ; $4AC7
                ldy #$66    ; $4AC9
                sta (BuffPoint),y    ; $4ACB
                lda #$01    ; $4ACD
                rts    ; $4ACF
                php    ; $4AD0
                ldx $4A86    ; $4AD1
                jsr IN:KillBuff    ; $4AD4
                plp    ; $4AD7
                bne $4AF5    ; $4AD8
                ldx LastBuffer    ; $4ADA
                jsr PointToBInfo    ; $4ADD
                ldy #$66    ; $4AE0
                ldx #$00    ; $4AE2
                lda (BuffPoint),y    ; $4AE4
                sta $0200,x    ; $4AE6
                iny    ; $4AE9
                inx    ; $4AEA
                cmp #$00    ; $4AEB
                bne $4AE4    ; $4AED
                ldx SelectedBuff    ; $4AEF
                stx LastBuffer    ; $4AF2
                jsr $4AB8    ; $4AF5
                jsr SelectNamed    ; $4AF8
                ldx SelectedBuff    ; $4AFB
                stx LastBuffer    ; $4AFE
                rts    ; $4B01
;
; === DefBuffer ===
                ldx LastBuffer    ; $4B02
                cpx SelectedBuff    ; $4B05
                beq $4B0B    ; $4B08
                rts    ; $4B0A
                stx $B0    ; $4B0B
                ldx LastBuffer    ; $4B0D
                cpx $B0    ; $4B10
                bne $4B26    ; $4B12
                ldx $B0    ; $4B14
                dex    ; $4B16
                bpl $4B1B    ; $4B17
                ldx #$0D    ; $4B19
                cpx $B0    ; $4B1B
                beq $4B26    ; $4B1D
                lda BuffActList,x    ; $4B1F
                bpl $4B16    ; $4B22
                bmi $4B26    ; $4B24
                stx LastBuffer    ; $4B26
                rts    ; $4B29
                stx $4B82    ; $4B2A
                jsr NewEchoArea    ; $4B2D
                lda #$74    ; $4B30
                sta ReadLineHelp    ; $4B32
                lda #$48    ; $4B35
                sta $3B21    ; $4B37
                pla    ; $4B3A
                sta $00    ; $4B3B
                pla    ; $4B3D
                sta $01    ; $4B3E
                ldy #$00    ; $4B40
                inc $00    ; $4B42
                bne $4B48    ; $4B44
                inc $01    ; $4B46
                lda ($00),y    ; $4B48
                pha    ; $4B4A
                ora #$80    ; $4B4B
                jsr CharOut    ; $4B4D
                pla    ; $4B50
                bmi $4B42    ; $4B51
                lda $01    ; $4B53
                pha    ; $4B55
                lda $00    ; $4B56
                pha    ; $4B58
                jsr PrintMessage    ; $4B59
                ldy #$C2    ; $4B5C
                sbc $E6,x    ; $4B5E
                inc $E5    ; $4B60
                sbc ($A0)    ; $4B62
                tay    ; $4B64
                brk    ; $4B65
                ldx $4B82    ; $4B66
                jsr PBuffName    ; $4B69
                jsr PrintMessage    ; $4B6C
                lda #$BA    ; $4B6F
                brk    ; $4B71
                dec BufferRead    ; $4B72
                jsr ReadLine    ; $4B75
                php    ; $4B78
                txa    ; $4B79
                pha    ; $4B7A
                jsr CloseEchoArea    ; $4B7B
                pla    ; $4B7E
                tax    ; $4B7F
                plp    ; $4B80
                rts    ; $4B81
                brk    ; $4B82
;
; === Modified? ===
                brk    ; $4B83
;
; === BuffInsert ===
                pha    ; $4B84
                jsr SetGap    ; $4B85
                inc GapTop    ; $4B88
                bne $4B8E    ; $4B8A
                inc $6B    ; $4B8C
                lda $6B    ; $4B8E
                cmp $6D    ; $4B90
                bcc $4B9C    ; $4B92
                bne $4BB1    ; $4B94
                lda GapTop    ; $4B96
                cmp GapBot    ; $4B98
                bcs $4BB1    ; $4B9A
                pla    ; $4B9C
                jsr $D06F    ; $4B9D
                inc TheBuffer    ; $4BA0
                bne $4BA6    ; $4BA2
                inc $61    ; $4BA4
                bit Modified?    ; $4BA6
                bmi $4BAE    ; $4BA9
                jsr SetModified    ; $4BAB
                lda #$00    ; $4BAE
                rts    ; $4BB0
                pla    ; $4BB1
                lda GapTop    ; $4BB2
                bne $4BB8    ; $4BB4
                dec $6B    ; $4BB6
                dec GapTop    ; $4BB8
                lda #$FF    ; $4BBA
                rts    ; $4BBC
;
; === BuffRubout ===
                jsr SetGap    ; $4BBD
                lda GapTop    ; $4BC0
                cmp BuffTop    ; $4BC2
                bne $4BCC    ; $4BC4
                lda $6B    ; $4BC6
                cmp $67    ; $4BC8
                beq $4C12    ; $4BCA
                lda TheBuffer    ; $4BCC
                bne $4BD2    ; $4BCE
                dec $61    ; $4BD0
                dec TheBuffer    ; $4BD2
                lda GapTop    ; $4BD4
                bne $4BDA    ; $4BD6
                dec $6B    ; $4BD8
                dec GapTop    ; $4BDA
                bit Modified?    ; $4BDC
                bmi $4BE4    ; $4BDF
                jsr SetModified    ; $4BE1
                lda #$00    ; $4BE4
                rts    ; $4BE6
;
; === BuffDelete ===
                jsr SetGap    ; $4BE7
                inc GapBot    ; $4BEA
                bne $4BF0    ; $4BEC
                inc $6D    ; $4BEE
                lda GapBot    ; $4BF0
                cmp BuffBot    ; $4BF2
                bne $4C07    ; $4BF4
                lda $6D    ; $4BF6
                cmp $69    ; $4BF8
                bne $4C07    ; $4BFA
                lda GapBot    ; $4BFC
                bne $4C02    ; $4BFE
                dec $6D    ; $4C00
                dec GapBot    ; $4C02
                jmp $4C12    ; $4C04
                bit Modified?    ; $4C07
                bmi $4C0F    ; $4C0A
                jsr SetModified    ; $4C0C
                lda #$00    ; $4C0F
                rts    ; $4C11
                lda #$FF    ; $4C12
                rts    ; $4C14
;
; === SetLastKill ===
                lda #$04    ; $4C15
;
; === SetBuffFlag ===
                ldy #$41    ; $4C17
                ora (BuffData),y    ; $4C19
                sta (BuffData),y    ; $4C1B
                rts    ; $4C1D
;
; === ClrLastKill ===
                lda #$04    ; $4C1E
;
; === ClrBuffFlag ===
                ldy #$41    ; $4C20
                eor #$FF    ; $4C22
                and (BuffData),y    ; $4C24
                sta (BuffData),y    ; $4C26
                rts    ; $4C28
;
; === OldKill? ===
                lda #$04    ; $4C29
;
; === BuffFlagOn? ===
                jsr BuffFlagOff?    ; $4C2B
                beq $4C33    ; $4C2E
                lda #$00    ; $4C30
                rts    ; $4C32
                iny    ; $4C33
                rts    ; $4C34
;
; === BuffFlagOff? ===
                ldy #$41    ; $4C35
                and (BuffData),y    ; $4C37
                rts    ; $4C39
;
; === SetAModified ===
                bpl ClrModified    ; $4C3A
;
; === SetModified ===
                lda #$02    ; $4C3C
                jsr SetBuffFlag    ; $4C3E
                lda #$FF    ; $4C41
                bmi $4C4C    ; $4C43
;
; === ClrModified ===
                lda #$02    ; $4C45
                jsr ClrBuffFlag    ; $4C47
                lda #$00    ; $4C4A
                sta Modified?    ; $4C4C
                jmp ModeInfo    ; $4C4F
;
; === SetGap ===
                ldy #$00    ; $4C52
                lda $61    ; $4C54
                cmp $6B    ; $4C56
                bcc $4C64    ; $4C58
                bne $4C8A    ; $4C5A
                lda TheBuffer    ; $4C5C
                cmp GapTop    ; $4C5E
                beq $4CBD    ; $4C60
                bcs $4C8A    ; $4C62
                lda GapTop    ; $4C64
                bne $4C6A    ; $4C66
                dec $6B    ; $4C68
                dec GapTop    ; $4C6A
                jsr $D036    ; $4C6C
                jsr $D093    ; $4C6F
                jsr GatherTYI    ; $4C72
                lda GapBot    ; $4C75
                bne $4C7B    ; $4C77
                dec $6D    ; $4C79
                dec GapBot    ; $4C7B
                lda $6B    ; $4C7D
                cmp $61    ; $4C7F
                bne $4C64    ; $4C81
                lda GapTop    ; $4C83
                cmp TheBuffer    ; $4C85
                bne $4C64    ; $4C87
                rts    ; $4C89
                inc GapBot    ; $4C8A
                bne $4C90    ; $4C8C
                inc $6D    ; $4C8E
                lda $6D    ; $4C90
                cmp $61    ; $4C92
                bcc $4C9C    ; $4C94
                lda GapBot    ; $4C96
                cmp TheBuffer    ; $4C98
                bcs $4CAD    ; $4C9A
                jsr $D03F    ; $4C9C
                jsr $D08A    ; $4C9F
                jsr GatherTYI    ; $4CA2
                inc GapTop    ; $4CA5
                bne $4CAB    ; $4CA7
                inc $6B    ; $4CA9
                bne $4C8A    ; $4CAB
                lda GapBot    ; $4CAD
                bne $4CB3    ; $4CAF
                dec $6D    ; $4CB1
                dec GapBot    ; $4CB3
                lda GapTop    ; $4CB5
                sta TheBuffer    ; $4CB7
                lda $6B    ; $4CB9
                sta $61    ; $4CBB
                rts    ; $4CBD
;
; === KillGap ===
                jsr $4CDE    ; $4CBE
                lda $61    ; $4CC1
                pha    ; $4CC3
                lda TheBuffer    ; $4CC4
                pha    ; $4CC6
                lda BuffBot    ; $4CC7
                sta TheBuffer    ; $4CC9
                lda $69    ; $4CCB
                sta $61    ; $4CCD
                jsr SetGap    ; $4CCF
                pla    ; $4CD2
                sta TheBuffer    ; $4CD3
                pla    ; $4CD5
                sta $61    ; $4CD6
                lda #$FF    ; $4CD8
                sta $07F7    ; $4CDA
                rts    ; $4CDD
                lda $07F7    ; $4CDE
                sta $4CD9    ; $4CE1
                lda #$20    ; $4CE4
                sta $07F7    ; $4CE6
                rts    ; $4CE9
;
; === MarkStack ===
                brk    ; $4CEA
                brk    ; $4CEB
                brk    ; $4CEC
                brk    ; $4CED
                brk    ; $4CEE
                brk    ; $4CEF
                brk    ; $4CF0
                brk    ; $4CF1
                brk    ; $4CF2
                brk    ; $4CF3
                brk    ; $4CF4
                brk    ; $4CF5
                brk    ; $4CF6
                brk    ; $4CF7
                brk    ; $4CF8
                brk    ; $4CF9
;
; === MarkStackPntr ===
                brk    ; $4CFA
;
; === PushMark ===
                lda TheBuffer    ; $4CFB
                sta $00    ; $4CFD
                lda $61    ; $4CFF
                sta $01    ; $4D01
;
; === MarkTemp ===
                lda $00    ; $4D03
                sec    ; $4D05
                sbc PhysBuffTop    ; $4D06
                sta $00    ; $4D08
                lda $01    ; $4D0A
                sbc $6F    ; $4D0C
                sta $01    ; $4D0E
;
; === IN:MarkTemp ===
                lda MarkStackPntr    ; $4D10
                asl    ; $4D13
                tax    ; $4D14
                lda $00    ; $4D15
                sta MarkStack,x    ; $4D17
                lda $01    ; $4D1A
                sta $4CEB,x    ; $4D1C
                inc MarkStackPntr    ; $4D1F
                lda MarkStackPntr    ; $4D22
                cmp #$08    ; $4D25
                bcc $4D2E    ; $4D27
                lda #$00    ; $4D29
                sta MarkStackPntr    ; $4D2B
                rts    ; $4D2E
;
; === MarkBuffer ===
                ldx SelectedBuff    ; $4D2F
                jsr MySize    ; $4D32
                sta $01    ; $4D35
                stx $00    ; $4D37
                jsr IN:MarkTemp    ; $4D39
                lda BuffTop    ; $4D3C
                sta TheBuffer    ; $4D3E
                lda $67    ; $4D40
                sta $61    ; $4D42
                jsr SetGap    ; $4D44
                lda #$06    ; $4D47
                rts    ; $4D49
;
; === PopMark ===
                lda $01    ; $4D4A
                pha    ; $4D4C
                lda $00    ; $4D4D
                pha    ; $4D4F
                jsr PopTempMark    ; $4D50
                lda $01    ; $4D53
                cmp $6B    ; $4D55
                bcc $4D8D    ; $4D57
                bne $4D63    ; $4D59
                lda $00    ; $4D5B
                cmp GapTop    ; $4D5D
                bcc $4D8D    ; $4D5F
                beq $4D8D    ; $4D61
                lda $00    ; $4D63
                sec    ; $4D65
                sbc GapTop    ; $4D66
                tax    ; $4D68
                lda $01    ; $4D69
                sbc $6B    ; $4D6B
                pha    ; $4D6D
                txa    ; $4D6E
                sec    ; $4D6F
                adc GapBot    ; $4D70
                sta $00    ; $4D72
                pla    ; $4D74
                adc $6D    ; $4D75
                sta $01    ; $4D77
                cmp $69    ; $4D79
                bcc $4D8D    ; $4D7B
                bne $4D85    ; $4D7D
                lda $00    ; $4D7F
                cmp BuffBot    ; $4D81
                bcc $4D8D    ; $4D83
                lda BuffBot    ; $4D85
                sta $00    ; $4D87
                lda $69    ; $4D89
                sta $01    ; $4D8B
                lda $00    ; $4D8D
                sta TheBuffer    ; $4D8F
                lda $01    ; $4D91
                sta $61    ; $4D93
                pla    ; $4D95
                sta $00    ; $4D96
                pla    ; $4D98
                sta $01    ; $4D99
                rts    ; $4D9B
;
; === PopTempMark ===
                ldx MarkStackPntr    ; $4D9C
                bne $4DA3    ; $4D9F
                ldx #$08    ; $4DA1
                dex    ; $4DA3
                stx MarkStackPntr    ; $4DA4
                txa    ; $4DA7
                asl    ; $4DA8
                tax    ; $4DA9
                lda MarkStack,x    ; $4DAA
                clc    ; $4DAD
                adc PhysBuffTop    ; $4DAE
                sta $00    ; $4DB0
                lda $4CEB,x    ; $4DB2
                adc $6F    ; $4DB5
                sta $01    ; $4DB7
                rts    ; $4DB9
;
; === GetTempMark ===
                jsr PopTempMark    ; $4DBA
                lda $01    ; $4DBD
                pha    ; $4DBF
                lda $00    ; $4DC0
                pha    ; $4DC2
                jsr MarkTemp    ; $4DC3
                pla    ; $4DC6
                sta $00    ; $4DC7
                pla    ; $4DC9
                sta $01    ; $4DCA
                rts    ; $4DCC
;
; === SwapPointMark ===
                lda $61    ; $4DCD
                pha    ; $4DCF
                lda TheBuffer    ; $4DD0
                pha    ; $4DD2
                jsr PopMark    ; $4DD3
                pla    ; $4DD6
                sta $00    ; $4DD7
                pla    ; $4DD9
                sta $01    ; $4DDA
                jsr MarkTemp    ; $4DDC
                rts    ; $4DDF
                brk    ; $4DE0
                cld    ; $4DE1
                brk    ; $4DE2
                cld    ; $4DE3
;
; === DeleteKill? ===
                brk    ; $4DE4
                brk    ; $4DE5
                inc $B0    ; $4DE6
                bne $4DEC    ; $4DE8
                inc $B1    ; $4DEA
                beq $4DFA    ; $4DEC
                lda $B1    ; $4DEE
                cmp #$FF    ; $4DF0
                bcc $4E02    ; $4DF2
                lda $B0    ; $4DF4
                cmp #$F1    ; $4DF6
                bcc $4E02    ; $4DF8
                lda #$00    ; $4DFA
                sta $B0    ; $4DFC
                lda #$D8    ; $4DFE
                sta $B1    ; $4E00
                rts    ; $4E02
                lda $B1    ; $4E03
                cmp #$D8    ; $4E05
                bne $4E17    ; $4E07
                lda $B0    ; $4E09
                cmp #$00    ; $4E0B
                bne $4E17    ; $4E0D
                lda #$F1    ; $4E0F
                sta $B0    ; $4E11
                lda #$FF    ; $4E13
                sta $B1    ; $4E15
                lda $B0    ; $4E17
                bne $4E1D    ; $4E19
                dec $B1    ; $4E1B
                dec $B0    ; $4E1D
                rts    ; $4E1F
                jsr EqTempPoint?    ; $4E20
                bne $4E2C    ; $4E23
                rts    ; $4E25
                jsr EqTempPoint?    ; $4E26
                bne $4E38    ; $4E29
                rts    ; $4E2B
                lda $4DE2    ; $4E2C
                sta $4DE0    ; $4E2F
                lda $4DE3    ; $4E32
                sta $4DE1    ; $4E35
                ldy #$00    ; $4E38
                lda $4DE0    ; $4E3A
                sta $B0    ; $4E3D
                lda $4DE1    ; $4E3F
                sta $B1    ; $4E42
                jsr $D000    ; $4E44
                php    ; $4E47
                sta $4DE5    ; $4E48
                lda $B1    ; $4E4B
                ldx $B0    ; $4E4D
                sta UseAuxZP    ; $4E4F   <== BANK: aux zero-page/stack (ALTZP on)
                sta $B1    ; $4E52
                stx $B0    ; $4E54
                lda $4DE5    ; $4E56
                sta ($B0),y    ; $4E59
                sta UseMainZP    ; $4E5B   <== BANK: main zero-page/stack (ALTZP off)
                plp    ; $4E5E
                jsr $4DE6    ; $4E5F
                lda $B0    ; $4E62
                cmp $4DE2    ; $4E64
                bne $4E82    ; $4E67
                lda $B1    ; $4E69
                cmp $4DE3    ; $4E6B
                bne $4E82    ; $4E6E
                jsr Beep    ; $4E70
                jsr $4E03    ; $4E73
                jsr $4E8D    ; $4E76
                jsr ClrLastKill    ; $4E79
                lda #$FF    ; $4E7C
                sta DeleteKill?    ; $4E7E
                rts    ; $4E81
                inc $00    ; $4E82
                bne $4E88    ; $4E84
                inc $01    ; $4E86
                jsr EqTempPoint?    ; $4E88
                bne $4E44    ; $4E8B
                lda $B0    ; $4E8D
                sta $4DE0    ; $4E8F
                lda $B1    ; $4E92
                sta $4DE1    ; $4E94
                jsr SetLastKill    ; $4E97
                jsr SetModified    ; $4E9A
                rts    ; $4E9D
                lda $4DE1    ; $4E9E
                pha    ; $4EA1
                lda $4DE0    ; $4EA2
                pha    ; $4EA5
                lda TheBuffer    ; $4EA6
                sec    ; $4EA8
                sbc $00    ; $4EA9
                sta $B2    ; $4EAB
                lda $61    ; $4EAD
                sbc $01    ; $4EAF
                sta $B3    ; $4EB1
                lda $4DE2    ; $4EB3
                sta $B0    ; $4EB6
                lda $4DE3    ; $4EB8
                sta $B1    ; $4EBB
                lda $B3    ; $4EBD
                ora $B2    ; $4EBF
                beq $4ED1    ; $4EC1
                lda $B2    ; $4EC3
                bne $4EC9    ; $4EC5
                dec $B3    ; $4EC7
                dec $B2    ; $4EC9
                jsr $4E03    ; $4ECB
                jmp $4EBD    ; $4ECE
                lda $B0    ; $4ED1
                sta $4DE0    ; $4ED3
                sta $4DE2    ; $4ED6
                lda $B1    ; $4ED9
                sta $4DE1    ; $4EDB
                sta $4DE3    ; $4EDE
                jsr $4E38    ; $4EE1
                pla    ; $4EE4
                sta $4DE0    ; $4EE5
                pla    ; $4EE8
                sta $4DE1    ; $4EE9
                rts    ; $4EEC
;
; === YankKill ===
                jsr PushMark    ; $4EED
                lda $4DE2    ; $4EF0
                sta $B0    ; $4EF3
                lda $4DE3    ; $4EF5
                sta $B1    ; $4EF8
                lda $B1    ; $4EFA
                cmp $4DE1    ; $4EFC
                bne $4F19    ; $4EFF
                lda $B0    ; $4F01
                cmp $4DE0    ; $4F03
                bne $4F19    ; $4F06
                jsr ClrLastKill    ; $4F08
                jsr FindPoint    ; $4F0B
                beq $4F13    ; $4F0E
                lda #$06    ; $4F10
                rts    ; $4F12
                jsr DisplayPage    ; $4F13
                lda #$01    ; $4F16
                rts    ; $4F18
                ldy #$00    ; $4F19
                ldx $B0    ; $4F1B
                lda $B1    ; $4F1D
                sta UseAuxZP    ; $4F1F   <== BANK: aux zero-page/stack (ALTZP on)
                sta $B1    ; $4F22
                stx $B0    ; $4F24
                lda ($B0),y    ; $4F26
                sta UseMainZP    ; $4F28   <== BANK: main zero-page/stack (ALTZP off)
                jsr BuffInsert    ; $4F2B
                bne $4F08    ; $4F2E
                jsr $4DE6    ; $4F30
                jmp $4EFA    ; $4F33
;
; === GenericKill ===
                sta $4F7D    ; $4F36
                lda #$04    ; $4F39
                jsr BuffFlagOn?    ; $4F3B
                beq $4F60    ; $4F3E
                lda $01    ; $4F40
                pha    ; $4F42
                lda $00    ; $4F43
                pha    ; $4F45
                jsr $4E20    ; $4F46
                pla    ; $4F49
                sta $00    ; $4F4A
                pla    ; $4F4C
                sta $01    ; $4F4D
                bit DeleteKill?    ; $4F4F
                bmi $4F57    ; $4F52
                jsr DelTempPoint    ; $4F54
                jsr SetLastKill    ; $4F57
                lda #$00    ; $4F5A
                sta DeleteKill?    ; $4F5C
                rts    ; $4F5F
                lda $4F7D    ; $4F60
                bmi $4F71    ; $4F63
                lda $01    ; $4F65
                pha    ; $4F67
                lda $00    ; $4F68
                pha    ; $4F6A
                jsr $4E26    ; $4F6B
                jmp $4F49    ; $4F6E
                lda $01    ; $4F71
                pha    ; $4F73
                lda $00    ; $4F74
                pha    ; $4F76
                jsr $4E9E    ; $4F77
                jmp $4F49    ; $4F7A
                brk    ; $4F7D
;
; === SetNewAppend ===
                jsr SetLastKill    ; $4F7E
                lda #$01    ; $4F81
                rts    ; $4F83
;
; === ComTab ===
                brk    ; $4F84
                brk    ; $4F85
                brk    ; $4F86
                brk    ; $4F87
                brk    ; $4F88
                brk    ; $4F89
                brk    ; $4F8A
                brk    ; $4F8B
                brk    ; $4F8C
                brk    ; $4F8D
                brk    ; $4F8E
                brk    ; $4F8F
                brk    ; $4F90
                brk    ; $4F91
                brk    ; $4F92
                brk    ; $4F93
                brk    ; $4F94
                brk    ; $4F95
                rol CV    ; $4F96
                brk    ; $4F98
                brk    ; $4F99
                ror    ; $4F9A
                asl FlushLibs,x    ; $4F9B
                adc (CV)    ; $4F9E
                cmp: WindowTop,x    ; $4FA0
                brk    ; $4FA3
                jmp WindowBot    ; $4FA4
                brk    ; $4FA7
                beq $4FCD    ; $4FA8
                brk    ; $4FAA
                brk    ; $4FAB
                brk    ; $4FAC
                brk    ; $4FAD
                brk    ; $4FAE
                brk    ; $4FAF
                brk    ; $4FB0
                brk    ; $4FB1
                ror $1F4F,x    ; $4FB2
        dfb $3F        ; $4FB5  (data/65C02-bit)
                brk    ; $4FB6
                brk    ; $4FB7
        dfb $82        ; $4FB8  (data/65C02-bit)
                bpl $4FBB    ; $4FB9
                brk    ; $4FBB
                dec $94,x    ; $4FBC
                brk    ; $4FBE
                brk    ; $4FBF
                brk    ; $4FC0
                brk    ; $4FC1
                brk    ; $4FC2
                brk    ; $4FC3
                brk    ; $4FC4
                brk    ; $4FC5
        dfb $2B        ; $4FC6  (data/65C02-bit)
                bit $00    ; $4FC7
                brk    ; $4FC9
                brk    ; $4FCA
                brk    ; $4FCB
                brk    ; $4FCC
                brk    ; $4FCD
                adc $84,x    ; $4FCE
                bmi $4FF6    ; $4FD0
                brk    ; $4FD2
                brk    ; $4FD3
                brk    ; $4FD4
                brk    ; $4FD5
                brk    ; $4FD6
                brk    ; $4FD7
                brk    ; $4FD8
                brk    ; $4FD9
                sec    ; $4FDA
                bit $00    ; $4FDB
                brk    ; $4FDD
                ora ($7B),y    ; $4FDE
                cmp ($94)    ; $4FE0
                brk    ; $4FE2
                brk    ; $4FE3
                cmp ($7A)    ; $4FE4
                cmp ($7A)    ; $4FE6
                cmp ($7A)    ; $4FE8
                cmp ($7A)    ; $4FEA
                cmp ($7A)    ; $4FEC
                cmp ($7A)    ; $4FEE
                cmp ($7A)    ; $4FF0
                cmp ($7A)    ; $4FF2
                cmp ($7A)    ; $4FF4
                cmp ($7A)    ; $4FF6
                brk    ; $4FF8
                brk    ; $4FF9
                ply    ; $4FFA
                asl GotoTop,x    ; $4FFB
                bcs $4F8D    ; $4FFE
                phy    ; $5000
                inc    ; $5001
                inx    ; $5002
        dfb $7F        ; $5003  (data/65C02-bit)
                brk    ; $5004
                brk    ; $5005
                ror $C23A    ; $5006
                and $7D,x    ; $5009
                rol $E7,x    ; $500B
        dfb $37        ; $500D  (data/65C02-bit)
                rol $173A    ; $500E
                rol $00,x    ; $5011
                brk    ; $5013
                lda WindowTop,x    ; $5014
        dfb $BB        ; $5016  (data/65C02-bit)
                stx: $0000    ; $5017
                cpx #$3A    ; $501A
                stz $36,x    ; $501C
                brk    ; $501E
                brk    ; $501F
                ldx $1E    ; $5020
                inc $91    ; $5022
                stz $C71E,x    ; $5024
        dfb $22        ; $5027  (data/65C02-bit)
                sbc ($17,x)    ; $5028
                dex    ; $502A
        dfb $63        ; $502B  (data/65C02-bit)
                brk    ; $502C
                brk    ; $502D
                rts    ; $502E
                rol $4C,x    ; $502F
                and $92,x    ; $5031
                sta MetaX    ; $5033
                brk    ; $5036
                brk    ; $5037
                brk    ; $5038
                brk    ; $5039
                and $3C22,y    ; $503A
                and DownPara,y    ; $503D
                brk    ; $5040
                brk    ; $5041
                brk    ; $5042
                brk    ; $5043
                brk    ; $5044
                brk    ; $5045
                lsr $3B17,x    ; $5046
        dfb $17        ; $5049  (data/65C02-bit)
        dfb $B7        ; $504A  (data/65C02-bit)
        dfb $1B        ; $504B  (data/65C02-bit)
        dfb $C2        ; $504C  (data/65C02-bit)
        dfb $1B        ; $504D  (data/65C02-bit)
;
; === doc:ExitSafe ===
        dfb $CF        ; $504E  (data/65C02-bit)
                inc $EDA0    ; $504F
                sbc $E1    ; $5052
                inc $A0F3    ; $5054
                beq $504B    ; $5057
        dfb $EF        ; $5059  (data/65C02-bit)
                sbc $F4F0    ; $505A
                ldy #$F4    ; $505D
        dfb $EF        ; $505F  (data/65C02-bit)
                ldy #$F3    ; $5060
                sbc ($F6,x)    ; $5062
                sbc $A0    ; $5064
                sbc $E4EF    ; $5066
                sbc #$E6    ; $5069
                sbc #$E5    ; $506B
                cpx $A0    ; $506D
        dfb $E2        ; $506F  (data/65C02-bit)
                sbc $E6,x    ; $5070
                inc $E5    ; $5072
                sbc ($73)    ; $5074
                brk    ; $5076
                brk    ; $5077
                brk    ; $5078
                brk    ; $5079
                brk    ; $507A
                brk    ; $507B
                brk    ; $507C
                brk    ; $507D
                brk    ; $507E
                brk    ; $507F
                ldx $1B    ; $5080
                inc $AB37,x    ; $5082
                and $A6,x    ; $5085
                bit BuffPoint,x    ; $5087
        dfb $17        ; $5089  (data/65C02-bit)
                brk    ; $508A
                brk    ; $508B
        dfb $87        ; $508C  (data/65C02-bit)
                ora $BA,x    ; $508D
                bit $3B,x    ; $508F
        dfb $17        ; $5091  (data/65C02-bit)
        dfb $F4        ; $5092  (data/65C02-bit)
        dfb $1B        ; $5093  (data/65C02-bit)
                lsr $CC17,x    ; $5094
                asl $C2,x    ; $5097
        dfb $1B        ; $5099  (data/65C02-bit)
                rol $8138    ; $509A
        dfb $17        ; $509D  (data/65C02-bit)
                rol $18    ; $509E
        dfb $C2        ; $50A0  (data/65C02-bit)
        dfb $1B        ; $50A1  (data/65C02-bit)
                ror $B719    ; $50A2
        dfb $1B        ; $50A5  (data/65C02-bit)
                lda ($1B),y    ; $50A6
                adc ($1B),y    ; $50A8
                adc $FA1B,y    ; $50AA
                bit #$1D    ; $50AD
        dfb $7B        ; $50AF  (data/65C02-bit)
        dfb $D4        ; $50B0  (data/65C02-bit)
                bit $9A,x    ; $50B1
                sta ControlX    ; $50B3
                sbc $EB4E    ; $50B6
                inc    ; $50B9
                cmp $1A,x    ; $50BA
                brk    ; $50BC
                brk    ; $50BD
                sei    ; $50BE
                and $DE    ; $50BF
                inc    ; $50C1
                sta ($83),y    ; $50C2
        dfb $9F        ; $50C4  (data/65C02-bit)
        dfb $1F        ; $50C5  (data/65C02-bit)
                dec $CE16    ; $50C6
                asl $CE,x    ; $50C9
                asl $CE,x    ; $50CB
                asl $CE,x    ; $50CD
                asl $CE,x    ; $50CF
                asl $CE,x    ; $50D1
                asl $CE,x    ; $50D3
                asl $CE,x    ; $50D5
                asl $CE,x    ; $50D7
                asl $CE,x    ; $50D9
                asl $CE,x    ; $50DB
                asl $CE,x    ; $50DD
                asl $CE,x    ; $50DF
                asl $CE,x    ; $50E1
                asl $CE,x    ; $50E3
                asl $CE,x    ; $50E5
                asl $CE,x    ; $50E7
                asl $CE,x    ; $50E9
                asl $CE,x    ; $50EB
                asl $CE,x    ; $50ED
                asl $CE,x    ; $50EF
                asl $CE,x    ; $50F1
                asl $CE,x    ; $50F3
                asl $CE,x    ; $50F5
                asl $CE,x    ; $50F7
                asl $CE,x    ; $50F9
                asl $CE,x    ; $50FB
                asl $CE,x    ; $50FD
                asl $CE,x    ; $50FF
                asl $CE,x    ; $5101
                asl $CE,x    ; $5103
                asl $CE,x    ; $5105
                asl $CE,x    ; $5107
                asl $CE,x    ; $5109
                asl $CE,x    ; $510B
                asl $CE,x    ; $510D
                asl $CE,x    ; $510F
                asl $CE,x    ; $5111
                asl $CE,x    ; $5113
                asl $CE,x    ; $5115
                asl $CE,x    ; $5117
                asl $CE,x    ; $5119
                asl $CE,x    ; $511B
                asl $CE,x    ; $511D
                asl $CE,x    ; $511F
                asl $CE,x    ; $5121
                asl $CE,x    ; $5123
                asl $CE,x    ; $5125
                asl $CE,x    ; $5127
                asl $CE,x    ; $5129
                asl $CE,x    ; $512B
                asl $CE,x    ; $512D
                asl $CE,x    ; $512F
                asl $CE,x    ; $5131
                asl $CE,x    ; $5133
                asl $CE,x    ; $5135
                asl $CE,x    ; $5137
                asl $CE,x    ; $5139
                asl $CE,x    ; $513B
                asl $CE,x    ; $513D
                asl $CE,x    ; $513F
                asl $CE,x    ; $5141
                asl $CE,x    ; $5143
                asl $CE,x    ; $5145
                asl $CE,x    ; $5147
                asl $CE,x    ; $5149
                asl $CE,x    ; $514B
                asl $CE,x    ; $514D
                asl $CE,x    ; $514F
                asl $CE,x    ; $5151
                asl $CE,x    ; $5153
                asl $CE,x    ; $5155
                asl $CE,x    ; $5157
                asl $CE,x    ; $5159
                asl $CE,x    ; $515B
                asl $CE,x    ; $515D
                asl $CE,x    ; $515F
                asl $CE,x    ; $5161
                asl $CE,x    ; $5163
                asl $CE,x    ; $5165
                asl $CE,x    ; $5167
                asl $CE,x    ; $5169
                asl $CE,x    ; $516B
                asl $CE,x    ; $516D
                asl $CE,x    ; $516F
                asl $CE,x    ; $5171
                asl $CE,x    ; $5173
                asl $CE,x    ; $5175
                asl $CE,x    ; $5177
                asl $CE,x    ; $5179
                asl $CE,x    ; $517B
                asl $CE,x    ; $517D
                asl $CE,x    ; $517F
                asl $1D,x    ; $5181
                asl WindowLft,x    ; $5183
                and ($7C)    ; $5185
                beq $5194    ; $5187
                jsr ReadFunction    ; $5189
                beq $519E    ; $518C
                jsr Beep    ; $518E
                lda #$01    ; $5191
                rts    ; $5193
                lda #$9B    ; $5194
                sta $0200,x    ; $5196
                jsr SI:CompleteMe    ; $5199
                bne $518E    ; $519C
                jsr $5232    ; $519E
                lda #$B0    ; $51A1
                sta $5231    ; $51A3
                inc $5231    ; $51A6
                lda $5231    ; $51A9
                jsr GetHelpFile    ; $51AC
                bne $51BF    ; $51AF
                jsr $5255    ; $51B1
                bne $51A6    ; $51B4
                jsr $529A    ; $51B6
                jsr DSK:CloseFile    ; $51B9
                jmp $5191    ; $51BC
                jsr OpenTypeout    ; $51BF
                lda $5231    ; $51C2
                cmp #$B1    ; $51C5
                bne $521C    ; $51C7
                jsr PrintMessage    ; $51C9
                sta $E8D4    ; $51CC
                sbc $A0    ; $51CF
                inc $E9    ; $51D1
                cpx $A0E5    ; $51D3
                ldx #$00    ; $51D6
                lda HelpHelpFile,y    ; $51D8
                beq $51E3    ; $51DB
                jsr CharOut    ; $51DD
                iny    ; $51E0
                bne $51D8    ; $51E1
                jsr PrintMessage    ; $51E3
                ldx #$A0    ; $51E6
        dfb $E3        ; $51E8  (data/65C02-bit)
                sbc ($EE,x)    ; $51E9
        dfb $A7        ; $51EB  (data/65C02-bit)
        dfb $F4        ; $51EC  (data/65C02-bit)
                ldy #$E2    ; $51ED
                sbc $A0    ; $51EF
        dfb $EF        ; $51F1  (data/65C02-bit)
                beq $51D9    ; $51F2
                inc $E4E5    ; $51F4
                ldx $A0A0    ; $51F7
        dfb $C3        ; $51FA  (data/65C02-bit)
                inx    ; $51FB
                sbc $E3    ; $51FC
        dfb $EB        ; $51FE  (data/65C02-bit)
                ldy #$A2    ; $51FF
        dfb $D3        ; $5201  (data/65C02-bit)
                sbc $F4F3,y    ; $5202
                sbc $ED    ; $5205
                ldy #$C6    ; $5207
                sbc #$EC    ; $5209
                sbc $F3    ; $520B
                ldy #$D0    ; $520D
                sbc ($F4,x)    ; $520F
                inx    ; $5211
                ldx #$AE    ; $5212
                sta $2000    ; $5214
        dfb $0F        ; $5217  (data/65C02-bit)
        dfb $2B        ; $5218  (data/65C02-bit)
                lda #$01    ; $5219
                rts    ; $521B
                ldy #$00    ; $521C
                lda $0280,y    ; $521E
                beq $5229    ; $5221
                jsr CharOut    ; $5223
                iny    ; $5226
                bpl $521E    ; $5227
                lda #$BF    ; $5229
                jsr CharOut    ; $522B
                jmp $5216    ; $522E
                brk    ; $5231
                lda $00    ; $5232
                sta $5253    ; $5234
                lda $01    ; $5237
                sta $5254    ; $5239
                ldy #$00    ; $523C
                lda ($00),y    ; $523E
                php    ; $5240
                ora #$80    ; $5241
                jsr UpperCon    ; $5243
                sta $0280,y    ; $5246
                iny    ; $5249
                plp    ; $524A
                bmi $523E    ; $524B
                lda #$00    ; $524D
                sta $0280,y    ; $524F
                rts    ; $5252
                brk    ; $5253
                brk    ; $5254
                jsr DSK:ReadByte    ; $5255
                bne $5297    ; $5258
                ora #$80    ; $525A
                cmp #$9B    ; $525C
                bne $5255    ; $525E
                ldy #$00    ; $5260
                sty $0300    ; $5262
                jsr DSK:ReadByte    ; $5265
                bne $5297    ; $5268
                ora #$80    ; $526A
                jsr UpperCon    ; $526C
                ldy $0300    ; $526F
                cmp $0280,y    ; $5272
                bne $5255    ; $5275
                iny    ; $5277
                sty $0300    ; $5278
                lda $0280,y    ; $527B
                bne $5265    ; $527E
                jsr DSK:ReadByte    ; $5280
                bne $5297    ; $5283
                ora #$80    ; $5285
                cmp #$9B    ; $5287
                bne $5255    ; $5289
                jsr DSK:ReadByte    ; $528B
                bne $5297    ; $528E
                ora #$80    ; $5290
                cmp #$9B    ; $5292
                bne $5255    ; $5294
                rts    ; $5296
                lda #$FF    ; $5297
                rts    ; $5299
                jsr OpenTypeout    ; $529A
                lda $5253    ; $529D
                sta $00    ; $52A0
                lda $5254    ; $52A2
                sta $01    ; $52A5
                jsr DCIStringOut    ; $52A7
                jsr DocRef    ; $52AA
                lda #$1E    ; $52AD
                sta TypeoutCH    ; $52AF
                sta CH    ; $52B2
                jsr DCIStringOut1    ; $52B4
                lda #$BA    ; $52B7
                jsr CharOut    ; $52B9
                jsr PrintReturn    ; $52BC
                jsr DSK:ReadByte    ; $52BF
                bne $52D8    ; $52C2
                ora #$80    ; $52C4
                cmp #$8D    ; $52C6
                bne $52DF    ; $52C8
                jsr CharOut    ; $52CA
                jsr DSK:ReadByte    ; $52CD
                bne $52D8    ; $52D0
                ora #$80    ; $52D2
                cmp #$9B    ; $52D4
                bne $52C4    ; $52D6
                jsr PrintDone    ; $52D8
                jsr CloseTypeout    ; $52DB
                rts    ; $52DE
                jsr CharOut    ; $52DF
                jmp $52BF    ; $52E2
;
; === LastPercnt ===
                brk    ; $52E5
;
; === ModeLineCV ===
                trb $7F    ; $52E6
;
; === ModeLineChar ===
                sty scrny    ; $52E8
                ldy CH    ; $52EA
                cpy #$50    ; $52EC
                bcs $52F5    ; $52EE
                sta $D400,y    ; $52F0
                inc CH    ; $52F3
                ldy scrny    ; $52F5
                rts    ; $52F7
;
; === DrawModeLine ===
                lda ModeLineCV    ; $52F8
                jsr vtab1    ; $52FB
                ldy #$00    ; $52FE
                lda $D400,y    ; $5300
                and ModeLineInv    ; $5303
                bmi $5311    ; $5306
                cmp #$20    ; $5308
                bcc $5311    ; $530A
                lda $D400,y    ; $530C
                and #$7F    ; $530F
                jsr StoreChar    ; $5311
                iny    ; $5314
                cpy WindowRgt    ; $5315
                bcc $5300    ; $5317
                jmp vtab    ; $5319
;
; === ModeLineMsg ===
                pla    ; $531C
                sta $00    ; $531D
                pla    ; $531F
                sta $01    ; $5320
                ldy #$00    ; $5322
                inc $00    ; $5324
                bne $532A    ; $5326
                inc $01    ; $5328
                lda ($00),y    ; $532A
                beq $5334    ; $532C
                jsr ModeLineChar    ; $532E
                jmp $5324    ; $5331
                lda $01    ; $5334
                pha    ; $5336
                lda $00    ; $5337
                pha    ; $5339
                rts    ; $533A
;
; === InvModeLine ===
                lda ModeLineInv    ; $533B
                bpl $534B    ; $533E
                lda #$7F    ; $5340
                bit IIcMode?    ; $5342
                bpl $534D    ; $5345
                lda #$3F    ; $5347
                bpl $534D    ; $5349
                lda #$FF    ; $534B
                sta ModeLineInv    ; $534D
                jsr DrawModeLine    ; $5350
                lda #$01    ; $5353
                rts    ; $5355
;
; === InitModeLine ===
                jsr ClearModeLine    ; $5356
                jsr DrawModeLine    ; $5359
                rts    ; $535C
;
; === ClearModeLine ===
                lda #$A0    ; $535D
                ldy #$00    ; $535F
                sta $D400,y    ; $5361
                iny    ; $5364
                cpy #$50    ; $5365
                bcc $5361    ; $5367
                rts    ; $5369
;
; === MajorNames ===
                sbc ($54)    ; $536A
                sbc $0154,x    ; $536C
                eor $07,x    ; $536F
                eor $0B,x    ; $5371
                eor $0C,x    ; $5373
                eor $F2,x    ; $5375
        dfb $54        ; $5377  (data/65C02-bit)
                sbc ($54)    ; $5378
                sbc ($54)    ; $537A
                brk    ; $537C
                brk    ; $537D
;
; === MakeModeLine ===
                jsr ClearModeLine    ; $537E
                lda #$00    ; $5381
                sta CH    ; $5383
                jsr ModeLineMsg    ; $5385
                cmp ($CD,x)    ; $5388
                cmp ($C3,x)    ; $538A
        dfb $D3        ; $538C  (data/65C02-bit)
                ldy #$A8    ; $538D
                brk    ; $538F
                ldy #$41    ; $5390
                lda (BuffData),y    ; $5392
                and #$01    ; $5394
                beq $53A1    ; $5396
                jsr ModeLineMsg    ; $5398
        dfb $DB        ; $539B  (data/65C02-bit)
                cmp ($CF)    ; $539C
                cmp: $00A0,x    ; $539E
                bit MacroDef    ; $53A1
                bpl $53B1    ; $53A4
                lda #$24    ; $53A6
                sta $00    ; $53A8
                lda #$55    ; $53AA
                sta $01    ; $53AC
                jsr TempToMode    ; $53AE
                ldy #$3F    ; $53B1
                lda (BuffData),y    ; $53B3
                asl    ; $53B5
                tax    ; $53B6
                lda MajorNames,x    ; $53B7
                sta $00    ; $53BA
                lda $536B,x    ; $53BC
                sta $01    ; $53BF
                jsr TempToMode    ; $53C1
                jsr PrintMinors    ; $53C4
                jsr ModeLineMsg    ; $53C7
                lda #$00    ; $53CA
                jsr ModeLineMsg    ; $53CC
                ldy #$A0    ; $53CF
        dfb $C2        ; $53D1  (data/65C02-bit)
                sbc $E6,x    ; $53D2
                inc $E5    ; $53D4
                sbc ($BA)    ; $53D6
                brk    ; $53D8
                ldy #$52    ; $53D9
                lda (BuffData),y    ; $53DB
                beq $53E5    ; $53DD
                jsr ModeLineChar    ; $53DF
                iny    ; $53E2
                bne $53DB    ; $53E3
                jsr ModeLineMsg    ; $53E5
                ldy #$A0    ; $53E8
                ldy #$C6    ; $53EA
                sbc #$EC    ; $53EC
                sbc $BA    ; $53EE
                brk    ; $53F0
                ldy #$00    ; $53F1
                lda (BuffData),y    ; $53F3
                beq $5429    ; $53F5
                lda #$A8    ; $53F7
                ldx CH    ; $53F9
                cpx #$43    ; $53FB
                bcs $5429    ; $53FD
                jsr ModeLineChar    ; $53FF
                dey    ; $5402
                sty $5423    ; $5403
                iny    ; $5406
                lda (BuffData),y    ; $5407
                beq $5415    ; $5409
                cmp #$AF    ; $540B
                bne $5412    ; $540D
                sty $5423    ; $540F
                iny    ; $5412
                bne $5407    ; $5413
                ldy $5423    ; $5415
                iny    ; $5418
                lda (BuffData),y    ; $5419
                beq $5424    ; $541B
                jsr ModeLineChar    ; $541D
                iny    ; $5420
                bne $5419    ; $5421
                brk    ; $5423
                lda #$A9    ; $5424
                jsr ModeLineChar    ; $5426
                lda #$43    ; $5429
                sta CH    ; $542B
                jsr ModeLineMsg    ; $542D
                ldy #$A0    ; $5430
                ldy #$AD    ; $5432
                lda $D4A0    ; $5434
        dfb $EF        ; $5437  (data/65C02-bit)
                beq $53DA    ; $5438
                lda: $00AD    ; $543A
                jsr ModeInfo    ; $543D
                rts    ; $5440
;
; === ModeInfo ===
                lda CV    ; $5441
                pha    ; $5443
                lda CH    ; $5444
                pha    ; $5446
                lda #$43    ; $5447
                sta CH    ; $5449
                lda #$02    ; $544B
                jsr BuffFlagOn?    ; $544D
                php    ; $5450
                lda #$AA    ; $5451
                plp    ; $5453
                beq $5458    ; $5454
                lda #$A0    ; $5456
                pha    ; $5458
                lda #$A0    ; $5459
                jsr ModeLineChar    ; $545B
                pla    ; $545E
                jsr ModeLineChar    ; $545F
                lda #$A0    ; $5462
                jsr ModeLineChar    ; $5464
                lda CH    ; $5467
                clc    ; $5469
                adc #$03    ; $546A
                sta CH    ; $546C
                jsr BuffPercent    ; $546E
                tax    ; $5471
                sta LastPercnt    ; $5472
                beq $54AC    ; $5475
                cmp #$64    ; $5477
                bcs $54B6    ; $5479
                lda $2607    ; $547B
                pha    ; $547E
                lda CoutDef    ; $547F
                pha    ; $5482
                lda #$E8    ; $5483
                sta CoutDef    ; $5485
                lda #$52    ; $5488
                sta $2607    ; $548A
                jsr ZeroJustify    ; $548D
                cpx #$0A    ; $5490
                bcs $5499    ; $5492
                jsr PrintSpace    ; $5494
                lda #$00    ; $5497
                jsr PrintDec    ; $5499
                lda #$A5    ; $549C
                jsr CharOut    ; $549E
                pla    ; $54A1
                sta CoutDef    ; $54A2
                pla    ; $54A5
                sta $2607    ; $54A6
                jmp $54BD    ; $54A9
                jsr ModeLineMsg    ; $54AC
        dfb $D4        ; $54AF  (data/65C02-bit)
        dfb $EF        ; $54B0  (data/65C02-bit)
                beq $54B3    ; $54B1
                jmp $54BD    ; $54B3
                jsr ModeLineMsg    ; $54B6
        dfb $C2        ; $54B9  (data/65C02-bit)
        dfb $EF        ; $54BA  (data/65C02-bit)
        dfb $F4        ; $54BB  (data/65C02-bit)
                brk    ; $54BC
                jsr DrawModeLine    ; $54BD
                lda #$3D    ; $54C0
                sta CH    ; $54C2
                lda #$15    ; $54C4
                sta CV    ; $54C6
                jsr vtab    ; $54C8
                lda $2607    ; $54CB
                pha    ; $54CE
                lda CoutDef    ; $54CF
                pha    ; $54D2
                lda #$14    ; $54D3
                sta CoutDef    ; $54D5
                lda #$26    ; $54D8
                sta $2607    ; $54DA
                jsr DSK:ModeTime    ; $54DD
                pla    ; $54E0
                sta CoutDef    ; $54E1
                pla    ; $54E4
                sta $2607    ; $54E5
                pla    ; $54E8
                sta CH    ; $54E9
                pla    ; $54EB
                sta CV    ; $54EC
                jsr vtab    ; $54EE
                rts    ; $54F1
                lsr $75    ; $54F2
                ror $6164    ; $54F4
                adc $6E65    ; $54F7
                stz $61,x    ; $54FA
                cpx $6554    ; $54FC
                sei    ; $54FF
        dfb $F4        ; $5500  (data/65C02-bit)
                eor $7265    ; $5501
                jmp ($EE69)    ; $5504
                jmp $7369    ; $5507
                beq $54CF    ; $550A
                bvc $556F    ; $550C
        dfb $73        ; $550E  (data/65C02-bit)
        dfb $63        ; $550F  (data/65C02-bit)
                adc ($EC,x)    ; $5510
                eor (TheBuffer_X,x)    ; $5512
        dfb $6F        ; $5514  (data/65C02-bit)
                sbc $6946    ; $5515
                jmp (PBuffFile)    ; $5518
                ror $6564    ; $551B
                ror $43F4    ; $551E
                adc (PhysBuffBot,x)    ; $5521
        dfb $F3        ; $5523  (data/65C02-bit)
        dfb $44        ; $5524  (data/65C02-bit)
                adc BuffTop    ; $5525
                ldy #$12    ; $5527
                eor $16,x    ; $5529
                eor $1A,x    ; $552B
                eor $00,x    ; $552D
                brk    ; $552F
                jsr $0055    ; $5530
                brk    ; $5533
                brk    ; $5534
                brk    ; $5535
                brk    ; $5536
                brk    ; $5537
;
; === PrintMinors ===
                ldy #$40    ; $5538
                lda (BuffData),y    ; $553A
                sta $5563    ; $553C
                ldx #$FE    ; $553F
                inx    ; $5541
                inx    ; $5542
                lda $5563    ; $5543
                beq $5562    ; $5546
                lsr $5563    ; $5548
                bcc $5541    ; $554B
                lda #$A0    ; $554D
                jsr ModeLineChar    ; $554F
                lda MinorNames,x    ; $5552
                sta $00    ; $5555
                lda $5529,x    ; $5557
                sta $01    ; $555A
                jsr TempToMode    ; $555C
                jmp $5541    ; $555F
                rts    ; $5562
                brk    ; $5563
;
; === TempToMode ===
                ldy #$00    ; $5564
                lda ($00),y    ; $5566
                pha    ; $5568
                ora #$80    ; $5569
                jsr ModeLineChar    ; $556B
                iny    ; $556E
                pla    ; $556F
                bpl $5566    ; $5570
                rts    ; $5572
                brk    ; $5573
                brk    ; $5574
                brk    ; $5575
                brk    ; $5576
;
; === SI:Divide ===
                sta $5576    ; $5577
                stx $5575    ; $557A
                lda $00    ; $557D
                sta $5573    ; $557F
                lda $01    ; $5582
                sta $5574    ; $5584
                jsr $5591    ; $5587
                lda $5574    ; $558A
                ldx $5573    ; $558D
                rts    ; $5590
                lda #$00    ; $5591
                sta $00    ; $5593
                sta $01    ; $5595
                ldx #$10    ; $5597
                asl $5573    ; $5599
                rol $5574    ; $559C
                rol $00    ; $559F
                rol $01    ; $55A1
                lda $00    ; $55A3
                sec    ; $55A5
                sbc $5575    ; $55A6
                tay    ; $55A9
                lda $01    ; $55AA
                sbc $5576    ; $55AC
                bcc $55B8    ; $55AF
                inc $5573    ; $55B1
                sta $01    ; $55B4
                sty $00    ; $55B6
                dex    ; $55B8
                bne $5599    ; $55B9
                rts    ; $55BB
                brk    ; $55BC
                ora $4B32,y    ; $55BD
                stz $00    ; $55C0
                brk    ; $55C2
                brk    ; $55C3
                brk    ; $55C4
                brk    ; $55C5
                brk    ; $55C6
                brk    ; $55C7
                brk    ; $55C8
                brk    ; $55C9
                brk    ; $55CA
;
; === P:Offset ===
                brk    ; $55CB
                brk    ; $55CC
;
; === P:Total ===
                brk    ; $55CD
                brk    ; $55CE
;
; === BuffPercent ===
                lda TheBuffer    ; $55CF
                sec    ; $55D1
                sbc PhysBuffTop    ; $55D2
                sta P:Offset    ; $55D4
                lda $61    ; $55D7
                sbc $6F    ; $55D9
                sta $55CC    ; $55DB
                ldx SelectedBuff    ; $55DE
                jsr MySize    ; $55E1
                sta $55CE    ; $55E4
                stx P:Total    ; $55E7
;
; === Percent ===
                lda P:Total    ; $55EA
                sta $55C9    ; $55ED
                sta $5573    ; $55F0
                lda $55CE    ; $55F3
                sta $55CA    ; $55F6
                sta $5574    ; $55F9
                lsr    ; $55FC
                ror P:Total    ; $55FD
                sta $55C6    ; $5600
                ldx P:Total    ; $5603
                stx $55C5    ; $5606
                lsr    ; $5609
                ror P:Total    ; $560A
                sta $55C4    ; $560D
                ldx P:Total    ; $5610
                stx $55C3    ; $5613
                lda $55C5    ; $5616
                clc    ; $5619
                adc $55C3    ; $561A
                sta $55C7    ; $561D
                lda $55C6    ; $5620
                adc $55C4    ; $5623
                sta $55C8    ; $5626
                ldx #$00    ; $5629
                ldy #$00    ; $562B
                sty $56FA    ; $562D
                lda P:Offset    ; $5630
                ora $55CC    ; $5633
                bne $563B    ; $5636
                jmp $56F8    ; $5638
                lda $55CC    ; $563B
                cmp $55C4,x    ; $563E
                bcc $565A    ; $5641
                bne $5655    ; $5643
                lda P:Offset    ; $5645
                cmp $55C3,x    ; $5648
                bcc $565A    ; $564B
                bne $5655    ; $564D
                lda $55BD,y    ; $564F
                jmp $56F8    ; $5652
                inx    ; $5655
                inx    ; $5656
                iny    ; $5657
                bne $563B    ; $5658
                lda $55C4    ; $565A
                lsr    ; $565D
                sta $01    ; $565E
                lda $55C3    ; $5660
                ror    ; $5663
                sta $00    ; $5664
                lda $55C1,x    ; $5666
                clc    ; $5669
                adc $00    ; $566A
                sta $00    ; $566C
                lda $55C2,x    ; $566E
                adc $01    ; $5671
                sta $01    ; $5673
                lda $55CC    ; $5675
                cmp $01    ; $5678
                bcc $56B0    ; $567A
                bne $568F    ; $567C
                lda P:Offset    ; $567E
                cmp $00    ; $5681
                bcc $56B0    ; $5683
                bne $568F    ; $5685
                lda $55BC,y    ; $5687
                clc    ; $568A
                adc #$0C    ; $568B
                bne $56F8    ; $568D
                lda $55BD,y    ; $568F
                sta $56F9    ; $5692
                lda #$FF    ; $5695
                sta $56FA    ; $5697
                lda $55C3,x    ; $569A
                sec    ; $569D
                sbc P:Offset    ; $569E
                sta $5575    ; $56A1
                lda $55C4,x    ; $56A4
                sbc $55CC    ; $56A7
                sta $5576    ; $56AA
                jmp $56C9    ; $56AD
                lda $55BC,y    ; $56B0
                sta $56F9    ; $56B3
                lda P:Offset    ; $56B6
                sec    ; $56B9
                sbc $55C1,x    ; $56BA
                sta $5575    ; $56BD
                lda $55CC    ; $56C0
                sbc $55C2,x    ; $56C3
                sta $5576    ; $56C6
                jsr $5591    ; $56C9
                lda $5573    ; $56CC
                sta $5575    ; $56CF
                lda $5574    ; $56D2
                sta $5576    ; $56D5
                lda #$64    ; $56D8
                sta $5573    ; $56DA
                lda #$00    ; $56DD
                sta $5574    ; $56DF
                jsr $5591    ; $56E2
                lda $56F9    ; $56E5
                bit $56FA    ; $56E8
                bpl $56F4    ; $56EB
                sec    ; $56ED
                sbc $5573    ; $56EE
                jmp $56F8    ; $56F1
                clc    ; $56F4
                adc $5573    ; $56F5
                rts    ; $56F8
                brk    ; $56F9
                brk    ; $56FA
;
; === PreBlinkCount ===
        dfb $02        ; $56FB  (data/65C02-bit)
                brk    ; $56FC
;
; === PreCharGet ===
                sta $56FC    ; $56FD
                lda PreBlinkCount    ; $5700
                sta BlinkTime    ; $5703
                lda CH    ; $5706
                sta Cursor2    ; $5708
                lda CV    ; $570B
                sta $28B8    ; $570D
                jsr TimedBlink    ; $5710
                beq $5723    ; $5713
                jsr ClrEchoArea    ; $5715
                lda $56FC    ; $5718
                jsr EchoOutput    ; $571B
                jsr BlinkCursor    ; $571E
                pha    ; $5721
                pla    ; $5722
                rts    ; $5723
;
; === EchoAreaCH ===
                brk    ; $5724
                asl $8D,x    ; $5725
                adc $A557    ; $5727
                and $48    ; $572A
                lda CH    ; $572C
                pha    ; $572E
                lda EchoAreaCH    ; $572F
                sta CH    ; $5732
                lda $5725    ; $5734
                sta CV    ; $5737
                jsr vtab    ; $5739
                lda $576D    ; $573C
                cmp #$00    ; $573F
                beq $576E    ; $5741
                cmp #$01    ; $5743
                beq $5777    ; $5745
                cmp #$02    ; $5747
                beq $577B    ; $5749
                cmp #$04    ; $574B
                beq $5788    ; $574D
                jsr CharOut    ; $574F
                lda CH    ; $5752
                sta EchoAreaCH    ; $5754
                lda CV    ; $5757
                sta $5725    ; $5759
                bne $5763    ; $575C
                lda #$16    ; $575E
                sta $5725    ; $5760
                pla    ; $5763
                sta CH    ; $5764
                pla    ; $5766
                sta CV    ; $5767
                jsr vtab    ; $5769
                rts    ; $576C
                brk    ; $576D
                lda #$CD    ; $576E
                jsr CharOut    ; $5770
                lda #$AD    ; $5773
                bne $574F    ; $5775
                lda #$C3    ; $5777
                bne $5770    ; $5779
                lda #$C3    ; $577B
                jsr CharOut    ; $577D
                lda #$AD    ; $5780
                jsr CharOut    ; $5782
                jmp $576E    ; $5785
                lda #$C3    ; $5788
                jsr CharOut    ; $578A
                lda #$AD    ; $578D
                jsr CharOut    ; $578F
                lda #$D8    ; $5792
                jsr CharOut    ; $5794
                lda #$A0    ; $5797
                bne $574F    ; $5799
;
; === ClrEchoArea ===
                lda CV    ; $579B
                pha    ; $579D
                lda CH    ; $579E
                pha    ; $57A0
                lda WindowTop    ; $57A1
                pha    ; $57A3
                lda WindowBot    ; $57A4
                pha    ; $57A6
                lda #$16    ; $57A7
                sta WindowTop    ; $57A9
                lda #$18    ; $57AB
                sta WindowBot    ; $57AD
                jsr ClearPage    ; $57AF
                lda CH    ; $57B2
                sta EchoAreaCH    ; $57B4
                lda CV    ; $57B7
                sta $5725    ; $57B9
                pla    ; $57BC
                sta WindowBot    ; $57BD
                pla    ; $57BF
                sta WindowTop    ; $57C0
                pla    ; $57C2
                sta CH    ; $57C3
                pla    ; $57C5
                sta CV    ; $57C6
                jsr vtab    ; $57C8
                rts    ; $57CB
;
; === NewEchoArea ===
                jsr OpenEchoArea    ; $57CC
                jmp ClearPage    ; $57CF
;
; === EchoAreaSave ===
                brk    ; $57D2
                brk    ; $57D3
                brk    ; $57D4
                brk    ; $57D5
                brk    ; $57D6
                brk    ; $57D7
;
; === OpenEchoArea ===
                ldx #$00    ; $57D8
                lda WindowLft,x    ; $57DA
                sta EchoAreaSave,x    ; $57DC
                inx    ; $57DF
                cpx #$06    ; $57E0
                bcc $57DA    ; $57E2
;
; === UseEchoArea ===
                lda #$16    ; $57E4
                sta WindowTop    ; $57E6
                lda #$18    ; $57E8
                sta WindowBot    ; $57EA
                lda EchoAreaCH    ; $57EC
                sta CH    ; $57EF
                lda $5725    ; $57F1
                sta CV    ; $57F4
                jsr vtab    ; $57F6
                rts    ; $57F9
;
; === CloseEchoArea ===
                lda CH    ; $57FA
                sta EchoAreaCH    ; $57FC
                lda CV    ; $57FF
                sta $5725    ; $5801
                ldx #$00    ; $5804
                lda EchoAreaSave,x    ; $5806
                sta WindowLft,x    ; $5809
                inx    ; $580B
                cpx #$06    ; $580C
                bcc $5806    ; $580E
                jsr vtab    ; $5810
                rts    ; $5813
;
; === EchoAreaMsg ===
                pla    ; $5814
                sta $06    ; $5815
                pla    ; $5817
                sta $07    ; $5818
                ldy #$00    ; $581A
                inc $06    ; $581C
                bne $5822    ; $581E
                inc $07    ; $5820
                lda ($06),y    ; $5822
                beq $582C    ; $5824
                jsr EchoOutput    ; $5826
                jmp $581C    ; $5829
                lda $07    ; $582C
                pha    ; $582E
                lda $06    ; $582F
                pha    ; $5831
                rts    ; $5832
;
; === BadCharMsg ===
                tax    ; $5833
                lda CV    ; $5834
                pha    ; $5836
                lda CH    ; $5837
                pha    ; $5839
                txa    ; $583A
                pha    ; $583B
                jsr NewEchoArea    ; $583C
                jsr Beep    ; $583F
                pla    ; $5842
                jsr PrettyPrint    ; $5843
                jsr PrUnDefined    ; $5846
                jsr CloseEchoArea    ; $5849
                pla    ; $584C
                sta CH    ; $584D
                pla    ; $584F
                sta CV    ; $5850
                jsr vtab    ; $5852
                lda #$00    ; $5855
                rts    ; $5857
;
; === PrUnDefined ===
                jsr PrintMessage    ; $5858
                ldy #$E9    ; $585B
        dfb $F3        ; $585D  (data/65C02-bit)
                ldy #$F5    ; $585E
                inc $E5E4    ; $5860
                inc $E9    ; $5863
                inc $E4E5    ; $5865
                ldx: $008D    ; $5868
                rts    ; $586B
;
; === PrettyPrint ===
                sta $58AA    ; $586C
                jsr $58B0    ; $586F
                lda $58AA    ; $5872
                cmp #$20    ; $5875
                bcc $5889    ; $5877
                cmp #$80    ; $5879
                bcc $58A0    ; $587B
                cmp #$A0    ; $587D
                bcc $5897    ; $587F
                cmp #$A0    ; $5881
                beq $58AB    ; $5883
                jsr CharOut    ; $5885
                rts    ; $5888
                jsr print_c_meta    ; $5889
                lda $58AA    ; $588C
                ora #$80    ; $588F
                clc    ; $5891
                adc #$40    ; $5892
                jmp $5881    ; $5894
                jsr print_control    ; $5897
                lda $58AA    ; $589A
                jmp $588F    ; $589D
                jsr print_meta    ; $58A0
                lda $58AA    ; $58A3
                ora #$80    ; $58A6
                bmi $5881    ; $58A8
                brk    ; $58AA
                jsr $595E    ; $58AB
                rts    ; $58AE
                rts    ; $58AF
                sta $58FB    ; $58B0
                jsr $58FD    ; $58B3
                beq $58C8    ; $58B6
                ora #$80    ; $58B8
                jsr $58FD    ; $58BA
                bne $58FA    ; $58BD
                jsr PrintMessage    ; $58BF
                cmp $F4E5    ; $58C2
                sbc ($AD,x)    ; $58C5
                brk    ; $58C7
                pla    ; $58C8
                pla    ; $58C9
                txa    ; $58CA
                sta $58FC    ; $58CB
                asl    ; $58CE
                tax    ; $58CF
                lda $01    ; $58D0
                pha    ; $58D2
                lda $00    ; $58D3
                pha    ; $58D5
                lda $5910,x    ; $58D6
                sta $00    ; $58D9
                lda $5911,x    ; $58DB
                sta $01    ; $58DE
                jsr DCIStringOut    ; $58E0
                pla    ; $58E3
                sta $00    ; $58E4
                pla    ; $58E6
                sta $01    ; $58E7
                lda $58FC    ; $58E9
                cmp #$04    ; $58EC
                bcc $58FA    ; $58EE
                jsr PrintMessage    ; $58F0
                lda $F2C1    ; $58F3
                sbc ($EF)    ; $58F6
        dfb $F7        ; $58F8  (data/65C02-bit)
                brk    ; $58F9
                rts    ; $58FA
                brk    ; $58FB
                brk    ; $58FC
                ldx #$07    ; $58FD
                cmp $5908,x    ; $58FF
                beq $5907    ; $5902
                dex    ; $5904
                bpl $58FF    ; $5905
                rts    ; $5907
                sta $9B89    ; $5908
        dfb $FF        ; $590B  (data/65C02-bit)
                adc (PageTop,x)    ; $590C
        dfb $63        ; $590E  (data/65C02-bit)
                stz WindowLft    ; $590F
                eor $5926,y    ; $5911
                and #$59    ; $5914
        dfb $2F        ; $5916  (data/65C02-bit)
                eor $5935,y    ; $5917
                and $3E59,y    ; $591A
                eor $5940,y    ; $591D
                cmp ($E5)    ; $5920
        dfb $F4        ; $5922  (data/65C02-bit)
                sbc $F2,x    ; $5923
                ror $E1D4    ; $5925
        dfb $62        ; $5928  (data/65C02-bit)
                cmp $F3    ; $5929
        dfb $E3        ; $592B  (data/65C02-bit)
                sbc ($F0,x)    ; $592C
                adc $C4    ; $592E
                sbc $EC    ; $5930
                sbc $F4    ; $5932
                adc $CC    ; $5934
                sbc $E6    ; $5936
                stz $D2,x    ; $5938
                sbc #$E7    ; $593A
                inx    ; $593C
                stz $D5,x    ; $593D
                bvs $5905    ; $593F
        dfb $EF        ; $5941  (data/65C02-bit)
        dfb $F7        ; $5942  (data/65C02-bit)
                ror $6820    ; $5943
                eor $EFC3,y    ; $5946
                inc $F2F4    ; $5949
        dfb $EF        ; $594C  (data/65C02-bit)
                cpx: $00AD    ; $594D
                rts    ; $5950
;
; === print_c_meta ===
                jsr print_control    ; $5951
;
; === print_meta ===
                jsr PrintMessage    ; $5954
                cmp $F4E5    ; $5957
                sbc ($AD,x)    ; $595A
                brk    ; $595C
                rts    ; $595D
                jsr PrintMessage    ; $595E
        dfb $D3        ; $5961  (data/65C02-bit)
                beq $5945    ; $5962
        dfb $E3        ; $5964  (data/65C02-bit)
                sbc $00    ; $5965
                rts    ; $5967
;
; === PrintMessage ===
                pla    ; $5968
                sta $06    ; $5969
                pla    ; $596B
                sta $07    ; $596C
                ldy #$00    ; $596E
                inc $06    ; $5970
                bne $5976    ; $5972
                inc $07    ; $5974
                lda ($06),y    ; $5976
                beq $5980    ; $5978
                jsr CharOut    ; $597A
                jmp $5970    ; $597D
                lda $07    ; $5980
                pha    ; $5982
                lda $06    ; $5983
                pha    ; $5985
                rts    ; $5986
;
; === CompList ===
        dfb $37        ; $5987  (data/65C02-bit)
        dfb $9B        ; $5988  (data/65C02-bit)
;
; === CompOffset ===
                brk    ; $5989
                brk    ; $598A
;
; === CompCount ===
                brk    ; $598B
;
; === PrintCompDoc ===
                jsr DocRef    ; $598C
;
; === DCIStringOut   (also PrintComp) ===
                lda CH    ; $598F
;
; === DCIStringOut1 ===
                sta $5A10    ; $5991
                ldy #$FF    ; $5994
                iny    ; $5996
                sty $5A0E    ; $5997
                lda CH    ; $599A
                cmp WindowLft    ; $599C
                bne $59A5    ; $599E
                lda $5A10    ; $59A0
                sta CH    ; $59A3
                sta $5A0F    ; $59A5
                lda ($00),y    ; $59A8
                bpl $59FD    ; $59AA
                cmp #$A0    ; $59AC
                beq $59E3    ; $59AE
                cmp #$8D    ; $59B0
                beq $59E3    ; $59B2
                jsr GetXCharLen    ; $59B4
                txa    ; $59B7
                clc    ; $59B8
                adc $5A0F    ; $59B9
                sta $5A0F    ; $59BC
                cmp WindowRgt    ; $59BF
                bcs $59C6    ; $59C1
                iny    ; $59C3
                bne $59A8    ; $59C4
                tya    ; $59C6
                pha    ; $59C7
                jsr PrintReturn    ; $59C8
                lda WindowRgt    ; $59CB
                pha    ; $59CD
                lda $5A10    ; $59CE
                sta WindowRgt    ; $59D1
                jsr ClearEOL    ; $59D3
                pla    ; $59D6
                sta WindowRgt    ; $59D7
                lda $5A10    ; $59D9
                sta CH    ; $59DC
                sta $5A0F    ; $59DE
                pla    ; $59E1
                tay    ; $59E2
                sty $5A11    ; $59E3
                ldy $5A0E    ; $59E6
                lda ($00),y    ; $59E9
                php    ; $59EB
                ora #$80    ; $59EC
                jsr CharOut    ; $59EE
                plp    ; $59F1
                bpl $5A0D    ; $59F2
                cpy $5A11    ; $59F4
                beq $5996    ; $59F7
                iny    ; $59F9
                jmp $59E9    ; $59FA
                ora #$80    ; $59FD
                jsr GetXCharLen    ; $59FF
                txa    ; $5A02
                clc    ; $5A03
                adc $5A0F    ; $5A04
                cmp WindowRgt    ; $5A07
                bcc $59E3    ; $5A09
                bcs $59C6    ; $5A0B
                rts    ; $5A0D
                brk    ; $5A0E
                brk    ; $5A0F
                brk    ; $5A10
                brk    ; $5A11
;
; === DocRef ===
                jsr DCIStringLen    ; $5A12
                iny    ; $5A15
                iny    ; $5A16
                iny    ; $5A17
                lda ($00),y    ; $5A18
                pha    ; $5A1A
                dey    ; $5A1B
                lda ($00),y    ; $5A1C
                sta $00    ; $5A1E
                pla    ; $5A20
                sta $01    ; $5A21
                rts    ; $5A23
;
; === DCIStringLen ===
                ldy #$00    ; $5A24
                lda ($00),y    ; $5A26
                php    ; $5A28
                iny    ; $5A29
                plp    ; $5A2A
                bmi $5A26    ; $5A2B
                rts    ; $5A2D
;
; === FunctionRef ===
                jsr DCIStringLen    ; $5A2E
                lda ($00),y    ; $5A31
                pha    ; $5A33
                iny    ; $5A34
                lda ($00),y    ; $5A35
                sta $01    ; $5A37
                pla    ; $5A39
                sta $00    ; $5A3A
                rts    ; $5A3C
;
; === PopCompPoint ===
                ldx CompCount    ; $5A3D
                beq $5A53    ; $5A40
                dex    ; $5A42
                stx CompCount    ; $5A43
                lda rm_DataBuffer,x    ; $5A46
                sta $00    ; $5A49
                lda $AA00,x    ; $5A4B
                sta $01    ; $5A4E
                lda #$00    ; $5A50
                rts    ; $5A52
                lda #$FF    ; $5A53
                rts    ; $5A55
;
; === PushCompPoint ===
                ldx CompCount    ; $5A56
                lda $00    ; $5A59
                sta rm_DataBuffer,x    ; $5A5B
                lda $01    ; $5A5E
                sta $AA00,x    ; $5A60
                inx    ; $5A63
                stx CompCount    ; $5A64
                rts    ; $5A67
;
; === SkipEnt ===
                jsr DCIStringLen    ; $5A68
                tya    ; $5A6B
                clc    ; $5A6C
                adc #$04    ; $5A6D
                adc $00    ; $5A6F
                sta $00    ; $5A71
                bcc $5A77    ; $5A73
                inc $01    ; $5A75
                rts    ; $5A77
;
; === CompareEnt ===
                ldy #$00    ; $5A78
                ldx $598A    ; $5A7A
                lda ($00),y    ; $5A7D
                sta $E3    ; $5A7F
                ora #$80    ; $5A81
                jsr UpperCon    ; $5A83
                sta $E2    ; $5A86
                lda $0200,x    ; $5A88
                cmp #$9B    ; $5A8B
                beq $5AA3    ; $5A8D
                jsr UpperCon    ; $5A8F
                cmp $E2    ; $5A92
                bne $5AAD    ; $5A94
                iny    ; $5A96
                inx    ; $5A97
                lda $E3    ; $5A98
                bmi $5A7D    ; $5A9A
                lda $0200,x    ; $5A9C
                cmp #$9B    ; $5A9F
                bne $5AAD    ; $5AA1
                cpy HighMatch    ; $5AA3
                bcc $5AAB    ; $5AA6
                sty HighMatch    ; $5AA8
                lda #$00    ; $5AAB
                rts    ; $5AAD
                ldy #$00    ; $5AAE
                lda ($00),y    ; $5AB0
                sta $E3    ; $5AB2
                ora #$80    ; $5AB4
                jsr UpperCon    ; $5AB6
                sta $E2    ; $5AB9
                lda ($02),y    ; $5ABB
                sta $E4    ; $5ABD
                ora #$80    ; $5ABF
                jsr UpperCon    ; $5AC1
                cmp $E2    ; $5AC4
                bne $5AD1    ; $5AC6
                lda $E3    ; $5AC8
                ora $E4    ; $5ACA
                bpl $5AD1    ; $5ACC
                iny    ; $5ACE
                bne $5AB0    ; $5ACF
                rts    ; $5AD1
                brk    ; $5AD2
;
; === HighMatch ===
                brk    ; $5AD3
;
; === GetCompLink ===
                ldy #$00    ; $5AD4
                lda ($00),y    ; $5AD6
                beq $5AE4    ; $5AD8
                cmp #$FF    ; $5ADA
                beq $5AE4    ; $5ADC
                jsr SkipEnt    ; $5ADE
                jmp GetCompLink    ; $5AE1
                rts    ; $5AE4
;
; === SI:CompleteMe ===
                lda #$9B    ; $5AE5
                bne $5AEB    ; $5AE7
;
; === SI:CompleteSp ===
                lda #$A0    ; $5AE9
                sta $5AD2    ; $5AEB
                lda CompList    ; $5AEE
                sta $00    ; $5AF1
                lda $5988    ; $5AF3
                sta $01    ; $5AF6
                lda #$00    ; $5AF8
                sta CompCount    ; $5AFA
                sta $5BC6    ; $5AFD
                sta HighMatch    ; $5B00
                ldy CompOffset    ; $5B03
                sty $598A    ; $5B06
                sta CompOffset    ; $5B09
                ldy #$00    ; $5B0C
                lda ($00),y    ; $5B0E
                beq $5B38    ; $5B10
                cmp #$FF    ; $5B12
                bne $5B25    ; $5B14
                iny    ; $5B16
                lda ($00),y    ; $5B17
                pha    ; $5B19
                iny    ; $5B1A
                lda ($00),y    ; $5B1B
                sta $01    ; $5B1D
                pla    ; $5B1F
                sta $00    ; $5B20
                jmp $5B0C    ; $5B22
                jsr CompareEnt    ; $5B25
                bne $5B32    ; $5B28
                cpy HighMatch    ; $5B2A
                bcc $5B32    ; $5B2D
                jsr PushCompPoint    ; $5B2F
                jsr SkipEnt    ; $5B32
                jmp $5B0C    ; $5B35
                lda CompCount    ; $5B38
                beq $5B44    ; $5B3B
                cmp #$01    ; $5B3D
                beq $5B4A    ; $5B3F
                jmp $5B65    ; $5B41
                ldx CharIndex    ; $5B44
                lda #$FF    ; $5B47
                rts    ; $5B49
                jsr PopCompPoint    ; $5B4A
                jsr PushCompPoint    ; $5B4D
                ldy #$00    ; $5B50
                ldx $598A    ; $5B52
                lda ($00),y    ; $5B55
                php    ; $5B57
                ora #$80    ; $5B58
                sta $0200,x    ; $5B5A
                iny    ; $5B5D
                inx    ; $5B5E
                plp    ; $5B5F
                bmi $5B55    ; $5B60
                lda #$00    ; $5B62
                rts    ; $5B64
                lda $5AD2    ; $5B65
                cmp #$9B    ; $5B68
                beq $5B44    ; $5B6A
                ldy #$FF    ; $5B6C
                sty $5BC5    ; $5B6E
                lda CompCount    ; $5B71
                sta $5BC7    ; $5B74
                jsr PopCompPoint    ; $5B77
                lda $00    ; $5B7A
                sta $02    ; $5B7C
                lda $01    ; $5B7E
                sta $03    ; $5B80
                jsr PopCompPoint    ; $5B82
                bne $5B95    ; $5B85
                jsr $5AAE    ; $5B87
                cpy $5BC5    ; $5B8A
                bcs $5B7A    ; $5B8D
                sty $5BC5    ; $5B8F
                jmp $5B7A    ; $5B92
                lda $5BC7    ; $5B95
                sta CompCount    ; $5B98
                ldx $598A    ; $5B9B
                ldy #$00    ; $5B9E
                lda ($02),y    ; $5BA0
                cpy $5BC5    ; $5BA2
                bcs $5BBF    ; $5BA5
                pha    ; $5BA7
                lda $0200,x    ; $5BA8
                cmp #$9B    ; $5BAB
                bne $5BB4    ; $5BAD
                lda #$FF    ; $5BAF
                sta $5BC6    ; $5BB1
                pla    ; $5BB4
                ora #$80    ; $5BB5
                sta $0200,x    ; $5BB7
                iny    ; $5BBA
                inx    ; $5BBB
                jmp $5BA0    ; $5BBC
                lda $5BC6    ; $5BBF
                eor #$FF    ; $5BC2
                rts    ; $5BC4
                brk    ; $5BC5
                brk    ; $5BC6
                brk    ; $5BC7
;
; === SearchDefault ===
                brk    ; $5BC8
                brk    ; $5BC9
                brk    ; $5BCA
                brk    ; $5BCB
                brk    ; $5BCC
                brk    ; $5BCD
                brk    ; $5BCE
                brk    ; $5BCF
                brk    ; $5BD0
                brk    ; $5BD1
                brk    ; $5BD2
                brk    ; $5BD3
                brk    ; $5BD4
                brk    ; $5BD5
                brk    ; $5BD6
                brk    ; $5BD7
                brk    ; $5BD8
                brk    ; $5BD9
                brk    ; $5BDA
                brk    ; $5BDB
                brk    ; $5BDC
                brk    ; $5BDD
                brk    ; $5BDE
                brk    ; $5BDF
                brk    ; $5BE0
                brk    ; $5BE1
                brk    ; $5BE2
                brk    ; $5BE3
                brk    ; $5BE4
                brk    ; $5BE5
                brk    ; $5BE6
                brk    ; $5BE7
                brk    ; $5BE8
                brk    ; $5BE9
                brk    ; $5BEA
                brk    ; $5BEB
                brk    ; $5BEC
                brk    ; $5BED
                brk    ; $5BEE
                brk    ; $5BEF
                brk    ; $5BF0
;
; === SearchString ===
                brk    ; $5BF1
                brk    ; $5BF2
                brk    ; $5BF3
                brk    ; $5BF4
                brk    ; $5BF5
                brk    ; $5BF6
                brk    ; $5BF7
                brk    ; $5BF8
                brk    ; $5BF9
                brk    ; $5BFA
                brk    ; $5BFB
                brk    ; $5BFC
                brk    ; $5BFD
                brk    ; $5BFE
                brk    ; $5BFF
                brk    ; $5C00
                brk    ; $5C01
                brk    ; $5C02
                brk    ; $5C03
                brk    ; $5C04
                brk    ; $5C05
                brk    ; $5C06
                brk    ; $5C07
                brk    ; $5C08
                brk    ; $5C09
                brk    ; $5C0A
                brk    ; $5C0B
                brk    ; $5C0C
                brk    ; $5C0D
                brk    ; $5C0E
                brk    ; $5C0F
                brk    ; $5C10
                brk    ; $5C11
                brk    ; $5C12
                brk    ; $5C13
                brk    ; $5C14
                brk    ; $5C15
                brk    ; $5C16
                brk    ; $5C17
                brk    ; $5C18
;
; === ISearchStack ===
                brk    ; $5C19
                brk    ; $5C1A
                brk    ; $5C1B
                brk    ; $5C1C
                brk    ; $5C1D
                brk    ; $5C1E
                brk    ; $5C1F
                brk    ; $5C20
                brk    ; $5C21
                brk    ; $5C22
                brk    ; $5C23
                brk    ; $5C24
                brk    ; $5C25
                brk    ; $5C26
                brk    ; $5C27
                brk    ; $5C28
                brk    ; $5C29
                brk    ; $5C2A
                brk    ; $5C2B
                brk    ; $5C2C
                brk    ; $5C2D
                brk    ; $5C2E
                brk    ; $5C2F
                brk    ; $5C30
                brk    ; $5C31
                brk    ; $5C32
                brk    ; $5C33
                brk    ; $5C34
                brk    ; $5C35
                brk    ; $5C36
                brk    ; $5C37
                brk    ; $5C38
                brk    ; $5C39
                brk    ; $5C3A
                brk    ; $5C3B
                brk    ; $5C3C
                brk    ; $5C3D
                brk    ; $5C3E
                brk    ; $5C3F
                brk    ; $5C40
                brk    ; $5C41
                brk    ; $5C42
                brk    ; $5C43
                brk    ; $5C44
                brk    ; $5C45
                brk    ; $5C46
                brk    ; $5C47
                brk    ; $5C48
                brk    ; $5C49
                brk    ; $5C4A
                brk    ; $5C4B
                brk    ; $5C4C
                brk    ; $5C4D
                brk    ; $5C4E
                brk    ; $5C4F
                brk    ; $5C50
                brk    ; $5C51
                brk    ; $5C52
                brk    ; $5C53
                brk    ; $5C54
                brk    ; $5C55
                brk    ; $5C56
                brk    ; $5C57
                brk    ; $5C58
                brk    ; $5C59
                brk    ; $5C5A
                brk    ; $5C5B
                brk    ; $5C5C
                brk    ; $5C5D
                brk    ; $5C5E
                brk    ; $5C5F
                brk    ; $5C60
                brk    ; $5C61
                brk    ; $5C62
                brk    ; $5C63
                brk    ; $5C64
                brk    ; $5C65
                brk    ; $5C66
                brk    ; $5C67
                brk    ; $5C68
                brk    ; $5C69
                brk    ; $5C6A
                brk    ; $5C6B
                brk    ; $5C6C
                brk    ; $5C6D
                brk    ; $5C6E
                brk    ; $5C6F
                brk    ; $5C70
                brk    ; $5C71
                brk    ; $5C72
                brk    ; $5C73
                brk    ; $5C74
                brk    ; $5C75
                brk    ; $5C76
                brk    ; $5C77
                brk    ; $5C78
                brk    ; $5C79
                brk    ; $5C7A
                brk    ; $5C7B
                brk    ; $5C7C
                brk    ; $5C7D
                brk    ; $5C7E
                brk    ; $5C7F
                brk    ; $5C80
                brk    ; $5C81
                brk    ; $5C82
                brk    ; $5C83
                brk    ; $5C84
                brk    ; $5C85
                brk    ; $5C86
                brk    ; $5C87
                brk    ; $5C88
                brk    ; $5C89
                brk    ; $5C8A
                brk    ; $5C8B
                brk    ; $5C8C
                brk    ; $5C8D
                brk    ; $5C8E
                brk    ; $5C8F
                brk    ; $5C90
                brk    ; $5C91
                brk    ; $5C92
                brk    ; $5C93
                brk    ; $5C94
                brk    ; $5C95
                brk    ; $5C96
                brk    ; $5C97
                brk    ; $5C98
                brk    ; $5C99
                brk    ; $5C9A
                brk    ; $5C9B
                brk    ; $5C9C
                brk    ; $5C9D
                brk    ; $5C9E
                brk    ; $5C9F
                brk    ; $5CA0
                brk    ; $5CA1
                brk    ; $5CA2
                brk    ; $5CA3
                brk    ; $5CA4
                brk    ; $5CA5
                brk    ; $5CA6
                brk    ; $5CA7
                brk    ; $5CA8
                brk    ; $5CA9
                brk    ; $5CAA
                brk    ; $5CAB
                brk    ; $5CAC
                brk    ; $5CAD
                brk    ; $5CAE
                brk    ; $5CAF
                brk    ; $5CB0
                brk    ; $5CB1
                brk    ; $5CB2
                brk    ; $5CB3
                brk    ; $5CB4
                brk    ; $5CB5
                brk    ; $5CB6
                brk    ; $5CB7
                brk    ; $5CB8
                brk    ; $5CB9
                brk    ; $5CBA
                brk    ; $5CBB
                brk    ; $5CBC
                brk    ; $5CBD
                brk    ; $5CBE
                brk    ; $5CBF
                brk    ; $5CC0
                brk    ; $5CC1
                brk    ; $5CC2
                brk    ; $5CC3
                brk    ; $5CC4
                brk    ; $5CC5
                brk    ; $5CC6
                brk    ; $5CC7
                brk    ; $5CC8
                brk    ; $5CC9
                brk    ; $5CCA
                brk    ; $5CCB
                brk    ; $5CCC
                brk    ; $5CCD
                brk    ; $5CCE
                brk    ; $5CCF
                brk    ; $5CD0
                brk    ; $5CD1
                brk    ; $5CD2
                brk    ; $5CD3
                brk    ; $5CD4
                brk    ; $5CD5
                brk    ; $5CD6
                brk    ; $5CD7
                brk    ; $5CD8
                brk    ; $5CD9
                brk    ; $5CDA
                brk    ; $5CDB
                brk    ; $5CDC
                brk    ; $5CDD
                brk    ; $5CDE
                brk    ; $5CDF
                brk    ; $5CE0
                brk    ; $5CE1
                brk    ; $5CE2
                brk    ; $5CE3
                brk    ; $5CE4
                brk    ; $5CE5
                brk    ; $5CE6
                brk    ; $5CE7
                brk    ; $5CE8
                brk    ; $5CE9
                brk    ; $5CEA
                brk    ; $5CEB
                brk    ; $5CEC
                brk    ; $5CED
                brk    ; $5CEE
                brk    ; $5CEF
                brk    ; $5CF0
                brk    ; $5CF1
                brk    ; $5CF2
                brk    ; $5CF3
                brk    ; $5CF4
                brk    ; $5CF5
                brk    ; $5CF6
                brk    ; $5CF7
                brk    ; $5CF8
                brk    ; $5CF9
                brk    ; $5CFA
                brk    ; $5CFB
                brk    ; $5CFC
                brk    ; $5CFD
                brk    ; $5CFE
                brk    ; $5CFF
                brk    ; $5D00
                brk    ; $5D01
                brk    ; $5D02
                brk    ; $5D03
                brk    ; $5D04
                brk    ; $5D05
                brk    ; $5D06
                brk    ; $5D07
                brk    ; $5D08
;
; === IStackPntr ===
                brk    ; $5D09
;
; === ISearchDir ===
                brk    ; $5D0A
                brk    ; $5D0B
                brk    ; $5D0C
                brk    ; $5D0D
                brk    ; $5D0E
;
; === SMoveMax ===
        dfb $F4        ; $5D0F  (data/65C02-bit)
                ora ($AE,x)    ; $5D10
                ora #$5D    ; $5D12
                beq $5D61    ; $5D14
                dec IStackPntr    ; $5D16
                dex    ; $5D19
                txa    ; $5D1A
                asl    ; $5D1B
                asl    ; $5D1C
                clc    ; $5D1D
                adc IStackPntr    ; $5D1E
                adc IStackPntr    ; $5D21
                tax    ; $5D24
                lda ISearchStack,x    ; $5D25
                sta TheBuffer    ; $5D28
                lda $5C1A,x    ; $5D2A
                sta $61    ; $5D2D
                lda $5C1B,x    ; $5D2F
                sta PageTop    ; $5D32
                lda $5C1C,x    ; $5D34
                sta $63    ; $5D37
                lda $5C1D,x    ; $5D39
                pha    ; $5D3C
                and #$80    ; $5D3D
                sta $5DC8    ; $5D3F
                pla    ; $5D42
                asl    ; $5D43
                asl    ; $5D44
                asl    ; $5D45
                asl    ; $5D46
                sta ISearchDir    ; $5D47
                lda $5C1E,x    ; $5D4A
                sta $5BF0    ; $5D4D
                lda ISearchDir    ; $5D50
                bpl $5D59    ; $5D53
                lda #$FF    ; $5D55
                bne $5D5B    ; $5D57
                lda #$00    ; $5D59
                sta ISearchDir    ; $5D5B
                lda #$00    ; $5D5E
                rts    ; $5D60
                lda #$FF    ; $5D61
                rts    ; $5D63
;
; === IPushSearch ===
                ldx IStackPntr    ; $5D64
                cpx #$28    ; $5D67
                bcs $5DAD    ; $5D69
                txa    ; $5D6B
                asl    ; $5D6C
                asl    ; $5D6D
                clc    ; $5D6E
                adc IStackPntr    ; $5D6F
                adc IStackPntr    ; $5D72
                tax    ; $5D75
                lda TheBuffer    ; $5D76
                sta ISearchStack,x    ; $5D78
                lda $61    ; $5D7B
                sta $5C1A,x    ; $5D7D
                lda PageTop    ; $5D80
                sta $5C1B,x    ; $5D82
                lda $63    ; $5D85
                sta $5C1C,x    ; $5D87
                lda ISearchDir    ; $5D8A
                lsr    ; $5D8D
                lsr    ; $5D8E
                lsr    ; $5D8F
                lsr    ; $5D90
                pha    ; $5D91
                lda $5DC8    ; $5D92
                and #$F0    ; $5D95
                sta $5C1D,x    ; $5D97
                pla    ; $5D9A
                ora $5C1D,x    ; $5D9B
                sta $5C1D,x    ; $5D9E
                lda $5BF0    ; $5DA1
                sta $5C1E,x    ; $5DA4
                inc IStackPntr    ; $5DA7
                lda #$00    ; $5DAA
                rts    ; $5DAC
                lda #$FF    ; $5DAD
                rts    ; $5DAF
;
; === ISearchChars ===
        dfb $87        ; $5DB0  (data/65C02-bit)
        dfb $FF        ; $5DB1  (data/65C02-bit)
        dfb $93        ; $5DB2  (data/65C02-bit)
                sta ($8D)    ; $5DB3
                bit #$9B    ; $5DB5
                sta ($BA),y    ; $5DB7
                adc ($49,x)    ; $5DB9
                rts    ; $5DBB
                inc TheBuffer    ; $5DBC
        dfb $E2        ; $5DBE  (data/65C02-bit)
                rts    ; $5DBF
                lsr $5263    ; $5DC0
        dfb $63        ; $5DC3  (data/65C02-bit)
                asl    ; $5DC4
        dfb $62        ; $5DC5  (data/65C02-bit)
        dfb $43        ; $5DC6  (data/65C02-bit)
        dfb $63        ; $5DC7  (data/65C02-bit)
                brk    ; $5DC8
;
; === SearchForward ===
                lda TheBuffer    ; $5DC9
                sta $00    ; $5DCB
                lda $61    ; $5DCD
                sta $01    ; $5DCF
                lda $00    ; $5DD1
                sec    ; $5DD3
                sbc $5BF0    ; $5DD4
                sta $00    ; $5DD7
                lda $01    ; $5DD9
                sbc #$00    ; $5DDB
                sta $01    ; $5DDD
                inc $00    ; $5DDF
                bne $5DE5    ; $5DE1
                inc $01    ; $5DE3
                lda $00    ; $5DE5
                clc    ; $5DE7
                adc $5BF0    ; $5DE8
                tax    ; $5DEB
                lda $01    ; $5DEC
                adc #$00    ; $5DEE
                cmp $6B    ; $5DF0
                bcc $5DFF    ; $5DF2
                bne $5DFC    ; $5DF4
                cpx GapTop    ; $5DF6
                bcc $5DFF    ; $5DF8
                beq $5DFF    ; $5DFA
                lda #$FF    ; $5DFC
                rts    ; $5DFE
                ldy #$00    ; $5DFF
                jsr $D000    ; $5E01
                jsr SearchCase    ; $5E04
                sta $08    ; $5E07
                lda SearchString,y    ; $5E09
                jsr SearchCase    ; $5E0C
                cmp $08    ; $5E0F
                bne $5E26    ; $5E11
                iny    ; $5E13
                cpy $5BF0    ; $5E14
                bcc $5E01    ; $5E17
                tya    ; $5E19
                clc    ; $5E1A
                adc $00    ; $5E1B
                sta $00    ; $5E1D
                bcc $5E23    ; $5E1F
                inc $01    ; $5E21
                lda #$00    ; $5E23
                rts    ; $5E25
                jsr $61CE    ; $5E26
                inc $00    ; $5E29
                bne $5E2F    ; $5E2B
                inc $01    ; $5E2D
                bne $5DE5    ; $5E2F
;
; === SearchBackwrd ===
                lda TheBuffer    ; $5E31
                sta $00    ; $5E33
                lda $61    ; $5E35
                sta $01    ; $5E37
                inc $00    ; $5E39
                bne $5E3F    ; $5E3B
                inc $01    ; $5E3D
                jsr $61CE    ; $5E3F
                lda $00    ; $5E42
                cmp BuffTop    ; $5E44
                bne $5E51    ; $5E46
                lda $01    ; $5E48
                cmp $67    ; $5E4A
                bne $5E51    ; $5E4C
                lda #$FF    ; $5E4E
                rts    ; $5E50
                lda $00    ; $5E51
                bne $5E57    ; $5E53
                dec $01    ; $5E55
                dec $00    ; $5E57
                lda $00    ; $5E59
                clc    ; $5E5B
                adc $5BF0    ; $5E5C
                tax    ; $5E5F
                lda $01    ; $5E60
                adc #$00    ; $5E62
                cmp $6B    ; $5E64
                bcc $5E70    ; $5E66
                bne $5E3F    ; $5E68
                cpx GapTop    ; $5E6A
                beq $5E70    ; $5E6C
                bcs $5E3F    ; $5E6E
                ldy #$00    ; $5E70
                jsr $D000    ; $5E72
                jsr SearchCase    ; $5E75
                sta $08    ; $5E78
                lda SearchString,y    ; $5E7A
                jsr SearchCase    ; $5E7D
                cmp $08    ; $5E80
                bne $5E3F    ; $5E82
                iny    ; $5E84
                cpy $5BF0    ; $5E85
                bcc $5E72    ; $5E88
                lda #$00    ; $5E8A
                rts    ; $5E8C
;
; === CaseSearch ===
                brk    ; $5E8D
;
; === SearchCase ===
                bit CaseSearch    ; $5E8E
                bmi $5E98    ; $5E91
                cmp #$E0    ; $5E93
                jsr UpperCon    ; $5E95
                rts    ; $5E98
                php    ; $5E99
                pha    ; $5E9A
                lda #$00    ; $5E9B
                sta IStackPntr    ; $5E9D
                pla    ; $5EA0
                plp    ; $5EA1
                bne $5EBE    ; $5EA2
                cmp #$9B    ; $5EA4
                bne $5EB1    ; $5EA6
                jsr $5EC1    ; $5EA8
                jsr PopTYI    ; $5EAB
                jmp $5EBE    ; $5EAE
                cmp #$87    ; $5EB1
                bne $5EC1    ; $5EB3
                jsr $5EE5    ; $5EB5
                jsr Beep    ; $5EB8
                jsr ClrEchoArea    ; $5EBB
                lda #$FF    ; $5EBE
                rts    ; $5EC0
                ldy #$00    ; $5EC1
                cpy $5BF0    ; $5EC3
                beq $5EDF    ; $5EC6
                lda SearchString,y    ; $5EC8
                sta SearchDefault,y    ; $5ECB
                iny    ; $5ECE
                cpy $5BF0    ; $5ECF
                bne $5EC8    ; $5ED2
                lda #$00    ; $5ED4
                sta SearchDefault,y    ; $5ED6
                jsr ClrEchoArea    ; $5ED9
                jsr $5F04    ; $5EDC
                jsr UnTYI    ; $5EDF
                ldy #$00    ; $5EE2
                rts    ; $5EE4
                ldx #$00    ; $5EE5
                lda $5D0B    ; $5EE7
                sta TheBuffer    ; $5EEA
                lda $5D0C    ; $5EEC
                sta $61    ; $5EEF
                lda $5D0D    ; $5EF1
                sta PageTop    ; $5EF4
                lda $5D0E    ; $5EF6
                sta $63    ; $5EF9
                jsr DisplayPage    ; $5EFB
                jsr FindPoint    ; $5EFE
                lda #$FF    ; $5F01
                rts    ; $5F03
                lda ISearchDir    ; $5F04
                bmi $5F19    ; $5F07
                lda TheBuffer    ; $5F09
                sec    ; $5F0B
                sbc $5D0B    ; $5F0C
                sta $00    ; $5F0F
                lda $61    ; $5F11
                sbc $5D0C    ; $5F13
                jmp $5F26    ; $5F16
                lda $5D0B    ; $5F19
                sec    ; $5F1C
                sbc TheBuffer    ; $5F1D
                sta $00    ; $5F1F
                lda $5D0C    ; $5F21
                sbc $61    ; $5F24
                cmp $5D10    ; $5F26
                bcc $5F5E    ; $5F29
                bne $5F34    ; $5F2B
                lda $00    ; $5F2D
                cmp SMoveMax    ; $5F2F
                bcc $5F5E    ; $5F32
                lda $61    ; $5F34
                pha    ; $5F36
                lda TheBuffer    ; $5F37
                pha    ; $5F39
                lda $5D0B    ; $5F3A
                sta TheBuffer    ; $5F3D
                lda $5D0C    ; $5F3F
                sta $61    ; $5F42
                jsr PushMark    ; $5F44
                pla    ; $5F47
                sta TheBuffer    ; $5F48
                pla    ; $5F4A
                sta $61    ; $5F4B
                jsr EchoAreaMsg    ; $5F4D
                bne $5F41    ; $5F50
                sbc #$EE    ; $5F52
        dfb $F4        ; $5F54  (data/65C02-bit)
                ldy #$D0    ; $5F55
                sbc $F3,x    ; $5F57
                inx    ; $5F59
                sbc $E4    ; $5F5A
                ldx $6000    ; $5F5C
                beq $5F65    ; $5F5F
                lda #$FF    ; $5F61
                bne $5F67    ; $5F63
                lda #$00    ; $5F65
                sta $5DC8    ; $5F67
                beq $5F76    ; $5F6A
                jsr Beep    ; $5F6C
                lda #$00    ; $5F6F
                sta MacroExec    ; $5F71
                lda #$FF    ; $5F74
                rts    ; $5F76
                jsr OpenEchoArea    ; $5F77
                lda #$16    ; $5F7A
                sta $5725    ; $5F7C
                sta CV    ; $5F7F
                lda WindowLft    ; $5F81
                sta EchoAreaCH    ; $5F83
                sta CH    ; $5F86
                jsr vtab    ; $5F88
                lda $5DC8    ; $5F8B
                bpl $5F9C    ; $5F8E
                jsr PrintMessage    ; $5F90
                dec $E1    ; $5F93
                sbc #$EC    ; $5F95
                sbc #$EE    ; $5F97
        dfb $E7        ; $5F99  (data/65C02-bit)
                ldy #$00    ; $5F9A
                lda ISearchDir    ; $5F9C
                bpl $5FAD    ; $5F9F
                jsr PrintMessage    ; $5FA1
                cmp ($E5)    ; $5FA4
                inc $E5,x    ; $5FA6
                sbc ($F3)    ; $5FA8
                sbc $A0    ; $5FAA
                brk    ; $5FAC
                jsr PrintMessage    ; $5FAD
                cmp #$AD    ; $5FB0
        dfb $D3        ; $5FB2  (data/65C02-bit)
                sbc $E1    ; $5FB3
                sbc ($E3)    ; $5FB5
                inx    ; $5FB7
                tsx    ; $5FB8
                brk    ; $5FB9
                ldy #$00    ; $5FBA
                cpy $5BF0    ; $5FBC
                beq $5FCA    ; $5FBF
                lda SearchString,y    ; $5FC1
                jsr CharOut    ; $5FC4
                iny    ; $5FC7
                bne $5FBC    ; $5FC8
                jsr ClearEOP    ; $5FCA
                jsr CloseEchoArea    ; $5FCD
                rts    ; $5FD0
;
; === ISearch ===
                jsr SearchInit    ; $5FD1
                jsr IPushSearch    ; $5FD4
                jsr $5F77    ; $5FD7
                jsr SearchKeyin    ; $5FDA
                jsr $61AC    ; $5FDD
                beq $5FEB    ; $5FE0
                cmp #$A0    ; $5FE2
                bcs $6001    ; $5FE4
                ldy #$00    ; $5FE6
                jmp $5E99    ; $5FE8
                txa    ; $5FEB
                asl    ; $5FEC
                tax    ; $5FED
                lda ISearchVects,x    ; $5FEE
                sta $00    ; $5FF1
                lda $5DB9,x    ; $5FF3
                sta $01    ; $5FF6
                jsr $5FFE    ; $5FF8
                jmp $5FD7    ; $5FFB
                jmp ($0000)    ; $5FFE
                ldx $5BF0    ; $6001
                cpx #$28    ; $6004
                bcs $6042    ; $6006
                sta SearchString,x    ; $6008
                jsr IPushSearch    ; $600B
                inc $5BF0    ; $600E
                jsr $5F77    ; $6011
                bit $5DC8    ; $6014
                bmi $603F    ; $6017
                lda #$00    ; $6019
                sta $5DC8    ; $601B
                jsr $61A1    ; $601E
                jsr $5F5F    ; $6021
                bne $603F    ; $6024
                lda $00    ; $6026
                sta TheBuffer    ; $6028
                lda $01    ; $602A
                sta $61    ; $602C
                jsr FindPoint    ; $602E
                beq $603F    ; $6031
                dec EnableKDisp    ; $6033
                jsr CenterPage    ; $6036
                inc EnableKDisp    ; $6039
                jsr FindPoint    ; $603C
                jmp $5FD7    ; $603F
                lda #$FF    ; $6042
                sta $5DC8    ; $6044
                bmi $5FD7    ; $6047
                lda $63    ; $6049
                pha    ; $604B
                lda PageTop    ; $604C
                pha    ; $604E
                jsr IPopSearch    ; $604F
                pla    ; $6052
                sta $00    ; $6053
                pla    ; $6055
                sta $01    ; $6056
                lda IStackPntr    ; $6058
                beq $6076    ; $605B
                lda $00    ; $605D
                cmp PageTop    ; $605F
                bne $6069    ; $6061
                lda $01    ; $6063
                cmp $63    ; $6065
                beq $6072    ; $6067
                dec EnableKDisp    ; $6069
                jsr DisplayPage    ; $606C
                inc EnableKDisp    ; $606F
                jsr FindPoint    ; $6072
                rts    ; $6075
                pla    ; $6076
                pla    ; $6077
                jsr ClrEchoArea    ; $6078
                lda #$9B    ; $607B
                ldy #$00    ; $607D
                sty $5BF0    ; $607F
                jmp $5E99    ; $6082
;
; === SearchKeyin ===
                lda EchoAreaCH    ; $6085
                sta ParenPos    ; $6088
                lda $5725    ; $608B
                sta $29D7    ; $608E
                lda CV    ; $6091
                pha    ; $6093
                lda CH    ; $6094
                pha    ; $6096
                lda ParenPos    ; $6097
                sta CH    ; $609A
                lda $29D7    ; $609C
                sta CV    ; $609F
                jsr vtab    ; $60A1
                lda #$DF    ; $60A4
                ldy CH    ; $60A6
                jsr StoreChar    ; $60A8
                pla    ; $60AB
                sta CH    ; $60AC
                pla    ; $60AE
                sta CV    ; $60AF
                jsr vtab    ; $60B1
                lda #$FF    ; $60B4
                sta ParenFlag    ; $60B6
                jsr BlinkCursor    ; $60B9
                pha    ; $60BC
                lda CV    ; $60BD
                pha    ; $60BF
                lda CH    ; $60C0
                pha    ; $60C2
                lda EchoAreaCH    ; $60C3
                sta CH    ; $60C6
                lda $5725    ; $60C8
                sta CV    ; $60CB
                jsr vtab    ; $60CD
                lda #$A0    ; $60D0
                ldy CH    ; $60D2
                jsr StoreChar    ; $60D4
                pla    ; $60D7
                sta CH    ; $60D8
                pla    ; $60DA
                sta CV    ; $60DB
                jsr vtab    ; $60DD
                pla    ; $60E0
                rts    ; $60E1
                lda #$FF    ; $60E2
                bne $60E8    ; $60E4
                lda #$00    ; $60E6
                pha    ; $60E8
                jsr IPushSearch    ; $60E9
                pla    ; $60EC
                cmp ISearchDir    ; $60ED
                sta ISearchDir    ; $60F0
                php    ; $60F3
                ldx $5BF0    ; $60F4
                bne $6118    ; $60F7
                plp    ; $60F9
                php    ; $60FA
                beq $610A    ; $60FB
                lda ISearchDir    ; $60FD
                pha    ; $6100
                jsr IPopSearch    ; $6101
                pla    ; $6104
                sta ISearchDir    ; $6105
                plp    ; $6108
                rts    ; $6109
                lda SearchDefault,x    ; $610A
                beq $6115    ; $610D
                sta SearchString,x    ; $610F
                inx    ; $6112
                bne $610A    ; $6113
                stx $5BF0    ; $6115
                lda #$00    ; $6118
                sta $5DC8    ; $611A
                jsr $5F77    ; $611D
                plp    ; $6120
                beq $6144    ; $6121
                jsr $61A1    ; $6123
                jsr $5F5F    ; $6126
                bne $6109    ; $6129
                lda $00    ; $612B
                sta TheBuffer    ; $612D
                lda $01    ; $612F
                sta $61    ; $6131
                jsr FindPoint    ; $6133
                beq $6109    ; $6136
                jsr CenterPage    ; $6138
                jmp FindPoint    ; $613B
                pla    ; $613E
                lda #$FF    ; $613F
                jmp $5F5F    ; $6141
                lda $5BF0    ; $6144
                beq $6164    ; $6147
                lda ISearchDir    ; $6149
                bmi $6165    ; $614C
                inc TheBuffer    ; $614E
                bne $6154    ; $6150
                inc $61    ; $6152
                jsr $61A1    ; $6154
                jsr $5F5F    ; $6157
                beq $612B    ; $615A
                lda TheBuffer    ; $615C
                bne $6162    ; $615E
                dec $61    ; $6160
                dec TheBuffer    ; $6162
                rts    ; $6164
                lda TheBuffer    ; $6165
                bne $616B    ; $6167
                dec $61    ; $6169
                dec TheBuffer    ; $616B
                jsr $61A1    ; $616D
                jsr $5F5F    ; $6170
                beq $612B    ; $6173
                inc TheBuffer    ; $6175
                bne $617B    ; $6177
                inc $61    ; $6179
                rts    ; $617B
;
; === SearchInit ===
                jsr KillGap    ; $617C
                lda TheBuffer    ; $617F
                sta $5D0B    ; $6181
                lda $61    ; $6184
                sta $5D0C    ; $6186
                lda PageTop    ; $6189
                sta $5D0D    ; $618B
                lda $63    ; $618E
                sta $5D0E    ; $6190
                lda #$00    ; $6193
                sta IStackPntr    ; $6195
                sta $5BF0    ; $6198
                sta $5DC8    ; $619B
                jmp ClrEchoArea    ; $619E
                lda ISearchDir    ; $61A1
                beq $61A9    ; $61A4
                jmp SearchBackwrd    ; $61A6
                jmp SearchForward    ; $61A9
                ldx #$00    ; $61AC
                cmp ISearchChars,x    ; $61AE
                beq $61B9    ; $61B1
                inx    ; $61B3
                cpx #$08    ; $61B4
                bcc $61AE    ; $61B6
                inx    ; $61B8
                rts    ; $61B9
                lda $5DC8    ; $61BA
                beq $61C5    ; $61BD
                jsr Beep    ; $61BF
                jmp $61F0    ; $61C2
                pla    ; $61C5
                pla    ; $61C6
                lda #$87    ; $61C7
                ldy #$00    ; $61C9
                jmp $5E99    ; $61CB
                lda HardKey    ; $61CE
                bpl $61EF    ; $61D1
                cmp #$87    ; $61D3
                php    ; $61D5
                jsr GatherTYI    ; $61D6
                plp    ; $61D9
                bne $61EF    ; $61DA
                pla    ; $61DC
                pla    ; $61DD
                jsr IPopSearch    ; $61DE
                jsr Beep    ; $61E1
                lda TheBuffer    ; $61E4
                sta $00    ; $61E6
                lda $61    ; $61E8
                sta $01    ; $61EA
                lda $5DC8    ; $61EC
                rts    ; $61EF
                jsr IPopSearch    ; $61F0
                bne $61FA    ; $61F3
                bit $5DC8    ; $61F5
                bmi $61F0    ; $61F8
                dec EnableKDisp    ; $61FA
                jsr DisplayPage    ; $61FD
                inc EnableKDisp    ; $6200
                jsr FindPoint    ; $6203
                jsr $5F77    ; $6206
                rts    ; $6209
                pla    ; $620A
                pla    ; $620B
                lda $5BF0    ; $620C
                beq $6218    ; $620F
                lda #$9B    ; $6211
                ldy #$00    ; $6213
                jmp $5E99    ; $6215
                lda ISearchDir    ; $6218
                jmp StrSearch    ; $621B
                brk    ; $621E
                brk    ; $621F
;
; === StringSearch ===
                lda #$00    ; $6220
                beq StrSearch    ; $6222
;
; === RStrSearch ===
                lda #$FF    ; $6224
;
; === StrSearch ===
                sta ISearchDir    ; $6226
                jsr SearchInit    ; $6229
                lda #$00    ; $622C
                sta $621E    ; $622E
                sta $621F    ; $6231
                jsr $635B    ; $6234
                jsr SearchKeyin    ; $6237
                jsr $625B    ; $623A
                bne $6245    ; $623D
                jsr $6269    ; $623F
                jmp $6234    ; $6242
                ldx $5BF0    ; $6245
                cpx #$28    ; $6248
                bcs $6255    ; $624A
                sta SearchString,x    ; $624C
                inc $5BF0    ; $624F
                jmp $6234    ; $6252
                jsr Beep    ; $6255
                jmp $6234    ; $6258
                ldx #$00    ; $625B
                cmp $627B,x    ; $625D
                beq $6268    ; $6260
                inx    ; $6262
                cpx #$07    ; $6263
                bcc $625D    ; $6265
                inx    ; $6267
                rts    ; $6268
                pha    ; $6269
                txa    ; $626A
                asl    ; $626B
                tax    ; $626C
                lda $6282,x    ; $626D
                sta $00    ; $6270
                lda $6283,x    ; $6272
                sta $01    ; $6275
                pla    ; $6277
                jmp ($0000)    ; $6278
        dfb $9B        ; $627B  (data/65C02-bit)
                sta $82    ; $627C
                sta ($93)    ; $627E
        dfb $87        ; $6280  (data/65C02-bit)
        dfb $FF        ; $6281  (data/65C02-bit)
                bcc $62E6    ; $6282
        dfb $DF        ; $6284  (data/65C02-bit)
        dfb $62        ; $6285  (data/65C02-bit)
                sbc $FB62    ; $6286
        dfb $62        ; $6289  (data/65C02-bit)
                asl $63    ; $628A
        dfb $2B        ; $628C  (data/65C02-bit)
        dfb $63        ; $628D  (data/65C02-bit)
                rol $63,x    ; $628E
                pla    ; $6290
                pla    ; $6291
                lda #$FF    ; $6292
                sta $5DC8    ; $6294
                jsr IPushSearch    ; $6297
                lda $621F    ; $629A
                beq $62AA    ; $629D
                lda BuffTop    ; $629F
                sta TheBuffer    ; $62A1
                lda $67    ; $62A3
                sta $61    ; $62A5
                jmp $62BF    ; $62A7
                lda $621E    ; $62AA
                beq $62BF    ; $62AD
                lda GapTop    ; $62AF
                sta TheBuffer    ; $62B1
                lda $6B    ; $62B3
                sta $61    ; $62B5
                lda TheBuffer    ; $62B7
                bne $62BD    ; $62B9
                dec $61    ; $62BB
                dec TheBuffer    ; $62BD
                lda #$9B    ; $62BF
                jsr EchoOutput    ; $62C1
                jsr $61A1    ; $62C4
                bne $62D8    ; $62C7
                lda $00    ; $62C9
                sta TheBuffer    ; $62CB
                lda $01    ; $62CD
                sta $61    ; $62CF
                lda #$9B    ; $62D1
                ldy #$00    ; $62D3
                jmp $5E99    ; $62D5
                lda #$87    ; $62D8
                ldy #$00    ; $62DA
                jmp $5E99    ; $62DC
                lda #$FF    ; $62DF
                sta ISearchDir    ; $62E1
                sta $621E    ; $62E4
                lda #$00    ; $62E7
                sta $621F    ; $62E9
                rts    ; $62EC
                lda #$00    ; $62ED
                sta ISearchDir    ; $62EF
                sta $621E    ; $62F2
                lda #$FF    ; $62F5
                sta $621F    ; $62F7
                rts    ; $62FA
                lda #$FF    ; $62FB
                sta ISearchDir    ; $62FD
                lda #$00    ; $6300
                sta $621F    ; $6302
                rts    ; $6305
                ldx $5BF0    ; $6306
                bne $631C    ; $6309
                ldx #$00    ; $630B
                lda SearchDefault,x    ; $630D
                beq $6318    ; $6310
                sta SearchString,x    ; $6312
                inx    ; $6315
                bne $630D    ; $6316
                stx $5BF0    ; $6318
                rts    ; $631B
                cpx #$28    ; $631C
                bcs $6327    ; $631E
                sta SearchString,x    ; $6320
                inc $5BF0    ; $6323
                rts    ; $6326
                jsr Beep    ; $6327
                rts    ; $632A
                jsr ClrEchoArea    ; $632B
                jsr Beep    ; $632E
                pla    ; $6331
                pla    ; $6332
                lda #$01    ; $6333
                rts    ; $6335
                dec $5BF0    ; $6336
                bpl $6342    ; $6339
                jsr ClrEchoArea    ; $633B
                pla    ; $633E
                pla    ; $633F
                lda #$01    ; $6340
                rts    ; $6342
                jsr SearchKeyin    ; $6343
                cmp #$87    ; $6346
                bne $6354    ; $6348
                jsr Beep    ; $634A
                rts    ; $634D
                lda #$8D    ; $634E
                bne $6354    ; $6350
                lda #$89    ; $6352
                tax    ; $6354
                pla    ; $6355
                pla    ; $6356
                txa    ; $6357
                jmp $6001    ; $6358
                lda CV    ; $635B
                pha    ; $635D
                lda CH    ; $635E
                pha    ; $6360
                jsr OpenEchoArea    ; $6361
                lda #$16    ; $6364
                sta $5725    ; $6366
                sta CV    ; $6369
                lda WindowLft    ; $636B
                sta EchoAreaCH    ; $636D
                sta CH    ; $6370
                jsr vtab    ; $6372
                lda $621F    ; $6375
                beq $6384    ; $6378
                jsr PrintMessage    ; $637A
        dfb $C2        ; $637D  (data/65C02-bit)
                dex    ; $637E
                ldy #$00    ; $637F
                jmp $6390    ; $6381
                lda $621E    ; $6384
                beq $6390    ; $6387
                jsr PrintMessage    ; $6389
                cmp $CA    ; $638C
                ldy #$00    ; $638E
                bit ISearchDir    ; $6390
                bpl $63A1    ; $6393
                jsr PrintMessage    ; $6395
                cmp ($E5)    ; $6398
                inc $E5,x    ; $639A
                sbc ($F3)    ; $639C
                sbc $A0    ; $639E
                brk    ; $63A0
                jsr PrintMessage    ; $63A1
        dfb $D3        ; $63A4  (data/65C02-bit)
                sbc $E1    ; $63A5
                sbc ($E3)    ; $63A7
                inx    ; $63A9
                tsx    ; $63AA
                brk    ; $63AB
                lda SearchString,y    ; $63AC
                cpy $5BF0    ; $63AF
                beq $63BA    ; $63B2
                jsr CharOut    ; $63B4
                iny    ; $63B7
                bne $63AC    ; $63B8
                jsr ClearEOP    ; $63BA
                jsr CloseEchoArea    ; $63BD
                pla    ; $63C0
                sta CH    ; $63C1
                pla    ; $63C3
                sta CV    ; $63C4
                jsr vtab    ; $63C6
                rts    ; $63C9
;
; === LabelSearch ===
                jsr GetStrArg    ; $63CA
                beq $63F3    ; $63CD
                jsr NewEchoArea    ; $63CF
                jsr PrintMessage    ; $63D2
                cpy $E2E1    ; $63D5
                sbc $EC    ; $63D8
                ldy #$D3    ; $63DA
                sbc $E1    ; $63DC
                sbc ($E3)    ; $63DE
                inx    ; $63E0
                tsx    ; $63E1
                brk    ; $63E2
                jsr ReadArgLine    ; $63E3
                php    ; $63E6
                jsr CloseEchoArea    ; $63E7
                plp    ; $63EA
                beq $63F3    ; $63EB
                jsr Beep    ; $63ED
                lda #$01    ; $63F0
                rts    ; $63F2
                ldy #$01    ; $63F3
                ldx #$00    ; $63F5
                lda $0200,x    ; $63F7
                cmp #$8D    ; $63FA
                beq $6407    ; $63FC
                sta SearchString,y    ; $63FE
                inx    ; $6401
                iny    ; $6402
                cpy #$28    ; $6403
                bcc $63F7    ; $6405
                lda #$8D    ; $6407
                sta SearchString    ; $6409
                sty $5BF0    ; $640C
                jsr KillGap    ; $640F
                lda TheBuffer    ; $6412
                sta $5D0B    ; $6414
                lda $61    ; $6417
                sta $5D0C    ; $6419
                lda PageTop    ; $641C
                sta $5D0D    ; $641E
                lda $63    ; $6421
                sta $5D0E    ; $6423
                lda BuffTop    ; $6426
                sta TheBuffer    ; $6428
                lda $67    ; $642A
                sta $61    ; $642C
                lda #$00    ; $642E
                sta ISearchDir    ; $6430
                jsr $61A1    ; $6433
                beq $6448    ; $6436
                jsr Beep    ; $6438
                lda $5D0B    ; $643B
                sta TheBuffer    ; $643E
                lda $5D0C    ; $6440
                sta $61    ; $6443
                jmp $63F0    ; $6445
                lda $00    ; $6448
                sta TheBuffer    ; $644A
                lda $01    ; $644C
                sta $61    ; $644E
                lda #$A0    ; $6450
                jsr EchoOutput    ; $6452
                ldx #$FF    ; $6455
                lda $61    ; $6457
                cmp $5D0C    ; $6459
                bcc $6468    ; $645C
                bne $6467    ; $645E
                lda TheBuffer    ; $6460
                cmp $5D0B    ; $6462
                bcc $6468    ; $6465
                inx    ; $6467
                stx ISearchDir    ; $6468
                jsr $5F04    ; $646B
                jsr SetGap    ; $646E
                lda #$01    ; $6471
                rts    ; $6473
                ldy $F7A0    ; $6474
                inx    ; $6477
                sbc #$E3    ; $6478
                inx    ; $647A
                ldy #$E3    ; $647B
                sbc ($EE,x)    ; $647D
                ldy #$E2    ; $647F
                sbc $A0    ; $6481
                sbc #$EE    ; $6483
                inc $EF,x    ; $6485
        dfb $EB        ; $6487  (data/65C02-bit)
                sbc $E4    ; $6488
                ldy #$F6    ; $648A
                sbc #$E1    ; $648C
                tsx    ; $648E
                jsr rm_DataBuffer    ; $648F
        dfb $37        ; $6492  (data/65C02-bit)
                sta CompList    ; $6493
                lda #$9B    ; $6496
                sta $5988    ; $6498
                jsr GetAproArg    ; $649B
                beq $64A6    ; $649E
                jsr Beep    ; $64A0
                lda #$01    ; $64A3
                rts    ; $64A5
                lda #$9B    ; $64A6
                sta $0200,x    ; $64A8
                jsr SI:Apropos    ; $64AB
                jsr OpenTypeout    ; $64AE
                lda #$00    ; $64B1
                jsr $6686    ; $64B3
                jmp $64CD    ; $64B6
                jsr GetStrArg    ; $64B9
                bne $64C4    ; $64BC
                jsr PrintReturn    ; $64BE
                jmp $64A6    ; $64C1
                jsr PrintDone    ; $64C4
                jsr CloseTypeout    ; $64C7
                lda #$06    ; $64CA
                rts    ; $64CC
                jsr PopCompPoint    ; $64CD
                bne $64B9    ; $64D0
                lda $01    ; $64D2
                pha    ; $64D4
                lda $00    ; $64D5
                pha    ; $64D7
                jsr $65A0    ; $64D8
                lda #$74    ; $64DB
                sta $00    ; $64DD
                lda #$64    ; $64DF
                sta $01    ; $64E1
                lda #$1E    ; $64E3
                jsr DCIStringOut1    ; $64E5
                pla    ; $64E8
                sta $00    ; $64E9
                pla    ; $64EB
                sta $01    ; $64EC
                jsr PushCompPoint    ; $64EE
                jsr FunctionRef    ; $64F1
                ldx #$00    ; $64F4
                stx $6490    ; $64F6
                lda $6490    ; $64F9
                bne $6504    ; $64FC
                jsr GetKeyFun    ; $64FE
                jmp $6507    ; $6501
                jsr GetKeyFun1    ; $6504
                bne $6528    ; $6507
                inc $6490    ; $6509
                pha    ; $650C
                lda $6490    ; $650D
                cmp #$01    ; $6510
                beq $6520    ; $6512
                cmp #$04    ; $6514
                bcs $6527    ; $6516
                lda #$AC    ; $6518
                jsr CharOut    ; $651A
                jsr PrintSpace    ; $651D
                pla    ; $6520
                jsr PrettyPrint    ; $6521
                jmp $64F9    ; $6524
                pla    ; $6527
                jsr $6567    ; $6528
                jsr PopCompPoint    ; $652B
                lda $6490    ; $652E
                beq $654B    ; $6531
                cmp #$04    ; $6533
                bcs $6540    ; $6535
                jsr PrintMessage    ; $6537
                ldx: $008D    ; $653A
                jmp $64CD    ; $653D
                jsr PrintMessage    ; $6540
                ldx $AEAE    ; $6543
                sta $4C00    ; $6546
                cmp $A564    ; $6549
                ora ($48,x)    ; $654C
                lda $00    ; $654E
                pha    ; $6550
                jsr PrintMessage    ; $6551
                cmp $D8AD    ; $6554
                ldy #$00    ; $6557
                pla    ; $6559
                sta $00    ; $655A
                pla    ; $655C
                sta $01    ; $655D
                lda #$1E    ; $655F
                jsr DCIStringOut1    ; $6561
                jmp $6537    ; $6564
                ldx #$00    ; $6567
                txa    ; $6569
                asl    ; $656A
                tay    ; $656B
                lda $00    ; $656C
                cmp C_XVectors,y    ; $656E
                bne $657A    ; $6571
                lda $01    ; $6573
                cmp $7DDF,y    ; $6575
                beq $6581    ; $6578
                inx    ; $657A
                cpx C_XCharCount    ; $657B
                bcc $6569    ; $657E
                rts    ; $6580
                lda C_XCharacters,x    ; $6581
                pha    ; $6584
                lda $6490    ; $6585
                beq $6590    ; $6588
                jsr PrintMessage    ; $658A
                ldy: $00A0    ; $658D
                lda #$98    ; $6590
                jsr PrettyPrint    ; $6592
                jsr PrintSpace    ; $6595
                pla    ; $6598
                jsr PrettyPrint    ; $6599
                inc $6490    ; $659C
                rts    ; $659F
                jsr PrintReturn    ; $65A0
                jsr DCIStringOut    ; $65A3
                lda #$1E    ; $65A6
                sta CH    ; $65A8
                sta TypeoutCH    ; $65AA
                jmp PrintCompDoc    ; $65AD
;
; === ListVars ===
                lda #$5D    ; $65B0
                sta CompList    ; $65B2
                lda #$97    ; $65B5
                sta $5988    ; $65B7
                jsr GetAproArg    ; $65BA
                beq $65C5    ; $65BD
                jsr Beep    ; $65BF
                lda #$01    ; $65C2
                rts    ; $65C4
                lda #$9B    ; $65C5
                sta $0200,x    ; $65C7
                jsr SI:Apropos    ; $65CA
                jsr OpenTypeout    ; $65CD
                lda #$FF    ; $65D0
                jsr $6686    ; $65D2
                jsr PopCompPoint    ; $65D5
                bne $65FF    ; $65D8
                lda $01    ; $65DA
                pha    ; $65DC
                lda $00    ; $65DD
                pha    ; $65DF
                jsr $65A0    ; $65E0
                lda #$E5    ; $65E3
                sta $00    ; $65E5
                lda #$BE    ; $65E7
                sta $01    ; $65E9
                lda #$1E    ; $65EB
                jsr DCIStringOut1    ; $65ED
                pla    ; $65F0
                sta $00    ; $65F1
                pla    ; $65F3
                sta $01    ; $65F4
                jsr PrintVar    ; $65F6
                jsr PrintReturn    ; $65F9
                jmp $65D5    ; $65FC
                jsr PrintDone    ; $65FF
                jsr CloseTypeout    ; $6602
                lda #$01    ; $6605
                rts    ; $6607
;
; === CheckString ===
                ldy #$FF    ; $6608
                sty $02    ; $660A
                inc $02    ; $660C
                ldy $02    ; $660E
                ldx #$00    ; $6610
                lda $0200,x    ; $6612
                cmp #$9B    ; $6615
                beq $663C    ; $6617
                jsr UpperCon    ; $6619
                sta $03    ; $661C
                lda ($00),y    ; $661E
                bpl $662D    ; $6620
                jsr UpperCon    ; $6622
                cmp $03    ; $6625
                bne $660C    ; $6627
                iny    ; $6629
                inx    ; $662A
                bne $6612    ; $662B
                ora #$80    ; $662D
                jsr UpperCon    ; $662F
                cmp $03    ; $6632
                bne $663C    ; $6634
                inx    ; $6636
                lda $0200,x    ; $6637
                cmp #$9B    ; $663A
                rts    ; $663C
;
; === SI:Apropos ===
                lda CompList    ; $663D
                sta $00    ; $6640
                lda $5988    ; $6642
                sta $01    ; $6645
                lda #$00    ; $6647
                sta CompCount    ; $6649
                ldy #$00    ; $664C
                lda ($00),y    ; $664E
                beq $6665    ; $6650
                cmp #$FF    ; $6652
                bne $6666    ; $6654
                iny    ; $6656
                lda ($00),y    ; $6657
                pha    ; $6659
                iny    ; $665A
                lda ($00),y    ; $665B
                sta $01    ; $665D
                pla    ; $665F
                sta $00    ; $6660
                jmp $664C    ; $6662
                rts    ; $6665
                jsr CheckString    ; $6666
                bne $6674    ; $6669
                jsr PushCompPoint    ; $666B
                jsr SkipEnt    ; $666E
                jmp $664C    ; $6671
                jsr PushCompPoint    ; $6674
                jsr DocRef    ; $6677
                jsr CheckString    ; $667A
                php    ; $667D
                jsr PopCompPoint    ; $667E
                plp    ; $6681
                beq $666B    ; $6682
                bne $666E    ; $6684
                php    ; $6686
                jsr PrintMessage    ; $6687
                iny    ; $668A
                sbc $F2    ; $668B
                sbc $A0    ; $668D
                sbc ($F2,x)    ; $668F
                sbc $A0    ; $6691
        dfb $F4        ; $6693  (data/65C02-bit)
                inx    ; $6694
                sbc $A0    ; $6695
                brk    ; $6697
                plp    ; $6698
                bmi $66AA    ; $6699
                jsr PrintMessage    ; $669B
                inc $F5    ; $669E
                inc $F4E3    ; $66A0
                sbc #$EF    ; $66A3
                inc $4C00    ; $66A5
                ldx BuffTop,y    ; $66A8
                jsr PrintMessage    ; $66AA
                inc $E1,x    ; $66AD
                sbc ($E9)    ; $66AF
                sbc ($E2,x)    ; $66B1
                cpx: $00E5    ; $66B3
                jsr PrintMessage    ; $66B6
        dfb $F3        ; $66B9  (data/65C02-bit)
                ldy #$F7    ; $66BA
                inx    ; $66BC
                sbc #$E3    ; $66BD
                inx    ; $66BF
                ldy #$E3    ; $66C0
        dfb $EF        ; $66C2  (data/65C02-bit)
                inc $E1F4    ; $66C3
                sbc #$EE    ; $66C6
                ldy #$A2    ; $66C8
                brk    ; $66CA
                lda $0200,y    ; $66CB
                cmp #$9B    ; $66CE
                beq $66D8    ; $66D0
                jsr CharOut    ; $66D2
                iny    ; $66D5
                bne $66CB    ; $66D6
                jsr PrintMessage    ; $66D8
                ldx #$BA    ; $66DB
                sta: $008D    ; $66DD
                rts    ; $66E0
;
; === GetAproArg ===
                jsr GetStrArg    ; $66E1
                beq $6703    ; $66E4
                jsr NewEchoArea    ; $66E6
                jsr PrintMessage    ; $66E9
        dfb $D3        ; $66EC  (data/65C02-bit)
                sbc $E2,x    ; $66ED
        dfb $F3        ; $66EF  (data/65C02-bit)
        dfb $F4        ; $66F0  (data/65C02-bit)
                sbc ($E9)    ; $66F1
                inc $BAE7    ; $66F3
                brk    ; $66F6
                jsr ReadArgLine    ; $66F7
                php    ; $66FA
                txa    ; $66FB
                pha    ; $66FC
                jsr CloseEchoArea    ; $66FD
                pla    ; $6700
                tax    ; $6701
                plp    ; $6702
                rts    ; $6703
;
; === GetKeyFun ===
                ldx #$00    ; $6704
                stx $B0    ; $6706
;
; === GetKeyFun1 ===
                lda DispatchTab    ; $6708
                sta $02    ; $670B
                lda $783A    ; $670D
                sta $03    ; $6710
                lda $B0    ; $6712
                tax    ; $6714
                ldy #$00    ; $6715
                asl    ; $6717
                bcc $671B    ; $6718
                iny    ; $671A
                clc    ; $671B
                adc $02    ; $671C
                sta $02    ; $671E
                tya    ; $6720
                adc $03    ; $6721
                sta $03    ; $6723
                ldy #$00    ; $6725
                lda ($02),y    ; $6727
                cmp $00    ; $6729
                bne $6734    ; $672B
                iny    ; $672D
                lda ($02),y    ; $672E
                cmp $01    ; $6730
                beq $6747    ; $6732
                inx    ; $6734
                beq $6744    ; $6735
                lda $02    ; $6737
                clc    ; $6739
                adc #$02    ; $673A
                sta $02    ; $673C
                bcc $6725    ; $673E
                inc $03    ; $6740
                bne $6725    ; $6742
                ldx #$FF    ; $6744
                rts    ; $6746
                txa    ; $6747
                inx    ; $6748
                stx $B0    ; $6749
                ldx #$00    ; $674B
                rts    ; $674D
;
; === AutoFileExt ===
                brk    ; $674E
                brk    ; $674F
                brk    ; $6750
                brk    ; $6751
                brk    ; $6752
                brk    ; $6753
;
; === ShowExtension ===
                brk    ; $6754
                brk    ; $6755
;
; === VisitFile ===
                lda #$00    ; $6756
;
; === SI:VisFile ===
                bne $6778    ; $6758
                jsr MaybeSave    ; $675A
                bne $678E    ; $675D
                dec ShowExtension    ; $675F
                lda #$D7    ; $6762
                sta $00    ; $6764
                lda #$67    ; $6766
                sta $01    ; $6768
                lda #$00    ; $676A
                jsr ReadFilename    ; $676C
                bne $678E    ; $676F
                jsr Default    ; $6771
                cmp #$8D    ; $6774
                beq $677B    ; $6776
                jsr FixPath    ; $6778
                jsr DSK:OpenFile    ; $677B
                bne $67E3    ; $677E
                lda #$01    ; $6780
                jsr ClrBuffFlag    ; $6782
                jsr $6875    ; $6785
                jsr ClrModified    ; $6788
                jmp $6796    ; $678B
                jsr Beep    ; $678E
                lda #$87    ; $6791
                jsr CharOut    ; $6793
                bit $6755    ; $6796
                bpl $67CE    ; $6799
                jsr NewEchoArea    ; $679B
                jsr PrintMessage    ; $679E
                ldy #$D4    ; $67A1
                inx    ; $67A3
                sbc $A0    ; $67A4
                sbc $EE    ; $67A6
        dfb $F4        ; $67A8  (data/65C02-bit)
                sbc #$F2    ; $67A9
                sbc $A0    ; $67AB
                inc $E9    ; $67AD
                cpx $A0E5    ; $67AF
        dfb $E3        ; $67B2  (data/65C02-bit)
                sbc ($EE,x)    ; $67B3
        dfb $A7        ; $67B5  (data/65C02-bit)
        dfb $F4        ; $67B6  (data/65C02-bit)
                ldy #$E2    ; $67B7
                sbc $A0    ; $67B9
                cpx $E1EF    ; $67BB
                cpx $E5    ; $67BE
                cpx $A1    ; $67C0
                brk    ; $67C2
                jsr CloseEchoArea    ; $67C3
                lda #$01    ; $67C6
                jsr SetBuffFlag    ; $67C8
                jsr Beep    ; $67CB
                jsr DisplayPage    ; $67CE
                jsr MakeModeLine    ; $67D1
                lda #$01    ; $67D4
                rts    ; $67D6
                dec $E9,x    ; $67D7
        dfb $F3        ; $67D9  (data/65C02-bit)
                sbc #$F4    ; $67DA
                ldy #$C6    ; $67DC
                sbc #$EC    ; $67DE
                sbc $84    ; $67E0
                dec    ; $67E2
                jsr SetFileDef    ; $67E3
                jsr NewEchoArea    ; $67E6
                jsr PrintMessage    ; $67E9
                tay    ; $67EC
                dec $F7E5    ; $67ED
                ldy #$C6    ; $67F0
                sbc #$EC    ; $67F2
                sbc $A9    ; $67F4
                brk    ; $67F6
                jsr CloseEchoArea    ; $67F7
                jsr MakeModeLine    ; $67FA
                lda BuffTop    ; $67FD
                sta TheBuffer    ; $67FF
                sta GapTop    ; $6801
                lda $67    ; $6803
                sta $61    ; $6805
                sta $6B    ; $6807
                lda BuffBot    ; $6809
                sec    ; $680B
                sbc #$01    ; $680C
                sta GapBot    ; $680E
                lda $69    ; $6810
                sbc #$00    ; $6812
                sta $6D    ; $6814
                jsr CloseEchoArea    ; $6816
                jsr ClrModified    ; $6819
                lda #$06    ; $681C
                rts    ; $681E
;
; === MaybeSave ===
                bit Modified?    ; $681F
                bmi $6825    ; $6822
                rts    ; $6824
                jsr NewEchoArea    ; $6825
                jsr PrintMessage    ; $6828
        dfb $C2        ; $682B  (data/65C02-bit)
                sbc $E6,x    ; $682C
                inc $E5    ; $682E
                sbc ($A0)    ; $6830
                brk    ; $6832
                jsr PrBuffName    ; $6833
                jsr PrintMessage    ; $6836
                ldy #$E8    ; $6839
                sbc ($F3,x)    ; $683B
                ldy #$E2    ; $683D
                sbc $E5    ; $683F
                inc $EDA0    ; $6841
        dfb $EF        ; $6844  (data/65C02-bit)
                cpx $E9    ; $6845
                inc $E9    ; $6847
                sbc $E4    ; $6849
                ldx $A0A0    ; $684B
        dfb $D3        ; $684E  (data/65C02-bit)
                sbc ($F6,x)    ; $684F
                sbc $A0    ; $6851
                sbc #$F4    ; $6853
                ldy #$E6    ; $6855
                sbc #$F2    ; $6857
        dfb $F3        ; $6859  (data/65C02-bit)
        dfb $F4        ; $685A  (data/65C02-bit)
                brk    ; $685B
                jsr GetYOrNp    ; $685C
                php    ; $685F
                pha    ; $6860
                jsr CloseEchoArea    ; $6861
                pla    ; $6864
                plp    ; $6865
                beq $6872    ; $6866
                cmp #$87    ; $6868
                beq $686F    ; $686A
                lda #$00    ; $686C
                rts    ; $686E
                lda #$FF    ; $686F
                rts    ; $6871
                jmp IN:SaveFile    ; $6872
                jsr NewEchoArea    ; $6875
                jsr PrintMessage    ; $6878
                cmp ($E5)    ; $687B
                sbc ($E4,x)    ; $687D
                sbc #$EE    ; $687F
        dfb $E7        ; $6881  (data/65C02-bit)
                ldy #$00    ; $6882
                jsr PrintPath    ; $6884
                jsr PrintMessage    ; $6887
        dfb $BB        ; $688A  (data/65C02-bit)
                ldy #$A8    ; $688B
                brk    ; $688D
                sty PD:Justify    ; $688E
                lda $7127    ; $6891
                ldx GblLength    ; $6894
                jsr PrintDec    ; $6897
                jsr PrintMessage    ; $689A
                ldy #$E3    ; $689D
                inx    ; $689F
                sbc ($F2,x)    ; $68A0
                sbc ($E3,x)    ; $68A2
        dfb $F4        ; $68A4  (data/65C02-bit)
                sbc $F2    ; $68A5
        dfb $F3        ; $68A7  (data/65C02-bit)
                lda #$00    ; $68A8
                jsr CloseEchoArea    ; $68AA
                jsr SetFileDef    ; $68AD
                jsr ZapBuff    ; $68B0
                jsr $6B27    ; $68B3
                sta $6755    ; $68B6
                jsr SetGap    ; $68B9
                jsr ParseMode    ; $68BC
                rts    ; $68BF
;
; === Default ===
                lda $0200    ; $68C0
                cmp #$8D    ; $68C3
                bne $68DB    ; $68C5
                ldy #$00    ; $68C7
                ldx #$00    ; $68C9
                lda (BuffData),y    ; $68CB
                beq $68D6    ; $68CD
                sta $0200,x    ; $68CF
                iny    ; $68D2
                inx    ; $68D3
                bne $68CB    ; $68D4
                lda #$8D    ; $68D6
                sta $0200,x    ; $68D8
                rts    ; $68DB
                lda #$8D    ; $68DC
                sta $0200,x    ; $68DE
                jmp DSK:ListFiles    ; $68E1
;
; === SetFileDef ===
                lda AutoFileExt    ; $68E4
                pha    ; $68E7
                lda #$00    ; $68E8
                sta AutoFileExt    ; $68EA
                jsr FixPath    ; $68ED
                pla    ; $68F0
                sta AutoFileExt    ; $68F1
                ldx #$00    ; $68F4
                lda $0200,x    ; $68F6
                beq $6904    ; $68F9
                cmp #$8D    ; $68FB
                beq $6904    ; $68FD
                inx    ; $68FF
                cpx #$3F    ; $6900
                bcc $68F6    ; $6902
                lda #$00    ; $6904
                sta $0200,x    ; $6906
                tax    ; $6909
                ldy #$00    ; $690A
                lda $0200,x    ; $690C
                sta (BuffData),y    ; $690F
                beq $6919    ; $6911
                iny    ; $6913
                inx    ; $6914
                cpx #$3F    ; $6915
                bcc $690C    ; $6917
                lda #$00    ; $6919
                sta (BuffData),y    ; $691B
                rts    ; $691D
                lda #$FF    ; $691E
                bmi $6924    ; $6920
;
; === IN:SaveFile ===
                lda #$00    ; $6922
                php    ; $6924
                ldy #$41    ; $6925
                lda (BuffData),y    ; $6927
                and #$01    ; $6929
                beq $6931    ; $692B
                plp    ; $692D
                jmp $698C    ; $692E
                plp    ; $6931
                bmi $6951    ; $6932
                ldy #$00    ; $6934
                lda (BuffData),y    ; $6936
                beq $6951    ; $6938
                ldx #$00    ; $693A
                lda (BuffData),y    ; $693C
                beq $6949    ; $693E
                sta $0200,x    ; $6940
                iny    ; $6943
                inx    ; $6944
                cpx #$3F    ; $6945
                bcc $693C    ; $6947
                lda #$8D    ; $6949
                sta $0200,x    ; $694B
                jmp $6960    ; $694E
                lda #$B4    ; $6951
                sta $00    ; $6953
                lda #$69    ; $6955
                sta $01    ; $6957
                lda #$FF    ; $6959
                jsr ReadFilename    ; $695B
                bne $6986    ; $695E
                jsr DSK:SaveFile    ; $6960
                bne $698C    ; $6963
                jsr SetFileDef    ; $6965
                jsr NewEchoArea    ; $6968
                jsr PrintMessage    ; $696B
        dfb $D7        ; $696E  (data/65C02-bit)
                sbc ($E9)    ; $696F
        dfb $F4        ; $6971  (data/65C02-bit)
        dfb $F4        ; $6972  (data/65C02-bit)
                sbc $EE    ; $6973
                tsx    ; $6975
                brk    ; $6976
                jsr PrFileName    ; $6977
                jsr ClrModified    ; $697A
                jsr MakeModeLine    ; $697D
                jsr CloseEchoArea    ; $6980
                lda #$00    ; $6983
                rts    ; $6985
                jsr CloseEchoArea    ; $6986
                lda #$FF    ; $6989
                rts    ; $698B
                jsr NewEchoArea    ; $698C
                jsr PrintMessage    ; $698F
                dec $E1    ; $6992
                sbc #$EC    ; $6994
                sbc $E4    ; $6996
                lda ($A0,x)    ; $6998
                cpy $F5    ; $699A
                sbc ($E9)    ; $699C
                inc $A0E7    ; $699E
        dfb $F7        ; $69A1  (data/65C02-bit)
                sbc ($E9)    ; $69A2
        dfb $F4        ; $69A4  (data/65C02-bit)
                sbc $A0    ; $69A5
        dfb $EF        ; $69A7  (data/65C02-bit)
                inc $A0    ; $69A8
                brk    ; $69AA
                jsr PrFileName    ; $69AB
                jsr Beep    ; $69AE
                jmp $6986    ; $69B1
        dfb $D3        ; $69B4  (data/65C02-bit)
                sbc ($F6,x)    ; $69B5
                sbc $A0    ; $69B7
        dfb $E2        ; $69B9  (data/65C02-bit)
                sbc $E6,x    ; $69BA
                inc $E5    ; $69BC
                sbc ($A0)    ; $69BE
        dfb $82        ; $69C0  (data/65C02-bit)
                ldy #$E9    ; $69C1
                inc $E6A0    ; $69C3
                sbc #$EC    ; $69C6
                sbc $3A    ; $69C8
;
; === WriteFile ===
                jsr $691E    ; $69CA
                lda #$01    ; $69CD
                rts    ; $69CF
;
; === ReadFilename ===
                sta $6A7C    ; $69D0
                lda $00    ; $69D3
                sta $6A7A    ; $69D5
                lda $01    ; $69D8
                sta $6A7B    ; $69DA
                jsr GetStrArg    ; $69DD
                bne $69E8    ; $69E0
                lda #$00    ; $69E2
                sta ShowExtension    ; $69E4
                rts    ; $69E7
                jsr NewEchoArea    ; $69E8
                bit ShowExtension    ; $69EB
                bpl $6A13    ; $69EE
                inc ShowExtension    ; $69F0
                jsr AnyArgument?    ; $69F3
                beq $6A13    ; $69F6
                ldy AutoFileExt    ; $69F8
                beq $6A13    ; $69FB
                jsr PrintMessage    ; $69FD
        dfb $DB        ; $6A00  (data/65C02-bit)
                brk    ; $6A01
                lda AutoFileExt,y    ; $6A02
                beq $6A0D    ; $6A05
                jsr CharOut    ; $6A07
                iny    ; $6A0A
                bne $6A02    ; $6A0B
                jsr PrintMessage    ; $6A0D
                cmp: $00A0,x    ; $6A10
                lda $6A7A    ; $6A13
                sta $00    ; $6A16
                lda $6A7B    ; $6A18
                sta $01    ; $6A1B
                ldy #$00    ; $6A1D
                lda ($00),y    ; $6A1F
                php    ; $6A21
                ora #$80    ; $6A22
                cmp #$82    ; $6A24
                bne $6A2E    ; $6A26
                jsr PrBuffName    ; $6A28
                jmp $6A48    ; $6A2B
                cmp #$84    ; $6A2E
                bne $6A45    ; $6A30
                ldy #$00    ; $6A32
                lda (BuffData),y    ; $6A34
                beq $6A48    ; $6A36
                jsr PrintSpace    ; $6A38
                lda #$A8    ; $6A3B
                jsr CharOut    ; $6A3D
                jsr PrFileName    ; $6A40
                lda #$A9    ; $6A43
                jsr CharOut    ; $6A45
                inc $00    ; $6A48
                bne $6A4E    ; $6A4A
                inc $01    ; $6A4C
                plp    ; $6A4E
                bmi $6A1D    ; $6A4F
                lda #$DC    ; $6A51
                sta ReadLineHelp    ; $6A53
                lda #$68    ; $6A56
                sta $3B21    ; $6A58
                dec FileRead    ; $6A5B
                jsr ReadLine    ; $6A5E
                php    ; $6A61
                txa    ; $6A62
                pha    ; $6A63
                jsr CloseEchoArea    ; $6A64
                pla    ; $6A67
                tax    ; $6A68
                plp    ; $6A69
                bne $6A76    ; $6A6A
                lda $0200    ; $6A6C
                cmp #$8D    ; $6A6F
                bne $6A77    ; $6A71
                lda $6A7C    ; $6A73
                rts    ; $6A76
                lda #$00    ; $6A77
                rts    ; $6A79
                brk    ; $6A7A
                brk    ; $6A7B
                brk    ; $6A7C
;
; === SaveFile ===
                bit Modified?    ; $6A7D
                bpl $6A88    ; $6A80
                jsr IN:SaveFile    ; $6A82
                lda #$01    ; $6A85
                rts    ; $6A87
                jsr NewEchoArea    ; $6A88
                jsr PrintMessage    ; $6A8B
                dec $A0EF    ; $6A8E
        dfb $E3        ; $6A91  (data/65C02-bit)
                inx    ; $6A92
                sbc ($EE,x)    ; $6A93
        dfb $E7        ; $6A95  (data/65C02-bit)
                sbc $F3    ; $6A96
                ldy #$EE    ; $6A98
                sbc $E5    ; $6A9A
                cpx $00    ; $6A9C
                jsr AnyArgument?    ; $6A9E
                php    ; $6AA1
                bne $6AAA    ; $6AA2
                jsr PrintMessage    ; $6AA4
                sbc $E4    ; $6AA7
                brk    ; $6AA9
                jsr PrintMessage    ; $6AAA
                ldy #$F4    ; $6AAD
        dfb $EF        ; $6AAF  (data/65C02-bit)
                ldy #$E2    ; $6AB0
                sbc $A0    ; $6AB2
        dfb $F7        ; $6AB4  (data/65C02-bit)
                sbc ($E9)    ; $6AB5
        dfb $F4        ; $6AB7  (data/65C02-bit)
        dfb $F4        ; $6AB8  (data/65C02-bit)
                sbc $EE    ; $6AB9
                ldx $2000    ; $6ABB
                plx    ; $6ABE
        dfb $57        ; $6ABF  (data/65C02-bit)
                plp    ; $6AC0
                beq $6A82    ; $6AC1
                lda #$01    ; $6AC3
                rts    ; $6AC5
;
; === PrBuffName ===
                ldx SelectedBuff    ; $6AC6
                jmp PBuffName    ; $6AC9
;
; === PrFileName ===
                ldx SelectedBuff    ; $6ACC
                jmp PBuffFile    ; $6ACF
;
; === InsertFile ===
                lda #$F6    ; $6AD2
                sta $00    ; $6AD4
                lda #$6A    ; $6AD6
                sta $01    ; $6AD8
                lda #$FF    ; $6ADA
                jsr ReadFilename    ; $6ADC
                bne $6AEE    ; $6ADF
                jsr DSK:OpenFile    ; $6AE1
                bne $6B02    ; $6AE4
                jsr $6B27    ; $6AE6
                bne $6B02    ; $6AE9
                lda #$06    ; $6AEB
                rts    ; $6AED
                lda #$87    ; $6AEE
                jsr EchoOutput    ; $6AF0
                jmp BeepFindPoint    ; $6AF3
                cmp #$EE    ; $6AF6
        dfb $F3        ; $6AF8  (data/65C02-bit)
                sbc $F2    ; $6AF9
        dfb $F4        ; $6AFB  (data/65C02-bit)
                ldy #$C6    ; $6AFC
                sbc #$EC    ; $6AFE
                sbc $3A    ; $6B00
                jsr NewEchoArea    ; $6B02
                jsr PrintMessage    ; $6B05
                cmp $F2    ; $6B08
                sbc ($EF)    ; $6B0A
                sbc ($A0)    ; $6B0C
                sbc ($E5)    ; $6B0E
                sbc ($E4,x)    ; $6B10
                sbc #$EE    ; $6B12
        dfb $E7        ; $6B14  (data/65C02-bit)
                ldy #$E6    ; $6B15
                sbc #$EC    ; $6B17
                sbc $A1    ; $6B19
                ldy #$00    ; $6B1B
                jsr Beep    ; $6B1D
                jsr CloseEchoArea    ; $6B20
                jmp $6AEE    ; $6B23
;
; === EORValue ===
                bra $6ACD    ; $6B26
                adc ($48,x)    ; $6B28
                lda TheBuffer    ; $6B2A
                pha    ; $6B2C
                jsr PrepRead    ; $6B2D
                jsr DSK:ReadByte    ; $6B30
                bne $6B41    ; $6B33
                eor EORValue    ; $6B35
                jsr BuffInsert    ; $6B38
                beq $6B30    ; $6B3B
                lda #$FF    ; $6B3D
                bmi $6B43    ; $6B3F
                lda #$00    ; $6B41
                tax    ; $6B43
                pla    ; $6B44
                sta TheBuffer    ; $6B45
                pla    ; $6B47
                sta $61    ; $6B48
                txa    ; $6B4A
                pha    ; $6B4B
                jsr SetGap    ; $6B4C
                jsr DSK:CloseFile    ; $6B4F
                pla    ; $6B52
                rts    ; $6B53
;
; === FileLister ===
                lda #$00    ; $6B54
                beq $6B5A    ; $6B56
;
; === DirLister ===
                lda #$FF    ; $6B58
                sta $6B92    ; $6B5A
                jsr GetStrArg    ; $6B5D
                beq $6B7C    ; $6B60
                jsr AnyArgument?    ; $6B62
                bne $6B79    ; $6B65
                lda #$93    ; $6B67
                sta $00    ; $6B69
                lda #$6B    ; $6B6B
                sta $01    ; $6B6D
                lda #$00    ; $6B6F
                jsr ReadFilename    ; $6B71
                beq $6B7C    ; $6B74
                jmp BeepFindPoint    ; $6B76
                jsr SelfPath    ; $6B79
                lda #$8D    ; $6B7C
                sta $0200,x    ; $6B7E
                bit $6B92    ; $6B81
                bmi $6B8C    ; $6B84
                jsr DSK:ListFiles    ; $6B86
                jmp $6B8F    ; $6B89
                jsr DSK:ListDir    ; $6B8C
                lda #$00    ; $6B8F
                rts    ; $6B91
                brk    ; $6B92
                cpy $E9    ; $6B93
                sbc ($E5)    ; $6B95
        dfb $E3        ; $6B97  (data/65C02-bit)
        dfb $F4        ; $6B98  (data/65C02-bit)
        dfb $EF        ; $6B99  (data/65C02-bit)
                sbc ($F9)    ; $6B9A
                dec    ; $6B9C
;
; === SelfPath ===
                ldx #$00    ; $6B9D
                ldy #$00    ; $6B9F
                lda (BuffData),y    ; $6BA1
                sta $0200,x    ; $6BA3
                beq BackPath    ; $6BA6
                iny    ; $6BA8
                inx    ; $6BA9
                bne $6BA1    ; $6BAA
;
; === BackPath ===
                dex    ; $6BAC
                bmi $6BB6    ; $6BAD
                lda $0200,x    ; $6BAF
                cmp #$AF    ; $6BB2
                bne BackPath    ; $6BB4
                inx    ; $6BB6
                rts    ; $6BB7
;
; === BeepFindPoint ===
                jsr Beep    ; $6BB8
                lda #$01    ; $6BBB
                rts    ; $6BBD
;
; === FindFile ===
                dec ShowExtension    ; $6BBE
                lda #$D3    ; $6BC1
                sta $00    ; $6BC3
                lda #$6B    ; $6BC5
                sta $01    ; $6BC7
                lda #$FF    ; $6BC9
                jsr ReadFilename    ; $6BCB
                beq $6BDD    ; $6BCE
                jmp BeepFindPoint    ; $6BD0
                dec $E9    ; $6BD3
                inc $A0E4    ; $6BD5
                dec $E9    ; $6BD8
                cpx $3AE5    ; $6BDA
                jsr FixPath    ; $6BDD
                jsr FindBuffFile    ; $6BE0
                bne $6BE8    ; $6BE3
                jmp SI:OpenBuff    ; $6BE5
                ldx #$00    ; $6BE8
                dex    ; $6BEA
                stx $6C25    ; $6BEB
                inx    ; $6BEE
                lda $0200,x    ; $6BEF
                cmp #$AF    ; $6BF2
                bne $6BF9    ; $6BF4
                stx $6C25    ; $6BF6
                sta $0280,x    ; $6BF9
                inx    ; $6BFC
                cmp #$8D    ; $6BFD
                bne $6BEF    ; $6BFF
                ldy #$00    ; $6C01
                ldx $6C25    ; $6C03
                inx    ; $6C06
                lda $0280,x    ; $6C07
                sta $0200,y    ; $6C0A
                iny    ; $6C0D
                inx    ; $6C0E
                cmp #$8D    ; $6C0F
                bne $6C07    ; $6C11
                lda #$00    ; $6C13
                sta $01FF,y    ; $6C15
                jsr Deselect    ; $6C18
                jsr CreateBuffer    ; $6C1B
                cmp #$06    ; $6C1E
                beq $6C26    ; $6C20
                jmp $6BD0    ; $6C22
                brk    ; $6C25
                ldx #$00    ; $6C26
                lda $0280,x    ; $6C28
                sta $0200,x    ; $6C2B
                inx    ; $6C2E
                cmp #$8D    ; $6C2F
                bne $6C28    ; $6C31
                lda #$FF    ; $6C33
                jmp SI:VisFile    ; $6C35
;
; === FixPath ===
                ldx #$00    ; $6C38
                lda $0200    ; $6C3A
                cmp #$AF    ; $6C3D
                beq $6C4F    ; $6C3F
                lda PrefixName,x    ; $6C41
                ora #$80    ; $6C44
                sta $0280,x    ; $6C46
                inx    ; $6C49
                cpx ThePrefix    ; $6C4A
                bcc $6C41    ; $6C4D
                ldy #$00    ; $6C4F
                lda $0200,y    ; $6C51
                sta $0280,x    ; $6C54
                iny    ; $6C57
                inx    ; $6C58
                cmp #$8D    ; $6C59
                bne $6C51    ; $6C5B
                dex    ; $6C5D
                stx $6CB5    ; $6C5E
                lda $0280,x    ; $6C61
                sta $0200,x    ; $6C64
                dex    ; $6C67
                bpl $6C61    ; $6C68
                ldy #$00    ; $6C6A
                lda AutoFileExt    ; $6C6C
                beq $6CB4    ; $6C6F
                jsr AnyArgument?    ; $6C71
                beq $6CB4    ; $6C74
                lda AutoFileExt,y    ; $6C76
                beq $6C7E    ; $6C79
                iny    ; $6C7B
                bne $6C76    ; $6C7C
                dey    ; $6C7E
                ldx $6CB5    ; $6C7F
                dex    ; $6C82
                lda $0200,x    ; $6C83
                jsr UpperCon    ; $6C86
                sta $6CB6    ; $6C89
                lda AutoFileExt,y    ; $6C8C
                jsr UpperCon    ; $6C8F
                cmp $6CB6    ; $6C92
                bne $6C9E    ; $6C95
                dex    ; $6C97
                dey    ; $6C98
                bpl $6C83    ; $6C99
                jmp $6CB4    ; $6C9B
                ldy #$00    ; $6C9E
                ldx $6CB5    ; $6CA0
                lda AutoFileExt,y    ; $6CA3
                sta $0200,x    ; $6CA6
                beq $6CAF    ; $6CA9
                iny    ; $6CAB
                inx    ; $6CAC
                bne $6CA3    ; $6CAD
                lda #$8D    ; $6CAF
                sta $0200,x    ; $6CB1
                rts    ; $6CB4
                brk    ; $6CB5
                brk    ; $6CB6
;
; === SetPrefix ===
                jsr GetStrArg    ; $6CB7
                beq $6CE6    ; $6CBA
                jsr $6CE9    ; $6CBC
                jsr OpenEchoArea    ; $6CBF
                jsr PrintMessage    ; $6CC2
                sta $E5CE    ; $6CC5
        dfb $F7        ; $6CC8  (data/65C02-bit)
                ldy #$F0    ; $6CC9
                sbc ($E5)    ; $6CCB
                inc $E9    ; $6CCD
                sed    ; $6CCF
                tsx    ; $6CD0
                brk    ; $6CD1
                dec FileRead    ; $6CD2
                jsr ReadArgLine    ; $6CD5
                php    ; $6CD8
                txa    ; $6CD9
                pha    ; $6CDA
                jsr CloseEchoArea    ; $6CDB
                pla    ; $6CDE
                tax    ; $6CDF
                plp    ; $6CE0
                bne $6CE9    ; $6CE1
                txa    ; $6CE3
                beq $6CE9    ; $6CE4
                jsr DSK:SetPrefix    ; $6CE6
                jsr NewEchoArea    ; $6CE9
                jsr PrintMessage    ; $6CEC
        dfb $C3        ; $6CEF  (data/65C02-bit)
                sbc $F2,x    ; $6CF0
                sbc ($E5)    ; $6CF2
                inc $A0F4    ; $6CF4
                beq $6CEB    ; $6CF7
                sbc $E6    ; $6CF9
                sbc #$F8    ; $6CFB
                tsx    ; $6CFD
                ldy #$00    ; $6CFE
                ldx #$00    ; $6D00
                lda PrefixName,x    ; $6D02
                ora #$80    ; $6D05
                jsr CharOut    ; $6D07
                inx    ; $6D0A
                cpx ThePrefix    ; $6D0B
                bcc $6D02    ; $6D0E
                jsr CloseEchoArea    ; $6D10
                lda #$01    ; $6D13
                rts    ; $6D15
;
; === DeleteFile ===
                lda #$30    ; $6D16
                sta $00    ; $6D18
                lda #$6D    ; $6D1A
                sta $01    ; $6D1C
                lda #$FF    ; $6D1E
                jsr ReadFilename    ; $6D20
                beq $6D28    ; $6D23
                jmp BeepFindPoint    ; $6D25
                jsr DSK:Delete    ; $6D28
                bne $6D25    ; $6D2B
                lda #$01    ; $6D2D
                rts    ; $6D2F
                cpy $E5    ; $6D30
                cpx $F4E5    ; $6D32
                sbc $A0    ; $6D35
                inc $E9    ; $6D37
                cpx $3AE5    ; $6D39
;
; === InitFiler ===
                lda ClockPatch    ; $6D3C
                bne $6D4C    ; $6D3F
                lda ReadClock    ; $6D41
                sta ClockPatch    ; $6D44
                lda #$60    ; $6D47
                sta ReadClock    ; $6D49
                jsr GetPrefix    ; $6D4C
                rts    ; $6D4F
                brk    ; $6D50
                brk    ; $6D51
                pha    ; $6D52
                lda #$01    ; $6D53
                sta $6D72    ; $6D55
                lda #$03    ; $6D58
                sta $6D73    ; $6D5A
                pla    ; $6D5D
                stx MLIParams    ; $6D5E
;
; === OpCallMLI ===
                sta $6D6A    ; $6D61
;
; === CallMLI ===
                jsr $72E6    ; $6D64
                jsr MLI    ; $6D67
                brk    ; $6D6A
                adc ($6D),y    ; $6D6B
                jsr $72F4    ; $6D6D
                rts    ; $6D70
;
; === MLIParams ===
                brk    ; $6D71
                brk    ; $6D72
                brk    ; $6D73
                brk    ; $6D74
                brk    ; $6D75
                brk    ; $6D76
                brk    ; $6D77
                brk    ; $6D78
                brk    ; $6D79
                brk    ; $6D7A
                brk    ; $6D7B
                brk    ; $6D7C
                brk    ; $6D7D
                brk    ; $6D7E
                brk    ; $6D7F
                brk    ; $6D80
                brk    ; $6D81
                brk    ; $6D82
;
; === DefFileType ===
                tsb $A2    ; $6D83
                ora ($A9,x)    ; $6D85
                eor ($8D,x)    ; $6D87
                adc ($6D)    ; $6D89
                lda #$03    ; $6D8B
                sta $6D73    ; $6D8D
                lda #$C7    ; $6D90
                jsr $6D5E    ; $6D92
                rts    ; $6D95
;
; === DSK:Quit ===
                jsr DSK:ChkExit    ; $6D96
                jsr $77B3    ; $6D99
                beq $6D9F    ; $6D9C
                rts    ; $6D9E
                jsr GetStrArg    ; $6D9F
                bne $6DC4    ; $6DA2
                lda #$8D    ; $6DA4
                sta $0200,x    ; $6DA6
                jsr MakePath    ; $6DA9
                ldy #$00    ; $6DAC
                lda PathStr,y    ; $6DAE
                ora #$80    ; $6DB1
                sta Compiler,y    ; $6DB3
                iny    ; $6DB6
                cpy ThePathname    ; $6DB7
                bcc $6DAE    ; $6DBA
                lda #$00    ; $6DBC
                sta Compiler,y    ; $6DBE
                jmp $772D    ; $6DC1
                lda ClockPatch    ; $6DC4
                sta ReadClock    ; $6DC7
                ldx #$04    ; $6DCA
                lda #$65    ; $6DCC
                jmp $6D5E    ; $6DCE
;
; === DSK:ChkExit ===
                jsr SafetyCheck    ; $6DD1
                beq $6DDA    ; $6DD4
                pla    ; $6DD6
                pla    ; $6DD7
                lda #$01    ; $6DD8
                rts    ; $6DDA
;
; === DSK:SetPrefix ===
                jsr OpenPath    ; $6DDB
                bne $6DEF    ; $6DDE
                jsr DSK:CloseFile    ; $6DE0
                ldx #$01    ; $6DE3
                lda #$C6    ; $6DE5
                jsr $6D52    ; $6DE7
                jsr GetPrefix    ; $6DEA
                lda #$00    ; $6DED
                rts    ; $6DEF
;
; === SlotDrive ===
        dfb $02        ; $6DF0  (data/65C02-bit)
                ora ($0A,x)    ; $6DF1
                php    ; $6DF3
                lsr    ; $6DF4
                lsr    ; $6DF5
                lsr    ; $6DF6
                lsr    ; $6DF7
                lsr    ; $6DF8
                sta SlotDrive    ; $6DF9
                lda #$00    ; $6DFC
                plp    ; $6DFE
                rol    ; $6DFF
                adc #$01    ; $6E00
                sta $6DF1    ; $6E02
                rts    ; $6E05
                brk    ; $6E06
                brk    ; $6E07
                brk    ; $6E08
                brk    ; $6E09
                brk    ; $6E0A
;
; === Time ===
                brk    ; $6E0B
                brk    ; $6E0C
                brk    ; $6E0D
                brk    ; $6E0E
;
; === GetSysDate ===
                lda SysTheDate    ; $6E0F
                sta $6E06    ; $6E12
                lda $BF91    ; $6E15
                sta $6E07    ; $6E18
                jsr $6E28    ; $6E1B
                ldy $6E08    ; $6E1E
                ldx $6E09    ; $6E21
                lda $6E0A    ; $6E24
                rts    ; $6E27
                lda $6E06    ; $6E28
                and #$1F    ; $6E2B
                sta $6E0A    ; $6E2D
                lda $6E07    ; $6E30
                lsr    ; $6E33
                sta $6E08    ; $6E34
                lda $6E06    ; $6E37
                ror    ; $6E3A
                lsr    ; $6E3B
                lsr    ; $6E3C
                lsr    ; $6E3D
                lsr    ; $6E3E
                sta $6E09    ; $6E3F
                rts    ; $6E42
;
; === GetSystemTime ===
                lda SysTheTime    ; $6E43
                sta Time    ; $6E46
                lda $BF93    ; $6E49
                sta $6E0C    ; $6E4C
;
; === GetRealTime ===
                lda $6E0C    ; $6E4F
                and #$1F    ; $6E52
                sta $6E0E    ; $6E54
                tax    ; $6E57
                lda Time    ; $6E58
                and #$3F    ; $6E5B
                sta $6E0D    ; $6E5D
                rts    ; $6E60
;
; === Months ===
                adc $7C6E,y    ; $6E61
                ror $6E7F    ; $6E64
        dfb $82        ; $6E67  (data/65C02-bit)
                ror $6E85    ; $6E68
                dey    ; $6E6B
                ror $6E8B    ; $6E6C
                stx $916E    ; $6E6F
                ror $6E94    ; $6E72
        dfb $97        ; $6E75  (data/65C02-bit)
                ror $6E9A    ; $6E76
                lsr    ; $6E79
                adc ($EE,x)    ; $6E7A
                lsr $65    ; $6E7C
        dfb $E2        ; $6E7E  (data/65C02-bit)
                eor $F261    ; $6E7F
                eor (PhysBuffBot,x)    ; $6E82
                sbc ($4D)    ; $6E84
                adc ($F9,x)    ; $6E86
                lsr    ; $6E88
                adc $EE,x    ; $6E89
                lsr    ; $6E8B
                adc $EC,x    ; $6E8C
                eor ($75,x)    ; $6E8E
        dfb $E7        ; $6E90  (data/65C02-bit)
        dfb $53        ; $6E91  (data/65C02-bit)
                adc $F0    ; $6E92
        dfb $4F        ; $6E94  (data/65C02-bit)
        dfb $63        ; $6E95  (data/65C02-bit)
        dfb $F4        ; $6E96  (data/65C02-bit)
                lsr $F66F    ; $6E97
        dfb $44        ; $6E9A  (data/65C02-bit)
                adc $E3    ; $6E9B
;
; === PrintDate ===
                jsr $6E28    ; $6E9D
                lda $6E06    ; $6EA0
                ora $6E07    ; $6EA3
                bne $6EB6    ; $6EA6
                jsr PrintMessage    ; $6EA8
        dfb $DB        ; $6EAB  (data/65C02-bit)
                inc $A0EF    ; $6EAC
                cpx $E1    ; $6EAF
        dfb $F4        ; $6EB1  (data/65C02-bit)
                sbc $DD    ; $6EB2
                brk    ; $6EB4
                rts    ; $6EB5
                ldx $6E0A    ; $6EB6
                jsr ZeroJustify    ; $6EB9
                cpx #$0A    ; $6EBC
                bcs $6EC7    ; $6EBE
                lda #$B0    ; $6EC0
                jsr CharOut    ; $6EC2
                lda #$00    ; $6EC5
                jsr PrintDec    ; $6EC7
                jsr $6EFA    ; $6ECA
                lda $6E09    ; $6ECD
                sec    ; $6ED0
                sbc #$01    ; $6ED1
                asl    ; $6ED3
                tax    ; $6ED4
                lda Months,x    ; $6ED5
                sta $00    ; $6ED8
                lda $6E62,x    ; $6EDA
                sta $01    ; $6EDD
                ldy #$00    ; $6EDF
                ldx #$03    ; $6EE1
                lda ($00),y    ; $6EE3
                ora #$80    ; $6EE5
                jsr CharOut    ; $6EE7
                iny    ; $6EEA
                dex    ; $6EEB
                bne $6EE3    ; $6EEC
                jsr $6EFA    ; $6EEE
                ldx $6E08    ; $6EF1
                lda #$00    ; $6EF4
                jsr PrintDec    ; $6EF6
                rts    ; $6EF9
                lda #$AD    ; $6EFA
                jmp CharOut    ; $6EFC
                rts    ; $6EFF
;
; === DSK:ModeTime ===
                lda ClockPatch    ; $6F00
                cmp #$60    ; $6F03
                beq $6EFF    ; $6F05
                jsr GetTheTime    ; $6F07
                lda SysTheDate    ; $6F0A
                sta $6E06    ; $6F0D
                lda $BF91    ; $6F10
                sta $6E07    ; $6F13
                jsr PrintDate    ; $6F16
                ldx #$01    ; $6F19
                jsr $7637    ; $6F1B
                lda SysTheTime    ; $6F1E
                sta Time    ; $6F21
                lda $BF93    ; $6F24
                sta $6E0C    ; $6F27
;
; === PrintTime ===
                jsr ZeroJustify    ; $6F2A
                sta $6F7E    ; $6F2D
                jsr GetRealTime    ; $6F30
                ldx $6E0E    ; $6F33
                beq $6F45    ; $6F36
                cpx #$0C    ; $6F38
                bcc $6F47    ; $6F3A
                ror $6F7E    ; $6F3C
                txa    ; $6F3F
                sbc #$0B    ; $6F40
                tax    ; $6F42
                bne $6F47    ; $6F43
                ldx #$0C    ; $6F45
                cpx #$0A    ; $6F47
                bcs $6F4E    ; $6F49
                jsr PrintSpace    ; $6F4B
                lda #$00    ; $6F4E
                jsr PrintDec    ; $6F50
                lda #$BA    ; $6F53
                jsr CharOut    ; $6F55
                ldx $6E0D    ; $6F58
                cpx #$0A    ; $6F5B
                bcs $6F64    ; $6F5D
                lda #$B0    ; $6F5F
                jsr CharOut    ; $6F61
                lda #$00    ; $6F64
                jsr PrintDec    ; $6F66
                jsr PrintSpace    ; $6F69
                lda #$E1    ; $6F6C
                bit $6F7E    ; $6F6E
                bpl $6F75    ; $6F71
                lda #$F0    ; $6F73
                jsr CharOut    ; $6F75
                lda #$ED    ; $6F78
                jsr CharOut    ; $6F7A
                rts    ; $6F7D
                brk    ; $6F7E
;
; === BuffDateTime ===
                jsr GetTheTime    ; $6F7F
                jsr BuffPutOn    ; $6F82
                lda SysTheDate    ; $6F85
                sta $6E06    ; $6F88
                lda $BF91    ; $6F8B
                sta $6E07    ; $6F8E
                jsr PrintDate    ; $6F91
                ldx #$01    ; $6F94
                jsr $7637    ; $6F96
                lda SysTheTime    ; $6F99
                sta Time    ; $6F9C
                lda $BF93    ; $6F9F
                sta $6E0C    ; $6FA2
                jsr PrintTime    ; $6FA5
                jsr BuffPutOff    ; $6FA8
                rts    ; $6FAB
;
; === BuffPutOn ===
                lda CoutDef    ; $6FAC
                sta $6FE7    ; $6FAF
                lda $2607    ; $6FB2
                sta $6FE8    ; $6FB5
                lda #$C3    ; $6FB8
                sta CoutDef    ; $6FBA
                lda #$6F    ; $6FBD
                sta $2607    ; $6FBF
                rts    ; $6FC2
;
; === BuffPutter ===
                stx $6FD4    ; $6FC3
                sty $6FD3    ; $6FC6
                jsr BuffInsert    ; $6FC9
                ldy $6FD3    ; $6FCC
                ldx $6FD4    ; $6FCF
                rts    ; $6FD2
                brk    ; $6FD3
                brk    ; $6FD4
;
; === BuffPutOff ===
                lda $6FE7    ; $6FD5
                sta CoutDef    ; $6FD8
                lda $6FE8    ; $6FDB
                sta $2607    ; $6FDE
                jsr DisplayPage    ; $6FE1
                lda #$01    ; $6FE4
                rts    ; $6FE6
                brk    ; $6FE7
                brk    ; $6FE8
;
; === PushFilePath ===
                ldx #$00    ; $6FE9
;
; === PushFilePath1 ===
                stx $7024    ; $6FEB
                lda $2607    ; $6FEE
                pha    ; $6FF1
                lda CoutDef    ; $6FF2
                pha    ; $6FF5
                lda #$14    ; $6FF6
                sta CoutDef    ; $6FF8
                lda #$70    ; $6FFB
                sta $2607    ; $6FFD
                jsr PrintPath    ; $7000
                pla    ; $7003
                sta CoutDef    ; $7004
                pla    ; $7007
                sta $2607    ; $7008
                lda #$00    ; $700B
                ldx $7024    ; $700D
                sta $0200,x    ; $7010
                rts    ; $7013
                stx $6FD4    ; $7014
                ldx $7024    ; $7017
                sta $0200,x    ; $701A
                ldx $6FD4    ; $701D
                inc $7024    ; $7020
                rts    ; $7023
                brk    ; $7024
;
; === PrintPath ===
                ldx #$00    ; $7025
                cpx ThePathname    ; $7027
                bcs $7037    ; $702A
                lda PathStr,x    ; $702C
                ora #$80    ; $702F
                jsr CharOut    ; $7031
                inx    ; $7034
                bne $7027    ; $7035
                rts    ; $7037
;
; === RBlock ===
                sta $6D72    ; $7038
;
; === RBlock1 ===
                lda #$03    ; $703B
                sta MLIParams    ; $703D
                stx $6D75    ; $7040
                sty $6D76    ; $7043
                lda #$00    ; $7046
                sta $6D73    ; $7048
                lda #$A5    ; $704B
                sta $6D74    ; $704D
                lda #$80    ; $7050
                jsr OpCallMLI    ; $7052
                rts    ; $7055
;
; === VolInfo ===
                brk    ; $7056
                brk    ; $7057
                brk    ; $7058
                brk    ; $7059
                brk    ; $705A
                brk    ; $705B
                brk    ; $705C
                brk    ; $705D
                brk    ; $705E
                brk    ; $705F
                brk    ; $7060
                brk    ; $7061
                brk    ; $7062
                brk    ; $7063
                brk    ; $7064
                brk    ; $7065
                brk    ; $7066
                brk    ; $7067
                brk    ; $7068
                brk    ; $7069
                brk    ; $706A
                brk    ; $706B
                brk    ; $706C
                brk    ; $706D
                brk    ; $706E
                brk    ; $706F
                brk    ; $7070
                brk    ; $7071
                brk    ; $7072
                brk    ; $7073
                brk    ; $7074
                brk    ; $7075
                brk    ; $7076
                brk    ; $7077
                brk    ; $7078
                brk    ; $7079
                brk    ; $707A
                brk    ; $707B
                brk    ; $707C
                jsr $0000    ; $707D
                brk    ; $7080
                brk    ; $7081
                brk    ; $7082
                brk    ; $7083
                brk    ; $7084
                brk    ; $7085
                brk    ; $7086
                brk    ; $7087
                brk    ; $7088
                brk    ; $7089
                brk    ; $708A
                brk    ; $708B
                brk    ; $708C
                brk    ; $708D
                brk    ; $708E
                brk    ; $708F
                brk    ; $7090
                brk    ; $7091
                brk    ; $7092
                brk    ; $7093
                brk    ; $7094
                brk    ; $7095
                brk    ; $7096
                brk    ; $7097
                brk    ; $7098
                brk    ; $7099
                brk    ; $709A
                brk    ; $709B
                brk    ; $709C
                brk    ; $709D
                brk    ; $709E
                brk    ; $709F
                brk    ; $70A0
                brk    ; $70A1
                brk    ; $70A2
                brk    ; $70A3
                brk    ; $70A4
                brk    ; $70A5
                brk    ; $70A6
                brk    ; $70A7
                brk    ; $70A8
                brk    ; $70A9
;
; === MakePath ===
                ldx #$00    ; $70AA
                ldy #$00    ; $70AC
                lda $0200    ; $70AE
                cmp #$AF    ; $70B1
                beq $70C6    ; $70B3
                lda ThePrefix    ; $70B5
                beq $70C6    ; $70B8
                lda PrefixName,y    ; $70BA
                sta PathStr,y    ; $70BD
                iny    ; $70C0
                cpy ThePrefix    ; $70C1
                bcc $70BA    ; $70C4
                lda $0200,x    ; $70C6
                and #$7F    ; $70C9
                sta PathStr,y    ; $70CB
                cmp #$0D    ; $70CE
                beq $70D8    ; $70D0
                inx    ; $70D2
                iny    ; $70D3
                cpy #$3F    ; $70D4
                bcc $70C6    ; $70D6
                sty ThePathname    ; $70D8
                rts    ; $70DB
;
; === OpenPath ===
                jsr DSK:CloseFile    ; $70DC
                jsr MakePath    ; $70DF
;
; === OpenPath1 ===
                ldx #$0A    ; $70E2
                lda #$C4    ; $70E4
                jsr $6D52    ; $70E6
                bcs $7118    ; $70E9
                lda $6D75    ; $70EB
                sta $6D51    ; $70EE
                ldx #$03    ; $70F1
                lda #$00    ; $70F3
                sta $6D74    ; $70F5
                lda #$A5    ; $70F8
                sta $6D75    ; $70FA
                lda #$00    ; $70FD
                sta GblLength    ; $70FF
                sta $7127    ; $7102
                sta $7128    ; $7105
                lda #$C8    ; $7108
                jsr $6D52    ; $710A
                lda $6D76    ; $710D
                sta $6D50    ; $7110
                sta $7125    ; $7113
                bcc $711B    ; $7116
                ldx #$FF    ; $7118
                rts    ; $711A
                jsr MLI    ; $711B
                cmp (CH),y    ; $711E
                adc ($A2),y    ; $7120
                brk    ; $7122
                rts    ; $7123
        dfb $02        ; $7124  (data/65C02-bit)
                brk    ; $7125
;
; === GblLength ===
                brk    ; $7126
                brk    ; $7127
                brk    ; $7128
                brk    ; $7129
;
; === CompFile ===
                ldy ThePathname    ; $712A
                cpy $7129    ; $712D
                beq $715D    ; $7130
                lda $727E    ; $7132
                eor #$FF    ; $7135
                beq $715D    ; $7137
                iny    ; $7139
                ldx #$00    ; $713A
                lda $707F,x    ; $713C
                ora #$80    ; $713F
                jsr UpperCon    ; $7141
                sta $715E    ; $7144
                lda ThePathname,y    ; $7147
                ora #$80    ; $714A
                jsr UpperCon    ; $714C
                cmp $715E    ; $714F
                bne $715D    ; $7152
                cpy $7129    ; $7154
                beq $715D    ; $7157
                iny    ; $7159
                inx    ; $715A
                bne $713C    ; $715B
                rts    ; $715D
                brk    ; $715E
;
; === GetDirInfo ===
                lda #$00    ; $715F
                sta $727E    ; $7161
                jsr OpenPath    ; $7164
                php    ; $7167
                ldy ThePathname    ; $7168
                sty $7129    ; $716B
                plp    ; $716E
                bne $717B    ; $716F
                jsr DSK:CloseFile    ; $7171
                lda $6D51    ; $7174
                cmp #$0F    ; $7177
                beq $71A8    ; $7179
                ldy ThePathname    ; $717B
                iny    ; $717E
                dey    ; $717F
                bmi $71A6    ; $7180
                lda ThePathname,y    ; $7182
                cmp #$2F    ; $7185
                bne $717F    ; $7187
                sty ThePathname    ; $7189
                cpy #$01    ; $718C
                bne $7197    ; $718E
                jsr GetOnline    ; $7190
                dec $727E    ; $7193
                rts    ; $7196
                jsr OpenPath1    ; $7197
                bne $71A6    ; $719A
                jsr DSK:CloseFile    ; $719C
                lda $6D51    ; $719F
                cmp #$0F    ; $71A2
                beq $71A8    ; $71A4
                sec    ; $71A6
                rts    ; $71A7
                lda LastUnit    ; $71A8
                and #$F0    ; $71AB
                sta $6D72    ; $71AD
                ldy #$04    ; $71B0
                ldx #$00    ; $71B2
                lda rm_FileBuffer,y    ; $71B4
                sta VolInfo,x    ; $71B7
                iny    ; $71BA
                inx    ; $71BB
                cpx #$27    ; $71BC
                bcc $71B4    ; $71BE
                sty $70A5    ; $71C0
                lda #$00    ; $71C3
                sta $70A6    ; $71C5
                sta $70A7    ; $71C8
                inc $70A7    ; $71CB
                lda $7077    ; $71CE
                sta $70A8    ; $71D1
                lda $7078    ; $71D4
                sta $70A9    ; $71D7
                clc    ; $71DA
                rts    ; $71DB
;
; === NextFile ===
                bit $727E    ; $71DC
                bpl $7215    ; $71DF
                lda $727F    ; $71E1
                inc $727F    ; $71E4
                cmp #$10    ; $71E7
                bcs $721D    ; $71E9
                asl    ; $71EB
                asl    ; $71EC
                asl    ; $71ED
                asl    ; $71EE
                tay    ; $71EF
                lda rm_FileBuffer,y    ; $71F0
                and #$0F    ; $71F3
                sta $EF    ; $71F5
                beq $71E1    ; $71F7
                lda rm_FileBuffer,y    ; $71F9
                jsr MakeSD    ; $71FC
                ldx #$00    ; $71FF
                iny    ; $7201
                lda rm_FileBuffer,y    ; $7202
                sta $707F,x    ; $7205
                inx    ; $7208
                cpx $EF    ; $7209
                bcc $7201    ; $720B
                txa    ; $720D
                ora #$D0    ; $720E
                sta FileInfo    ; $7210
                clc    ; $7213
                rts    ; $7214
                lda $70A8    ; $7215
                ora $70A9    ; $7218
                bne $721F    ; $721B
                sec    ; $721D
                rts    ; $721E
                lda $70A7    ; $721F
                cmp $7076    ; $7222
                bcc $723F    ; $7225
                ldx $A502    ; $7227
                ldy $A503    ; $722A
                jsr RBlock1    ; $722D
                bcs $721E    ; $7230
                lda #$00    ; $7232
                sta $70A7    ; $7234
                sta $70A6    ; $7237
                lda #$04    ; $723A
                sta $70A5    ; $723C
                lda #$00    ; $723F
                clc    ; $7241
                adc $70A5    ; $7242
                sta $00    ; $7245
                lda #$A5    ; $7247
                adc $70A6    ; $7249
                sta $01    ; $724C
                ldy #$00    ; $724E
                lda ($00),y    ; $7250
                sta FileInfo,y    ; $7252
                iny    ; $7255
                cpy #$27    ; $7256
                bcc $7250    ; $7258
                inc $70A7    ; $725A
                tya    ; $725D
                clc    ; $725E
                adc $70A5    ; $725F
                sta $70A5    ; $7262
                bcc $726A    ; $7265
                inc $70A6    ; $7267
                lda FileInfo    ; $726A
                and #$F0    ; $726D
                beq $721F    ; $726F
                lda $70A8    ; $7271
                bne $7279    ; $7274
                dec $70A9    ; $7276
                dec $70A8    ; $7279
                clc    ; $727C
                rts    ; $727D
                brk    ; $727E
                brk    ; $727F
;
; === GetOnline ===
                jsr DSK:CloseFile    ; $7280
                lda #$00    ; $7283
                sta $6D72    ; $7285
                sta $727F    ; $7288
                lda #$00    ; $728B
                sta $6D73    ; $728D
                lda #$A5    ; $7290
                sta $6D74    ; $7292
                ldx #$02    ; $7295
                lda #$C5    ; $7297
                jsr $6D5E    ; $7299
                rts    ; $729C
;
; === DSK:OpenFile ===
                jsr OpenPath    ; $729D
                bne $72AA    ; $72A0
                lda $6D50    ; $72A2
                sta $6D72    ; $72A5
                lda #$00    ; $72A8
                rts    ; $72AA
;
; === DSK:ReadByte ===
                jsr GatherTYI    ; $72AB
                lda $6D77    ; $72AE
                bne $72B6    ; $72B1
                dec $6D78    ; $72B3
                dec $6D77    ; $72B6
                lda $6D78    ; $72B9
                bpl $72D6    ; $72BC
                jsr CallMLI    ; $72BE
                bcs $72E3    ; $72C1
                lda #$00    ; $72C3
                sta $B0    ; $72C5
                lda #$A9    ; $72C7
                sta $B1    ; $72C9
                lda $6D77    ; $72CB
                bne $72D3    ; $72CE
                dec $6D78    ; $72D0
                dec $6D77    ; $72D3
                ldy #$00    ; $72D6
                php    ; $72D8
                lda ($B0),y    ; $72D9
                inc $B0    ; $72DB
                bne $72E1    ; $72DD
                inc $B1    ; $72DF
                plp    ; $72E1
                rts    ; $72E2
                lda #$FF    ; $72E3
                rts    ; $72E5
                pha    ; $72E6
                lda $07F5    ; $72E7
                sta $72F7    ; $72EA
                lda #$2D    ; $72ED
                sta $07F5    ; $72EF
                pla    ; $72F2
                rts    ; $72F3
                php    ; $72F4
                pha    ; $72F5
                lda #$FF    ; $72F6
                sta $07F5    ; $72F8
                pla    ; $72FB
                plp    ; $72FC
                rts    ; $72FD
;
; === PrepRead ===
                lda #$A9    ; $72FE
                sta $6D74    ; $7300
                lda #$02    ; $7303
                sta $6D76    ; $7305
                lda #$04    ; $7308
                sta MLIParams    ; $730A
                lda #$CA    ; $730D
                sta $6D6A    ; $730F
                lda #$00    ; $7312
                sta $6D73    ; $7314
                sta $6D75    ; $7317
                sta $6D77    ; $731A
                sta $6D78    ; $731D
                rts    ; $7320
;
; === PrepWrite ===
                jsr PrepRead    ; $7321
                sta $6D76    ; $7324
                inc $6D6A    ; $7327
                rts    ; $732A
;
; === DSK:WriteByte ===
                sty $7349    ; $732B
                ldy $6D75    ; $732E
                sta rm_DataBuffer,y    ; $7331
                inc $6D75    ; $7334
                bne $7341    ; $7337
                inc $6D76    ; $7339
                jsr $73A6    ; $733C
                bcs $7343    ; $733F
                ldy #$00    ; $7341
                php    ; $7343
                ldy $7349    ; $7344
                plp    ; $7347
                rts    ; $7348
                brk    ; $7349
;
; === DSK:SaveFile ===
                jsr DSK:OpenFile    ; $734A
                beq $7355    ; $734D
                jsr DSK:Create    ; $734F
                bcc DSK:SaveFile    ; $7352
                rts    ; $7354
                jsr PrepWrite    ; $7355
                lda BuffTop    ; $7358
                sta $00    ; $735A
                lda $67    ; $735C
                sta $01    ; $735E
                lda $01    ; $7360
                cmp $6B    ; $7362
                bcc $737F    ; $7364
                bne $7373    ; $7366
                lda $00    ; $7368
                cmp GapTop    ; $736A
                bcc $737F    ; $736C
                bne $7373    ; $736E
                jsr SetTempBot    ; $7370
                lda $01    ; $7373
                cmp $69    ; $7375
                bcc $737F    ; $7377
                lda $00    ; $7379
                cmp BuffBot    ; $737B
                bcs $739D    ; $737D
                jsr GatherTYI    ; $737F
                ldy #$00    ; $7382
                jsr $D000    ; $7384
                eor EORValue    ; $7387
                jsr DSK:WriteByte    ; $738A
                bne $7397    ; $738D
                inc $00    ; $738F
                bne $7395    ; $7391
                inc $01    ; $7393
                bne $7360    ; $7395
                jsr DSK:CloseFile    ; $7397
                lda #$FF    ; $739A
                rts    ; $739C
                jsr DSK:CloseHere    ; $739D
                jsr SetGap    ; $73A0
                lda #$00    ; $73A3
                rts    ; $73A5
                jsr CallMLI    ; $73A6
                bcs $73B3    ; $73A9
                lda #$00    ; $73AB
                sta $6D76    ; $73AD
                sta $6D75    ; $73B0
                rts    ; $73B3
;
; === DSK:CloseHere ===
                jsr $73A6    ; $73B4
                ldx #$02    ; $73B7
                lda #$CF    ; $73B9
                jsr $6D5E    ; $73BB
                lda #$D0    ; $73BE
                jsr OpCallMLI    ; $73C0
                ldx #$0A    ; $73C3
                lda #$C4    ; $73C5
                jsr $6D52    ; $73C7
                jsr GetTheTime    ; $73CA
                ldx #$00    ; $73CD
                lda SysTheDate,x    ; $73CF
                sta $6D79,x    ; $73D2
                inx    ; $73D5
                cpx #$04    ; $73D6
                bcc $73CF    ; $73D8
                ldx #$07    ; $73DA
                lda #$C3    ; $73DC
                jsr $6D5E    ; $73DE
                jsr DSK:CloseFile    ; $73E1
                rts    ; $73E4
;
; === DSK:CloseFile ===
                lda #$00    ; $73E5
                sta $6D72    ; $73E7
                ldx #$01    ; $73EA
                lda #$CC    ; $73EC
                jsr $6D5E    ; $73EE
                rts    ; $73F1
;
; === DSK:DiskSpace ===
                jsr SelfPath    ; $73F2
                lda #$8D    ; $73F5
                sta $0200,x    ; $73F7
                jsr OpenPath    ; $73FA
                bcc $7400    ; $73FD
                rts    ; $73FF
                jsr DSK:CloseFile    ; $7400
                lda LastUnit    ; $7403
                ldx #$02    ; $7406
                ldy #$00    ; $7408
                sty PD:Justify    ; $740A
                jsr RBlock    ; $740D
                ldy #$04    ; $7410
                lda rm_FileBuffer,y    ; $7412
                and #$0F    ; $7415
                tax    ; $7417
                inx    ; $7418
                stx ThePathname    ; $7419
                ldy #$00    ; $741C
                lda PathStr,y    ; $741E
                ora #$80    ; $7421
                jsr CharOut    ; $7423
                iny    ; $7426
                dex    ; $7427
                bne $741E    ; $7428
                jsr PrintMessage    ; $742A
                ldy #$E8    ; $742D
                sbc ($F3,x)    ; $742F
                ldy #$00    ; $7431
                ldy #$29    ; $7433
                lda rm_FileBuffer,y    ; $7435
                sta $7499    ; $7438
                tax    ; $743B
                lda $A501,y    ; $743C
                sta $749A    ; $743F
                ldx #$0A    ; $7442
                lda #$C4    ; $7444
                jsr $6D52    ; $7446
                bcs $7498    ; $7449
                lda $7499    ; $744B
                sec    ; $744E
                sbc $6D79    ; $744F
                tax    ; $7452
                lda $749A    ; $7453
                sbc $6D7A    ; $7456
                jsr PrintPages    ; $7459
                jsr PrintMessage    ; $745C
                inc $F2    ; $745F
                sbc $E5    ; $7461
                ldy: $00A0    ; $7463
                lda $6D7A    ; $7466
                ldx $6D79    ; $7469
                jsr PrintPages    ; $746C
                jsr PrintMessage    ; $746F
                sbc #$EE    ; $7472
                ldy #$F5    ; $7474
        dfb $F3        ; $7476  (data/65C02-bit)
                sbc $AC    ; $7477
                ldy #$E6    ; $7479
        dfb $EF        ; $747B  (data/65C02-bit)
                sbc ($A0)    ; $747C
                sbc ($A0,x)    ; $747E
        dfb $F4        ; $7480  (data/65C02-bit)
        dfb $EF        ; $7481  (data/65C02-bit)
        dfb $F4        ; $7482  (data/65C02-bit)
                sbc ($EC,x)    ; $7483
                ldy #$EF    ; $7485
                inc $A0    ; $7487
                brk    ; $7489
                lda $749A    ; $748A
                ldx $7499    ; $748D
                jsr PrintDec    ; $7490
                lda #$AE    ; $7493
                jsr CharOut    ; $7495
                rts    ; $7498
                brk    ; $7499
                brk    ; $749A
;
; === PrintPages ===
                stx $0100    ; $749B
                sta $0101    ; $749E
                jsr PrintDec    ; $74A1
                jsr PrintMessage    ; $74A4
                ldy #$F0    ; $74A7
                sbc ($E7,x)    ; $74A9
                sbc $00    ; $74AB
                ldx $0100    ; $74AD
                lda $0101    ; $74B0
                jsr Plurilize    ; $74B3
                jsr PrintSpace    ; $74B6
                rts    ; $74B9
;
; === DSK:ListDir ===
                lda #$00    ; $74BA
                beq $74C0    ; $74BC
;
; === DSK:ListFiles ===
                lda #$FF    ; $74BE
                sta $753F    ; $74C0
                jsr PrepTO    ; $74C3
                jsr GetDirInfo    ; $74C6
                bcs $74FB    ; $74C9
                jsr $7501    ; $74CB
                lda #$00    ; $74CE
                sta $B0    ; $74D0
                jsr NextFile    ; $74D2
                bcs $74FB    ; $74D5
                jsr CompFile    ; $74D7
                bne $74D2    ; $74DA
                jsr $7540    ; $74DC
                bit $753F    ; $74DF
                bpl $74F5    ; $74E2
                lda #$FF    ; $74E4
                eor $B0    ; $74E6
                sta $B0    ; $74E8
                beq $74F5    ; $74EA
                lda #$28    ; $74EC
                sta CH    ; $74EE
                sta TypeoutCH    ; $74F0
                bne $74D2    ; $74F3
                jsr PrintReturn    ; $74F5
                jmp $74D2    ; $74F8
                jsr PrintReturn    ; $74FB
                jmp UnPrepTO    ; $74FE
                bit $727E    ; $7501
                bmi $753D    ; $7504
                jsr ZeroJustify    ; $7506
                lda $7078    ; $7509
                ldx $7077    ; $750C
                jsr PrintDec    ; $750F
                jsr PrintMessage    ; $7512
                ldy #$E6    ; $7515
                sbc #$EC    ; $7517
                sbc $00    ; $7519
                lda $7078    ; $751B
                ldx $7077    ; $751E
                jsr Plurilize    ; $7521
                jsr PrintMessage    ; $7524
                ldy #$F0    ; $7527
                sbc ($E5)    ; $7529
        dfb $F3        ; $752B  (data/65C02-bit)
                sbc $EE    ; $752C
        dfb $F4        ; $752E  (data/65C02-bit)
                ldy #$EF    ; $752F
                inc: $00A0    ; $7531
                jsr PrintPath    ; $7534
                jsr PrintMessage    ; $7537
                sta: $008D    ; $753A
                rts    ; $753D
;
; === HexListing ===
        dfb $FF        ; $753E  (data/65C02-bit)
                brk    ; $753F
                ldy #$00    ; $7540
                lda FileInfo    ; $7542
                and #$0F    ; $7545
                tax    ; $7547
                lda $707F,y    ; $7548
                dex    ; $754B
                bmi $7556    ; $754C
                ora #$80    ; $754E
                jsr CharOut    ; $7550
                iny    ; $7553
                bne $7548    ; $7554
                bit $753F    ; $7556
                bpl $756E    ; $7559
                bit $727E    ; $755B
                bmi $756E    ; $755E
                lda FileInfo    ; $7560
                and #$F0    ; $7563
                cmp #$D0    ; $7565
                bcc $756E    ; $7567
                lda #$AF    ; $7569
                jsr CharOut    ; $756B
                lda #$A0    ; $756E
                cpy #$11    ; $7570
                bcs $757A    ; $7572
                jsr CharOut    ; $7574
                iny    ; $7577
                bne $7570    ; $7578
                bit $727E    ; $757A
                bpl $7594    ; $757D
                lda #$00    ; $757F
                ldx SlotDrive    ; $7581
                jsr PrintDec    ; $7584
                lda #$AC    ; $7587
                jsr CharOut    ; $7589
                lda #$00    ; $758C
                ldx $6DF1    ; $758E
                jmp PrintDec    ; $7591
                bit $753F    ; $7594
                bpl $759A    ; $7597
                rts    ; $7599
                lda $708E    ; $759A
                jsr PrintType    ; $759D
                lda #$A0    ; $75A0
                sta PD:Justify    ; $75A2
                ldx $7091    ; $75A5
                lda $7092    ; $75A8
                jsr PrintDec    ; $75AB
                ldx #$03    ; $75AE
                bit HexListing    ; $75B0
                bpl $75B6    ; $75B3
                dex    ; $75B5
                jsr $7637    ; $75B6
                bit HexListing    ; $75B9
                bpl $75D9    ; $75BC
                lda #$A4    ; $75BE
                jsr CharOut    ; $75C0
                lda $7095    ; $75C3
                jsr HexByteOut    ; $75C6
                lda $7094    ; $75C9
                jsr HexByteOut    ; $75CC
                lda $7093    ; $75CF
                jsr HexByteOut    ; $75D2
                ldx #$02    ; $75D5
                bne $75E4    ; $75D7
                lda $7094    ; $75D9
                ldx $7093    ; $75DC
                jsr PrintDec    ; $75DF
                ldx #$03    ; $75E2
                jsr $7637    ; $75E4
                lda $709F    ; $75E7
                sta $6E06    ; $75EA
                lda $70A0    ; $75ED
                sta $6E07    ; $75F0
                lda #$00    ; $75F3
                jsr PrintDate    ; $75F5
                ldx #$01    ; $75F8
                jsr $7637    ; $75FA
                lda $70A1    ; $75FD
                sta Time    ; $7600
                lda $70A2    ; $7603
                sta $6E0C    ; $7606
                jsr PrintTime    ; $7609
                ldx #$03    ; $760C
                jsr $7637    ; $760E
                lda $7096    ; $7611
                sta $6E06    ; $7614
                lda $7097    ; $7617
                sta $6E07    ; $761A
                lda #$00    ; $761D
                jsr PrintDate    ; $761F
                ldx #$01    ; $7622
                jsr $7637    ; $7624
                lda $7098    ; $7627
                sta Time    ; $762A
                lda $7099    ; $762D
                sta $6E0C    ; $7630
                jsr PrintTime    ; $7633
                rts    ; $7636
                lda #$A0    ; $7637
                jsr CharOut    ; $7639
                dex    ; $763C
                bne $7639    ; $763D
                rts    ; $763F
;
; === FTypeTable ===
                tsb $D4    ; $7640
                cld    ; $7642
        dfb $D4        ; $7643  (data/65C02-bit)
                asl $C2    ; $7644
                cmp #$CE    ; $7646
        dfb $0F        ; $7648  (data/65C02-bit)
                cpy $C9    ; $7649
                cmp ($19)    ; $764B
                cmp ($C4,x)    ; $764D
        dfb $C2        ; $764F  (data/65C02-bit)
                inc    ; $7650
                cmp ($D7,x)    ; $7651
                bne $7670    ; $7653
                cmp ($D3,x)    ; $7655
                bne $7648    ; $7657
                bne $761C    ; $7659
        dfb $D3        ; $765B  (data/65C02-bit)
                beq $7621    ; $765C
                cmp $F7C4    ; $765E
                cmp #$CD    ; $7661
        dfb $C7        ; $7663  (data/65C02-bit)
                sed    ; $7664
                cpy $CBCE    ; $7665
        dfb $FC        ; $7668  (data/65C02-bit)
        dfb $C2        ; $7669  (data/65C02-bit)
                cmp ($D3,x)    ; $766A
                sbc $C1D6,x    ; $766C
                cmp ($FE)    ; $766F
                cmp ($C5)    ; $7671
                cpy $D3FF    ; $7673
                cmp: $00D3,y    ; $7676
;
; === PrintType ===
                ldy #$00    ; $7679
                cmp FTypeTable,y    ; $767B
                beq $7698    ; $767E
                tax    ; $7680
                lda FTypeTable,y    ; $7681
                beq $768E    ; $7684
                tya    ; $7686
                clc    ; $7687
                adc #$04    ; $7688
                tay    ; $768A
                txa    ; $768B
                bne $767B    ; $768C
                lda #$A4    ; $768E
                jsr CharOut    ; $7690
                txa    ; $7693
                jsr HexByteOut    ; $7694
                rts    ; $7697
                iny    ; $7698
                ldx #$02    ; $7699
                lda FTypeTable,y    ; $769B
                jsr CharOut    ; $769E
                iny    ; $76A1
                dex    ; $76A2
                bpl $769B    ; $76A3
                rts    ; $76A5
;
; === DSK:Create ===
                jsr GetTheTime    ; $76A6
                jsr MakePath    ; $76A9
                lda #$C3    ; $76AC
                sta $6D74    ; $76AE
                lda DefFileType    ; $76B1
                sta $6D75    ; $76B4
                lda #$00    ; $76B7
                tax    ; $76B9
                sta $6D76,x    ; $76BA
                inx    ; $76BD
                cpx #$08    ; $76BE
                bcc $76BA    ; $76C0
                ldx #$07    ; $76C2
                lda #$C0    ; $76C4
                jsr $6D52    ; $76C6
                rts    ; $76C9
;
; === DSK:Delete ===
                jsr MakePath    ; $76CA
                lda #$01    ; $76CD
                sta $6D72    ; $76CF
                lda #$03    ; $76D2
                sta $6D73    ; $76D4
                ldx #$01    ; $76D7
                lda #$C1    ; $76D9
                jsr $6D5E    ; $76DB
                ldx #$00    ; $76DE
                bcc $76E3    ; $76E0
                dex    ; $76E2
                rts    ; $76E3
;
; === Compiler ===
                brk    ; $76E4
                brk    ; $76E5
                brk    ; $76E6
                brk    ; $76E7
                brk    ; $76E8
                brk    ; $76E9
                brk    ; $76EA
                brk    ; $76EB
                brk    ; $76EC
                brk    ; $76ED
                brk    ; $76EE
                brk    ; $76EF
                brk    ; $76F0
                brk    ; $76F1
                brk    ; $76F2
                brk    ; $76F3
                brk    ; $76F4
                brk    ; $76F5
                brk    ; $76F6
                brk    ; $76F7
                brk    ; $76F8
                brk    ; $76F9
                brk    ; $76FA
                brk    ; $76FB
                brk    ; $76FC
                brk    ; $76FD
                brk    ; $76FE
                brk    ; $76FF
                brk    ; $7700
                brk    ; $7701
                brk    ; $7702
                brk    ; $7703
                brk    ; $7704
                brk    ; $7705
                brk    ; $7706
                brk    ; $7707
                brk    ; $7708
                brk    ; $7709
                brk    ; $770A
                brk    ; $770B
                brk    ; $770C
                brk    ; $770D
                brk    ; $770E
                brk    ; $770F
                brk    ; $7710
                brk    ; $7711
                brk    ; $7712
                brk    ; $7713
                brk    ; $7714
                brk    ; $7715
                brk    ; $7716
                brk    ; $7717
                brk    ; $7718
                brk    ; $7719
                brk    ; $771A
                brk    ; $771B
                brk    ; $771C
                brk    ; $771D
                brk    ; $771E
                brk    ; $771F
                brk    ; $7720
                brk    ; $7721
                brk    ; $7722
                brk    ; $7723
;
; === Compile ===
                jsr DSK:ChkExit    ; $7724
                jsr $77B3    ; $7727
                beq $772D    ; $772A
                rts    ; $772C
                lda Compiler    ; $772D
                beq $774D    ; $7730
                ldx #$00    ; $7732
                lda Compiler,x    ; $7734
                sta $0200,x    ; $7737
                inx    ; $773A
                cmp #$00    ; $773B
                bne $7734    ; $773D
                dex    ; $773F
                lda #$8D    ; $7740
                sta $0200,x    ; $7742
                jsr DSK:OpenFile    ; $7745
                beq $7750    ; $7748
                jsr Beep    ; $774A
                lda #$01    ; $774D
                rts    ; $774F
                lda $6D51    ; $7750
                cmp #$FF    ; $7753
                bne $774A    ; $7755
                ldx #$17    ; $7757
                lda #$07    ; $7759
                sta SysMemMap,x    ; $775B
                dex    ; $775E
                lda #$00    ; $775F
                sta SysMemMap,x    ; $7761
                dex    ; $7764
                bpl $7761    ; $7765
                lda #$CF    ; $7767
                sta SysMemMap    ; $7769
                ldx ThePathname    ; $776C
                lda ThePathname,x    ; $776F
                and #$7F    ; $7772
                sta $0280,x    ; $7774
                dex    ; $7777
                bpl $776F    ; $7778
                lda $6D72    ; $777A
                sta $77AE    ; $777D
                ldx #$00    ; $7780
                lda $7796,x    ; $7782
                sta LoRamPoint,x    ; $7785
                inx    ; $7788
                cpx #$1D    ; $7789
                bcc $7782    ; $778B
                lda ClockPatch    ; $778D
                sta ReadClock    ; $7790
                jmp LoRamPoint    ; $7793
                sta RdRomBank    ; $7796   <== BANK: language-card ROM (read)
                sta RdRomBank    ; $7799   <== BANK: language-card ROM (read)
                jsr MLI    ; $779C
                dex    ; $779F
                clc    ; $77A0
                php    ; $77A1
                jsr MLI    ; $77A2
                cpy $0816    ; $77A5
                jmp $2000    ; $77A8
                ora ($00,x)    ; $77AB
                tsb $00    ; $77AD
                brk    ; $77AF
                jsr $8000    ; $77B0
                jsr AnyArgument?    ; $77B3
                bne $77BC    ; $77B6
                jsr BufferDump    ; $77B8
                rts    ; $77BB
                lda #$00    ; $77BC
                rts    ; $77BE
;
; === ClockPatch ===
                brk    ; $77BF
;
; === GetTheTime ===
                ldx #$20    ; $77C0
                lda $0200,x    ; $77C2
                sta rm_PathComp,x    ; $77C5
                dex    ; $77C8
                bpl $77C2    ; $77C9
                lda ClockPatch    ; $77CB
                sta ReadClock    ; $77CE
                jsr MLI    ; $77D1
        dfb $82        ; $77D4  (data/65C02-bit)
                brk    ; $77D5
                brk    ; $77D6
                lda $0204    ; $77D7
                sbc #$AF    ; $77DA
                sta DayOfWeek    ; $77DC
                lda #$60    ; $77DF
                sta ReadClock    ; $77E1
                ldx #$20    ; $77E4
                lda rm_PathComp,x    ; $77E6
                sta $0200,x    ; $77E9
                dex    ; $77EC
                bpl $77E6    ; $77ED
                rts    ; $77EF
;
; === DayOfWeek ===
                brk    ; $77F0
;
; === ExitPrompt ===
        dfb $FF        ; $77F1  (data/65C02-bit)
;
; === SafetyCheck ===
                bit ExitPrompt    ; $77F2
                bpl $782F    ; $77F5
                jsr AnyArgument?    ; $77F7
                beq $782F    ; $77FA
                ldx SelectedBuff    ; $77FC
                stx $7831    ; $77FF
                stx $7830    ; $7802
                lda BuffActList,x    ; $7805
                bpl $7820    ; $7808
                jsr PointToBInfo    ; $780A
                ldy #$55    ; $780D
                lda (BuffPoint),y    ; $780F
                and #$02    ; $7811
                beq $7820    ; $7813
                ldx $7830    ; $7815
                jsr SI:OpenBuff    ; $7818
                jsr MaybeSave    ; $781B
                bne $782F    ; $781E
                ldx $7830    ; $7820
                inx    ; $7823
                cpx #$0E    ; $7824
                bcc $782A    ; $7826
                ldx #$00    ; $7828
                cpx $7831    ; $782A
                bne $7802    ; $782D
                rts    ; $782F
                brk    ; $7830
                brk    ; $7831
;
; === CommandChar ===
                brk    ; $7832
;
; === LastCommand ===
                brk    ; $7833
;
; === CommandVector ===
                brk    ; $7834
                brk    ; $7835
;
; === LastComVect ===
                brk    ; $7836
                brk    ; $7837
;
; === DisplayCode ===
                brk    ; $7838
;
; === DispatchTab ===
                sty $4F    ; $7839
                brk    ; $783B
                brk    ; $783C
;
; === Dispatch ===
                sta CommandChar    ; $783D
                sta $783B    ; $7840
                lda #$00    ; $7843
                sta $783C    ; $7845
                asl $783B    ; $7848
                rol $783C    ; $784B
                lda DispatchTab    ; $784E
                clc    ; $7851
                adc $783B    ; $7852
                sta $00    ; $7855
                lda $783A    ; $7857
                adc $783C    ; $785A
                sta $01    ; $785D
                ldy #$00    ; $785F
                lda ($00),y    ; $7861
                pha    ; $7863
                iny    ; $7864
                lda ($00),y    ; $7865
                sta $01    ; $7867
                sta $7835    ; $7869
                pla    ; $786C
                sta $00    ; $786D
                sta CommandVector    ; $786F
                ora $01    ; $7872
                bne $7879    ; $7874
                jmp CharError    ; $7876
                lda CommandChar    ; $7879
                jsr CallTemp    ; $787C
                sta DisplayCode    ; $787F
                lda CommandChar    ; $7882
                sta LastCommand    ; $7885
                lda CommandVector    ; $7888
                sta LastComVect    ; $788B
                lda $7835    ; $788E
                sta $7837    ; $7891
                lda DisplayCode    ; $7894
                rts    ; $7897
;
; === CallTemp ===
                jmp ($0000)    ; $7898
;
; === CharError ===
                lda CommandChar    ; $789B
;
; === BadCharacter ===
                jmp BadCharMsg    ; $789E
                brk    ; $78A1
;
; === NextByte ===
                jsr GatherTYI    ; $78A2
                inc $00    ; $78A5
                bne $78AB    ; $78A7
                inc $01    ; $78A9
                lda $01    ; $78AB
                cmp $6B    ; $78AD
                bcc $78D8    ; $78AF
                bne $78C9    ; $78B1
                lda $00    ; $78B3
                cmp GapTop    ; $78B5
                bcc $78D8    ; $78B7
                bne $78C9    ; $78B9
                lda GapBot    ; $78BB
                sta $00    ; $78BD
                lda $6D    ; $78BF
                sta $01    ; $78C1
                inc $00    ; $78C3
                bne $78C9    ; $78C5
                inc $01    ; $78C7
                lda $01    ; $78C9
                cmp $69    ; $78CB
                bcc $78D8    ; $78CD
                lda $00    ; $78CF
                cmp BuffBot    ; $78D1
                bcc $78D8    ; $78D3
                lda #$FF    ; $78D5
                rts    ; $78D7
                ldy #$00    ; $78D8
                jsr $D000    ; $78DA
                ldy #$00    ; $78DD
                rts    ; $78DF
;
; === UnMerlinify ===
                lda BuffTop    ; $78E0
                sta $00    ; $78E2
                lda $67    ; $78E4
                sta $01    ; $78E6
                lda $00    ; $78E8
                bne $78EE    ; $78EA
                dec $01    ; $78EC
                dec $00    ; $78EE
                lda #$8D    ; $78F0
                sta $78A1    ; $78F2
                jsr NextByte    ; $78F5
                beq $78FD    ; $78F8
                jmp $79FB    ; $78FA
                ora #$80    ; $78FD
                jsr $D054    ; $78FF
                cmp #$AA    ; $7902
                beq $7911    ; $7904
                cmp #$BB    ; $7906
                bne $791C    ; $7908
                lda $78A1    ; $790A
                cmp #$89    ; $790D
                beq $7955    ; $790F
                lda $78A1    ; $7911
                cmp #$8D    ; $7914
                beq $7955    ; $7916
                lda #$BB    ; $7918
                bne $78F2    ; $791A
                cmp #$A0    ; $791C
                bne $7927    ; $791E
                lda #$89    ; $7920
                jsr $D054    ; $7922
                bne $78F2    ; $7925
                cmp #$A2    ; $7927
                beq $792F    ; $7929
                cmp #$A7    ; $792B
                bne $78F2    ; $792D
                sta $7954    ; $792F
                jsr NextByte    ; $7932
                php    ; $7935
                ora #$80    ; $7936
                jsr $D054    ; $7938
                plp    ; $793B
                bne $78FA    ; $793C
                cmp #$20    ; $793E
                bne $7949    ; $7940
                lda #$A0    ; $7942
                jsr $D054    ; $7944
                bne $7932    ; $7947
                cmp $7954    ; $7949
                beq $78F2    ; $794C
                cmp #$8D    ; $794E
                bne $7932    ; $7950
                beq $78F2    ; $7952
                brk    ; $7954
                jsr NextByte    ; $7955
                bne $78FA    ; $7958
                ora #$80    ; $795A
                jsr $D054    ; $795C
                cmp #$8D    ; $795F
                bne $7955    ; $7961
                beq $78F2    ; $7963
;
; === Merlinify ===
                ldx #$FF    ; $7965
                jsr AnyArgument?    ; $7967
                bne $796E    ; $796A
                ldx #$7F    ; $796C
                stx $79AD    ; $796E
                lda BuffTop    ; $7971
                sta $00    ; $7973
                lda $67    ; $7975
                sta $01    ; $7977
                lda $00    ; $7979
                bne $797F    ; $797B
                dec $01    ; $797D
                dec $00    ; $797F
                lda #$8D    ; $7981
                sta $78A1    ; $7983
                jsr NextByte    ; $7986
                bne $79F8    ; $7989
                pha    ; $798B
                and $79AD    ; $798C
                jsr $D054    ; $798F
                pla    ; $7992
                cmp #$89    ; $7993
                bne $799E    ; $7995
                lda #$A0    ; $7997
                jsr $D054    ; $7999
                bne $7983    ; $799C
                cmp #$A2    ; $799E
                beq $79AE    ; $79A0
                cmp #$BB    ; $79A2
                beq $79CE    ; $79A4
                cmp #$AA    ; $79A6
                beq $79D5    ; $79A8
                jmp $7983    ; $79AA
                brk    ; $79AD
                jsr NextByte    ; $79AE
                bne $79F8    ; $79B1
                pha    ; $79B3
                and $79AD    ; $79B4
                jsr $D054    ; $79B7
                pla    ; $79BA
                cmp #$A2    ; $79BB
                beq $7983    ; $79BD
                cmp #$8D    ; $79BF
                beq $7983    ; $79C1
                cmp #$A0    ; $79C3
                bne $79AE    ; $79C5
                lda #$20    ; $79C7
                jsr $D054    ; $79C9
                bne $79AE    ; $79CC
                lda $78A1    ; $79CE
                cmp #$A0    ; $79D1
                beq $79DC    ; $79D3
                lda $78A1    ; $79D5
                cmp #$8D    ; $79D8
                bne $7983    ; $79DA
                jsr NextByte    ; $79DC
                bne $79F8    ; $79DF
                pha    ; $79E1
                and $79AD    ; $79E2
                jsr $D054    ; $79E5
                pla    ; $79E8
                cmp #$8D    ; $79E9
                beq $7983    ; $79EB
                cmp #$A0    ; $79ED
                bne $79DC    ; $79EF
                lda #$20    ; $79F1
                jsr $D054    ; $79F3
                bne $79DC    ; $79F6
                jsr SetModified    ; $79F8
                jsr DisplayPage    ; $79FB
                lda #$01    ; $79FE
                rts    ; $7A00
;
; === PrintDec ===
                sta $7A47    ; $7A01
                stx $7A48    ; $7A04
                ldx #$09    ; $7A07
                stx $7A49    ; $7A09
                ldy #$B0    ; $7A0C
                lda $7A48    ; $7A0E
                cmp $7A49,x    ; $7A11
                lda $7A47    ; $7A14
                sbc $7A4A,x    ; $7A17
                bcc $7A2B    ; $7A1A
                sta $7A47    ; $7A1C
                lda $7A48    ; $7A1F
                sbc $7A49,x    ; $7A22
                sta $7A48    ; $7A25
                iny    ; $7A28
                bne $7A0E    ; $7A29
                tya    ; $7A2B
                dex    ; $7A2C
                beq $7A40    ; $7A2D
                cmp #$B0    ; $7A2F
                beq $7A36    ; $7A31
                sta $7A49    ; $7A33
                bit $7A49    ; $7A36
                bmi $7A40    ; $7A39
                lda PD:Justify    ; $7A3B
                bpl $7A43    ; $7A3E
                jsr CharOut    ; $7A40
                dex    ; $7A43
                bpl $7A0C    ; $7A44
                rts    ; $7A46
                brk    ; $7A47
                brk    ; $7A48
                brk    ; $7A49
                ora ($00,x)    ; $7A4A
                asl    ; $7A4C
                brk    ; $7A4D
                stz $00    ; $7A4E
                inx    ; $7A50
        dfb $03        ; $7A51  (data/65C02-bit)
                bpl $7A7B    ; $7A52
;
; === PD:Justify ===
                brk    ; $7A54
;
; === ZeroJustify ===
                lda #$00    ; $7A55
                sta PD:Justify    ; $7A57
                rts    ; $7A5A
;
; === Argument ===
                ora ($00,x)    ; $7A5B
;
; === ExplicitArg ===
                brk    ; $7A5D
;
; === ArgSign ===
                brk    ; $7A5E
                brk    ; $7A5F
;
; === GetArgSign ===
                lda ArgSign    ; $7A60
                pha    ; $7A63
                lda #$00    ; $7A64
                sta ArgSign    ; $7A66
                pla    ; $7A69
                rts    ; $7A6A
;
; === InitArgument ===
                lda #$00    ; $7A6B
                sta ArgSign    ; $7A6D
                sta ExplicitArg    ; $7A70
                sta $7A5F    ; $7A73
                sta $7A5C    ; $7A76
                lda #$01    ; $7A79
                sta Argument    ; $7A7B
                rts    ; $7A7E
;
; === AnyArgument? ===
                bit ExplicitArg    ; $7A7F
                bmi $7A98    ; $7A82
                lda $7A5C    ; $7A84
                bne $7A98    ; $7A87
                lda Argument    ; $7A89
                cmp #$01    ; $7A8C
                bne $7A98    ; $7A8E
                lda ArgSign    ; $7A90
                bmi $7A98    ; $7A93
                lda #$FF    ; $7A95
                rts    ; $7A97
                lda #$00    ; $7A98
                rts    ; $7A9A
;
; === AddArgDigit ===
                pha    ; $7A9B
                lda $7A5C    ; $7A9C
                sta $01    ; $7A9F
                lda Argument    ; $7AA1
                sta $00    ; $7AA4
                asl    ; $7AA6
                rol $7A5C    ; $7AA7
                asl    ; $7AAA
                rol $7A5C    ; $7AAB
                asl    ; $7AAE
                rol $7A5C    ; $7AAF
                asl $00    ; $7AB2
                rol $01    ; $7AB4
                clc    ; $7AB6
                adc $00    ; $7AB7
                sta Argument    ; $7AB9
                lda $7A5C    ; $7ABC
                adc $01    ; $7ABF
                sta $7A5C    ; $7AC1
                pla    ; $7AC4
                clc    ; $7AC5
                adc Argument    ; $7AC6
                sta Argument    ; $7AC9
                bcc $7AD1    ; $7ACC
                inc $7A5C    ; $7ACE
                rts    ; $7AD1
;
; === ArgumentDigit ===
                bit $7A5F    ; $7AD2
                bmi $7AE9    ; $7AD5
                pha    ; $7AD7
                lda #$00    ; $7AD8
                sta Argument    ; $7ADA
                sta $7A5C    ; $7ADD
                lda #$FF    ; $7AE0
                sta $7A5F    ; $7AE2
                sta ExplicitArg    ; $7AE5
                pla    ; $7AE8
                ora #$80    ; $7AE9
                sec    ; $7AEB
                sbc #$B0    ; $7AEC
                jsr AddArgDigit    ; $7AEE
                pla    ; $7AF1
                pla    ; $7AF2
                jmp $7B29    ; $7AF3
;
; === ZeroArg? ===
                lda HardKey    ; $7AF6
                ora #$80    ; $7AF9
                cmp #$87    ; $7AFB
                bne $7B0A    ; $7AFD
                lda #$00    ; $7AFF
                sta Argument    ; $7B01
                sta $7A5C    ; $7B04
                jsr Beep    ; $7B07
                lda Argument    ; $7B0A
                ora $7A5C    ; $7B0D
                rts    ; $7B10
;
; === NegativeArg ===
                jsr InitArgument    ; $7B11
                lda #$FF    ; $7B14
                sta ArgSign    ; $7B16
                jmp $7B29    ; $7B19
                brk    ; $7B1C
;
; === UniversalArg ===
                asl Argument    ; $7B1D
                rol $7A5C    ; $7B20
                asl Argument    ; $7B23
                rol $7A5C    ; $7B26
                jsr $7B59    ; $7B29
                sta $7B58    ; $7B2C
                ora #$80    ; $7B2F
                cmp #$AD    ; $7B31
                bne $7B42    ; $7B33
                bit ArgSign    ; $7B35
                bmi $7B4D    ; $7B38
                bit ExplicitArg    ; $7B3A
                bmi $7B4D    ; $7B3D
                jmp NegativeArg    ; $7B3F
                cmp #$B0    ; $7B42
                bcc $7B4D    ; $7B44
                cmp #$BA    ; $7B46
                bcs $7B4D    ; $7B48
                jsr ArgumentDigit    ; $7B4A
                lda #$00    ; $7B4D
                sta $7B1C    ; $7B4F
                lda $7B58    ; $7B52
                jmp Dispatch    ; $7B55
                brk    ; $7B58
                bit $7B1C    ; $7B59
                bpl $7B64    ; $7B5C
                jsr $7B7F    ; $7B5E
                jmp BlinkCursor    ; $7B61
                lda #$03    ; $7B64
                sta BlinkTime    ; $7B66
                lda CH    ; $7B69
                sta Cursor2    ; $7B6B
                lda CV    ; $7B6E
                sta $28B8    ; $7B70
                jsr TimedBlink    ; $7B73
                beq $7B7E    ; $7B76
                dec $7B1C    ; $7B78
                jmp $7B59    ; $7B7B
                rts    ; $7B7E
                jsr NewEchoArea    ; $7B7F
                jsr PrintMessage    ; $7B82
                cmp ($F2,x)    ; $7B85
        dfb $E7        ; $7B87  (data/65C02-bit)
                tsx    ; $7B88
                brk    ; $7B89
                lda #$AD    ; $7B8A
                bit ArgSign    ; $7B8C
                bpl $7B94    ; $7B8F
                jsr CharOut    ; $7B91
                jsr PrintArgument    ; $7B94
                jmp CloseEchoArea    ; $7B97
;
; === PrintArgument ===
                jsr ZeroJustify    ; $7B9A
                lda $7A5C    ; $7B9D
                ldx Argument    ; $7BA0
                jmp PrintDec    ; $7BA3
        dfb $9B        ; $7BA6  (data/65C02-bit)
;
; === StringArgs ===
                brk    ; $7BA7
                brk    ; $7BA8
                brk    ; $7BA9
                brk    ; $7BAA
                brk    ; $7BAB
                brk    ; $7BAC
                brk    ; $7BAD
                brk    ; $7BAE
                brk    ; $7BAF
                brk    ; $7BB0
                brk    ; $7BB1
                brk    ; $7BB2
                brk    ; $7BB3
                brk    ; $7BB4
                brk    ; $7BB5
                brk    ; $7BB6
                brk    ; $7BB7
                brk    ; $7BB8
                brk    ; $7BB9
                brk    ; $7BBA
                brk    ; $7BBB
                brk    ; $7BBC
                brk    ; $7BBD
                brk    ; $7BBE
                brk    ; $7BBF
                brk    ; $7BC0
                brk    ; $7BC1
                brk    ; $7BC2
                brk    ; $7BC3
                brk    ; $7BC4
                brk    ; $7BC5
                brk    ; $7BC6
                brk    ; $7BC7
                brk    ; $7BC8
                brk    ; $7BC9
                brk    ; $7BCA
                brk    ; $7BCB
                brk    ; $7BCC
                brk    ; $7BCD
                brk    ; $7BCE
                brk    ; $7BCF
                brk    ; $7BD0
                brk    ; $7BD1
                brk    ; $7BD2
                brk    ; $7BD3
                brk    ; $7BD4
                brk    ; $7BD5
                brk    ; $7BD6
                brk    ; $7BD7
                brk    ; $7BD8
                brk    ; $7BD9
                brk    ; $7BDA
                brk    ; $7BDB
                brk    ; $7BDC
                brk    ; $7BDD
                brk    ; $7BDE
                brk    ; $7BDF
                brk    ; $7BE0
                brk    ; $7BE1
                brk    ; $7BE2
                brk    ; $7BE3
                brk    ; $7BE4
                brk    ; $7BE5
                brk    ; $7BE6
                brk    ; $7BE7
                brk    ; $7BE8
                brk    ; $7BE9
                brk    ; $7BEA
                brk    ; $7BEB
                brk    ; $7BEC
                brk    ; $7BED
                brk    ; $7BEE
                brk    ; $7BEF
                brk    ; $7BF0
                brk    ; $7BF1
                brk    ; $7BF2
                brk    ; $7BF3
                brk    ; $7BF4
                brk    ; $7BF5
                brk    ; $7BF6
                brk    ; $7BF7
                brk    ; $7BF8
                brk    ; $7BF9
                brk    ; $7BFA
                brk    ; $7BFB
                brk    ; $7BFC
                brk    ; $7BFD
                brk    ; $7BFE
                brk    ; $7BFF
                brk    ; $7C00
                brk    ; $7C01
                brk    ; $7C02
                brk    ; $7C03
                brk    ; $7C04
                brk    ; $7C05
                brk    ; $7C06
                brk    ; $7C07
                brk    ; $7C08
                brk    ; $7C09
                brk    ; $7C0A
                brk    ; $7C0B
                brk    ; $7C0C
                brk    ; $7C0D
                brk    ; $7C0E
                brk    ; $7C0F
                brk    ; $7C10
                brk    ; $7C11
                brk    ; $7C12
                brk    ; $7C13
                brk    ; $7C14
                brk    ; $7C15
                brk    ; $7C16
                brk    ; $7C17
                brk    ; $7C18
                brk    ; $7C19
                brk    ; $7C1A
                brk    ; $7C1B
                brk    ; $7C1C
                brk    ; $7C1D
                brk    ; $7C1E
                brk    ; $7C1F
                brk    ; $7C20
                brk    ; $7C21
                brk    ; $7C22
                brk    ; $7C23
                brk    ; $7C24
                brk    ; $7C25
                brk    ; $7C26
;
; === ArgCount ===
                brk    ; $7C27
;
; === ArgIndex ===
                brk    ; $7C28
;
; === InitStrArgs ===
                lda #$00    ; $7C29
                sta ArgIndex    ; $7C2B
                sta ArgCount    ; $7C2E
                rts    ; $7C31
;
; === GetStrArg ===
                ldx ArgIndex    ; $7C32
                cpx ArgCount    ; $7C35
                bcs $7C65    ; $7C38
                ldy #$FF    ; $7C3A
                iny    ; $7C3C
                bmi $7C65    ; $7C3D
                lda $7BA6,y    ; $7C3F
                cmp #$9B    ; $7C42
                bne $7C3C    ; $7C44
                dex    ; $7C46
                cpx #$FF    ; $7C47
                bne $7C3C    ; $7C49
                inx    ; $7C4B
                lda StringArgs,y    ; $7C4C
                cmp #$9B    ; $7C4F
                beq $7C5A    ; $7C51
                sta $0200,x    ; $7C53
                inx    ; $7C56
                iny    ; $7C57
                bpl $7C4C    ; $7C58
                lda #$8D    ; $7C5A
                sta $0200,x    ; $7C5C
                inc ArgIndex    ; $7C5F
                lda #$00    ; $7C62
                rts    ; $7C64
                lda #$FF    ; $7C65
                rts    ; $7C67
;
; === PointForward ===
                lda $61    ; $7C68
                cmp $6B    ; $7C6A
                bcc $7C8F    ; $7C6C
                bne $7C88    ; $7C6E
                lda TheBuffer    ; $7C70
                cmp GapTop    ; $7C72
                bcc $7C8F    ; $7C74
                bne $7C88    ; $7C76
                jsr GapBotPoint    ; $7C78
                cmp $69    ; $7C7B
                bne $7CAB    ; $7C7D
                lda TheBuffer    ; $7C7F
                cmp BuffBot    ; $7C81
                bne $7CAB    ; $7C83
                lda #$FF    ; $7C85
                rts    ; $7C87
                jsr PointBuffBot?    ; $7C88
                bne $7CAB    ; $7C8B
                beq $7C85    ; $7C8D
                inc TheBuffer    ; $7C8F
                bne $7C95    ; $7C91
                inc $61    ; $7C93
                lda $61    ; $7C95
                cmp $6B    ; $7C97
                bne $7CB1    ; $7C99
                lda TheBuffer    ; $7C9B
                cmp GapTop    ; $7C9D
                bne $7CB1    ; $7C9F
                jsr GapBotPoint    ; $7CA1
                jsr PointBuffBot?    ; $7CA4
                bne $7CB1    ; $7CA7
                beq $7C85    ; $7CA9
                inc TheBuffer    ; $7CAB
                bne $7CB1    ; $7CAD
                inc $61    ; $7CAF
                lda #$00    ; $7CB1
                rts    ; $7CB3
;
; === GapBotPoint ===
                lda GapBot    ; $7CB4
                clc    ; $7CB6
                adc #$01    ; $7CB7
                sta TheBuffer    ; $7CB9
                lda $6D    ; $7CBB
                adc #$00    ; $7CBD
                sta $61    ; $7CBF
                rts    ; $7CC1
;
; === PointBuffBot? ===
                lda TheBuffer    ; $7CC2
                cmp BuffBot    ; $7CC4
                bne $7CCC    ; $7CC6
                lda $61    ; $7CC8
                cmp $69    ; $7CCA
                rts    ; $7CCC
;
; === PointBackward ===
                ldx GapBot    ; $7CCD
                lda $6D    ; $7CCF
                inx    ; $7CD1
                bne $7CD7    ; $7CD2
                clc    ; $7CD4
                adc #$01    ; $7CD5
                cmp $61    ; $7CD7
                beq $7CE8    ; $7CD9
                bcs $7D11    ; $7CDB
                lda TheBuffer    ; $7CDD
                bne $7CE3    ; $7CDF
                dec $61    ; $7CE1
                dec TheBuffer    ; $7CE3
                lda #$00    ; $7CE5
                rts    ; $7CE7
                cpx TheBuffer    ; $7CE8
                bcc $7CDD    ; $7CEA
                bne $7D11    ; $7CEC
                lda GapTop    ; $7CEE
                sbc #$01    ; $7CF0
                sta TheBuffer    ; $7CF2
                lda $6B    ; $7CF4
                sbc #$00    ; $7CF6
                sta $61    ; $7CF8
                cmp $67    ; $7CFA
                bcc $7D06    ; $7CFC
                bne $7CB1    ; $7CFE
                lda TheBuffer    ; $7D00
                cmp BuffTop    ; $7D02
                bcs $7CB1    ; $7D04
                lda BuffTop    ; $7D06
                sta TheBuffer    ; $7D08
                lda $67    ; $7D0A
                sta $61    ; $7D0C
                lda #$FF    ; $7D0E
                rts    ; $7D10
                lda $61    ; $7D11
                cmp $67    ; $7D13
                bne $7CDD    ; $7D15
                lda TheBuffer    ; $7D17
                cmp BuffTop    ; $7D19
                bne $7CDD    ; $7D1B
                lda #$FF    ; $7D1D
                rts    ; $7D1F
;
; === GetYOrNp ===
                jsr PrintMessage    ; $7D20
                ldy #$A8    ; $7D23
                cmp $EFA0,y    ; $7D25
                sbc ($A0)    ; $7D28
                dec $BFA9    ; $7D2A
                brk    ; $7D2D
                jsr BlinkCursor    ; $7D2E
                cmp #$87    ; $7D31
                beq $7D47    ; $7D33
                jsr UpperCon    ; $7D35
                cmp #$CE    ; $7D38
                beq $7D47    ; $7D3A
                cmp #$D9    ; $7D3C
                beq $7D46    ; $7D3E
                jsr Beep    ; $7D40
                jmp $7D2E    ; $7D43
                rts    ; $7D46
                ldy #$FF    ; $7D47
                rts    ; $7D49
;
; === ReadAltKey ===
                lda #$FF    ; $7D4A
                sta $B4    ; $7D4C
                jsr BlinkCursor    ; $7D4E
                cmp #$87    ; $7D51
                beq $7D80    ; $7D53
                cmp #$9B    ; $7D55
                bne $7D60    ; $7D57
                jsr print_meta    ; $7D59
                lda #$7F    ; $7D5C
                bne $7D69    ; $7D5E
                cmp #$9A    ; $7D60
                bne $7D80    ; $7D62
                jsr print_c_meta    ; $7D64
                lda #$3F    ; $7D67
                sta $B4    ; $7D69
                jsr BlinkCursor    ; $7D6B
                cmp #$87    ; $7D6E
                beq $7D80    ; $7D70
                pha    ; $7D72
                jsr CharOut    ; $7D73
                pla    ; $7D76
                ora #$80    ; $7D77
                jsr UpperCon    ; $7D79
                and $B4    ; $7D7C
                ldx #$FF    ; $7D7E
                rts    ; $7D80
;
; === HexByteOut ===
                pha    ; $7D81
                lsr    ; $7D82
                lsr    ; $7D83
                lsr    ; $7D84
                lsr    ; $7D85
                jsr $7D8C    ; $7D86
                pla    ; $7D89
                and #$0F    ; $7D8A
                ora #$B0    ; $7D8C
                cmp #$BA    ; $7D8E
                bcc $7D94    ; $7D90
                adc #$06    ; $7D92
                jmp CharOut    ; $7D94
;
; === PrintDone ===
                jsr PrintMessage    ; $7D97
                sta $EFC4    ; $7D9A
                inc $AEE5    ; $7D9D
                sta $6000    ; $7DA0
;
; === PrintReturn ===
                lda #$8D    ; $7DA3
                bne $7DA9    ; $7DA5
;
; === PrintSpace ===
                lda #$A0    ; $7DA7
                jmp CharOut    ; $7DA9
;
; === Plurilize ===
                dex    ; $7DAC
                bne $7DB3    ; $7DAD
                tax    ; $7DAF
                bne $7DB3    ; $7DB0
                rts    ; $7DB2
                lda #$F3    ; $7DB3
                jmp CharOut    ; $7DB5
; ---- $7DB8-$7DDD  data  C_XCharacters (38 extended-key chars) ----
        dfb $8F,$96,$93,$98,$81,$BD,$BB,$C5,$82,$C2,$CB,$86,$C6,$B1,$B2,$CF    ; $7DB8  .....=;E.BK.F12O
        dfb $DE,$8C,$95,$83,$84,$FF,$94,$8E,$A8,$A9,$97,$C8,$89,$D6,$C3,$C1    ; $7DC8  ^.......().H.VCA
        dfb $91,$AE,$D2,$CD,$D0,$DC    ; $7DD8  ..RMP\
; ---- $7DDE-$7E29  data  C_XVectors (38 handler addresses) ----
        dfb $55,$39,$56,$67,$7D,$6A,$2B,$7E,$10,$1C,$48,$1C,$4A,$7E,$04,$8B    ; $7DDE  U9Vg}j+~..H.J~..
        dfb $74,$48,$B1,$45,$1F,$4A,$BE,$6B,$3F,$7E,$3F,$13,$23,$12,$C1,$12    ; $7DEE  tH1E.J>k?~?.#.A.
        dfb $7F,$13,$61,$8D,$75,$8D,$83,$8D,$54,$6B,$F0,$3A,$7D,$8A,$34,$7E    ; $7DFE  ..a.u...Tkp:}.4~
        dfb $D9,$8B,$05,$8C,$CA,$69,$2F,$4D,$9D,$1B,$49,$97,$14,$1C,$08,$1C    ; $7E0E  Y...Ji/M..I.....
        dfb $7B,$7E,$AC,$20,$31,$7E,$31,$7E,$31,$7E,$31,$7E    ; $7E1E  {~, 1~1~1~1~
; ---- $7E2A-$7E2A  data  C_XCharCount ($26 = 38) ----
        dfb $26    ; $7E2A  &
; ---- $7E2B-$9B36  code ----
;
; === SwapMark ===
                jsr SwapPointMark    ; $7E2B
                jsr SetGap    ; $7E2E
                lda #$01    ; $7E31
                rts    ; $7E33
;
; === SetGoalCol ===
                lda #$08    ; $7E34
                sta $00    ; $7E36
                lda #$34    ; $7E38
                sta $01    ; $7E3A
                jmp $7E52    ; $7E3C
;
; === SetFillCol ===
                lda #$AC    ; $7E3F
                sta $00    ; $7E41
                lda #$1F    ; $7E43
                sta $01    ; $7E45
                jmp $7E52    ; $7E47
;
; === SetCommCol ===
                lda #$FF    ; $7E4A
                sta $00    ; $7E4C
                lda #$1C    ; $7E4E
                sta $01    ; $7E50
                bit ExplicitArg    ; $7E52
                bpl $7E63    ; $7E55
                lda $7A5C    ; $7E57
                bne $7E63    ; $7E5A
                lda Argument    ; $7E5C
                cmp #$50    ; $7E5F
                bcc $7E74    ; $7E61
                lda $01    ; $7E63
                pha    ; $7E65
                lda $00    ; $7E66
                pha    ; $7E68
                jsr FindPoint    ; $7E69
                pla    ; $7E6C
                sta $00    ; $7E6D
                pla    ; $7E6F
                sta $01    ; $7E70
                lda CH    ; $7E72
                ldy #$00    ; $7E74
                sta ($00),y    ; $7E76
                lda #$00    ; $7E78
                rts    ; $7E7A
;
; === ToggleRO ===
                lda #$01    ; $7E7B
                jsr BuffFlagOn?    ; $7E7D
                php    ; $7E80
                lda #$01    ; $7E81
                plp    ; $7E83
                beq $7E8F    ; $7E84
                jsr SetBuffFlag    ; $7E86
                jsr MakeModeLine    ; $7E89
                lda #$01    ; $7E8C
                rts    ; $7E8E
                jsr ClrBuffFlag    ; $7E8F
                jmp $7E89    ; $7E92
;
; === FunPtr ===
                brk    ; $7E95
                brk    ; $7E96
;
; === FindFunKey ===
                jsr FindFunRef    ; $7E97
                ldy #$00    ; $7E9A
                lda ($00),y    ; $7E9C
                pha    ; $7E9E
                iny    ; $7E9F
                lda ($00),y    ; $7EA0
                sta $01    ; $7EA2
                pla    ; $7EA4
                sta $00    ; $7EA5
                rts    ; $7EA7
;
; === FindFunRef ===
                sta $00    ; $7EA8
                lda #$00    ; $7EAA
                sta $01    ; $7EAC
                asl $00    ; $7EAE
                rol $01    ; $7EB0
                lda DispatchTab    ; $7EB2
                clc    ; $7EB5
                adc $00    ; $7EB6
                sta $00    ; $7EB8
                lda $783A    ; $7EBA
                adc $01    ; $7EBD
                sta $01    ; $7EBF
                rts    ; $7EC1
;
; === GetFunName ===
                lda #$37    ; $7EC2
                sta $00    ; $7EC4
                lda #$9B    ; $7EC6
                sta $01    ; $7EC8
                ldy #$00    ; $7ECA
                lda ($00),y    ; $7ECC
                beq $7EE3    ; $7ECE
                cmp #$FF    ; $7ED0
                bne $7EE9    ; $7ED2
                iny    ; $7ED4
                lda ($00),y    ; $7ED5
                pha    ; $7ED7
                iny    ; $7ED8
                lda ($00),y    ; $7ED9
                sta $01    ; $7EDB
                pla    ; $7EDD
                sta $00    ; $7EDE
                jmp $7ECA    ; $7EE0
                sta $00    ; $7EE3
                sta $01    ; $7EE5
                dey    ; $7EE7
                rts    ; $7EE8
                jsr PushCompPoint    ; $7EE9
                jsr FunctionRef    ; $7EEC
                lda $00    ; $7EEF
                cmp FunPtr    ; $7EF1
                bne $7F03    ; $7EF4
                lda $01    ; $7EF6
                cmp $7E96    ; $7EF8
                bne $7F03    ; $7EFB
                jsr PopCompPoint    ; $7EFD
                lda #$00    ; $7F00
                rts    ; $7F02
                jsr PopCompPoint    ; $7F03
                jsr SkipEnt    ; $7F06
                jmp $7ECA    ; $7F09
                brk    ; $7F0C
                brk    ; $7F0D
                brk    ; $7F0E
;
; === SetKey ===
                jsr ReadFunction    ; $7F0F
                beq $7F17    ; $7F12
                jmp $808A    ; $7F14
                jsr OpenEchoArea    ; $7F17
                lda $00    ; $7F1A
                sta $7F0C    ; $7F1C
                lda $01    ; $7F1F
                sta $7F0D    ; $7F21
                bit ExplicitArg    ; $7F24
                bpl $7F2F    ; $7F27
                lda Argument    ; $7F29
                jmp $7F48    ; $7F2C
                jsr PrintMessage    ; $7F2F
                sta $EECF    ; $7F32
                ldy #$F7    ; $7F35
                inx    ; $7F37
                sbc ($F4,x)    ; $7F38
                ldy #$EB    ; $7F3A
                sbc $F9    ; $7F3C
                tsx    ; $7F3E
                brk    ; $7F3F
                jsr ReadAltKey    ; $7F40
                bne $7F48    ; $7F43
                jmp $8082    ; $7F45
                sta $7F0E    ; $7F48
                jsr Home    ; $7F4B
                jsr PrintMessage    ; $7F4E
                bne $7F48    ; $7F51
        dfb $F4        ; $7F53  (data/65C02-bit)
                ldy #$00    ; $7F54
                lda $7F0C    ; $7F56
                sta $00    ; $7F59
                lda $7F0D    ; $7F5B
                sta $01    ; $7F5E
                jsr DCIStringOut    ; $7F60
                jsr PrintMessage    ; $7F63
                ldy #$EF    ; $7F66
                inc: $00A0    ; $7F68
                lda $7F0E    ; $7F6B
                jsr PrettyPrint    ; $7F6E
                jsr ClearEOL    ; $7F71
                jsr GetYOrNp    ; $7F74
                bne $7F45    ; $7F77
                lda $7F0E    ; $7F79
                jsr FindFunRef    ; $7F7C
                lda $01    ; $7F7F
                pha    ; $7F81
                lda $00    ; $7F82
                pha    ; $7F84
                lda $7F0C    ; $7F85
                sta $00    ; $7F88
                lda $7F0D    ; $7F8A
                sta $01    ; $7F8D
                jsr FunctionRef    ; $7F8F
                lda $00    ; $7F92
                sta $7F0C    ; $7F94
                lda $01    ; $7F97
                sta $7F0D    ; $7F99
                pla    ; $7F9C
                sta $00    ; $7F9D
                pla    ; $7F9F
                sta $01    ; $7FA0
                ldy #$00    ; $7FA2
                lda $7F0C    ; $7FA4
                sta ($00),y    ; $7FA7
                iny    ; $7FA9
                lda $7F0D    ; $7FAA
                sta ($00),y    ; $7FAD
                jmp $7F14    ; $7FAF
;
; === BindIfNot ===
                tax    ; $7FB2
                lda $01    ; $7FB3
                pha    ; $7FB5
                lda $00    ; $7FB6
                pha    ; $7FB8
                txa    ; $7FB9
                jsr FindFunRef    ; $7FBA
                ldy #$00    ; $7FBD
                lda ($00),y    ; $7FBF
                iny    ; $7FC1
                ora ($00),y    ; $7FC2
                beq $7FDE    ; $7FC4
                pla    ; $7FC6
                sta $00    ; $7FC7
                pla    ; $7FC9
                sta $01    ; $7FCA
                rts    ; $7FCC
;
; === UnBindKey ===
                ldx #$00    ; $7FCD
                stx $00    ; $7FCF
                stx $01    ; $7FD1
;
; === BindKey ===
                tax    ; $7FD3
                lda $01    ; $7FD4
                pha    ; $7FD6
                lda $00    ; $7FD7
                pha    ; $7FD9
                txa    ; $7FDA
                jsr FindFunRef    ; $7FDB
                ldy #$00    ; $7FDE
                pla    ; $7FE0
                sta ($00),y    ; $7FE1
                pla    ; $7FE3
                iny    ; $7FE4
                sta ($00),y    ; $7FE5
                rts    ; $7FE7
;
; === WhatKey ===
                tsx    ; $7FE8
                stx $8077    ; $7FE9
                lda #$78    ; $7FEC
                sta TypeoutAbort    ; $7FEE
                lda #$80    ; $7FF1
                sta $2A98    ; $7FF3
                jsr NewEchoArea    ; $7FF6
                jsr PrintMessage    ; $7FF9
                cmp $BFAD    ; $7FFC
                ldy #$00    ; $7FFF
                jsr ReadAltKey    ; $8001
                bne $8009    ; $8004
                jmp $8082    ; $8006
                sta $7F0E    ; $8009
                jsr CloseEchoArea    ; $800C
                jsr OpenTypeout    ; $800F
                lda $7F0E    ; $8012
                cmp #$98    ; $8015
                bne $801C    ; $8017
                jmp WhatCtrlX    ; $8019
                jsr FindFunKey    ; $801C
                lda $00    ; $801F
                sta FunPtr    ; $8021
                lda $01    ; $8024
                sta $7E96    ; $8026
                jsr GetFunName    ; $8029
                lda $7F0E    ; $802C
                jsr PrettyPrint    ; $802F
                lda $01    ; $8032
                bne $803C    ; $8034
                jsr PrUnDefined    ; $8036
                jmp $803F    ; $8039
                jsr PrFunDoc    ; $803C
                jsr CloseTypeout    ; $803F
                lda #$01    ; $8042
                rts    ; $8044
;
; === PrFunDoc ===
                jsr PrintMessage    ; $8045
                ldy #$F2    ; $8048
                sbc $EE,x    ; $804A
        dfb $F3        ; $804C  (data/65C02-bit)
                ldy #$F4    ; $804D
                inx    ; $804F
                sbc $A0    ; $8050
                inc $F5    ; $8052
                inc $F4E3    ; $8054
                sbc #$EF    ; $8057
                inc: $00A0    ; $8059
                tya    ; $805C
                jsr DCIStringOut1    ; $805D
                jsr PrintMessage    ; $8060
                tsx    ; $8063
                sta: $0089    ; $8064
                jsr DocRef    ; $8067
                lda #$08    ; $806A
                jsr DCIStringOut1    ; $806C
                jsr PrintMessage    ; $806F
                ldx $8D8D    ; $8072
                brk    ; $8075
                rts    ; $8076
                brk    ; $8077
                ldx $8077    ; $8078
                txs    ; $807B
                jsr CloseTypeout1    ; $807C
                lda #$01    ; $807F
                rts    ; $8081
                jsr Beep    ; $8082
                lda #$87    ; $8085
                jsr CharOut    ; $8087
                jsr CloseEchoArea    ; $808A
                lda #$01    ; $808D
                rts    ; $808F
;
; === WhatCtrlX ===
                lda #$98    ; $8090
                jsr PrettyPrint    ; $8092
                lda #$9C    ; $8095
                sta $00    ; $8097
                lda #$BE    ; $8099
                sta $01    ; $809B
                lda #$00    ; $809D
                jsr DCIStringOut1    ; $809F
                jsr BlinkCursor    ; $80A2
                cmp #$87    ; $80A5
                beq $8078    ; $80A7
                sta $7F0E    ; $80A9
                jsr PrintMessage    ; $80AC
                sta: $008D    ; $80AF
                lda $7F0E    ; $80B2
                cmp #$AA    ; $80B5
                beq $80E2    ; $80B7
                cmp #$80    ; $80B9
                bcc $80CE    ; $80BB
                jsr UpperCon    ; $80BD
                jsr FindXKey    ; $80C0
                bne $80CE    ; $80C3
                lda $7F0E    ; $80C5
                jsr PrCtrlXDoc    ; $80C8
                jmp $803F    ; $80CB
                lda #$98    ; $80CE
                jsr PrettyPrint    ; $80D0
                jsr PrintSpace    ; $80D3
                lda $7F0E    ; $80D6
                jsr PrettyPrint    ; $80D9
                jsr PrUnDefined    ; $80DC
                jmp $803F    ; $80DF
                ldx #$00    ; $80E2
                stx $7F0C    ; $80E4
                ldx $7F0C    ; $80E7
                cpx C_XCharCount    ; $80EA
                bcs $8105    ; $80ED
                lda C_XCharacters,x    ; $80EF
                sta $7F0E    ; $80F2
                jsr FindXKey    ; $80F5
                bne $8100    ; $80F8
                lda $7F0E    ; $80FA
                jsr PrCtrlXDoc    ; $80FD
                inc $7F0C    ; $8100
                bne $80E7    ; $8103
                jsr PrintDone    ; $8105
                jmp $803F    ; $8108
;
; === FindXKey ===
                ldx #$00    ; $810B
                cpx C_XCharCount    ; $810D
                bcs $811A    ; $8110
                cmp C_XCharacters,x    ; $8112
                beq $811C    ; $8115
                inx    ; $8117
                bne $810D    ; $8118
                inx    ; $811A
                rts    ; $811B
                txa    ; $811C
                asl    ; $811D
                tax    ; $811E
                lda C_XVectors,x    ; $811F
                sta FunPtr    ; $8122
                lda $7DDF,x    ; $8125
                sta $7E96    ; $8128
                jsr GetFunName    ; $812B
                lda $01    ; $812E
                beq $811A    ; $8130
                lda #$00    ; $8132
                rts    ; $8134
;
; === PrCtrlXDoc ===
                pha    ; $8135
                lda #$98    ; $8136
                jsr PrettyPrint    ; $8138
                lda #$A0    ; $813B
                jsr CharOut    ; $813D
                pla    ; $8140
                jsr PrettyPrint    ; $8141
                jmp PrFunDoc    ; $8144
;
; === DefMajor ===
                brk    ; $8147
;
; === TheModes ===
                sbc ($81)    ; $8148
                lda ($81),y    ; $814A
                adc $6D81,x    ; $814C
                sta ($5A,x)    ; $814F
                sta ($C6,x)    ; $8151
                sta ($F2,x)    ; $8153
                sta ($F2,x)    ; $8155
                sta ($F2,x)    ; $8157
                sta ($A9,x)    ; $8159
                php    ; $815B
                sta $00    ; $815C
                lda #$83    ; $815E
                sta $01    ; $8160
                jsr SetModeComm    ; $8162
                jsr BlockBind    ; $8165
                lda #$04    ; $8168
                jmp ModeFinish    ; $816A
;
; === MODE:Lisp ===
                lda #$05    ; $816D
                sta $00    ; $816F
                lda #$83    ; $8171
                sta $01    ; $8173
                jsr SetModeComm    ; $8175
                lda #$03    ; $8178
                jmp ModeFinish    ; $817A
;
; === MODE:Merlin ===
                lda #$05    ; $817D
                sta $00    ; $817F
                lda #$83    ; $8181
                sta $01    ; $8183
                jsr SetModeComm    ; $8185
                lda #$65    ; $8188
                sta $00    ; $818A
                lda #$79    ; $818C
                sta $01    ; $818E
                lda #$0D    ; $8190
                jsr BindKey    ; $8192
                lda #$E0    ; $8195
                sta $00    ; $8197
                lda #$78    ; $8199
                sta $01    ; $819B
                lda #$4D    ; $819D
                jsr BindKey    ; $819F
                lda #$02    ; $81A2
                eor #$FF    ; $81A4
                ldy #$40    ; $81A6
                and (BuffData),y    ; $81A8
                sta (BuffData),y    ; $81AA
                lda #$02    ; $81AC
                jmp ModeFinish    ; $81AE
;
; === MODE:Text ===
                lda #$03    ; $81B1
                sta $00    ; $81B3
                lda #$83    ; $81B5
                sta $01    ; $81B7
                jsr SetModeComm    ; $81B9
                lda #$02    ; $81BC
                jsr SetMinorMd    ; $81BE
                lda #$01    ; $81C1
                jmp ModeFinish    ; $81C3
;
; === MODE:Pascal ===
                lda #$0E    ; $81C6
                sta $00    ; $81C8
                lda #$83    ; $81CA
                sta $01    ; $81CC
                jsr SetModeComm    ; $81CE
                jsr BlockBind    ; $81D1
                lda #$05    ; $81D4
                jmp ModeFinish    ; $81D6
;
; === BlockBind ===
                lda #$04    ; $81D9
                jsr SetMinorMd    ; $81DB
                lda #$72    ; $81DE
                sta $00    ; $81E0
                lda #$25    ; $81E2
                sta $01    ; $81E4
                lda #$0D    ; $81E6
                jmp BindKey    ; $81E8
;
; === SetMinorMd ===
                ldy #$40    ; $81EB
                ora (BuffData),y    ; $81ED
                sta (BuffData),y    ; $81EF
                rts    ; $81F1
;
; === MODE:Fund ===
                lda #$05    ; $81F2
                sta $00    ; $81F4
                lda #$83    ; $81F6
                sta $01    ; $81F8
                jsr SetModeComm    ; $81FA
                lda #$00    ; $81FD
;
; === ModeFinish ===
                ldy #$3F    ; $81FF
                sta (BuffData),y    ; $8201
                cmp #$06    ; $8203
                bcc $8209    ; $8205
                lda #$00    ; $8207
                asl    ; $8209
                tax    ; $820A
                lda $D0A5,x    ; $820B
                sta $00    ; $820E
                lda $D0A6,x    ; $8210
                sta $01    ; $8213
                ldy #$09    ; $8215
                lda ($00),y    ; $8217
                sta TabTable,y    ; $8219
                dey    ; $821C
                bpl $8217    ; $821D
                jsr MakeModeLine    ; $821F
                lda #$01    ; $8222
                rts    ; $8224
;
; === SetModeComm ===
                ldy #$FF    ; $8225
                iny    ; $8227
                lda ($00),y    ; $8228
                sta CommentBegin,y    ; $822A
                bne $8227    ; $822D
                ldx #$FF    ; $822F
                iny    ; $8231
                inx    ; $8232
                lda ($00),y    ; $8233
                sta CommentEnd,x    ; $8235
                bne $8231    ; $8238
                rts    ; $823A
                lda $ADAA    ; $823B
                brk    ; $823E
;
; === ParseMode ===
                lda #$3B    ; $823F
                sta StringPntr    ; $8241
                lda #$82    ; $8244
                sta $1D0B    ; $8246
                jsr StringInLine    ; $8249
                bne $8291    ; $824C
                ldy #$00    ; $824E
                jsr $D000    ; $8250
                ora #$80    ; $8253
                cmp #$8D    ; $8255
                beq $8291    ; $8257
                cmp #$BA    ; $8259
                beq $8260    ; $825B
                iny    ; $825D
                bne $8250    ; $825E
                ldx #$00    ; $8260
                iny    ; $8262
                jsr $D000    ; $8263
                ora #$80    ; $8266
                cmp #$A0    ; $8268
                beq $8262    ; $826A
                cmp #$89    ; $826C
                beq $8262    ; $826E
                jsr $D000    ; $8270
                ora #$80    ; $8273
                jsr UpperCon    ; $8275
                sta $0200,x    ; $8278
                inx    ; $827B
                bmi $8291    ; $827C
                cmp #$89    ; $827E
                beq $8292    ; $8280
                cmp #$A0    ; $8282
                beq $8292    ; $8284
                cmp #$8D    ; $8286
                beq $8292    ; $8288
                cmp #$AD    ; $828A
                beq $8292    ; $828C
                iny    ; $828E
                bne $8270    ; $828F
                rts    ; $8291
                lda #$00    ; $8292
                sta $01FF,x    ; $8294
                jsr SI:ParseMode    ; $8297
                bne $8291    ; $829A
;
; === SelectMode ===
                pha    ; $829C
                lda #$84    ; $829D
                sta DispatchTab    ; $829F
                lda #$4F    ; $82A2
                sta $783A    ; $82A4
                pla    ; $82A7
                asl    ; $82A8
                tax    ; $82A9
                lda TheModes,x    ; $82AA
                sta $00    ; $82AD
                lda $8149,x    ; $82AF
                sta $01    ; $82B2
                jmp ($0000)    ; $82B4
;
; === SI:ParseMode ===
                lda #$6A    ; $82B7
                sta $00    ; $82B9
                lda #$53    ; $82BB
                sta $01    ; $82BD
;
; === SI:ListScan ===
                ldx #$00    ; $82BF
                stx $04    ; $82C1
                ldy $04    ; $82C3
                lda ($00),y    ; $82C5
                sta $02    ; $82C7
                iny    ; $82C9
                lda ($00),y    ; $82CA
                beq $82E9    ; $82CC
                sta $03    ; $82CE
                iny    ; $82D0
                sty $04    ; $82D1
                ldy #$00    ; $82D3
                ldx #$00    ; $82D5
                lda ($02),y    ; $82D7
                bmi $82EC    ; $82D9
                ora #$80    ; $82DB
                jsr UpperCon    ; $82DD
                cmp $0200,x    ; $82E0
                bne $82C3    ; $82E3
                iny    ; $82E5
                inx    ; $82E6
                bpl $82D7    ; $82E7
                lda #$FF    ; $82E9
                rts    ; $82EB
                jsr UpperCon    ; $82EC
                cmp $0200,x    ; $82EF
                bne $82C3    ; $82F2
                inx    ; $82F4
                lda $0200,x    ; $82F5
                bne $82C3    ; $82F8
                php    ; $82FA
                lda $04    ; $82FB
                lsr    ; $82FD
                sec    ; $82FE
                sbc #$01    ; $82FF
                plp    ; $8301
                rts    ; $8302
                brk    ; $8303
                brk    ; $8304
        dfb $BB        ; $8305  (data/65C02-bit)
                brk    ; $8306
                brk    ; $8307
        dfb $AF        ; $8308  (data/65C02-bit)
                tax    ; $8309
                brk    ; $830A
                tax    ; $830B
        dfb $AF        ; $830C  (data/65C02-bit)
                brk    ; $830D
        dfb $FB        ; $830E  (data/65C02-bit)
                brk    ; $830F
                sbc $E800,x    ; $8310
                sbc $EC    ; $8313
                beq $82C6    ; $8315
                sbc ($ED,x)    ; $8317
                sbc ($E3,x)    ; $8319
        dfb $F3        ; $831B  (data/65C02-bit)
                ldx $E5E8    ; $831C
                cpx $B0F0    ; $831F
                brk    ; $8322
;
; === SystemPath ===
        dfb $AF        ; $8323  (data/65C02-bit)
                sbc ($ED,x)    ; $8324
                sbc ($E3,x)    ; $8326
        dfb $F3        ; $8328  (data/65C02-bit)
        dfb $AF        ; $8329  (data/65C02-bit)
                brk    ; $832A
                brk    ; $832B
                brk    ; $832C
                brk    ; $832D
                brk    ; $832E
                brk    ; $832F
                brk    ; $8330
                brk    ; $8331
                brk    ; $8332
                brk    ; $8333
                brk    ; $8334
                brk    ; $8335
                brk    ; $8336
                brk    ; $8337
                brk    ; $8338
                brk    ; $8339
                brk    ; $833A
                brk    ; $833B
                brk    ; $833C
                brk    ; $833D
                brk    ; $833E
                brk    ; $833F
                brk    ; $8340
                brk    ; $8341
                brk    ; $8342
                brk    ; $8343
                brk    ; $8344
                brk    ; $8345
                brk    ; $8346
                brk    ; $8347
                brk    ; $8348
                brk    ; $8349
                brk    ; $834A
                brk    ; $834B
                brk    ; $834C
                brk    ; $834D
                brk    ; $834E
                brk    ; $834F
                brk    ; $8350
                brk    ; $8351
                brk    ; $8352
                brk    ; $8353
        dfb $9F        ; $8354  (data/65C02-bit)
;
; === SetSysPath ===
                ldy #$00    ; $8355
                lda SystemPath,y    ; $8357
                sta $0200,y    ; $835A
                beq $8362    ; $835D
                iny    ; $835F
                bne $8357    ; $8360
                dey    ; $8362
                lda #$AF    ; $8363
                cmp $0200,y    ; $8365
                beq $836E    ; $8368
                iny    ; $836A
                sta $0200,y    ; $836B
                iny    ; $836E
                lda #$8D    ; $836F
                sta $0200,y    ; $8371
                rts    ; $8374
;
; === GetHelpFile ===
                sta $8321    ; $8375
                jsr SetSysPath    ; $8378
                lda #$12    ; $837B
                sta $00    ; $837D
                lda #$83    ; $837F
                sta $01    ; $8381
                jsr SetMyFile    ; $8383
                jsr DSK:OpenFile    ; $8386
                bne $8390    ; $8389
                jsr PrepRead    ; $838B
                lda #$00    ; $838E
                rts    ; $8390
;
; === Help ===
                jsr NewEchoArea    ; $8391
                jsr PrintMessage    ; $8394
                cpy $EF    ; $8397
        dfb $E3        ; $8399  (data/65C02-bit)
                ldy #$A8    ; $839A
        dfb $BF        ; $839C  (data/65C02-bit)
                ldy #$E6    ; $839D
        dfb $EF        ; $839F  (data/65C02-bit)
                sbc ($A0)    ; $83A0
                iny    ; $83A2
                sbc $EC    ; $83A3
                beq $8350    ; $83A5
                tsx    ; $83A7
                brk    ; $83A8
                jsr BlinkCursor    ; $83A9
                pha    ; $83AC
                jsr CloseEchoArea    ; $83AD
                pla    ; $83B0
                jsr $83B7    ; $83B1
                jmp Help    ; $83B4
                ldx #$00    ; $83B7
                jsr UpperCon    ; $83B9
                cmp $83E9,x    ; $83BC
                beq $83CA    ; $83BF
                inx    ; $83C1
                cpx #$0A    ; $83C2
                bcc $83BC    ; $83C4
                jsr Beep    ; $83C6
                rts    ; $83C9
                cpx #$07    ; $83CA
                bcs $83D1    ; $83CC
                sta $8354    ; $83CE
                pla    ; $83D1
                pla    ; $83D2
                txa    ; $83D3
                asl    ; $83D4
                tax    ; $83D5
                lda $83F3,x    ; $83D6
                sta CommandVector    ; $83D9
                sta $00    ; $83DC
                lda $83F4,x    ; $83DE
                sta $7835    ; $83E1
                sta $01    ; $83E4
                jmp ($0000)    ; $83E6
                cmp ($CC,x)    ; $83E9
                cpy $C3    ; $83EB
                dec $BF,x    ; $83ED
        dfb $9F        ; $83EF  (data/65C02-bit)
        dfb $87        ; $83F0  (data/65C02-bit)
        dfb $FF        ; $83F1  (data/65C02-bit)
                ldy #$91    ; $83F2
                stz $CD    ; $83F4
                trb Describe    ; $83F6
                inx    ; $83F9
        dfb $7F        ; $83FA  (data/65C02-bit)
                bcs $8462    ; $83FB
                asl $1E84,x    ; $83FD
                sty $13    ; $8400
                sty $0D    ; $8402
                sty $07    ; $8404
                sty $AD    ; $8406
        dfb $54        ; $8408  (data/65C02-bit)
        dfb $83        ; $8409  (data/65C02-bit)
                jsr $83B7    ; $840A
                jsr ClrEchoArea    ; $840D
                lda #$01    ; $8410
                rts    ; $8412
                jsr Beep    ; $8413
                lda #$87    ; $8416
                jsr EchoOutput    ; $8418
                jmp $8410    ; $841B
                lda UseTabTable?    ; $841E
                pha    ; $8421
                lda #$00    ; $8422
                sta UseTabTable?    ; $8424
                lda #$B0    ; $8427
                jsr GetHelpFile    ; $8429
                php    ; $842C
                jsr InitTypeout    ; $842D
                jsr OpenTypeout    ; $8430
                lda #$50    ; $8433
                sta TypeoutAbort    ; $8435
                lda #$84    ; $8438
                sta $2A98    ; $843A
                plp    ; $843D
                bne $844D    ; $843E
                jsr DSK:ReadByte    ; $8440
                bne $8450    ; $8443
                ora #$80    ; $8445
                jsr CharOut    ; $8447
                jmp $8440    ; $844A
                jsr Beep    ; $844D
                jsr CloseTypeout1    ; $8450
                pla    ; $8453
                sta UseTabTable?    ; $8454
                jmp Help    ; $8457
;
; === SetMyFile ===
                tya    ; $845A
                tax    ; $845B
                ldy #$00    ; $845C
                lda ($00),y    ; $845E
                sta $0200,x    ; $8460
                beq $8469    ; $8463
                iny    ; $8465
                inx    ; $8466
                bne $845E    ; $8467
                lda #$8D    ; $8469
                sta $0200,x    ; $846B
                rts    ; $846E
;
; === QueryFlag ===
                brk    ; $846F
;
; === CaseReplace ===
                brk    ; $8470
                brk    ; $8471
                brk    ; $8472
                brk    ; $8473
                brk    ; $8474
;
; === QueryReplace ===
                lda #$FF    ; $8475
                bmi ReplaceEm    ; $8477
;
; === Replace ===
                lda #$00    ; $8479
;
; === ReplaceEm ===
                sta QueryFlag    ; $847B
                jsr ClrLastKill    ; $847E
                lda TheBuffer    ; $8481
                sta $8471    ; $8483
                lda $61    ; $8486
                sta $8472    ; $8488
                jsr $85D9    ; $848B
                beq $8493    ; $848E
                jmp $8541    ; $8490
                lda #$80    ; $8493
                sta $F0    ; $8495
                lda #$02    ; $8497
                sta $F1    ; $8499
                jsr TecoSearch    ; $849B
                beq $84A3    ; $849E
                jmp $8541    ; $84A0
                sty $E0    ; $84A3
                lda $00    ; $84A5
                sta TheBuffer    ; $84A7
                lda $01    ; $84A9
                sta $61    ; $84AB
                jsr SetGap    ; $84AD
                bit QueryFlag    ; $84B0
                bpl $84C3    ; $84B3
                jsr $8565    ; $84B5
                beq $84C3    ; $84B8
                jsr PointForward    ; $84BA
                jsr SetGap    ; $84BD
                jmp $8493    ; $84C0
                jsr SetModified    ; $84C3
                lda GapBot    ; $84C6
                sta $E2    ; $84C8
                lda $6D    ; $84CA
                sta $E3    ; $84CC
                inc $E2    ; $84CE
                bne $84D4    ; $84D0
                inc $E3    ; $84D2
                ldy #$FF    ; $84D4
                sty $8473    ; $84D6
                bit $8474    ; $84D9
                bmi $8513    ; $84DC
                iny    ; $84DE
                cpy $E0    ; $84DF
                bcs $8513    ; $84E1
                lda #$E2    ; $84E3
                jsr $D048    ; $84E5
                jsr AlphaChar?    ; $84E8
                bcs $84DE    ; $84EB
                cmp #$DB    ; $84ED
                bcc $84F8    ; $84EF
                lda #$01    ; $84F1
                sta $8473    ; $84F3
                bne $8513    ; $84F6
                inc $8473    ; $84F8
                iny    ; $84FB
                cpy $E0    ; $84FC
                bcs $8513    ; $84FE
                lda #$E2    ; $8500
                jsr $D048    ; $8502
                jsr AlphaChar?    ; $8505
                bcs $8513    ; $8508
                cmp #$E1    ; $850A
                bcc $8513    ; $850C
                lda #$02    ; $850E
                sta $8473    ; $8510
                lda $E0    ; $8513
                clc    ; $8515
                adc GapBot    ; $8516
                sta GapBot    ; $8518
                bcc $851E    ; $851A
                inc $6D    ; $851C
                ldx #$00    ; $851E
                stx $E1    ; $8520
                ldx $E1    ; $8522
                lda $0200,x    ; $8524
                bne $8534    ; $8527
                bit QueryFlag    ; $8529
                bpl $8531    ; $852C
                jsr DisplayPage    ; $852E
                jmp $8493    ; $8531
                jsr $868F    ; $8534
                jsr BuffInsert    ; $8537
                inc $E1    ; $853A
                bpl $8522    ; $853C
                jsr Beep    ; $853E
                lda $8471    ; $8541
                sta TheBuffer    ; $8544
                lda $8472    ; $8546
                sta $61    ; $8549
                jsr ClrEchoArea    ; $854B
                jsr SetGap    ; $854E
                bit QueryFlag    ; $8551
                bpl $855F    ; $8554
                jsr FindPoint    ; $8556
                beq $855F    ; $8559
                lda #$06    ; $855B
                bne $8564    ; $855D
                jsr DisplayPage    ; $855F
                lda #$01    ; $8562
                rts    ; $8564
                jsr FindPoint    ; $8565
                beq $856D    ; $8568
                jsr CenterPage    ; $856A
                jsr CursorOff    ; $856D
                jsr NewEchoArea    ; $8570
                jsr PrintMessage    ; $8573
                cmp ($E5)    ; $8576
                beq $8566    ; $8578
                sbc ($E3,x)    ; $857A
                sbc $A0    ; $857C
        dfb $F4        ; $857E  (data/65C02-bit)
                inx    ; $857F
                sbc #$F3    ; $8580
                ldy #$EF    ; $8582
        dfb $E3        ; $8584  (data/65C02-bit)
        dfb $E3        ; $8585  (data/65C02-bit)
                sbc $F2,x    ; $8586
                sbc $EE    ; $8588
        dfb $E3        ; $858A  (data/65C02-bit)
                sbc $A0    ; $858B
                tay    ; $858D
                cmp $CEAC,y    ; $858E
                ldy $ACA1    ; $8591
        dfb $C3        ; $8594  (data/65C02-bit)
                lda $A9C7    ; $8595
        dfb $BF        ; $8598  (data/65C02-bit)
                brk    ; $8599
                jsr BlinkCursor    ; $859A
                pha    ; $859D
                jsr CloseEchoArea    ; $859E
                jsr FindPoint    ; $85A1
                jsr CursorOff    ; $85A4
                pla    ; $85A7
                jsr UpperCon    ; $85A8
                cmp #$87    ; $85AB
                beq $85C1    ; $85AD
                cmp #$A1    ; $85AF
                bne $85B9    ; $85B1
                lda #$00    ; $85B3
                sta QueryFlag    ; $85B5
                rts    ; $85B8
                cmp #$D9    ; $85B9
                php    ; $85BB
                jsr EchoOutput    ; $85BC
                plp    ; $85BF
                rts    ; $85C0
                jsr EchoOutput    ; $85C1
                jsr Beep    ; $85C4
                pla    ; $85C7
                pla    ; $85C8
                lda $8471    ; $85C9
                sta TheBuffer    ; $85CC
                lda $8472    ; $85CE
                sta $61    ; $85D1
                jsr SetGap    ; $85D3
                lda #$06    ; $85D6
                rts    ; $85D8
                jsr GetStrArg    ; $85D9
                beq $85FF    ; $85DC
                jsr NewEchoArea    ; $85DE
                jsr PrintMessage    ; $85E1
        dfb $D3        ; $85E4  (data/65C02-bit)
                sbc $E1    ; $85E5
                sbc ($E3)    ; $85E7
                inx    ; $85E9
                ldy #$E6    ; $85EA
        dfb $EF        ; $85EC  (data/65C02-bit)
                sbc ($BA)    ; $85ED
                brk    ; $85EF
                jsr ReadArgLine    ; $85F0
                php    ; $85F3
                txa    ; $85F4
                pha    ; $85F5
                jsr CloseEchoArea    ; $85F6
                pla    ; $85F9
                tax    ; $85FA
                plp    ; $85FB
                beq $85FF    ; $85FC
                rts    ; $85FE
                txa    ; $85FF
                bne $8605    ; $8600
                lda #$FF    ; $8602
                rts    ; $8604
                lda #$00    ; $8605
                sta $0200,x    ; $8607
                tax    ; $860A
                lda $0200,x    ; $860B
                sta $0280,x    ; $860E
                beq $8616    ; $8611
                inx    ; $8613
                bpl $860B    ; $8614
                jsr GetStrArg    ; $8616
                beq $863E    ; $8619
                jsr OpenEchoArea    ; $861B
                jsr PrintMessage    ; $861E
                sta $E5D2    ; $8621
                beq $8612    ; $8624
                sbc ($E3,x)    ; $8626
                sbc $A0    ; $8628
        dfb $F7        ; $862A  (data/65C02-bit)
                sbc #$F4    ; $862B
                inx    ; $862D
                tsx    ; $862E
                brk    ; $862F
                jsr ReadArgLine    ; $8630
                php    ; $8633
                txa    ; $8634
                pha    ; $8635
                jsr CloseEchoArea    ; $8636
                pla    ; $8639
                tax    ; $863A
                plp    ; $863B
                bne $85FE    ; $863C
                lda #$00    ; $863E
                sta $0200,x    ; $8640
                jsr $8649    ; $8643
                lda #$00    ; $8646
                rts    ; $8648
                ldx #$00    ; $8649
                stx $8474    ; $864B
                bit CaseReplace    ; $864E
                bmi $8677    ; $8651
                lda $0280,x    ; $8653
                beq $8664    ; $8656
                jsr AlphaChar?    ; $8658
                bcs $8661    ; $865B
                cmp #$E1    ; $865D
                bcc $8677    ; $865F
                inx    ; $8661
                bne $8653    ; $8662
                ldx #$00    ; $8664
                lda $0200,x    ; $8666
                beq $867A    ; $8669
                jsr AlphaChar?    ; $866B
                bcs $8674    ; $866E
                cmp #$E1    ; $8670
                bcc $8677    ; $8672
                inx    ; $8674
                bne $8666    ; $8675
                dec $8474    ; $8677
                rts    ; $867A
;
; === AlphaChar? ===
                cmp #$C1    ; $867B
                bcc $868B    ; $867D
                cmp #$FB    ; $867F
                bcs $868B    ; $8681
                cmp #$E1    ; $8683
                bcs $868D    ; $8685
                cmp #$DB    ; $8687
                bcc $868D    ; $8689
                sec    ; $868B
                rts    ; $868C
                clc    ; $868D
                rts    ; $868E
                bit $8474    ; $868F
                bmi $86A6    ; $8692
                ldy $8473    ; $8694
                beq $86A3    ; $8697
                dey    ; $8699
                beq $86A7    ; $869A
                dey    ; $869C
                bne $86A6    ; $869D
                cpx #$00    ; $869F
                bne $86A7    ; $86A1
                jsr UpperCon    ; $86A3
                rts    ; $86A6
                jsr LowerCon    ; $86A7
                rts    ; $86AA
;
; === TecoSearch ===
                jsr SetGap    ; $86AB
                lda GapBot    ; $86AE
                sta $00    ; $86B0
                lda $6D    ; $86B2
                sta $01    ; $86B4
                lda $F0    ; $86B6
                sta $8765    ; $86B8
                lda $F1    ; $86BB
                sta $8766    ; $86BD
                inc $00    ; $86C0
                bne $86C6    ; $86C2
                inc $01    ; $86C4
                lda HardKey    ; $86C6
                ora #$80    ; $86C9
                cmp #$87    ; $86CB
                beq $86EC    ; $86CD
                jsr GatherTYI    ; $86CF
                ldx #$00    ; $86D2
                stx $F4    ; $86D4
                ldy #$00    ; $86D6
                tya    ; $86D8
                clc    ; $86D9
                adc $00    ; $86DA
                sta $F3    ; $86DC
                lda $01    ; $86DE
                adc #$00    ; $86E0
                cmp $69    ; $86E2
                bne $86EF    ; $86E4
                lda $F3    ; $86E6
                cmp BuffBot    ; $86E8
                bne $86EF    ; $86EA
                lda #$FF    ; $86EC
                rts    ; $86EE
                jsr $8764    ; $86EF
                beq $872A    ; $86F2
                cmp #$98    ; $86F4
                beq $8726    ; $86F6
                cmp #$8F    ; $86F8
                beq $872A    ; $86FA
                cmp #$97    ; $86FC
                beq $872D    ; $86FE
                cmp #$8E    ; $8700
                bne $8709    ; $8702
                dec $F4    ; $8704
                inx    ; $8706
                bne $86EF    ; $8707
                cmp #$91    ; $8709
                bne $8713    ; $870B
                inx    ; $870D
                jsr $8764    ; $870E
                beq $872A    ; $8711
                jsr SearchCase    ; $8713
                sta $F2    ; $8716
                jsr $D000    ; $8718
                jsr SearchCase    ; $871B
                cmp $F2    ; $871E
                bne $8749    ; $8720
                bit $F4    ; $8722
                bmi $86C0    ; $8724
                iny    ; $8726
                inx    ; $8727
                bne $86D8    ; $8728
                lda #$00    ; $872A
                rts    ; $872C
                jsr $D000    ; $872D
                stx $F2    ; $8730
                jsr WhiteSpace?    ; $8732
                php    ; $8735
                ldx $F2    ; $8736
                plp    ; $8738
                bne $86C0    ; $8739
                iny    ; $873B
                jsr $D000    ; $873C
                jsr WhiteSpace?    ; $873F
                beq $873B    ; $8742
                ldx $F2    ; $8744
                jmp $8727    ; $8746
                lda $F4    ; $8749
                pha    ; $874B
                lda #$00    ; $874C
                sta $F4    ; $874E
                pla    ; $8750
                bmi $8726    ; $8751
                inx    ; $8753
                jsr $8764    ; $8754
                bne $875C    ; $8757
                jmp $86C0    ; $8759
                cmp #$8F    ; $875C
                bne $8753    ; $875E
                inx    ; $8760
                jmp $86D6    ; $8761
                lda $8765,x    ; $8764
                rts    ; $8767
;
; === CountOccurs ===
                jsr $8939    ; $8768
                lda #$00    ; $876B
                beq IN:Occur    ; $876D
;
; === Occur ===
                jsr $8939    ; $876F
                lda #$FF    ; $8772
                bmi IN:Occur    ; $8774
;
; === Bccur ===
                jsr $8939    ; $8776
                jsr SetGap    ; $8779
                lda TheBuffer    ; $877C
                sta $87A9    ; $877E
                lda $61    ; $8781
                sta $87AA    ; $8783
                lda BuffTop    ; $8786
                sta TheBuffer    ; $8788
                lda $67    ; $878A
                sta $61    ; $878C
                jsr SetGap    ; $878E
                lda #$FF    ; $8791
                jsr IN:Occur    ; $8793
                jsr KillGap    ; $8796
                lda $87A9    ; $8799
                sta TheBuffer    ; $879C
                lda $87AA    ; $879E
                sta $61    ; $87A1
                jsr SetGap    ; $87A3
                lda #$01    ; $87A6
                rts    ; $87A8
                brk    ; $87A9
                brk    ; $87AA
;
; === PrintOccurs ===
                brk    ; $87AB
                brk    ; $87AC
                brk    ; $87AD
                brk    ; $87AE
                brk    ; $87AF
                brk    ; $87B0
;
; === IN:Occur ===
                sta PrintOccurs    ; $87B1
                lda TheBuffer    ; $87B4
                sta $87AC    ; $87B6
                lda $61    ; $87B9
                sta $87AD    ; $87BB
                lda #$00    ; $87BE
                sta $87AE    ; $87C0
                sta $87AF    ; $87C3
                lda #$00    ; $87C6
                sta $F0    ; $87C8
                lda #$02    ; $87CA
                sta $F1    ; $87CC
                bit PrintOccurs    ; $87CE
                bpl $87E4    ; $87D1
                jsr OpenTypeout    ; $87D3
                lda #$8A    ; $87D6
                sta TypeoutAbort    ; $87D8
                lda #$88    ; $87DB
                sta $2A98    ; $87DD
                tsx    ; $87E0
                stx $87B0    ; $87E1
                jsr TecoSearch    ; $87E4
                bne $883E    ; $87E7
                lda $00    ; $87E9
                sta TheBuffer    ; $87EB
                lda $01    ; $87ED
                sta $61    ; $87EF
                jsr SetGap    ; $87F1
                inc $87AE    ; $87F4
                bne $87FC    ; $87F7
                inc $87AF    ; $87F9
                bit PrintOccurs    ; $87FC
                bpl $8804    ; $87FF
                jsr $88A2    ; $8801
                ldy #$00    ; $8804
                lda ($F0),y    ; $8806
                cmp #$8D    ; $8808
                bne $880F    ; $880A
                iny    ; $880C
                bne $8806    ; $880D
                lda $7A5C    ; $880F
                pha    ; $8812
                lda Argument    ; $8813
                pha    ; $8816
                lda ArgSign    ; $8817
                pha    ; $881A
                sty Argument    ; $881B
                lda #$00    ; $881E
                sta ArgSign    ; $8820
                sta $7A5C    ; $8823
                jsr DownRealLine    ; $8826
                pla    ; $8829
                sta ArgSign    ; $882A
                pla    ; $882D
                sta Argument    ; $882E
                pla    ; $8831
                sta $7A5C    ; $8832
                jsr EndOfLine    ; $8835
                jsr SetGap    ; $8838
                jmp $87E4    ; $883B
                lda $87AC    ; $883E
                sta TheBuffer    ; $8841
                lda $87AD    ; $8843
                sta $61    ; $8846
                jsr SetGap    ; $8848
                bit PrintOccurs    ; $884B
                bpl $8859    ; $884E
                jsr PrintDone    ; $8850
                jsr CloseTypeout    ; $8853
                lda #$01    ; $8856
                rts    ; $8858
                jsr NewEchoArea    ; $8859
                jsr ZeroJustify    ; $885C
                lda $87AF    ; $885F
                ldx $87AE    ; $8862
                jsr PrintDec    ; $8865
                jsr PrintMessage    ; $8868
                ldy #$EF    ; $886B
        dfb $E3        ; $886D  (data/65C02-bit)
        dfb $E3        ; $886E  (data/65C02-bit)
                sbc $F2,x    ; $886F
                sbc $EE    ; $8871
        dfb $E3        ; $8873  (data/65C02-bit)
                sbc $00    ; $8874
                lda $87AF    ; $8876
                ldx $87AE    ; $8879
                jsr Plurilize    ; $887C
                lda #$AE    ; $887F
                jsr CharOut    ; $8881
                jsr CloseEchoArea    ; $8884
                jmp $8856    ; $8887
                ldx $87B0    ; $888A
                txs    ; $888D
                jsr CloseTypeout1    ; $888E
                lda $87AC    ; $8891
                sta TheBuffer    ; $8894
                lda $87AD    ; $8896
                sta $61    ; $8899
                jsr SetGap    ; $889B
                lda #$01    ; $889E
                rts    ; $88A0
                brk    ; $88A1
                lda Argument    ; $88A2
                sta $88A1    ; $88A5
                lda $61    ; $88A8
                pha    ; $88AA
                lda TheBuffer    ; $88AB
                pha    ; $88AD
                lsr Argument    ; $88AE
                lda #$00    ; $88B1
                sta $7A5C    ; $88B3
                lda CV    ; $88B6
                pha    ; $88B8
                lda CH    ; $88B9
                pha    ; $88BB
                jsr UpRealLine    ; $88BC
                jsr BegOfLine    ; $88BF
                pla    ; $88C2
                sta CH    ; $88C3
                pla    ; $88C5
                sta CV    ; $88C6
                jsr vtab    ; $88C8
                lda TheBuffer    ; $88CB
                sta $04    ; $88CD
                lda $61    ; $88CF
                sta $05    ; $88D1
                pla    ; $88D3
                sta TheBuffer    ; $88D4
                pla    ; $88D6
                sta $61    ; $88D7
                lda $88A1    ; $88D9
                sta Argument    ; $88DC
                ldy #$00    ; $88DF
                lda $04    ; $88E1
                cmp GapTop    ; $88E3
                bne $88FB    ; $88E5
                lda $05    ; $88E7
                cmp $6B    ; $88E9
                bne $88FB    ; $88EB
                lda GapBot    ; $88ED
                sta $04    ; $88EF
                lda $6D    ; $88F1
                sta $05    ; $88F3
                inc $04    ; $88F5
                bne $88FB    ; $88F7
                inc $05    ; $88F9
                lda $04    ; $88FB
                cmp BuffBot    ; $88FD
                bne $8907    ; $88FF
                lda $05    ; $8901
                cmp $69    ; $8903
                beq $891A    ; $8905
                jsr $D012    ; $8907
                cmp #$8D    ; $890A
                beq $891A    ; $890C
                jsr CharOut    ; $890E
                inc $04    ; $8911
                bne $8917    ; $8913
                inc $05    ; $8915
                jmp $88E1    ; $8917
                jsr PrintReturn    ; $891A
                dec $88A1    ; $891D
                bmi $8924    ; $8920
                bne $8911    ; $8922
                lda Argument    ; $8924
                cmp #$01    ; $8927
                beq $8938    ; $8929
                ldx #$14    ; $892B
                lda #$AD    ; $892D
                jsr CharOut    ; $892F
                dex    ; $8932
                bne $892F    ; $8933
                jsr PrintReturn    ; $8935
                rts    ; $8938
                jsr GetStrArg    ; $8939
                beq $895D    ; $893C
                jsr NewEchoArea    ; $893E
                jsr PrintMessage    ; $8941
        dfb $CF        ; $8944  (data/65C02-bit)
        dfb $E3        ; $8945  (data/65C02-bit)
        dfb $E3        ; $8946  (data/65C02-bit)
                sbc $F2,x    ; $8947
                sbc $EE    ; $8949
        dfb $E3        ; $894B  (data/65C02-bit)
                sbc $BA    ; $894C
                brk    ; $894E
                jsr ReadArgLine    ; $894F
                php    ; $8952
                txa    ; $8953
                pha    ; $8954
                jsr CloseEchoArea    ; $8955
                pla    ; $8958
                tax    ; $8959
                plp    ; $895A
                bne $8966    ; $895B
                txa    ; $895D
                beq $8966    ; $895E
                lda #$00    ; $8960
                sta $0200,x    ; $8962
                rts    ; $8965
                pla    ; $8966
                pla    ; $8967
                jsr ClrEchoArea    ; $8968
                jsr Beep    ; $896B
                lda #$01    ; $896E
                rts    ; $8970
;
; === AccumLines ===
                jsr $8939    ; $8971
                jsr ClrLastKill    ; $8974
                jsr SetGap    ; $8977
                lda TheBuffer    ; $897A
                sta $87AC    ; $897C
                lda $61    ; $897F
                sta $87AD    ; $8981
                lda #$00    ; $8984
                sta $F0    ; $8986
                lda #$02    ; $8988
                sta $F1    ; $898A
                jsr SetGap    ; $898C
                jsr TecoSearch    ; $898F
                bne $89C7    ; $8992
                lda $00    ; $8994
                sta TheBuffer    ; $8996
                lda $01    ; $8998
                sta $61    ; $899A
                jsr BegOfLine    ; $899C
                jsr SetGap    ; $899F
                lda #$FF    ; $89A2
                sta ExplicitArg    ; $89A4
                lda ArgSign    ; $89A7
                pha    ; $89AA
                eor #$FF    ; $89AB
                sta DeleteKill?    ; $89AD
                lda #$01    ; $89B0
                sta Argument    ; $89B2
                lda #$00    ; $89B5
                sta $7A5C    ; $89B7
                sta ArgSign    ; $89BA
                jsr KillLine    ; $89BD
                pla    ; $89C0
                sta ArgSign    ; $89C1
                jmp $898C    ; $89C4
                lda $87AC    ; $89C7
                sta TheBuffer    ; $89CA
                lda $87AD    ; $89CC
                sta $61    ; $89CF
                jsr SetGap    ; $89D1
                lda #$01    ; $89D4
                ldx ArgSign    ; $89D6
                bpl $89DD    ; $89D9
                lda #$02    ; $89DB
                rts    ; $89DD
;
; === XCharMove ===
                brk    ; $89DE
;
; === EOLorEOB? ===
                lda GapBot    ; $89DF
                clc    ; $89E1
                adc #$01    ; $89E2
                tay    ; $89E4
                lda $6D    ; $89E5
                adc #$00    ; $89E7
                cmp $69    ; $89E9
                bcc $89F2    ; $89EB
                cpy BuffBot    ; $89ED
                bcc $89F2    ; $89EF
                rts    ; $89F1
                ldy #$01    ; $89F2
                jsr $D03F    ; $89F4
                cmp #$8D    ; $89F7
                rts    ; $89F9
;
; === XposeChars ===
                bit XCharMove    ; $89FA
                bmi $8A53    ; $89FD
                jsr EOLorEOB?    ; $89FF
                beq $8A53    ; $8A02
                jsr PointBackward    ; $8A04
                bne $8A50    ; $8A07
                ldy #$00    ; $8A09
                jsr $D01B    ; $8A0B
                pha    ; $8A0E
                ldy #$01    ; $8A0F
                jsr $D03F    ; $8A11
                dey    ; $8A14
                jsr $D06F    ; $8A15
                sta $B4    ; $8A18
                pla    ; $8A1A
                iny    ; $8A1B
                jsr $D093    ; $8A1C
                sta $B5    ; $8A1F
                lda GapBot    ; $8A21
                sta TheBuffer    ; $8A23
                lda $6D    ; $8A25
                sta $61    ; $8A27
                inc TheBuffer    ; $8A29
                bne $8A2F    ; $8A2B
                inc $61    ; $8A2D
                inc TheBuffer    ; $8A2F
                bne $8A35    ; $8A31
                inc $61    ; $8A33
                jsr SetGap    ; $8A35
                jsr FindPoint    ; $8A38
                lda $B4    ; $8A3B
                cmp #$8D    ; $8A3D
                beq $8A47    ; $8A3F
                lda $B5    ; $8A41
                cmp #$8D    ; $8A43
                bne $8A4A    ; $8A45
                jsr DispToPoint    ; $8A47
                lda #$03    ; $8A4A
                rts    ; $8A4C
                jsr PointForward    ; $8A4D
                lda #$00    ; $8A50
                rts    ; $8A52
                jsr PointBackward    ; $8A53
                bne $8A50    ; $8A56
                jsr PointBackward    ; $8A58
                bne $8A4D    ; $8A5B
                ldy #$00    ; $8A5D
                jsr $D01B    ; $8A5F
                sta $B4    ; $8A62
                pha    ; $8A64
                iny    ; $8A65
                jsr $D01B    ; $8A66
                sta $B5    ; $8A69
                dey    ; $8A6B
                jsr $D06F    ; $8A6C
                iny    ; $8A6F
                pla    ; $8A70
                jsr $D06F    ; $8A71
                jsr PointForward    ; $8A74
                jsr PointForward    ; $8A77
                jmp $8A3B    ; $8A7A
;
; === XposeLines ===
                jsr InitArgument    ; $8A7D
                dec ExplicitArg    ; $8A80
                jsr BegOfLine    ; $8A83
                jsr SetGap    ; $8A86
                jsr ClrLastKill    ; $8A89
                jsr KillLine    ; $8A8C
                jsr PointBackward    ; $8A8F
                jsr BegOfLine    ; $8A92
                jsr YankKill    ; $8A95
                jsr PointBackward    ; $8A98
                jsr BegOfLine    ; $8A9B
                rts    ; $8A9E
                brk    ; $8A9F
                brk    ; $8AA0
                brk    ; $8AA1
                brk    ; $8AA2
                brk    ; $8AA3
                brk    ; $8AA4
;
; === MacroExec ===
                brk    ; $8AA5
;
; === MacroDef ===
                brk    ; $8AA6
;
; === ViewKbdMacro ===
                jsr OpenTypeout    ; $8AA7
                sta UseAuxZP    ; $8AAA   <== BANK: aux zero-page/stack (ALTZP on)
                lda #$00    ; $8AAD
                sta $02    ; $8AAF
                lda #$D6    ; $8AB1
                sta $03    ; $8AB3
                sta UseMainZP    ; $8AB5   <== BANK: main zero-page/stack (ALTZP off)
                lda $8A9F    ; $8AB8
                sta $8B02    ; $8ABB
                lda $8AA0    ; $8ABE
                sta $8B03    ; $8AC1
                lda $8B02    ; $8AC4
                ora $8B03    ; $8AC7
                beq $8AF6    ; $8ACA
                ldy #$00    ; $8ACC
                sta UseAuxZP    ; $8ACE   <== BANK: aux zero-page/stack (ALTZP on)
                lda ($02),y    ; $8AD1
                sta UseMainZP    ; $8AD3   <== BANK: main zero-page/stack (ALTZP off)
                jsr PrettyPrint    ; $8AD6
                jsr PrintSpace    ; $8AD9
                sta UseAuxZP    ; $8ADC   <== BANK: aux zero-page/stack (ALTZP on)
                inc $02    ; $8ADF
                bne $8AE5    ; $8AE1
                inc $03    ; $8AE3
                sta UseMainZP    ; $8AE5   <== BANK: main zero-page/stack (ALTZP off)
                lda $8B02    ; $8AE8
                bne $8AF0    ; $8AEB
                dec $8B03    ; $8AED
                dec $8B02    ; $8AF0
                jmp $8AC4    ; $8AF3
                jsr PrintReturn    ; $8AF6
                jsr PrintDone    ; $8AF9
                jsr CloseTypeout    ; $8AFC
                lda #$01    ; $8AFF
                rts    ; $8B01
                brk    ; $8B02
                brk    ; $8B03
;
; === DoLastMacro ===
                lda Argument    ; $8B04
                sta $8AA3    ; $8B07
                lda $7A5C    ; $8B0A
                sta $8AA4    ; $8B0D
                lda #$00    ; $8B10
                sta $8AA1    ; $8B12
                sta $8AA2    ; $8B15
                lda #$FF    ; $8B18
                sta MacroExec    ; $8B1A
                lda #$01    ; $8B1D
                rts    ; $8B1F
;
; === KeyToMac ===
                php    ; $8B20
                bit MacroDef    ; $8B21
                bpl $8B63    ; $8B24
                pha    ; $8B26
                sty $8B66    ; $8B27
                stx $8B65    ; $8B2A
                sta UseAuxZP    ; $8B2D   <== BANK: aux zero-page/stack (ALTZP on)
                ldy $8AA0    ; $8B30
                cpy #$01    ; $8B33
                bcc $8B47    ; $8B35
                ldy $8A9F    ; $8B37
                cpy #$FF    ; $8B3A
                bcc $8B47    ; $8B3C
                sta UseMainZP    ; $8B3E   <== BANK: main zero-page/stack (ALTZP off)
                jsr EndMacro    ; $8B41
                jmp $8B5C    ; $8B44
                ldy #$00    ; $8B47
                sta ($00),y    ; $8B49
                inc $00    ; $8B4B
                bne $8B51    ; $8B4D
                inc $01    ; $8B4F
                sta UseMainZP    ; $8B51   <== BANK: main zero-page/stack (ALTZP off)
                inc $8A9F    ; $8B54
                bne $8B5C    ; $8B57
                inc $8AA0    ; $8B59
                ldx $8B65    ; $8B5C
                ldy $8B66    ; $8B5F
                pla    ; $8B62
                plp    ; $8B63
                rts    ; $8B64
                brk    ; $8B65
                brk    ; $8B66
;
; === KeyFromMac ===
                sty $8B66    ; $8B67
                stx $8B65    ; $8B6A
                lda $8AA1    ; $8B6D
                ora $8AA2    ; $8B70
                beq $8BA0    ; $8B73
                lda $8AA1    ; $8B75
                bne $8B7D    ; $8B78
                dec $8AA2    ; $8B7A
                dec $8AA1    ; $8B7D
                ldy #$00    ; $8B80
                sta UseAuxZP    ; $8B82   <== BANK: aux zero-page/stack (ALTZP on)
                lda ($00),y    ; $8B85
                sta UseMainZP    ; $8B87   <== BANK: main zero-page/stack (ALTZP off)
                jsr PushTYI    ; $8B8A
                sta UseAuxZP    ; $8B8D   <== BANK: aux zero-page/stack (ALTZP on)
                inc $00    ; $8B90
                bne $8B96    ; $8B92
                inc $01    ; $8B94
                sta UseMainZP    ; $8B96   <== BANK: main zero-page/stack (ALTZP off)
                ldx $8B65    ; $8B99
                ldy $8B66    ; $8B9C
                rts    ; $8B9F
                lda $8AA3    ; $8BA0
                ora $8AA4    ; $8BA3
                beq $8BCE    ; $8BA6
                lda $8AA3    ; $8BA8
                bne $8BB0    ; $8BAB
                dec $8AA4    ; $8BAD
                dec $8AA3    ; $8BB0
                sta UseAuxZP    ; $8BB3   <== BANK: aux zero-page/stack (ALTZP on)
                lda #$00    ; $8BB6
                sta $00    ; $8BB8
                lda #$D6    ; $8BBA
                sta $01    ; $8BBC
                sta UseMainZP    ; $8BBE   <== BANK: main zero-page/stack (ALTZP off)
                lda $8A9F    ; $8BC1
                sta $8AA1    ; $8BC4
                lda $8AA0    ; $8BC7
                sta $8AA2    ; $8BCA
                rts    ; $8BCD
                jsr EndMacroExec    ; $8BCE
                beq $8B99    ; $8BD1
;
; === EndMacroExec ===
                lda #$00    ; $8BD3
                sta MacroExec    ; $8BD5
                rts    ; $8BD8
;
; === StartMacro ===
                bit MacroExec    ; $8BD9
                bmi $8BFC    ; $8BDC
                lda #$FF    ; $8BDE
                sta MacroDef    ; $8BE0
                sta UseAuxZP    ; $8BE3   <== BANK: aux zero-page/stack (ALTZP on)
                lda #$00    ; $8BE6
                sta $00    ; $8BE8
                lda #$D6    ; $8BEA
                sta $01    ; $8BEC
                sta UseMainZP    ; $8BEE   <== BANK: main zero-page/stack (ALTZP off)
                lda #$00    ; $8BF1
                sta $8A9F    ; $8BF3
                sta $8AA0    ; $8BF6
                jsr MakeModeLine    ; $8BF9
                lda #$01    ; $8BFC
                rts    ; $8BFE
                jsr Beep    ; $8BFF
                lda #$01    ; $8C02
                rts    ; $8C04
;
; === EndMacro ===
                bit MacroExec    ; $8C05
                bmi $8C28    ; $8C08
                bit MacroDef    ; $8C0A
                bpl $8BFF    ; $8C0D
                lda $8A9F    ; $8C0F
                sec    ; $8C12
                sbc #$02    ; $8C13
                sta $8A9F    ; $8C15
                lda $8AA0    ; $8C18
                sbc #$00    ; $8C1B
                sta $8AA0    ; $8C1D
                lda #$00    ; $8C20
                sta MacroDef    ; $8C22
                jsr MakeModeLine    ; $8C25
                lda #$01    ; $8C28
                rts    ; $8C2A
;
; === RegionQSize ===
        dfb $F4        ; $8C2B  (data/65C02-bit)
                ora ($A5,x)    ; $8C2C
                rts    ; $8C2E
                sec    ; $8C2F
                sbc $00    ; $8C30
                tax    ; $8C32
                lda $61    ; $8C33
                sbc $01    ; $8C35
                cmp $8C2C    ; $8C37
                bcc $8CAB    ; $8C3A
                bne $8C43    ; $8C3C
                cpx RegionQSize    ; $8C3E
                bcc $8CAB    ; $8C41
                pha    ; $8C43
                txa    ; $8C44
                pha    ; $8C45
                jsr NewEchoArea    ; $8C46
                jsr PrintMessage    ; $8C49
                cmp $F5EF,y    ; $8C4C
                ldy #$E1    ; $8C4F
                sbc ($E5)    ; $8C51
                ldy #$E1    ; $8C53
        dfb $E2        ; $8C55  (data/65C02-bit)
        dfb $EF        ; $8C56  (data/65C02-bit)
                sbc $F4,x    ; $8C57
                ldy #$F4    ; $8C59
        dfb $EF        ; $8C5B  (data/65C02-bit)
                ldy #$E1    ; $8C5C
        dfb $E3        ; $8C5E  (data/65C02-bit)
        dfb $F4        ; $8C5F  (data/65C02-bit)
                ldy #$EF    ; $8C60
                inc: $00A0    ; $8C62
                sty PD:Justify    ; $8C65
                pla    ; $8C68
                tax    ; $8C69
                pla    ; $8C6A
                jsr PrintDec    ; $8C6B
                jsr PrintMessage    ; $8C6E
                ldy #$E3    ; $8C71
                inx    ; $8C73
                sbc ($F2,x)    ; $8C74
                sbc ($E3,x)    ; $8C76
        dfb $F4        ; $8C78  (data/65C02-bit)
                sbc $F2    ; $8C79
        dfb $F3        ; $8C7B  (data/65C02-bit)
                ldy $E4A0    ; $8C7C
        dfb $EF        ; $8C7F  (data/65C02-bit)
                ldy #$F9    ; $8C80
        dfb $EF        ; $8C82  (data/65C02-bit)
                sbc $A0,x    ; $8C83
        dfb $F7        ; $8C85  (data/65C02-bit)
                sbc ($EE,x)    ; $8C86
        dfb $F4        ; $8C88  (data/65C02-bit)
                ldy #$F4    ; $8C89
        dfb $EF        ; $8C8B  (data/65C02-bit)
                ldy #$E3    ; $8C8C
        dfb $EF        ; $8C8E  (data/65C02-bit)
                inc $E9F4    ; $8C8F
                inc $E5F5    ; $8C92
                brk    ; $8C95
                jsr GetYOrNp    ; $8C96
                php    ; $8C99
                pha    ; $8C9A
                jsr CharOut    ; $8C9B
                jsr CloseEchoArea    ; $8C9E
                pla    ; $8CA1
                cmp #$87    ; $8CA2
                bne $8CA9    ; $8CA4
                jsr Beep    ; $8CA6
                plp    ; $8CA9
                rts    ; $8CAA
                lda #$00    ; $8CAB
                rts    ; $8CAD
;
; === TheRegion ===
                brk    ; $8CAE
                brk    ; $8CAF
                brk    ; $8CB0
                brk    ; $8CB1
                brk    ; $8CB2
;
; === OpenRegion ===
                jsr SetGap    ; $8CB3
                jsr GetTempMark    ; $8CB6
                lda #$FF    ; $8CB9
                sta $8CB2    ; $8CBB
                lda $01    ; $8CBE
                cmp $61    ; $8CC0
                bcc $8CE0    ; $8CC2
                bne $8CCE    ; $8CC4
                lda $00    ; $8CC6
                cmp TheBuffer    ; $8CC8
                bcc $8CE0    ; $8CCA
                beq $8CE0    ; $8CCC
                inc $8CB2    ; $8CCE
                lda $61    ; $8CD1
                pha    ; $8CD3
                lda TheBuffer    ; $8CD4
                pha    ; $8CD6
                jsr $8D2B    ; $8CD7
                pla    ; $8CDA
                sta $00    ; $8CDB
                pla    ; $8CDD
                sta $01    ; $8CDE
                lda $00    ; $8CE0
                sta TheRegion    ; $8CE2
                lda $01    ; $8CE5
                sta $8CAF    ; $8CE7
                lda TheBuffer    ; $8CEA
                sta $8CB0    ; $8CEC
                lda $61    ; $8CEF
                sta $8CB1    ; $8CF1
                rts    ; $8CF4
;
; === CloseRegion ===
                lda $8CB0    ; $8CF5
                sta TheBuffer    ; $8CF8
                lda $8CB1    ; $8CFA
                sta $61    ; $8CFD
                bit $8CB2    ; $8CFF
                bmi $8D0E    ; $8D02
                lda TheRegion    ; $8D04
                sta TheBuffer    ; $8D07
                lda $8CAF    ; $8D09
                sta $61    ; $8D0C
                lda $61    ; $8D0E
                cmp $6B    ; $8D10
                bcc $8D1E    ; $8D12
                bne $8D1F    ; $8D14
                lda TheBuffer    ; $8D16
                cmp GapTop    ; $8D18
                bcc $8D1E    ; $8D1A
                bne $8D1F    ; $8D1C
                rts    ; $8D1E
                lda TheBuffer    ; $8D1F
                sta $00    ; $8D21
                lda $61    ; $8D23
                sta $01    ; $8D25
                jsr $8D2B    ; $8D27
                rts    ; $8D2A
                lda $00    ; $8D2B
                sec    ; $8D2D
                sbc GapTop    ; $8D2E
                sta $00    ; $8D30
                lda $01    ; $8D32
                sbc $6B    ; $8D34
                sta $01    ; $8D36
                lda $00    ; $8D38
                sec    ; $8D3A
                adc GapBot    ; $8D3B
                sta TheBuffer    ; $8D3D
                lda $01    ; $8D3F
                adc $6D    ; $8D41
                sta $61    ; $8D43
                lda $61    ; $8D45
                cmp $69    ; $8D47
                bcc $8D5D    ; $8D49
                bne $8D55    ; $8D4B
                lda TheBuffer    ; $8D4D
                cmp BuffBot    ; $8D4F
                bcc $8D5D    ; $8D51
                beq $8D5D    ; $8D53
                lda BuffBot    ; $8D55
                sta TheBuffer    ; $8D57
                lda $69    ; $8D59
                sta $61    ; $8D5B
                jsr SetGap    ; $8D5D
                rts    ; $8D60
;
; === LCaseRegion ===
                jsr OpenRegion    ; $8D61
                jsr $8C2D    ; $8D64
                bne $8D6C    ; $8D67
                jsr IN:LowerReg    ; $8D69
                jsr CloseRegion    ; $8D6C
                jsr DisplayPage    ; $8D6F
                lda #$01    ; $8D72
                rts    ; $8D74
;
; === UCaseRegion ===
                jsr OpenRegion    ; $8D75
                jsr $8C2D    ; $8D78
                bne $8D6C    ; $8D7B
                jsr IN:UpperReg    ; $8D7D
                jmp $8D6C    ; $8D80
;
; === CCaseRegion ===
                jsr OpenRegion    ; $8D83
                jsr $8C2D    ; $8D86
                bne $8D6C    ; $8D89
                jsr IN:CapReg    ; $8D8B
                jmp $8D6C    ; $8D8E
                brk    ; $8D91
;
; === CopyRegion ===
                lda #$FF    ; $8D92
                sta DeleteKill?    ; $8D94
                sta $8D91    ; $8D97
;
; === KRegion ===
                jsr OpenRegion    ; $8D9A
                jsr KillTempPoint    ; $8D9D
                lda #$00    ; $8DA0
                bit $8D91    ; $8DA2
                bmi $8DAA    ; $8DA5
                sta $8CB2    ; $8DA7
                sta $8D91    ; $8DAA
                jmp $8D6C    ; $8DAD
;
; === CLinesRegion ===
                jsr CLInternal    ; $8DB0
                jsr NewEchoArea    ; $8DB3
                lda $8E09    ; $8DB6
                ldx LsInReg    ; $8DB9
                jsr PrintDec    ; $8DBC
                jsr PrintMessage    ; $8DBF
                ldy #$EC    ; $8DC2
                sbc #$EE    ; $8DC4
                sbc $F3    ; $8DC6
                ldy #$E9    ; $8DC8
                inc $D2A0    ; $8DCA
                sbc $E7    ; $8DCD
                sbc #$EF    ; $8DCF
                inc: $00AE    ; $8DD1
                jsr CloseEchoArea    ; $8DD4
                lda #$01    ; $8DD7
                rts    ; $8DD9
;
; === CLInternal ===
                jsr OpenRegion    ; $8DDA
                ldy #$00    ; $8DDD
                sty LsInReg    ; $8DDF
                sty $8E09    ; $8DE2
                sty PD:Justify    ; $8DE5
                jsr EqTempPoint?    ; $8DE8
                bne $8DF1    ; $8DEB
                jsr CloseRegion    ; $8DED
                rts    ; $8DF0
                jsr $D000    ; $8DF1
                cmp #$8D    ; $8DF4
                bne $8E00    ; $8DF6
                inc LsInReg    ; $8DF8
                bne $8E00    ; $8DFB
                inc $8E09    ; $8DFD
                inc $00    ; $8E00
                bne $8E06    ; $8E02
                inc $01    ; $8E04
                bne $8DE8    ; $8E06
;
; === LsInReg ===
                brk    ; $8E08
                brk    ; $8E09
;
; === FillRegion ===
                jsr AnyArgument?    ; $8E0A
                bne $8E14    ; $8E0D
                lda Argument    ; $8E0F
                bne $8E17    ; $8E12
                lda FillColumn    ; $8E14
                sta $EF    ; $8E17
                jsr OpenRegion    ; $8E19
                ldy #$00    ; $8E1C
                lda $00    ; $8E1E
                bne $8E24    ; $8E20
                dec $01    ; $8E22
                dec $00    ; $8E24
                jsr EqTempPoint?    ; $8E26
                beq $8E9B    ; $8E29
                inc $00    ; $8E2B
                bne $8E31    ; $8E2D
                inc $01    ; $8E2F
                jsr $D000    ; $8E31
                cmp #$8D    ; $8E34
                beq $8E26    ; $8E36
                lda #$00    ; $8E38
                sta $EB    ; $8E3A
                sta CH    ; $8E3C
                jsr EqTempPoint?    ; $8E3E
                beq $8E9B    ; $8E41
                jsr $D000    ; $8E43
                cmp #$A0    ; $8E46
                beq $8E6D    ; $8E48
                cmp #$8D    ; $8E4A
                bne $8E77    ; $8E4C
                inc $00    ; $8E4E
                bne $8E54    ; $8E50
                inc $01    ; $8E52
                jsr EqTempPoint?    ; $8E54
                beq $8E9B    ; $8E57
                jsr $D000    ; $8E59
                cmp #$8D    ; $8E5C
                beq $8E26    ; $8E5E
                lda $00    ; $8E60
                bne $8E66    ; $8E62
                dec $01    ; $8E64
                dec $00    ; $8E66
                lda #$A0    ; $8E68
                jsr $D054    ; $8E6A
                lda $00    ; $8E6D
                sta $EA    ; $8E6F
                lda $01    ; $8E71
                sta $EB    ; $8E73
                lda #$A0    ; $8E75
                inc $00    ; $8E77
                bne $8E7D    ; $8E79
                inc $01    ; $8E7B
                jsr GetXCharLen    ; $8E7D
                txa    ; $8E80
                clc    ; $8E81
                adc CH    ; $8E82
                sta CH    ; $8E84
                cmp $EF    ; $8E86
                bcc $8E3E    ; $8E88
                lda $EB    ; $8E8A
                beq $8E3C    ; $8E8C
                sta $01    ; $8E8E
                lda $EA    ; $8E90
                sta $00    ; $8E92
                lda #$8D    ; $8E94
                jsr $D054    ; $8E96
                bne $8E1C    ; $8E99
                jsr CloseRegion    ; $8E9B
                jsr FindPoint    ; $8E9E
                bne $8EA9    ; $8EA1
                jsr DisplayPage    ; $8EA3
                lda #$01    ; $8EA6
                rts    ; $8EA8
                lda #$06    ; $8EA9
                rts    ; $8EAB
;
; === PrintBuffer ===
                jsr MarkBuffer    ; $8EAC
                jsr GenDisplay    ; $8EAF
;
; === PrintRegion ===
                jsr OpenRegion    ; $8EB2
                jsr PrintText    ; $8EB5
                jmp $8D6C    ; $8EB8
;
; === IndentReg ===
                lda Argument    ; $8EBB
                eor ArgSign    ; $8EBE
                sta $8F33    ; $8EC1
                bpl $8EC9    ; $8EC4
                inc $8F33    ; $8EC6
                jsr InitArgument    ; $8EC9
                jsr CLInternal    ; $8ECC
                jsr OpenRegion    ; $8ECF
                lda $00    ; $8ED2
                sta TheBuffer    ; $8ED4
                lda $01    ; $8ED6
                sta $61    ; $8ED8
                jsr SetGap    ; $8EDA
                jsr BackToIndent    ; $8EDD
                tya    ; $8EE0
                clc    ; $8EE1
                adc $8F33    ; $8EE2
                bpl $8EE9    ; $8EE5
                lda #$00    ; $8EE7
                inc IndentVbtm    ; $8EE9
                jsr IndentLine    ; $8EEC
                dec IndentVbtm    ; $8EEF
                lda LsInReg    ; $8EF2
                ora $8E09    ; $8EF5
                bne $8F1C    ; $8EF8
                jsr SetGap    ; $8EFA
                lda TheBuffer    ; $8EFD
                sta $8CB0    ; $8EFF
                lda $61    ; $8F02
                sta $8CB1    ; $8F04
                bit $8CB2    ; $8F07
                bpl $8F19    ; $8F0A
                lda $8CB0    ; $8F0C
                sta $00    ; $8F0F
                lda $8CB1    ; $8F11
                sta $01    ; $8F14
                jsr MarkTemp    ; $8F16
                jmp $8D6C    ; $8F19
                jsr EndOfLine    ; $8F1C
                jsr PointForward    ; $8F1F
                jsr SetGap    ; $8F22
                lda LsInReg    ; $8F25
                bne $8F2D    ; $8F28
                dec $8E09    ; $8F2A
                dec LsInReg    ; $8F2D
                jmp $8EDD    ; $8F30
                brk    ; $8F33
;
; === PrinterSlot ===
                ora ($42,x)    ; $8F34
;
; === PLinesPage ===
                bit $0150,x    ; $8F36
                brk    ; $8F39
;
; === FileLine? ===
                brk    ; $8F3A
;
; === AutoNumber ===
                ora ($DC,x)    ; $8F3B
                brk    ; $8F3D
;
; === ContextBeg ===
                brk    ; $8F3E
                brk    ; $8F3F
                brk    ; $8F40
                brk    ; $8F41
                brk    ; $8F42
                brk    ; $8F43
                brk    ; $8F44
                brk    ; $8F45
                brk    ; $8F46
                brk    ; $8F47
;
; === ContextEnd ===
                brk    ; $8F48
                brk    ; $8F49
                brk    ; $8F4A
                brk    ; $8F4B
                brk    ; $8F4C
                brk    ; $8F4D
                brk    ; $8F4E
                brk    ; $8F4F
                brk    ; $8F50
                brk    ; $8F51
                brk    ; $8F52
                brk    ; $8F53
;
; === PInitStr ===
                brk    ; $8F54
                brk    ; $8F55
                brk    ; $8F56
                brk    ; $8F57
                brk    ; $8F58
                brk    ; $8F59
                brk    ; $8F5A
                brk    ; $8F5B
                brk    ; $8F5C
                brk    ; $8F5D
;
; === LeftMargin ===
                brk    ; $8F5E
;
; === RightMargin ===
                brk    ; $8F5F
                brk    ; $8F60
                brk    ; $8F61
                lda PrinterSlot    ; $8F62
                ora #$C0    ; $8F65
                cmp $37    ; $8F67
                beq $8F7C    ; $8F69
                sta $37    ; $8F6B
                lda #$00    ; $8F6D
                sta $36    ; $8F6F
                sta $8F61    ; $8F71
                inc $8F61    ; $8F74
                lda #$8D    ; $8F77
                jsr PrintOut    ; $8F79
                lda #$00    ; $8F7C
                sta $8F52    ; $8F7E
                sta $8F60    ; $8F81
                ldx AutoNumber    ; $8F84
                bmi $8F93    ; $8F87
                beq $8FA1    ; $8F89
                sta $8F39    ; $8F8B
                stx PageNum    ; $8F8E
                bpl $8FA1    ; $8F91
                lda PageNum    ; $8F93
                lsr    ; $8F96
                bcs $8FA1    ; $8F97
                inc PageNum    ; $8F99
                bne $8FA1    ; $8F9C
                inc $8F39    ; $8F9E
                lda PrinterCols    ; $8FA1
                sec    ; $8FA4
                sbc RightMargin    ; $8FA5
                sta $8F53    ; $8FA8
                ldy #$00    ; $8FAB
                lda PInitStr,y    ; $8FAD
                beq $8FB8    ; $8FB0
                jsr PrintOut    ; $8FB2
                iny    ; $8FB5
                bne $8FAD    ; $8FB6
                rts    ; $8FB8
;
; === PrintOut ===
                pha    ; $8FB9
                lda RdRomBank    ; $8FBA   <== BANK: language-card ROM (read)
                lda RdRomBank    ; $8FBD   <== BANK: language-card ROM (read)
                pla    ; $8FC0
                pha    ; $8FC1
                jsr $8FCD    ; $8FC2
                lda RdWrBank2    ; $8FC5   <== BANK: language-card RAM bank 2 (read+write, BIT twice)
                lda RdWrBank2    ; $8FC8   <== BANK: language-card RAM bank 2 (read+write, BIT twice)
                pla    ; $8FCB
                rts    ; $8FCC
                jmp ($0036)    ; $8FCD
                lda SheetLines    ; $8FD0
                sec    ; $8FD3
                sbc PLinesPage    ; $8FD4
                lsr    ; $8FD7
                beq $8FF8    ; $8FD8
                pha    ; $8FDA
                bit FileLine?    ; $8FDB
                bpl $8FEB    ; $8FDE
                jsr $8FF9    ; $8FE0
                inc PageNum    ; $8FE3
                bne $8FEB    ; $8FE6
                inc $8F39    ; $8FE8
                pla    ; $8FEB
                pha    ; $8FEC
                lda #$8D    ; $8FED
                jsr $9102    ; $8FEF
                pla    ; $8FF2
                sec    ; $8FF3
                sbc #$01    ; $8FF4
                bne $8FEC    ; $8FF6
                rts    ; $8FF8
                lda #$00    ; $8FF9
                sta $8F60    ; $8FFB
                lda LeftMargin    ; $8FFE
                jsr $9090    ; $9001
                lda FileLine?    ; $9004
                cmp #$80    ; $9007
                beq $9040    ; $9009
                cmp #$81    ; $900B
                beq $9015    ; $900D
                lda PageNum    ; $900F
                lsr    ; $9012
                bcs $9040    ; $9013
                jsr $905E    ; $9015
                ldy #$00    ; $9018
                ldx #$00    ; $901A
                lda (BuffData),y    ; $901C
                beq $9024    ; $901E
                iny    ; $9020
                inx    ; $9021
                bne $901C    ; $9022
                stx $903F    ; $9024
                lda $8F53    ; $9027
                sec    ; $902A
                sbc $903F    ; $902B
                cmp $8F60    ; $902E
                bcc $9039    ; $9031
                sbc $8F60    ; $9033
                jsr $9090    ; $9036
                jsr $90A5    ; $9039
                jmp $9057    ; $903C
                brk    ; $903F
                jsr $90A5    ; $9040
                lda $8F53    ; $9043
                sec    ; $9046
                sbc #$05    ; $9047
                cmp $8F60    ; $9049
                bcc $9054    ; $904C
                sbc $8F60    ; $904E
                jsr $9090    ; $9051
                jsr $905E    ; $9054
                lda #$00    ; $9057
                sta $8F60    ; $9059
                tay    ; $905C
                rts    ; $905D
                lda $2607    ; $905E
                pha    ; $9061
                lda CoutDef    ; $9062
                pha    ; $9065
                lda #$B9    ; $9066
                sta CoutDef    ; $9068
                lda #$8F    ; $906B
                sta $2607    ; $906D
                lda #$A0    ; $9070
                sta PD:Justify    ; $9072
                lda $8F39    ; $9075
                ldx PageNum    ; $9078
                jsr PrintDec    ; $907B
                pla    ; $907E
                sta CoutDef    ; $907F
                pla    ; $9082
                sta $2607    ; $9083
                lda #$05    ; $9086
                clc    ; $9088
                adc $8F60    ; $9089
                sta $8F60    ; $908C
                rts    ; $908F
                pha    ; $9090
                pla    ; $9091
                beq $909C    ; $9092
                jsr $909D    ; $9094
                sec    ; $9097
                sbc #$01    ; $9098
                bne $9094    ; $909A
                rts    ; $909C
                pha    ; $909D
                lda #$A0    ; $909E
                jsr PrintOut    ; $90A0
                pla    ; $90A3
                rts    ; $90A4
                ldy #$00    ; $90A5
                lda (BuffData),y    ; $90A7
                beq $90B5    ; $90A9
                cmp #$AC    ; $90AB
                beq $90B5    ; $90AD
                jsr PrintOut    ; $90AF
                iny    ; $90B2
                bne $90A7    ; $90B3
                tya    ; $90B5
                clc    ; $90B6
                adc $8F60    ; $90B7
                sta $8F60    ; $90BA
                rts    ; $90BD
                lda SheetLines    ; $90BE
                sec    ; $90C1
                sbc $8F61    ; $90C2
                beq $90D5    ; $90C5
                bmi $90D5    ; $90C7
                pha    ; $90C9
                lda #$8D    ; $90CA
                jsr PrintOut    ; $90CC
                pla    ; $90CF
                sec    ; $90D0
                sbc #$01    ; $90D1
                bne $90C9    ; $90D3
                lda #$00    ; $90D5
                sta $8F61    ; $90D7
                rts    ; $90DA
                brk    ; $90DB
                brk    ; $90DC
                brk    ; $90DD
                brk    ; $90DE
                sta $90DB    ; $90DF
                stx $90DC    ; $90E2
                sty $90DD    ; $90E5
                php    ; $90E8
                php    ; $90E9
                pla    ; $90EA
                sta $90DE    ; $90EB
                lda $90DB    ; $90EE
                plp    ; $90F1
                rts    ; $90F2
                lda $90DE    ; $90F3
                pha    ; $90F6
                lda $90DB    ; $90F7
                ldx $90DC    ; $90FA
                ldy $90DD    ; $90FD
                plp    ; $9100
                rts    ; $9101
                jsr $90DF    ; $9102
                cmp #$8D    ; $9105
                beq $912E    ; $9107
                cmp #$89    ; $9109
                beq $9155    ; $910B
                cmp #$8C    ; $910D
                beq $914C    ; $910F
                pha    ; $9111
                jsr PrintOut    ; $9112
                ldx #$01    ; $9115
                pla    ; $9117
                cmp #$A0    ; $9118
                bcs $911D    ; $911A
                dex    ; $911C
                txa    ; $911D
                clc    ; $911E
                adc $8F60    ; $911F
                sta $8F60    ; $9122
                cmp $8F53    ; $9125
                bcs $912E    ; $9128
                jsr $90F3    ; $912A
                rts    ; $912D
                lda #$8D    ; $912E
                jsr PrintOut    ; $9130
                inc $8F61    ; $9133
                lda #$00    ; $9136
                sta $8F60    ; $9138
                lda $8F61    ; $913B
                cmp PLinesPage    ; $913E
                bcs $914C    ; $9141
                lda LeftMargin    ; $9143
                jsr $9090    ; $9146
                jmp $912A    ; $9149
                jsr $90BE    ; $914C
                jsr $8FD0    ; $914F
                jmp $912A    ; $9152
                lda $8F60    ; $9155
                jsr TabBump    ; $9158
                cmp PrinterCols    ; $915B
                bcs $912E    ; $915E
                pha    ; $9160
                sec    ; $9161
                sbc $8F60    ; $9162
                beq $916F    ; $9165
                jsr $909D    ; $9167
                sec    ; $916A
                sbc #$01    ; $916B
                bne $9167    ; $916D
                pla    ; $916F
                sta $8F60    ; $9170
                jmp $912A    ; $9173
;
; === PrintText ===
                jsr $8F62    ; $9176
                lda #$8D    ; $9179
                jsr $9102    ; $917B
                bit FileLine?    ; $917E
                bpl $9196    ; $9181
                jsr $8FF9    ; $9183
                inc PageNum    ; $9186
                bne $918E    ; $9189
                inc $8F39    ; $918B
                lda #$8D    ; $918E
                jsr $9102    ; $9190
                jsr $9102    ; $9193
                ldy #$00    ; $9196
                jsr EqTempPoint?    ; $9198
                beq $91B9    ; $919B
                lda HardKey    ; $919D
                ora #$80    ; $91A0
                cmp #$87    ; $91A2
                beq $91B9    ; $91A4
                jsr $D000    ; $91A6
                cmp HCEscape    ; $91A9
                beq $91BD    ; $91AC
                jsr $9102    ; $91AE
                inc $00    ; $91B1
                bne $91B7    ; $91B3
                inc $01    ; $91B5
                bne $9198    ; $91B7
                jsr $90BE    ; $91B9
                rts    ; $91BC
                ldx #$00    ; $91BD
                lda $8F52    ; $91BF
                eor #$FF    ; $91C2
                sta $8F52    ; $91C4
                bmi $91CB    ; $91C7
                ldx #$0A    ; $91C9
                lda ContextBeg,x    ; $91CB
                beq $91B1    ; $91CE
                jsr PrintOut    ; $91D0
                inx    ; $91D3
                bpl $91CB    ; $91D4
                bmi $91B1    ; $91D6
;
; === BaseLibAddr ===
                brk    ; $91D8
                cld    ; $91D9
;
; === LibCount ===
                brk    ; $91DA
                cpx $E2E9    ; $91DB
        dfb $AF        ; $91DE  (data/65C02-bit)
                ldx $A0    ; $91DF
                cmp #$EE    ; $91E1
                sbc #$F4    ; $91E3
                ldy #$20    ; $91E5
        dfb $7F        ; $91E7  (data/65C02-bit)
                ply    ; $91E8
                bne SI:LoadLib    ; $91E9
                lda ArgSign    ; $91EB
                bmi $91F3    ; $91EE
                jsr InitArgument    ; $91F0
                jsr FlushLibs    ; $91F3
;
; === SI:LoadLib ===
                jsr GetStrArg    ; $91F6
                beq $9224    ; $91F9
                jsr NewEchoArea    ; $91FB
                jsr PrintMessage    ; $91FE
                cpy $E2E9    ; $9201
                sbc ($E1)    ; $9204
                sbc ($F9)    ; $9206
                tsx    ; $9208
                brk    ; $9209
                jsr ReadArgLine    ; $920A
                php    ; $920D
                txa    ; $920E
                pha    ; $920F
                jsr CloseEchoArea    ; $9210
                pla    ; $9213
                tax    ; $9214
                plp    ; $9215
                bne $921B    ; $9216
                txa    ; $9218
                bne $9224    ; $9219
                jsr ClrEchoArea    ; $921B
                jsr Beep    ; $921E
                lda #$01    ; $9221
                rts    ; $9223
                jsr IN:LibLoad    ; $9224
                bne $921B    ; $9227
                lda $00    ; $9229
                sta $B2    ; $922B
                lda $01    ; $922D
                sta $B3    ; $922F
                lda #$37    ; $9231
                sta $00    ; $9233
                lda #$9B    ; $9235
                sta $01    ; $9237
                jsr GetLinkEnd    ; $9239
                lda #$FF    ; $923C
                sta ($00),y    ; $923E
                iny    ; $9240
                lda $B2    ; $9241
                sta ($00),y    ; $9243
                iny    ; $9245
                lda $B3    ; $9246
                sta ($00),y    ; $9248
                lda $B2    ; $924A
                sta $00    ; $924C
                lda $B3    ; $924E
                sta $01    ; $9250
                lda #$00    ; $9252
                jsr $9352    ; $9254
                lda $00    ; $9257
                clc    ; $9259
                adc #$03    ; $925A
                pha    ; $925C
                lda $01    ; $925D
                adc #$00    ; $925F
                pha    ; $9261
                lda #$5D    ; $9262
                sta $00    ; $9264
                lda #$97    ; $9266
                sta $01    ; $9268
                jsr GetLinkEnd    ; $926A
                lda #$FF    ; $926D
                sta ($00),y    ; $926F
                iny    ; $9271
                iny    ; $9272
                pla    ; $9273
                sta ($00),y    ; $9274
                dey    ; $9276
                pla    ; $9277
                sta ($00),y    ; $9278
                pha    ; $927A
                iny    ; $927B
                lda ($00),y    ; $927C
                sta $01    ; $927E
                pla    ; $9280
                sta $00    ; $9281
                lda #$FF    ; $9283
                jsr $9352    ; $9285
                ldy #$00    ; $9288
                lda $91DF,y    ; $928A
                sta $0200,y    ; $928D
                iny    ; $9290
                cpy #$07    ; $9291
                bcc $928A    ; $9293
                jsr $9322    ; $9295
                lda #$37    ; $9298
                sta CompList    ; $929A
                lda #$9B    ; $929D
                sta $5988    ; $929F
                dey    ; $92A2
                lda #$9B    ; $92A3
                sta $0200,y    ; $92A5
                jsr SI:CompleteMe    ; $92A8
                lda CompCount    ; $92AB
                cmp #$01    ; $92AE
                bne $92B8    ; $92B0
                jsr FunctionRef    ; $92B2
                jsr CallTemp    ; $92B5
                jmp $9221    ; $92B8
;
; === FlushLibs ===
                jsr AnyArgument?    ; $92BB
                beq SI:FlushLibs    ; $92BE
                jsr NewEchoArea    ; $92C0
                jsr PrintMessage    ; $92C3
                dec $EC    ; $92C6
                sbc $F3,x    ; $92C8
                inx    ; $92CA
                ldy #$EC    ; $92CB
                sbc #$E2    ; $92CD
                sbc ($E1)    ; $92CF
                sbc ($E9)    ; $92D1
                sbc $F3    ; $92D3
                brk    ; $92D5
                jsr GetYOrNp    ; $92D6
                php    ; $92D9
                jsr CloseEchoArea    ; $92DA
                plp    ; $92DD
                bne $930D    ; $92DE
;
; === SI:FlushLibs ===
                lda #$5D    ; $92E0
                sta $00    ; $92E2
                lda #$97    ; $92E4
                sta $01    ; $92E6
                jsr GetCompLink    ; $92E8
                ldy #$00    ; $92EB
                tya    ; $92ED
                sta ($00),y    ; $92EE
                lda #$37    ; $92F0
                sta $00    ; $92F2
                lda #$9B    ; $92F4
                sta $01    ; $92F6
                jsr GetCompLink    ; $92F8
                ldy #$00    ; $92FB
                tya    ; $92FD
                sta ($00),y    ; $92FE
                sta LibCount    ; $9300
                lda #$00    ; $9303
                sta BaseLibAddr    ; $9305
                lda #$D8    ; $9308
                sta $91D9    ; $930A
                lda #$01    ; $930D
                rts    ; $930F
;
; === CopyLibPfx ===
                jsr SetSysPath    ; $9310
                ldx #$00    ; $9313
                lda $91DB,x    ; $9315
                sta $0200,y    ; $9318
                iny    ; $931B
                inx    ; $931C
                cpx #$04    ; $931D
                bcc $9315    ; $931F
                rts    ; $9321
                ldx LibCount    ; $9322
                dex    ; $9325
                txa    ; $9326
                asl    ; $9327
                asl    ; $9328
                asl    ; $9329
                asl    ; $932A
                tax    ; $932B
                lda LibNames,x    ; $932C
                sta $0200,y    ; $932F
                inx    ; $9332
                iny    ; $9333
                cmp #$8D    ; $9334
                bne $932C    ; $9336
                rts    ; $9338
;
; === GetLinkEnd ===
                jsr GetCompLink    ; $9339
                ldy #$00    ; $933C
                lda ($00),y    ; $933E
                beq $9351    ; $9340
                iny    ; $9342
                lda ($00),y    ; $9343
                pha    ; $9345
                iny    ; $9346
                lda ($00),y    ; $9347
                sta $01    ; $9349
                pla    ; $934B
                sta $00    ; $934C
                jmp GetLinkEnd    ; $934E
                rts    ; $9351
                sta $04    ; $9352
                ldy #$00    ; $9354
                lda ($00),y    ; $9356
                bne $935B    ; $9358
                rts    ; $935A
                lda ($00),y    ; $935B
                php    ; $935D
                iny    ; $935E
                plp    ; $935F
                bmi $935B    ; $9360
                ldx #$02    ; $9362
                lda ($00),y    ; $9364
                clc    ; $9366
                adc $B2    ; $9367
                sta ($00),y    ; $9369
                iny    ; $936B
                lda ($00),y    ; $936C
                adc $B3    ; $936E
                sta ($00),y    ; $9370
                iny    ; $9372
                dex    ; $9373
                bne $9364    ; $9374
                bit $04    ; $9376
                bpl $939B    ; $9378
                tya    ; $937A
                pha    ; $937B
                dey    ; $937C
                dey    ; $937D
                dey    ; $937E
                dey    ; $937F
                lda ($00),y    ; $9380
                sta $02    ; $9382
                iny    ; $9384
                lda ($00),y    ; $9385
                sta $03    ; $9387
                ldy #$02    ; $9389
                lda ($02),y    ; $938B
                clc    ; $938D
                adc $B2    ; $938E
                sta ($02),y    ; $9390
                iny    ; $9392
                lda ($02),y    ; $9393
                adc $B3    ; $9395
                sta ($02),y    ; $9397
                pla    ; $9399
                tay    ; $939A
                tya    ; $939B
                clc    ; $939C
                adc $00    ; $939D
                sta $00    ; $939F
                bcc $93A5    ; $93A1
                inc $01    ; $93A3
                jmp $9354    ; $93A5
;
; === IN:LibLoad ===
                jsr AddLibName    ; $93A8
                bne $93DD    ; $93AB
                jsr CopyLibPfx    ; $93AD
                jsr $9322    ; $93B0
                jsr DSK:OpenFile    ; $93B3
                bne $93DA    ; $93B6
                jsr PrepRead    ; $93B8
                lda BaseLibAddr    ; $93BB
                sta $00    ; $93BE
                lda $91D9    ; $93C0
                sta $01    ; $93C3
                jsr DSK:ReadByte    ; $93C5
                bne $93E3    ; $93C8
                ldy #$00    ; $93CA
                sta ($00),y    ; $93CC
                inc $00    ; $93CE
                bne $93D4    ; $93D0
                inc $01    ; $93D2
                lda $01    ; $93D4
                cmp #$E0    ; $93D6
                bcc $93C5    ; $93D8
                dec LibCount    ; $93DA
                jsr DSK:CloseFile    ; $93DD
                lda #$FF    ; $93E0
                rts    ; $93E2
                ldx #$01    ; $93E3
                lda $00,x    ; $93E5
                pha    ; $93E7
                lda BaseLibAddr,x    ; $93E8
                sta $00,x    ; $93EB
                pla    ; $93ED
                sta BaseLibAddr,x    ; $93EE
                dex    ; $93F1
                bpl $93E5    ; $93F2
                jsr DSK:CloseFile    ; $93F4
                lda #$00    ; $93F7
                rts    ; $93F9
;
; === AddLibName ===
                lda LibCount    ; $93FA
                cmp #$08    ; $93FD
                bcs $9435    ; $93FF
                ldy #$00    ; $9401
                lda $0200,y    ; $9403
                ora #$80    ; $9406
                jsr UpperCon    ; $9408
                sta $0200,y    ; $940B
                iny    ; $940E
                cmp #$8D    ; $940F
                bne $9403    ; $9411
                ldx #$00    ; $9413
                stx $04    ; $9415
                ldy #$00    ; $9417
                lda $04    ; $9419
                cmp LibCount    ; $941B
                bcs $943C    ; $941E
                asl    ; $9420
                asl    ; $9421
                asl    ; $9422
                asl    ; $9423
                tax    ; $9424
                lda $0200,y    ; $9425
                cmp LibNames,x    ; $9428
                bne $9438    ; $942B
                cmp #$8D    ; $942D
                beq $9435    ; $942F
                iny    ; $9431
                inx    ; $9432
                bne $9425    ; $9433
                lda #$FF    ; $9435
                rts    ; $9437
                inc $04    ; $9438
                bne $943C    ; $943A
                lda LibCount    ; $943C
                asl    ; $943F
                asl    ; $9440
                asl    ; $9441
                asl    ; $9442
                tay    ; $9443
                ldx #$00    ; $9444
                lda $0200,x    ; $9446
                sta LibNames,y    ; $9449
                inx    ; $944C
                cpx #$10    ; $944D
                bcs $9456    ; $944F
                iny    ; $9451
                cmp #$8D    ; $9452
                bne $9446    ; $9454
                inc LibCount    ; $9456
                lda #$00    ; $9459
                rts    ; $945B
                tax    ; $945C
        dfb $D4        ; $945D  (data/65C02-bit)
                cmp ($C7,x)    ; $945E
        dfb $D3        ; $9460  (data/65C02-bit)
                tax    ; $9461
                brk    ; $9462
;
; === TheTag ===
                brk    ; $9463
                brk    ; $9464
                brk    ; $9465
                brk    ; $9466
                brk    ; $9467
                brk    ; $9468
                brk    ; $9469
                brk    ; $946A
                brk    ; $946B
                brk    ; $946C
                brk    ; $946D
                brk    ; $946E
                brk    ; $946F
                brk    ; $9470
                brk    ; $9471
                brk    ; $9472
                brk    ; $9473
                brk    ; $9474
                brk    ; $9475
                brk    ; $9476
                brk    ; $9477
                brk    ; $9478
                brk    ; $9479
                brk    ; $947A
                brk    ; $947B
                brk    ; $947C
                brk    ; $947D
                brk    ; $947E
                brk    ; $947F
                brk    ; $9480
;
; === TagsFindFile ===
        dfb $FF        ; $9481  (data/65C02-bit)
                brk    ; $9482
                brk    ; $9483
                brk    ; $9484
                brk    ; $9485
                brk    ; $9486
                brk    ; $9487
;
; === GetTagBuff ===
                ldy #$FF    ; $9488
                iny    ; $948A
                lda $945C,y    ; $948B
                sta $0200,y    ; $948E
                bne $948A    ; $9491
                jsr FindBuffer    ; $9493
                bne $94D0    ; $9496
                cpx SelectedBuff    ; $9498
                bne $94B3    ; $949B
                jsr KillGap    ; $949D
                lda BuffTop    ; $94A0
                sta $00    ; $94A2
                lda $67    ; $94A4
                sta $01    ; $94A6
                lda GapTop    ; $94A8
                sta $02    ; $94AA
                lda $6B    ; $94AC
                sta $03    ; $94AE
                jmp $94C4    ; $94B0
                jsr PointToBInfo    ; $94B3
                ldy #$0E    ; $94B6
                ldx #$00    ; $94B8
                lda (BuffPoint),y    ; $94BA
                sta $00,x    ; $94BC
                iny    ; $94BE
                inx    ; $94BF
                cpx #$04    ; $94C0
                bcc $94BA    ; $94C2
                lda $00    ; $94C4
                sta $9482    ; $94C6
                lda $01    ; $94C9
                sta $9483    ; $94CB
                lda #$00    ; $94CE
                rts    ; $94D0
                brk    ; $94D1
;
; === ScanForTag ===
                lda #$00    ; $94D2
                beq $94D8    ; $94D4
;
; === WhatTagFile ===
                lda #$FF    ; $94D6
                sta $94D1    ; $94D8
                jsr GetTagBuff    ; $94DB
                beq $9506    ; $94DE
                jsr NewEchoArea    ; $94E0
                jsr PrintMessage    ; $94E3
                cmp $F3E9    ; $94E6
        dfb $F3        ; $94E9  (data/65C02-bit)
                sbc #$EE    ; $94EA
        dfb $E7        ; $94EC  (data/65C02-bit)
                ldy #$E2    ; $94ED
                sbc $E6,x    ; $94EF
                inc $E5    ; $94F1
                sbc ($A0)    ; $94F3
                tax    ; $94F5
        dfb $D4        ; $94F6  (data/65C02-bit)
                cmp ($C7,x)    ; $94F7
        dfb $D3        ; $94F9  (data/65C02-bit)
                tax    ; $94FA
                ldx $2000    ; $94FB
                plx    ; $94FE
        dfb $57        ; $94FF  (data/65C02-bit)
                jsr Beep    ; $9500
                lda #$01    ; $9503
                rts    ; $9505
                jsr AnyArgument?    ; $9506
                bne $952E    ; $9509
                lda $00    ; $950B
                clc    ; $950D
                adc $9486    ; $950E
                sta $971E    ; $9511
                lda $01    ; $9514
                adc $9487    ; $9516
                sta $971F    ; $9519
                lda $00    ; $951C
                clc    ; $951E
                adc $9484    ; $951F
                sta $00    ; $9522
                lda $01    ; $9524
                adc $9485    ; $9526
                sta $01    ; $9529
                jmp $9580    ; $952B
                jsr GetStrArg    ; $952E
                beq $956D    ; $9531
                jsr NewEchoArea    ; $9533
                lda #$20    ; $9536
                sta $00    ; $9538
                lda #$97    ; $953A
                sta $01    ; $953C
                bit $94D1    ; $953E
                bpl $954B    ; $9541
                lda #$30    ; $9543
                sta $00    ; $9545
                lda #$97    ; $9547
                sta $01    ; $9549
                jsr DCIStringOut    ; $954B
                jsr ReadArgLine    ; $954E
                php    ; $9551
                txa    ; $9552
                pha    ; $9553
                jsr CloseEchoArea    ; $9554
                pla    ; $9557
                tax    ; $9558
                plp    ; $9559
                bne $955F    ; $955A
                txa    ; $955C
                bne $956D    ; $955D
                bne $9567    ; $955F
                jsr ClrEchoArea    ; $9561
                jmp $956A    ; $9564
                jsr Beep    ; $9567
                lda #$01    ; $956A
                rts    ; $956C
                lda #$8D    ; $956D
                sta $0200,x    ; $956F
                ldx #$1D    ; $9572
                lda $0200,x    ; $9574
                sta TheTag,x    ; $9577
                dex    ; $957A
                bpl $9574    ; $957B
                jsr GetTagBuff    ; $957D
                ldy #$00    ; $9580
                ldx #$00    ; $9582
                jsr $D000    ; $9584
                ora #$80    ; $9587
                cmp #$AF    ; $9589
                beq $95C1    ; $958B
                lda $01    ; $958D
                cmp $03    ; $958F
                bcc $959E    ; $9591
                beq $9598    ; $9593
                jmp $96F9    ; $9595
                lda $00    ; $9598
                cmp $02    ; $959A
                bcs $9595    ; $959C
                jsr $D000    ; $959E
                ora #$80    ; $95A1
                jsr UpperCon    ; $95A3
                sta $971D    ; $95A6
                lda TheTag,x    ; $95A9
                cmp #$8D    ; $95AC
                beq $95E0    ; $95AE
                jsr UpperCon    ; $95B0
                cmp $971D    ; $95B3
                bne $95D1    ; $95B6
                inx    ; $95B8
                inc $00    ; $95B9
                bne $95BF    ; $95BB
                inc $01    ; $95BD
                bne $958D    ; $95BF
                lda $00    ; $95C1
                sta $971E    ; $95C3
                lda $01    ; $95C6
                sta $971F    ; $95C8
                inc $00    ; $95CB
                bne $95D1    ; $95CD
                inc $01    ; $95CF
                jsr $D000    ; $95D1
                cmp #$8D    ; $95D4
                bne $95CB    ; $95D6
                inc $00    ; $95D8
                bne $95DE    ; $95DA
                inc $01    ; $95DC
                bne $9582    ; $95DE
                lda $00    ; $95E0
                sec    ; $95E2
                sbc $9482    ; $95E3
                sta $9484    ; $95E6
                lda $01    ; $95E9
                sbc $9483    ; $95EB
                sta $9485    ; $95EE
                ldx #$00    ; $95F1
                lda $00    ; $95F3
                bne $95F9    ; $95F5
                dec $01    ; $95F7
                dec $00    ; $95F9
                inc $00    ; $95FB
                bne $9601    ; $95FD
                inc $01    ; $95FF
                jsr $D000    ; $9601
                ora #$80    ; $9604
                cmp #$8D    ; $9606
                beq $962D    ; $9608
                cmp #$A1    ; $960A
                bne $95FB    ; $960C
                inc $00    ; $960E
                bne $9614    ; $9610
                inc $01    ; $9612
                jsr $D000    ; $9614
                ora #$80    ; $9617
                cmp #$8D    ; $9619
                beq $9627    ; $961B
                cmp #$A1    ; $961D
                beq $962D    ; $961F
                sta $0200,x    ; $9621
                inx    ; $9624
                bne $960E    ; $9625
                lda #$A0    ; $9627
                sta $0200,x    ; $9629
                inx    ; $962C
                lda $00    ; $962D
                bne $9633    ; $962F
                dec $01    ; $9631
                dec $00    ; $9633
                jsr $D000    ; $9635
                cmp #$8D    ; $9638
                bne $962D    ; $963A
                inc $00    ; $963C
                bne $9642    ; $963E
                inc $01    ; $9640
                jsr $D000    ; $9642
                cmp #$A1    ; $9645
                bne $964B    ; $9647
                lda #$8D    ; $9649
                sta $0200,x    ; $964B
                iny    ; $964E
                inx    ; $964F
                cmp #$8D    ; $9650
                bne $9642    ; $9652
                lda $0200,x    ; $9654
                sta TagSpace,x    ; $9657
                dex    ; $965A
                bpl $9654    ; $965B
                inx    ; $965D
                ldy #$00    ; $965E
                lda $971E    ; $9660
                sta $00    ; $9663
                sec    ; $9665
                sbc $9482    ; $9666
                sta $9486    ; $9669
                lda $971F    ; $966C
                sta $01    ; $966F
                sbc $9483    ; $9671
                sta $9487    ; $9674
                jsr $D000    ; $9677
                ora #$80    ; $967A
                sta $0200,x    ; $967C
                cmp #$8D    ; $967F
                beq $968C    ; $9681
                inc $00    ; $9683
                bne $9689    ; $9685
                inc $01    ; $9687
                inx    ; $9689
                bne $9677    ; $968A
                bit $94D1    ; $968C
                bmi $96A4    ; $968F
                jsr PushArg    ; $9691
                lda #$FF    ; $9694
                sta ExplicitArg    ; $9696
                bit TagsFindFile    ; $9699
                bmi $96E3    ; $969C
                jsr VisitFile    ; $969E
                jmp $96E6    ; $96A1
                jsr NewEchoArea    ; $96A4
                ldx #$00    ; $96A7
                lda TagSpace,x    ; $96A9
                cmp #$8D    ; $96AC
                beq $96B6    ; $96AE
                jsr CharOut    ; $96B0
                inx    ; $96B3
                bne $96A9    ; $96B4
                jsr PrintMessage    ; $96B6
                ldy #$E3    ; $96B9
                sbc ($EE,x)    ; $96BB
                ldy #$E2    ; $96BD
                sbc $A0    ; $96BF
                inc $EF    ; $96C1
                sbc $EE,x    ; $96C3
                cpx $A0    ; $96C5
                sbc #$EE    ; $96C7
                ldy #$00    ; $96C9
                lda $0200,y    ; $96CB
                cmp #$8D    ; $96CE
                beq $96D8    ; $96D0
                jsr CharOut    ; $96D2
                iny    ; $96D5
                bne $96CB    ; $96D6
                lda #$AE    ; $96D8
                jsr CharOut    ; $96DA
                jsr CloseEchoArea    ; $96DD
                lda #$01    ; $96E0
                rts    ; $96E2
                jsr FindFile    ; $96E3
                ldx #$00    ; $96E6
                lda TagSpace,x    ; $96E8
                sta $0200,x    ; $96EB
                inx    ; $96EE
                cmp #$8D    ; $96EF
                bne $96E8    ; $96F1
                jsr PushArg    ; $96F3
                jmp LabelSearch    ; $96F6
                jsr NewEchoArea    ; $96F9
                lda #$A7    ; $96FC
                jsr CharOut    ; $96FE
                jsr $9739    ; $9701
                jsr PrintMessage    ; $9704
        dfb $A7        ; $9707  (data/65C02-bit)
                ldy #$EE    ; $9708
        dfb $EF        ; $970A  (data/65C02-bit)
        dfb $F4        ; $970B  (data/65C02-bit)
                ldy #$E6    ; $970C
        dfb $EF        ; $970E  (data/65C02-bit)
                sbc $EE,x    ; $970F
                cpx $AE    ; $9711
                brk    ; $9713
                jsr CloseEchoArea    ; $9714
                jsr Beep    ; $9717
                lda #$01    ; $971A
                rts    ; $971C
                brk    ; $971D
                brk    ; $971E
                brk    ; $971F
                cmp $E4    ; $9720
                sbc #$F4    ; $9722
                ldy #$C4    ; $9724
                sbc $E6    ; $9726
                sbc #$EE    ; $9728
                sbc #$F4    ; $972A
                sbc #$EF    ; $972C
                inc $D73A    ; $972E
                inx    ; $9731
                sbc ($F4,x)    ; $9732
                ldy #$D4    ; $9734
                sbc ($E7,x)    ; $9736
                dec    ; $9738
                ldx #$00    ; $9739
                lda TheTag,x    ; $973B
                cmp #$8D    ; $973E
                beq $9748    ; $9740
                jsr CharOut    ; $9742
                inx    ; $9745
                bne $973B    ; $9746
                rts    ; $9748
;
; === VisitTags ===
                ldx #$FF    ; $9749
                stx ExplicitArg    ; $974B
                inx    ; $974E
                lda $945C,x    ; $974F
                sta $0200,x    ; $9752
                bne $974E    ; $9755
                jsr SelectNamed    ; $9757
                jmp VisitFile    ; $975A
;
; === Variables ===
                cmp ($F5,x)    ; $975D
        dfb $F4        ; $975F  (data/65C02-bit)
        dfb $EF        ; $9760  (data/65C02-bit)
                ldy #$C6    ; $9761
                sbc #$EC    ; $9763
                sbc $A0    ; $9765
                cmp $F8    ; $9767
        dfb $F4        ; $9769  (data/65C02-bit)
                sbc $EE    ; $976A
        dfb $F3        ; $976C  (data/65C02-bit)
                sbc #$EF    ; $976D
                ror $9AA5    ; $976F
                bit $C2BB    ; $9772
                sbc $E5    ; $9775
                beq $9719    ; $9777
        dfb $C2        ; $9779  (data/65C02-bit)
                cpx $EEE9    ; $977A
        dfb $EB        ; $977D  (data/65C02-bit)
        dfb $F3        ; $977E  (data/65C02-bit)
                ldy #$CD    ; $977F
        dfb $EF        ; $9781  (data/65C02-bit)
                cpx $E5    ; $9782
                cpx $EEE9    ; $9784
                adc $8D    ; $9787
                txs    ; $9789
        dfb $73        ; $978A  (data/65C02-bit)
                tsx    ; $978B
        dfb $C2        ; $978C  (data/65C02-bit)
                sbc $E5    ; $978D
                beq $9731    ; $978F
                cmp ($E9)    ; $9791
                inc $F3E7    ; $9793
                ldy #$C2    ; $9796
                sbc $EC    ; $9798
                jmp ($9A91)    ; $979A
        dfb $93        ; $979D  (data/65C02-bit)
                tsx    ; $979E
        dfb $C2        ; $979F  (data/65C02-bit)
                cpx $EEE9    ; $97A0
        dfb $EB        ; $97A3  (data/65C02-bit)
                sbc $F2    ; $97A4
                ldy #$D3    ; $97A6
                beq $978F    ; $97A8
                sbc MarkPnt    ; $97AA
                bit #$9A    ; $97AC
                eor $C3BA,y    ; $97AE
                sbc ($F3,x)    ; $97B1
                sbc $A0    ; $97B3
                cmp ($E5)    ; $97B5
                beq $97A5    ; $97B7
                sbc ($E3,x)    ; $97B9
                adc $A1    ; $97BB
                txs    ; $97BD
                tsb $BB    ; $97BE
        dfb $C3        ; $97C0  (data/65C02-bit)
                sbc ($F3,x)    ; $97C1
                sbc $A0    ; $97C3
        dfb $D3        ; $97C5  (data/65C02-bit)
                sbc $E1    ; $97C6
                sbc ($E3)    ; $97C8
                pla    ; $97CA
                sta $E69A,x    ; $97CB
                tsx    ; $97CE
        dfb $C3        ; $97CF  (data/65C02-bit)
                cpx $E3E9    ; $97D0
        dfb $EB        ; $97D3  (data/65C02-bit)
                ldy #$D6    ; $97D4
        dfb $EF        ; $97D6  (data/65C02-bit)
                cpx $EDF5    ; $97D7
                adc $99    ; $97DA
                txs    ; $97DC
        dfb $CB        ; $97DD  (data/65C02-bit)
                tsx    ; $97DE
        dfb $C3        ; $97DF  (data/65C02-bit)
        dfb $EF        ; $97E0  (data/65C02-bit)
                sbc $E5ED    ; $97E1
                inc $A0F4    ; $97E4
        dfb $C2        ; $97E7  (data/65C02-bit)
                sbc $E7    ; $97E8
                sbc #$6E    ; $97EA
                adc $E09A,y    ; $97EC
                lda $EFC3,y    ; $97EF
                sbc $E5ED    ; $97F2
                inc $A0F4    ; $97F5
        dfb $C3        ; $97F8  (data/65C02-bit)
        dfb $EF        ; $97F9  (data/65C02-bit)
                cpx $EDF5    ; $97FA
                ror $9A75    ; $97FD
                cpy #$B9    ; $9800
        dfb $C3        ; $9802  (data/65C02-bit)
        dfb $EF        ; $9803  (data/65C02-bit)
                sbc $E5ED    ; $9804
                inc $A0F4    ; $9807
                cmp $EE    ; $980A
                stz $7D    ; $980C
                txs    ; $980E
        dfb $F7        ; $980F  (data/65C02-bit)
                lda $EFC3,y    ; $9810
                sbc $E9F0    ; $9813
                cpx $F2E5    ; $9816
                ldy #$C6    ; $9819
                sbc #$EC    ; $981B
                sbc $EE    ; $981D
                sbc ($ED,x)    ; $981F
                adc $DD    ; $9821
                txs    ; $9823
                lsr $C3B9,x    ; $9824
                sbc $F2,x    ; $9827
        dfb $F3        ; $9829  (data/65C02-bit)
        dfb $EF        ; $982A  (data/65C02-bit)
                sbc ($A0)    ; $982B
        dfb $C3        ; $982D  (data/65C02-bit)
                sbc $EE    ; $982E
        dfb $F4        ; $9830  (data/65C02-bit)
                sbc $F2    ; $9831
                sbc #$EE    ; $9833
        dfb $E7        ; $9835  (data/65C02-bit)
                ldy #$CC    ; $9836
                sbc #$EE    ; $9838
                adc $71    ; $983A
                txs    ; $983C
        dfb $9F        ; $983D  (data/65C02-bit)
                lda $E5C4,y    ; $983E
                inc $E1    ; $9841
                sbc $EC,x    ; $9843
        dfb $F4        ; $9845  (data/65C02-bit)
                ldy #$C6    ; $9846
                sbc #$EC    ; $9848
                sbc $A0    ; $984A
        dfb $D4        ; $984C  (data/65C02-bit)
                sbc $65F0,y    ; $984D
                lda $4D9A,y    ; $9850
        dfb $BB        ; $9853  (data/65C02-bit)
                cpy $E5    ; $9854
                inc $E1    ; $9856
                sbc $EC,x    ; $9858
        dfb $F4        ; $985A  (data/65C02-bit)
                ldy #$CD    ; $985B
                sbc ($EA,x)    ; $985D
        dfb $EF        ; $985F  (data/65C02-bit)
                sbc ($A0)    ; $9860
                cmp $E4EF    ; $9862
                adc $09    ; $9865
        dfb $9B        ; $9867  (data/65C02-bit)
                rts    ; $9868
                ldx $F8C5,y    ; $9869
                sbc #$F4    ; $986C
                ldy #$D0    ; $986E
                sbc ($EF)    ; $9870
                sbc $74F0    ; $9872
                ora $4E9B    ; $9875
                bvc $9840    ; $9878
                sbc #$EC    ; $987A
                cpx $C3A0    ; $987C
        dfb $EF        ; $987F  (data/65C02-bit)
                cpx $EDF5    ; $9880
                ror VarList    ; $9883
                ply    ; $9886
                lda $EFC7,y    ; $9887
                sbc ($EC,x)    ; $988A
                ldy #$C3    ; $988C
        dfb $EF        ; $988E  (data/65C02-bit)
                cpx $EDF5    ; $988F
                ror $9AD1    ; $9892
                bit $C8BC,x    ; $9895
        dfb $C3        ; $9898  (data/65C02-bit)
                ldy #$C1    ; $9899
                sbc $F4,x    ; $989B
        dfb $EF        ; $989D  (data/65C02-bit)
                ldy #$CE    ; $989E
                sbc $ED,x    ; $98A0
        dfb $E2        ; $98A2  (data/65C02-bit)
                sbc BuffData    ; $98A3
                lda #$9A    ; $98A5
        dfb $13        ; $98A7  (data/65C02-bit)
                ldx $C3C8,y    ; $98A8
                ldy #$C3    ; $98AB
        dfb $EF        ; $98AD  (data/65C02-bit)
                cpx $EDF5    ; $98AE
                inc $F173    ; $98B1
                txs    ; $98B4
                eor $C8BD    ; $98B5
        dfb $C3        ; $98B8  (data/65C02-bit)
                ldy #$C3    ; $98B9
        dfb $EF        ; $98BB  (data/65C02-bit)
                inc $E5F4    ; $98BC
                sed    ; $98BF
        dfb $F4        ; $98C0  (data/65C02-bit)
                ldy #$C2    ; $98C1
                sbc $E7    ; $98C3
                sbc #$6E    ; $98C5
                lda ($9A),y    ; $98C7
                lsr $BE    ; $98C9
                iny    ; $98CB
        dfb $C3        ; $98CC  (data/65C02-bit)
                ldy #$C3    ; $98CD
        dfb $EF        ; $98CF  (data/65C02-bit)
                inc $E5F4    ; $98D0
                sed    ; $98D3
        dfb $F4        ; $98D4  (data/65C02-bit)
                ldy #$C5    ; $98D5
                inc $B564    ; $98D7
                txs    ; $98DA
                lsr $BE    ; $98DB
                iny    ; $98DD
        dfb $C3        ; $98DE  (data/65C02-bit)
                ldy #$C5    ; $98DF
        dfb $F3        ; $98E1  (data/65C02-bit)
        dfb $E3        ; $98E2  (data/65C02-bit)
                sbc ($F0,x)    ; $98E3
                adc $AD    ; $98E5
                txs    ; $98E7
                rol $C8BE,x    ; $98E8
        dfb $C3        ; $98EB  (data/65C02-bit)
                ldy #$C9    ; $98EC
                inc $F4E9    ; $98EE
                ldy #$D3    ; $98F1
        dfb $F4        ; $98F3  (data/65C02-bit)
                sbc ($E9)    ; $98F4
                inc $F567    ; $98F6
                txs    ; $98F9
                ror $BD    ; $98FA
                iny    ; $98FC
        dfb $C3        ; $98FD  (data/65C02-bit)
                ldy #$CC    ; $98FE
                sbc $E6    ; $9900
        dfb $F4        ; $9902  (data/65C02-bit)
                ldy #$CD    ; $9903
                sbc ($F2,x)    ; $9905
        dfb $E7        ; $9907  (data/65C02-bit)
                sbc #$6E    ; $9908
                sbc $839A,y    ; $990A
                lda $C3C8,x    ; $990D
                ldy #$D0    ; $9910
                sbc ($E7,x)    ; $9912
                sbc $A0    ; $9914
                cpy $EEE9    ; $9916
                sbc $73    ; $9919
                sbc $369A    ; $991B
                lda $C3C8,x    ; $991E
                ldy #$D0    ; $9921
                sbc ($E7,x)    ; $9923
                sbc $A0    ; $9925
                dec $EDF5    ; $9927
        dfb $E2        ; $992A  (data/65C02-bit)
                sbc BuffData    ; $992B
                ora ($9B,x)    ; $992D
        dfb $E3        ; $992F  (data/65C02-bit)
                ldy $C3C8,x    ; $9930
                ldy #$D2    ; $9933
                sbc #$E7    ; $9935
                inx    ; $9937
        dfb $F4        ; $9938  (data/65C02-bit)
                ldy #$CD    ; $9939
                sbc ($F2,x)    ; $993B
        dfb $E7        ; $993D  (data/65C02-bit)
                sbc #$6E    ; $993E
                sbc $839A,x    ; $9940
                lda $C3C8,x    ; $9943
                ldy #$D3    ; $9946
                cpx $74EF    ; $9948
                sbc $9A    ; $994B
        dfb $FF        ; $994D  (data/65C02-bit)
                ldy $C3C8,x    ; $994E
                ldy #$D3    ; $9951
                inx    ; $9953
                sbc $E5    ; $9954
        dfb $F4        ; $9956  (data/65C02-bit)
                ldy #$CC    ; $9957
                sbc #$EE    ; $9959
                sbc $73    ; $995B
                sbc #$9A    ; $995D
                asl $C8BD,x    ; $995F
        dfb $C3        ; $9962  (data/65C02-bit)
                ldy #$D4    ; $9963
        dfb $EF        ; $9965  (data/65C02-bit)
                beq $9908    ; $9966
                cpy $EEE9    ; $9968
                adc $05    ; $996B
        dfb $9B        ; $996D  (data/65C02-bit)
                lda $C8BC,x    ; $996E
                sbc $F8    ; $9971
                ldy #$C6    ; $9973
                sbc #$EC    ; $9975
                sbc $A0    ; $9977
        dfb $D3        ; $9979  (data/65C02-bit)
                sbc #$FA    ; $997A
                adc $11    ; $997C
        dfb $9B        ; $997E  (data/65C02-bit)
                ora $9B,x    ; $997F
                cmp #$E7    ; $9981
                inc $F2EF    ; $9983
                sbc $A0    ; $9986
                cmp ($EC,x)    ; $9988
                beq $9974    ; $998A
                sbc ($A0,x)    ; $998C
                cpy $E2E1    ; $998E
                sbc $EC    ; $9991
        dfb $73        ; $9993  (data/65C02-bit)
                cmp $999A,y    ; $9994
                ldy $E5CB,x    ; $9997
                sbc $C3A0,y    ; $999A
                cpx $E3E9    ; $999D
        dfb $6B        ; $99A0  (data/65C02-bit)
                sta $9A,x    ; $99A1
                ldx $CCBA    ; $99A3
                sbc ($E2,x)    ; $99A6
                sbc $EC    ; $99A8
                ldy #$D3    ; $99AA
        dfb $F4        ; $99AC  (data/65C02-bit)
                sbc ($F2,x)    ; $99AD
        dfb $F4        ; $99AF  (data/65C02-bit)
                sbc $F2    ; $99B0
        dfb $73        ; $99B2  (data/65C02-bit)
                cmp $9A,x    ; $99B3
                stz $BC,x    ; $99B5
                dec $F8E5    ; $99B7
        dfb $F4        ; $99BA  (data/65C02-bit)
                ldy #$D3    ; $99BB
        dfb $E3        ; $99BD  (data/65C02-bit)
                sbc ($E5)    ; $99BE
                sbc $EE    ; $99C0
                ldy #$C3    ; $99C2
        dfb $EF        ; $99C4  (data/65C02-bit)
                inc $E5F4    ; $99C5
                sed    ; $99C8
        dfb $F4        ; $99C9  (data/65C02-bit)
                ldy #$CC    ; $99CA
                sbc #$EE    ; $99CC
                sbc $73    ; $99CE
                cmp $9A    ; $99D0
                ldy $BB,x    ; $99D2
                dec $F7E5    ; $99D4
                ldy #$CC    ; $99D7
                sbc #$EE    ; $99D9
                sbc $F3    ; $99DB
                ldy #$C1    ; $99DD
        dfb $F4        ; $99DF  (data/65C02-bit)
                ldy #$C5    ; $99E0
        dfb $CF        ; $99E2  (data/65C02-bit)
        dfb $42        ; $99E3  (data/65C02-bit)
                cmp #$9A    ; $99E4
        dfb $DF        ; $99E6  (data/65C02-bit)
        dfb $BB        ; $99E7  (data/65C02-bit)
                cmp ($E5)    ; $99E8
        dfb $E7        ; $99EA  (data/65C02-bit)
                sbc #$EF    ; $99EB
                inc $D1A0    ; $99ED
                sbc $E5,x    ; $99F0
                sbc ($F9)    ; $99F2
                ldy #$D3    ; $99F4
                sbc #$FA    ; $99F6
                adc $CD    ; $99F8
                txs    ; $99FA
        dfb $07        ; $99FB  (data/65C02-bit)
                ldy $E5D3,x    ; $99FC
                sbc ($F2,x)    ; $99FF
        dfb $E3        ; $9A01  (data/65C02-bit)
                inx    ; $9A02
                ldy #$CD    ; $9A03
        dfb $EF        ; $9A05  (data/65C02-bit)
                inc $E5,x    ; $9A06
                sbc $EEE5    ; $9A08
        dfb $F4        ; $9A0B  (data/65C02-bit)
                ldy #$CD    ; $9A0C
                sbc ($78,x)    ; $9A0E
                sta ($9A,x)    ; $9A10
                tsb $D3BA    ; $9A12
        dfb $EB        ; $9A15  (data/65C02-bit)
                sbc #$F0    ; $9A16
                ldy #$C3    ; $9A18
        dfb $EF        ; $9A1A  (data/65C02-bit)
                sbc $E5ED    ; $9A1B
                inc $A0F4    ; $9A1E
                cmp $EE    ; $9A21
                stz $85    ; $9A23
                txs    ; $9A25
        dfb $37        ; $9A26  (data/65C02-bit)
                tsx    ; $9A27
        dfb $D3        ; $9A28  (data/65C02-bit)
                sbc $F4F3,y    ; $9A29
                sbc $ED    ; $9A2C
                ldy #$C6    ; $9A2E
                sbc #$EC    ; $9A30
                sbc $F3    ; $9A32
                ldy #$D0    ; $9A34
                sbc ($F4,x)    ; $9A36
                pla    ; $9A38
                lda $689A,x    ; $9A39
        dfb $BB        ; $9A3C  (data/65C02-bit)
        dfb $D4        ; $9A3D  (data/65C02-bit)
                sbc ($E1)    ; $9A3E
                inc $F0F3    ; $9A40
        dfb $EF        ; $9A43  (data/65C02-bit)
        dfb $F3        ; $9A44  (data/65C02-bit)
                sbc $A0    ; $9A45
                bne $9A3B    ; $9A47
                sbc $F6    ; $9A49
                sbc #$EF    ; $9A4B
                sbc $F3,x    ; $9A4D
                ldy #$CF    ; $9A4F
                inc $79EC    ; $9A51
                cmp ($9A,x)    ; $9A54
        dfb $8B        ; $9A56  (data/65C02-bit)
        dfb $BB        ; $9A57  (data/65C02-bit)
        dfb $D4        ; $9A58  (data/65C02-bit)
                sbc ($E7,x)    ; $9A59
        dfb $F3        ; $9A5B  (data/65C02-bit)
                ldy #$C6    ; $9A5C
                sbc #$EE    ; $9A5E
                cpx $A0    ; $9A60
                dec $E9    ; $9A62
                cpx $E165    ; $9A64
                txs    ; $9A67
        dfb $02        ; $9A68  (data/65C02-bit)
        dfb $B3        ; $9A69  (data/65C02-bit)
;
; === VariableLink ===
                brk    ; $9A6A
                brk    ; $9A6B
                brk    ; $9A6C
;
; === VarList ===
                brk    ; $9A6D
        dfb $FF        ; $9A6E  (data/65C02-bit)
                ldy: scrny    ; $9A6F
                clc    ; $9A72
                sbc $31,x    ; $9A73
                brk    ; $9A75
                bvc $9A77    ; $9A76
                trb $0502    ; $9A78
                brk    ; $9A7B
                ora $0502,x    ; $9A7C
                ora $1D    ; $9A7F
                ora ($00,x)    ; $9A81
        dfb $0F        ; $9A83  (data/65C02-bit)
                eor: $0003,x    ; $9A84
                and $18    ; $9A87
                brk    ; $9A89
        dfb $FF        ; $9A8A  (data/65C02-bit)
                eor BASH    ; $9A8B
        dfb $03        ; $9A8D  (data/65C02-bit)
                brk    ; $9A8E
        dfb $37        ; $9A8F  (data/65C02-bit)
                rol    ; $9A90
        dfb $03        ; $9A91  (data/65C02-bit)
                brk    ; $9A92
                sec    ; $9A93
                rol    ; $9A94
        dfb $03        ; $9A95  (data/65C02-bit)
                brk    ; $9A96
                phy    ; $9A97
        dfb $27        ; $9A98  (data/65C02-bit)
                brk    ; $9A99
                bra $9AF7    ; $9A9A
        dfb $27        ; $9A9C  (data/65C02-bit)
        dfb $03        ; $9A9D  (data/65C02-bit)
                brk    ; $9A9E
                sta $035E    ; $9A9F
                brk    ; $9AA2
                bvs $9A29    ; $9AA3
        dfb $02        ; $9AA5  (data/65C02-bit)
                asl $4E    ; $9AA6
        dfb $67        ; $9AA8  (data/65C02-bit)
                brk    ; $9AA9
        dfb $FF        ; $9AAA  (data/65C02-bit)
        dfb $3B        ; $9AAB  (data/65C02-bit)
        dfb $8F        ; $9AAC  (data/65C02-bit)
        dfb $02        ; $9AAD  (data/65C02-bit)
        dfb $02        ; $9AAE  (data/65C02-bit)
                bit $028F,x    ; $9AAF
                ora #$3E    ; $9AB2
        dfb $8F        ; $9AB4  (data/65C02-bit)
        dfb $02        ; $9AB5  (data/65C02-bit)
                ora #$48    ; $9AB6
        dfb $8F        ; $9AB8  (data/65C02-bit)
                brk    ; $9AB9
        dfb $FF        ; $9ABA  (data/65C02-bit)
        dfb $83        ; $9ABB  (data/65C02-bit)
                adc $3102    ; $9ABC
        dfb $23        ; $9ABF  (data/65C02-bit)
        dfb $83        ; $9AC0  (data/65C02-bit)
        dfb $03        ; $9AC1  (data/65C02-bit)
                brk    ; $9AC2
                dec: $0089,x    ; $9AC3
                clc    ; $9AC6
        dfb $D3        ; $9AC7  (data/65C02-bit)
                bit $03,x    ; $9AC8
                brk    ; $9ACA
                sec    ; $9ACB
                bit $01,x    ; $9ACC
                brk    ; $9ACE
        dfb $2B        ; $9ACF  (data/65C02-bit)
                sty $5000    ; $9AD0
                php    ; $9AD3
                bit $02,x    ; $9AD4
                ora $98    ; $9AD6
                and ($03,x)    ; $9AD8
                brk    ; $9ADA
                sta $0221,x    ; $9ADB
                rti    ; $9ADE
                cpx $76    ; $9ADF
        dfb $03        ; $9AE1  (data/65C02-bit)
                brk    ; $9AE2
                sta ($94,x)    ; $9AE3
                brk    ; $9AE5
        dfb $07        ; $9AE6  (data/65C02-bit)
                bit $8F,x    ; $9AE7
                brk    ; $9AE9
        dfb $FF        ; $9AEA  (data/65C02-bit)
                and $8F,x    ; $9AEB
                brk    ; $9AED
        dfb $FF        ; $9AEE  (data/65C02-bit)
                rol $8F,x    ; $9AEF
                brk    ; $9AF1
                sty $37    ; $9AF2
        dfb $8F        ; $9AF4  (data/65C02-bit)
        dfb $02        ; $9AF5  (data/65C02-bit)
                asl    ; $9AF6
        dfb $54        ; $9AF7  (data/65C02-bit)
        dfb $8F        ; $9AF8  (data/65C02-bit)
                brk    ; $9AF9
                bvc $9B5A    ; $9AFA
        dfb $8F        ; $9AFC  (data/65C02-bit)
                brk    ; $9AFD
                bvc $9B5F    ; $9AFE
        dfb $8F        ; $9B00  (data/65C02-bit)
                ora ($00,x)    ; $9B01
                sec    ; $9B03
        dfb $8F        ; $9B04  (data/65C02-bit)
                brk    ; $9B05
        dfb $FF        ; $9B06  (data/65C02-bit)
                dec    ; $9B07
        dfb $8F        ; $9B08  (data/65C02-bit)
                brk    ; $9B09
                ora $47    ; $9B0A
                sta ($03,x)    ; $9B0C
                brk    ; $9B0E
                sbc ($77),y    ; $9B0F
        dfb $03        ; $9B11  (data/65C02-bit)
                brk    ; $9B12
                rol $CF75,x    ; $9B13
                inc $EDA0    ; $9B16
                sbc $E1    ; $9B19
                inc $A0F3    ; $9B1B
                cpx $E9    ; $9B1E
        dfb $F3        ; $9B20  (data/65C02-bit)
                beq $9B0F    ; $9B21
                sbc ($F9,x)    ; $9B23
                ldy #$E6    ; $9B25
                sbc #$EC    ; $9B27
                sbc $A0    ; $9B29
        dfb $F3        ; $9B2B  (data/65C02-bit)
                sbc #$FA    ; $9B2C
                sbc $F3    ; $9B2E
                ldy #$E9    ; $9B30
                inc $E8A0    ; $9B32
                sbc $78    ; $9B35
; ---- $9B37-$A4F7  data  CommandNames (alphabetical command-name string table, runs to EOF) ----
        dfb $C1,$E3,$E3,$F5,$ED,$F5,$EC,$E1,$F4,$E5,$A0,$CD,$E1,$F4,$E3,$E8    ; $9B37  Accumulate Match
        dfb $E9,$EE,$E7,$A0,$CC,$E9,$EE,$E5,$73,$71,$89,$45,$B5,$C1,$F0,$F0    ; $9B47  ing Linesq.E5App
        dfb $E5,$EE,$E4,$A0,$CE,$E5,$F8,$F4,$A0,$CB,$E9,$EC,$6C,$7E,$4F,$78    ; $9B57  end Next Kill~Ox
        dfb $B7,$C1,$F0,$F2,$EF,$F0,$EF,$73,$91,$64,$AC,$AF,$C1,$F2,$E7,$F5    ; $9B67  7Apropos.d,/Argu
        dfb $ED,$E5,$EE,$F4,$A0,$C4,$E9,$E7,$E9,$74,$D2,$7A,$0E,$AE,$C1,$F4    ; $9B77  ment DigitRz..At
        dfb $EF,$ED,$A0,$D7,$EF,$F2,$E4,$A0,$CD,$EF,$E4,$65,$08,$1C,$AC,$B0    ; $9B87  om Word Mode..,0
        dfb $C1,$F5,$F4,$EF,$A0,$C6,$E9,$EC,$EC,$A0,$CD,$EF,$E4,$65,$10,$1C    ; $9B97  Auto Fill Mode..
        dfb $D7,$B0,$C1,$F5,$F4,$EF,$A0,$C9,$EE,$E4,$E5,$EE,$F4,$A0,$CD,$EF    ; $9BA7  W0Auto Indent Mo
        dfb $E4,$65,$0C,$1C,$AF,$BD,$C2,$E1,$E3,$EB,$A0,$F4,$EF,$A0,$C9,$EE    ; $9BB7  de../=Back to In
        dfb $E4,$E5,$EE,$F4,$E1,$F4,$E9,$EF,$6E,$26,$25,$D7,$BD,$CF,$F5,$F4    ; $9BC7  dentation&%W=Out
        dfb $E4,$E5,$EE,$F4,$A0,$CC,$E9,$EE,$65,$78,$25,$6A,$B2,$CF,$F5,$F4    ; $9BD7  dent Linex%j2Out
        dfb $E4,$E5,$EE,$F4,$A0,$C3,$D2,$CC,$46,$72,$25,$5F,$B2,$C2,$E1,$E3    ; $9BE7  dent CRLFr%_2Bac
        dfb $EB,$F7,$E1,$F2,$E4,$A0,$C3,$E8,$E1,$F2,$E1,$E3,$F4,$E5,$72,$5E    ; $9BF7  kward Character^
        dfb $17,$00,$AB,$C2,$E1,$E3,$EB,$F7,$E1,$F2,$E4,$A0,$C4,$E5,$EC,$E5    ; $9C07  ..+Backward Dele
        dfb $F4,$E5,$A0,$C3,$E8,$E1,$F2,$E1,$E3,$F4,$E5,$72,$1D,$16,$B6,$AB    ; $9C17  te Character..6+
        dfb $C2,$E1,$E3,$EB,$F7,$E1,$F2,$E4,$A0,$C4,$E5,$EC,$E5,$F4,$E5,$A0    ; $9C27  Backward Delete 
        dfb $C8,$E1,$E3,$EB,$E9,$EE,$E7,$A0,$D4,$E1,$E2,$73,$8B,$16,$DC,$AB    ; $9C37  Hacking Tabs..\+
        dfb $C2,$E1,$E3,$EB,$F7,$E1,$F2,$E4,$A0,$CB,$E9,$EC,$EC,$A0,$CC,$E9    ; $9C47  Backward Kill Li
        dfb $EE,$65,$26,$38,$13,$B2,$C2,$E1,$E3,$EB,$F7,$E1,$F2,$E4,$A0,$CB    ; $9C57  ne&8.2Backward K
        dfb $E9,$EC,$EC,$A0,$D3,$E5,$EE,$F4,$E5,$EE,$E3,$65,$F0,$3A,$F1,$B8    ; $9C67  ill Sentencep:q8
        dfb $C2,$E1,$E3,$EB,$F7,$E1,$F2,$E4,$A0,$CB,$E9,$EC,$EC,$A0,$D7,$EF    ; $9C77  Backward Kill Wo
        dfb $F2,$64,$FE,$37,$1F,$AC,$C2,$E1,$E3,$EB,$F7,$E1,$F2,$E4,$A0,$D0    ; $9C87  rd~7.,Backward P
        dfb $E1,$F2,$E1,$E7,$F2,$E1,$F0,$68,$39,$22,$15,$B8,$C2,$E1,$E3,$EB    ; $9C97  aragraph9".8Back
        dfb $F7,$E1,$F2,$E4,$A0,$D3,$E5,$EE,$F4,$E5,$EE,$E3,$65,$6E,$3A,$AF    ; $9CA7  ward Sentencen:/
        dfb $B8,$C2,$E1,$E3,$EB,$F7,$E1,$F2,$E4,$A0,$D7,$EF,$F2,$64,$C2,$35    ; $9CB7  8Backward WordB5
        dfb $74,$AB,$C2,$E3,$E3,$F5,$72,$76,$87,$1E,$B5,$C2,$E5,$E7,$E9,$EE    ; $9CC7  t+Bccurv..5Begin
        dfb $EE,$E9,$EE,$E7,$A0,$EF,$E6,$A0,$CC,$E9,$EE,$65,$A6,$34,$8B,$AE    ; $9CD7  ning of Line&4..
        dfb $C3,$A0,$CD,$EF,$E4,$65,$5A,$81,$6D,$B4,$C3,$D2,$CC,$46,$26,$18    ; $9CE7  C ModeZ.m4CRLF&.
        dfb $2C,$B2,$C3,$E1,$F0,$E9,$F4,$E1,$EC,$E9,$FA,$E5,$A0,$D2,$E5,$E7    ; $9CF7  ,2Capitalize Reg
        dfb $E9,$EF,$6E,$83,$8D,$B4,$B6,$C3,$E1,$F0,$F3,$A0,$D7,$EF,$F2,$E4    ; $9D07  ion..46Caps Word
        dfb $A0,$CD,$EF,$E4,$65,$14,$1C,$7A,$BE,$C3,$EF,$ED,$F0,$E9,$EC,$65    ; $9D17   Mode..z>Compile
        dfb $24,$77,$02,$B2,$C3,$EF,$F0,$F9,$A0,$D2,$E5,$E7,$E9,$EF,$6E,$92    ; $9D27  $w.2Copy Region.
        dfb $8D,$FA,$B6,$C3,$EF,$F5,$EE,$F4,$A0,$CC,$E9,$EE,$E5,$F3,$A0,$D2    ; $9D37  .z6Count Lines R
        dfb $E5,$E7,$E9,$EF,$6E,$B0,$8D,$16,$B7,$C3,$EF,$F5,$EE,$F4,$A0,$CF    ; $9D47  egion0..7Count O
        dfb $E3,$E3,$F5,$F2,$E5,$EE,$E3,$E5,$73,$68,$87,$D3,$B4,$C4,$E5,$EC    ; $9D57  ccurencesh.S4Del
        dfb $E5,$F4,$E5,$A0,$C2,$EC,$E1,$EE,$EB,$A0,$CC,$E9,$EE,$E5,$73,$55    ; $9D67  ete Blank LinesU
        dfb $39,$57,$B0,$C4,$E5,$EC,$E5,$F4,$E5,$A0,$C3,$E8,$E1,$F2,$E1,$E3    ; $9D77  9W0Delete Charac
        dfb $F4,$E5,$72,$87,$15,$94,$AB,$C4,$E5,$EC,$E5,$F4,$E5,$A0,$C6,$E9    ; $9D87  ter...+Delete Fi
        dfb $EC,$65,$16,$6D,$EB,$B1,$C4,$E5,$EC,$E5,$F4,$E5,$A0,$C8,$EF,$F2    ; $9D97  le.mk1Delete Hor
        dfb $E9,$FA,$EF,$EE,$F4,$E1,$EC,$A0,$D3,$F0,$E1,$E3,$65,$3C,$39,$72    ; $9DA7  izontal Space<9r
        dfb $B0,$C4,$E5,$F3,$E3,$F2,$E9,$E2,$65,$84,$51,$B4,$B4,$C4,$EF,$A0    ; $9DB7  0Describe.Q44Do 
        dfb $CC,$E1,$F3,$F4,$A0,$CB,$E2,$E4,$A0,$CD,$E1,$E3,$F2,$6F,$04,$8B    ; $9DC7  Last Kbd Macro..
        dfb $66,$B5,$C4,$EF,$F7,$EE,$A0,$C3,$EF,$ED,$ED,$E5,$EE,$F4,$A0,$CC    ; $9DD7  f5Down Comment L
        dfb $E9,$EE,$65,$A6,$1E,$02,$B4,$C4,$EF,$F7,$EE,$A0,$D2,$E5,$E1,$EC    ; $9DE7  ine&..4Down Real
        dfb $A0,$CC,$E9,$EE,$65,$C2,$1B,$21,$AB,$C5,$E4,$E9,$F4,$A0,$C4,$E5    ; $9DF7   LineB.!+Edit De
        dfb $E6,$E9,$EE,$E9,$F4,$E9,$EF,$6E,$D2,$94,$AE,$B2,$C5,$EE,$E4,$A0    ; $9E07  finitionR..2End 
        dfb $CB,$E2,$E4,$A0,$CD,$E1,$E3,$F2,$6F,$05,$8C,$DD,$B7,$C5,$EE,$E4    ; $9E17  Kbd Macro..]7End
        dfb $A0,$EF,$E6,$A0,$CC,$E9,$EE,$65,$BA,$34,$A9,$AE,$C5,$F8,$E3,$E8    ; $9E27   of Line:4).Exch
        dfb $E1,$EE,$E7,$E5,$A0,$D0,$EF,$E9,$EE,$F4,$A0,$E1,$EE,$E4,$A0,$CD    ; $9E37  ange Point and M
        dfb $E1,$F2,$6B,$2B,$7E,$3F,$B3,$C5,$F8,$E9,$74,$82,$10,$48,$B9,$C5    ; $9E47  ark+~?3Exit..H9E
        dfb $F8,$F4,$E5,$EE,$E4,$E5,$E4,$A0,$C3,$EF,$ED,$ED,$E1,$EE,$64,$1F    ; $9E57  xtended Command.
        dfb $3F,$34,$AE,$C6,$E9,$EC,$EC,$A0,$D0,$E1,$F2,$E1,$E7,$F2,$E1,$F0    ; $9E67  ?4.Fill Paragrap
        dfb $68,$C7,$22,$42,$B7,$C6,$E9,$EC,$EC,$A0,$D2,$E5,$E7,$E9,$EF,$6E    ; $9E77  hG"B7Fill Region
        dfb $0A,$8E,$42,$B7,$C6,$E9,$EE,$E4,$A0,$C6,$E9,$EC,$65,$BE,$6B,$22    ; $9E87  ..B7Find File>k"
        dfb $B6,$C6,$EF,$F2,$F7,$E1,$F2,$E4,$A0,$C3,$E8,$E1,$F2,$E1,$E3,$F4    ; $9E97  6Forward Charact
        dfb $E5,$72,$3B,$17,$00,$AB,$C6,$EF,$F2,$F7,$E1,$F2,$E4,$A0,$D0,$E1    ; $9EA7  er;..+Forward Pa
        dfb $F2,$E1,$E7,$F2,$E1,$F0,$68,$CF,$21,$28,$B8,$C6,$EF,$F2,$F7,$E1    ; $9EB7  ragraphO!(8Forwa
        dfb $F2,$E4,$A0,$D3,$E5,$EE,$F4,$E5,$EE,$E3,$65,$2E,$3A,$8F,$B8,$C6    ; $9EC7  rd Sentence.:.8F
        dfb $EF,$F2,$F7,$E1,$F2,$E4,$A0,$D7,$EF,$F2,$64,$17,$36,$57,$AB,$C6    ; $9ED7  orward Word.6W+F
        dfb $F5,$EE,$E4,$E1,$ED,$E5,$EE,$F4,$E1,$EC,$A0,$CD,$EF,$E4,$65,$F2    ; $9EE7  undamental Moder
        dfb $81,$6D,$B4,$C7,$EF,$F4,$EF,$A0,$C2,$E5,$E7,$E9,$EE,$EE,$E9,$EE    ; $9EF7  .m4Goto Beginnin
        dfb $67,$41,$1A,$C5,$AE,$C7,$EF,$F4,$EF,$A0,$C5,$EE,$64,$5A,$1A,$E5    ; $9F07  gA.E.Goto EndZ.e
        dfb $AE,$C7,$EF,$F4,$EF,$A0,$CE,$E5,$F8,$F4,$A0,$CC,$E1,$E2,$E5,$6C    ; $9F17  .Goto Next Label
        dfb $DD,$22,$3D,$B8,$C7,$EF,$F4,$EF,$A0,$D0,$F2,$E5,$F6,$E9,$EF,$F5    ; $9F27  ]"=8Goto Previou
        dfb $F3,$A0,$CC,$E1,$E2,$E5,$6C,$4C,$23,$58,$B8,$C7,$F2,$EF,$F7,$A0    ; $9F37  s LabelL#X8Grow 
        dfb $D7,$E9,$EE,$E4,$EF,$77,$7F,$13,$96,$B6,$C8,$E1,$F2,$E4,$E3,$EF    ; $9F47  Window...6Hardco
        dfb $F0,$F9,$A0,$C2,$F5,$E6,$E6,$E5,$72,$AC,$8E,$95,$BD,$C8,$E1,$F2    ; $9F57  py Buffer,..=Har
        dfb $E4,$E3,$EF,$F0,$F9,$A0,$D2,$E5,$E7,$E9,$EF,$6E,$B2,$8E,$5A,$B7    ; $9F67  dcopy Region2.Z7
        dfb $C8,$E5,$EC,$70,$91,$83,$0A,$B6,$C9,$EE,$E3,$F2,$E5,$ED,$E5,$EE    ; $9F77  Help...6Incremen
        dfb $F4,$E1,$EC,$A0,$D3,$E5,$E1,$F2,$E3,$68,$79,$1B,$22,$AF,$C9,$EE    ; $9F87  tal Searchy."/In
        dfb $E4,$E5,$EE,$F4,$A0,$D2,$E5,$E7,$E9,$EF,$6E,$BB,$8E,$F9,$BD,$C9    ; $9F97  dent Region;.y=I
        dfb $EE,$E4,$E5,$EE,$F4,$A0,$E6,$EF,$F2,$A0,$C3,$EF,$ED,$ED,$E5,$EE    ; $9FA7  ndent for Commen
        dfb $74,$7A,$1E,$02,$B4,$C9,$EE,$F3,$E5,$F2,$F4,$A0,$C4,$E1,$F4,$E5    ; $9FB7  tz..4Insert Date
        dfb $A0,$E1,$EE,$E4,$A0,$D4,$E9,$ED,$65,$7F,$6F,$96,$B1,$C9,$EE,$F3    ; $9FC7   and Time.o.1Ins
        dfb $E5,$F2,$F4,$A0,$C6,$E9,$EC,$65,$D2,$6A,$17,$B1,$C9,$EE,$F6,$E5    ; $9FD7  ert FileRj.1Inve
        dfb $F2,$F4,$A0,$CD,$EF,$E4,$E5,$A0,$CC,$E9,$EE,$65,$3B,$53,$74,$B3    ; $9FE7  rt Mode Line;St3
        dfb $CB,$E9,$EC,$EC,$A0,$C2,$F5,$E6,$E6,$E5,$72,$1F,$4A,$D5,$B5,$CB    ; $9FF7  Kill Buffer.JU5K
        dfb $E9,$EC,$EC,$A0,$C3,$EF,$ED,$ED,$E5,$EE,$74,$6A,$1E,$2F,$B4,$CB    ; $A007  ill Commentj./4K
        dfb $E9,$EC,$EC,$A0,$CC,$E9,$EE,$65,$2E,$38,$13,$B2,$CB,$E9,$EC,$EC    ; $A017  ill Line.8.2Kill
        dfb $A0,$D2,$E5,$E7,$E9,$EF,$6E,$9A,$8D,$DA,$B6,$CB,$E9,$EC,$EC,$A0    ; $A027   Region..Z6Kill 
        dfb $D3,$E5,$EE,$F4,$E5,$EE,$E3,$65,$E0,$3A,$D1,$B8,$CB,$E9,$EC,$EC    ; $A037  Sentence`:Q8Kill
        dfb $A0,$D7,$EF,$F2,$64,$E7,$37,$02,$AC,$CC,$E1,$E2,$E5,$EC,$A0,$D3    ; $A047   Wordg7.,Label S
        dfb $E5,$E1,$F2,$E3,$68,$CA,$63,$E3,$B3,$CC,$E9,$F3,$F0,$A0,$CD,$EF    ; $A057  earchJcc3Lisp Mo
        dfb $E4,$65,$6D,$81,$6D,$B4,$CC,$E9,$F3,$F4,$A0,$C2,$F5,$E6,$E6,$E5    ; $A067  dem.m4List Buffe
        dfb $F2,$73,$74,$48,$B5,$B5,$CC,$E9,$F3,$F4,$A0,$C4,$E9,$F2,$E5,$E3    ; $A077  rstH55List Direc
        dfb $F4,$EF,$F2,$79,$58,$6B,$98,$B3,$CC,$E9,$F3,$F4,$A0,$C6,$E9,$EC    ; $A087  toryXk.3List Fil
        dfb $E5,$73,$54,$6B,$A0,$B3,$CC,$E9,$F3,$F4,$A0,$CD,$E1,$F4,$E3,$E8    ; $A097  esTk 3List Match
        dfb $E9,$EE,$E7,$A0,$CC,$E9,$EE,$E5,$73,$6F,$87,$F4,$B4,$CC,$E9,$F3    ; $A0A7  ing Lineso.t4Lis
        dfb $F4,$A0,$D6,$E1,$F2,$E9,$E1,$E2,$EC,$E5,$73,$B0,$65,$BB,$AF,$CC    ; $A0B7  t Variables0e;/L
        dfb $EF,$E1,$E4,$A0,$CC,$E9,$E2,$F2,$E1,$F2,$79,$E6,$91,$EA,$A4,$CC    ; $A0C7  oad Libraryf.j$L
        dfb $EF,$F7,$E5,$F2,$E3,$E1,$F3,$E5,$A0,$D2,$E5,$E7,$E9,$EF,$6E,$61    ; $A0D7  owercase Regiona
        dfb $8D,$B4,$B6,$CC,$EF,$F7,$E5,$F2,$E3,$E1,$F3,$E5,$A0,$D7,$EF,$F2    ; $A0E7  .46Lowercase Wor
        dfb $64,$74,$36,$62,$AC,$CD,$E1,$F2,$EB,$A0,$C2,$F5,$E6,$E6,$E5,$72    ; $A0F7  dt6b,Mark Buffer
        dfb $2F,$4D,$24,$B9,$CD,$E1,$F2,$EB,$A0,$D0,$E1,$F2,$E1,$E7,$F2,$E1    ; $A107  /M$9Mark Paragra
        dfb $F0,$68,$B5,$22,$13,$B9,$CD,$E5,$F2,$EC,$E9,$EE,$A0,$CD,$EF,$E4    ; $A117  ph5".9Merlin Mod
        dfb $65,$7D,$81,$6D,$B4,$CD,$E5,$F2,$EC,$E9,$EE,$E9,$FA,$65,$65,$79    ; $A127  e}.m4Merlinizeey
        dfb $07,$B0,$CD,$EF,$F6,$E5,$A0,$D4,$EF,$A0,$D3,$E3,$F2,$E5,$E5,$EE    ; $A137  .0Move To Screen
        dfb $A0,$C5,$E4,$E7,$65,$E1,$17,$ED,$AC,$CE,$E5,$E7,$E1,$F4,$E9,$F6    ; $A147   Edgea.m,Negativ
        dfb $E5,$A0,$C1,$F2,$E7,$F5,$ED,$E5,$EE,$74,$11,$7B,$E0,$AD,$CE,$E5    ; $A157  e Argument.{`-Ne
        dfb $F7,$A0,$D7,$E9,$EE,$E4,$EF,$77,$81,$17,$9C,$AC,$CE,$E5,$F8,$F4    ; $A167  w Window...,Next
        dfb $A0,$D3,$E3,$F2,$E5,$E5,$6E,$D4,$34,$B5,$AC,$CE,$EF,$F4,$A0,$CD    ; $A177   ScreenT45,Not M
        dfb $EF,$E4,$E9,$E6,$E9,$E5,$64,$A6,$1B,$57,$B3,$CF,$EE,$E5,$A0,$D7    ; $A187  odified&.W3One W
        dfb $E9,$EE,$E4,$EF,$77,$3F,$13,$5D,$B6,$CF,$F0,$E5,$EE,$A0,$C2,$EC    ; $A197  indow?.]6Open Bl
        dfb $E1,$EE,$EB,$A0,$CC,$E9,$EE,$65,$6E,$19,$44,$B2,$CF,$F4,$E8,$E5    ; $A1A7  ank Linen.D2Othe
        dfb $F2,$A0,$D7,$E9,$EE,$E4,$EF,$77,$C1,$12,$7E,$B6,$D0,$E1,$F3,$E3    ; $A1B7  r WindowA.~6Pasc
        dfb $E1,$EC,$A0,$CD,$EF,$E4,$65,$C6,$81,$6D,$B4,$D0,$F2,$E5,$E6,$E9    ; $A1C7  al ModeF.m4Prefi
        dfb $F8,$A0,$C3,$F4,$F2,$EC,$AD,$CD,$E5,$F4,$61,$EB,$1A,$29,$AD,$D0    ; $A1D7  x Ctrl-Metak.)-P
        dfb $F2,$E5,$E6,$E9,$F8,$A0,$CD,$E5,$F4,$61,$D5,$1A,$10,$AD,$D0,$F2    ; $A1E7  refix MetaU..-Pr
        dfb $E5,$F6,$E9,$EF,$F5,$F3,$A0,$D3,$E3,$F2,$E5,$E5,$6E,$4C,$35,$D0    ; $A1F7  evious ScreenL5P
        dfb $AC,$D1,$F5,$E5,$F2,$F9,$A0,$D2,$E5,$F0,$EC,$E1,$E3,$65,$75,$84    ; $A207  ,Query Replaceu.
        dfb $69,$B1,$D1,$F5,$EF,$F4,$E5,$E4,$A0,$C9,$EE,$F3,$E5,$F2,$74,$B1    ; $A217  i1Quoted Insert1
        dfb $1B,$45,$AD,$D2,$E5,$EE,$E1,$ED,$E5,$A0,$C2,$F5,$E6,$E6,$E5,$72    ; $A227  .E-Rename Buffer
        dfb $4A,$47,$9A,$B5,$D2,$E5,$F0,$EC,$E1,$E3,$E5,$A0,$D3,$F4,$F2,$E9    ; $A237  JG.5Replace Stri
        dfb $EE,$67,$79,$84,$78,$B1,$D2,$E5,$F0,$EF,$F3,$E9,$F4,$E9,$EF,$EE    ; $A247  ngy.x1Reposition
        dfb $A0,$D7,$E9,$EE,$E4,$EF,$77,$F0,$23,$75,$B8,$D2,$E5,$F6,$E5,$F2    ; $A257   Windowp#u8Rever
        dfb $F3,$E5,$A0,$C9,$EE,$E3,$F2,$E5,$ED,$E5,$EE,$F4,$E1,$EC,$A0,$D3    ; $A267  se Incremental S
        dfb $E5,$E1,$F2,$E3,$68,$71,$1B,$03,$AF,$D2,$E5,$F6,$E5,$F2,$F3,$E5    ; $A277  earchq../Reverse
        dfb $A0,$D3,$F4,$F2,$E9,$EE,$E7,$A0,$D3,$E5,$E1,$F2,$E3,$68,$88,$1B    ; $A287   String Search..
        dfb $50,$B1,$D3,$E1,$F6,$E5,$A0,$C6,$E9,$EC,$65,$7D,$6A,$88,$B0,$D3    ; $A297  P1Save File}j.0S
        dfb $E5,$EC,$E5,$E3,$F4,$A0,$C2,$F5,$E6,$E6,$E5,$72,$B1,$45,$81,$B5    ; $A2A7  elect Buffer1E.5
        dfb $D3,$E5,$EC,$E6,$A0,$C9,$EE,$F3,$E5,$F2,$74,$CE,$16,$67,$AD,$D3    ; $A2B7  Self InsertN.g-S
        dfb $E5,$F4,$A0,$C3,$EF,$ED,$ED,$E5,$EE,$F4,$A0,$C3,$EF,$EC,$F5,$ED    ; $A2C7  et Comment Colum
        dfb $6E,$4A,$7E,$4A,$B4,$D3,$E5,$F4,$A0,$C7,$EF,$E1,$EC,$A0,$C3,$EF    ; $A2D7  nJ~J4Set Goal Co
        dfb $EC,$F5,$ED,$6E,$34,$7E,$9C,$B7,$D3,$E5,$F4,$A0,$CB,$E5,$79,$0F    ; $A2E7  lumn4~.7Set Key.
        dfb $7F,$35,$B1,$D3,$E5,$F4,$A0,$D0,$EF,$F0,$A0,$CD,$E1,$F2,$6B,$AB    ; $A2F7  .51Set Pop Mark+
        dfb $35,$1B,$B3,$D3,$E5,$F4,$A0,$D0,$F2,$E5,$E6,$E9,$78,$B7,$6C,$B3    ; $A307  5.3Set Prefix7l3
        dfb $B1,$D3,$E5,$F4,$A0,$D6,$E1,$F2,$E9,$E1,$E2,$EC,$65,$AF,$14,$E9    ; $A317  1Set Variable/.i
        dfb $AF,$D3,$F0,$E1,$E3,$E5,$C2,$E1,$72,$9F,$1F,$97,$AD,$D3,$F4,$E1    ; $A327  /SpaceBar...-Sta
        dfb $F2,$F4,$A0,$CB,$E2,$E4,$A0,$CD,$E1,$E3,$F2,$6F,$D9,$8B,$C5,$B7    ; $A337  rt Kbd MacroY.E7
        dfb $D3,$F4,$F2,$E9,$EE,$E7,$A0,$D3,$E5,$E1,$F2,$E3,$68,$90,$1B,$50    ; $A347  String Search..P
        dfb $B1,$D4,$E1,$E2,$A0,$C9,$EE,$F3,$E5,$F2,$74,$CC,$16,$67,$AD,$D4    ; $A357  1Tab InsertL.g-T
        dfb $E5,$F8,$F4,$A0,$CD,$EF,$E4,$65,$B1,$81,$6D,$B4,$D4,$EF,$F0,$A0    ; $A367  ext Mode1.m4Top 
        dfb $CC,$E5,$F6,$E5,$EC,$A0,$C1,$E2,$EF,$F2,$74,$F4,$1B,$91,$AF,$D4    ; $A377  Level Abortt../T
        dfb $F2,$E1,$EE,$F3,$F0,$EF,$F3,$E5,$A0,$C3,$E8,$E1,$F2,$E1,$E3,$F4    ; $A387  ranspose Charact
        dfb $E5,$F2,$73,$FA,$89,$4E,$AE,$D4,$F2,$E1,$EE,$F3,$F0,$EF,$F3,$E5    ; $A397  ersz.N.Transpose
        dfb $A0,$CC,$E9,$EE,$E5,$73,$7D,$8A,$6F,$AE,$D4,$F7,$EF,$A0,$D7,$E9    ; $A3A7   Lines}.o.Two Wi
        dfb $EE,$E4,$EF,$F7,$73,$23,$12,$3F,$B6,$D5,$EE,$AD,$CB,$E9,$EC,$6C    ; $A3B7  ndows#.?6Un-Kill
        dfb $ED,$4E,$F3,$B7,$D5,$EE,$CD,$E5,$F2,$EC,$E9,$EE,$E9,$FA,$65,$E0    ; $A3C7  mNs7UnMerlinize`
        dfb $78,$2C,$B0,$D5,$EE,$E9,$F6,$E5,$F2,$F3,$E1,$EC,$A0,$C1,$F2,$E7    ; $A3D7  x,0Universal Arg
        dfb $F5,$ED,$E5,$EE,$74,$1D,$7B,$BA,$AD,$D5,$F0,$A0,$C3,$EF,$ED,$ED    ; $A3E7  ument.{:-Up Comm
        dfb $E5,$EE,$F4,$A0,$CC,$E9,$EE,$65,$9E,$1E,$02,$B4,$D5,$F0,$A0,$D2    ; $A3F7  ent Line...4Up R
        dfb $E5,$E1,$EC,$A0,$CC,$E9,$EE,$65,$B7,$1B,$3B,$AB,$D5,$F0,$F0,$E5    ; $A407  eal Line7.;+Uppe
        dfb $F2,$E3,$E1,$F3,$E5,$A0,$C9,$EE,$E9,$F4,$E9,$E1,$6C,$7D,$36,$84    ; $A417  rcase Initial}6.
        dfb $AC,$D5,$F0,$F0,$E5,$F2,$E3,$E1,$F3,$E5,$A0,$D2,$E5,$E7,$E9,$EF    ; $A427  ,Uppercase Regio
        dfb $6E,$75,$8D,$B4,$B6,$D5,$F0,$F0,$E5,$F2,$E3,$E1,$F3,$E5,$A0,$D7    ; $A437  nu.46Uppercase W
        dfb $EF,$F2,$64,$60,$36,$40,$AC,$D6,$E9,$E5,$F7,$A0,$CB,$E2,$E4,$A0    ; $A447  ord`6@,View Kbd 
        dfb $CD,$E1,$E3,$F2,$6F,$A7,$8A,$F2,$B5,$D6,$E9,$F3,$E9,$F4,$A0,$C6    ; $A457  Macro'.r5Visit F
        dfb $E9,$EC,$65,$56,$67,$47,$AF,$D6,$E9,$F3,$E9,$F4,$A0,$D4,$E1,$E7    ; $A467  ileVgG/Visit Tag
        dfb $A0,$D4,$E1,$E2,$EC,$65,$49,$97,$CD,$B2,$D7,$E8,$E1,$F4,$A0,$C1    ; $A477   TableI.M2What A
        dfb $F6,$E1,$E9,$EC,$E1,$E2,$EC,$E5,$A0,$D3,$F0,$E1,$E3,$65,$13,$21    ; $A487  vailable Space.!
        dfb $98,$B4,$D7,$E8,$E1,$F4,$A0,$C3,$F5,$F2,$F3,$EF,$F2,$A0,$D0,$EF    ; $A497  .4What Cursor Po
        dfb $73,$48,$1C,$F5,$B0,$D7,$E8,$E1,$F4,$A0,$CB,$E5,$79,$E8,$7F,$86    ; $A4A7  sH.u0What Keyh..
        dfb $B2,$D7,$E8,$E1,$F4,$A0,$CC,$EF,$F3,$F3,$E1,$E7,$65,$CD,$1C,$BF    ; $A4B7  2What LossageM.?
        dfb $B3,$D7,$E8,$E1,$F4,$A0,$D4,$E1,$E7,$A0,$C6,$E9,$EC,$65,$D6,$94    ; $A4C7  3What Tag FileV.
        dfb $E9,$B2,$D7,$F2,$E9,$F4,$E5,$A0,$C6,$E9,$EC,$65,$CA,$69,$6A,$AF    ; $A4D7  i2Write FileJij/
        dfb $00,$00,$00,$EC,$EF,$E1,$E4,$A0,$E1,$A0,$EC,$E9,$E2,$F2,$E1,$F2    ; $A4E7  ...load a librar
        dfb $79    ; $A4F7  y
