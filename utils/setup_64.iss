#define MyAppName "Infinium"
#define MyAppVersion "1.5.2.150"
#define MyAppPublisher "Infinium Developers"
#define MyAppURL "https://infinium.space"
#define MyAppExeName "infinium.exe"

[Setup]

AppId={{65FD6D06-3A2D-47FB-AA45-2B302C1C9D6E}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={pf64}\{#MyAppName}
DefaultGroupName={#MyAppName}
OutputBaseFilename=setup
Compression=lzma
SolidCompression=yes
ChangesAssociations=yes
ArchitecturesInstallIn64BitMode=x64
WizardImageFile=../../../../resources/installer_bg_164x313.bmp
;WizardSmallImageFile=../../../../resources/icon.bmp
PrivilegesRequired=poweruser
ArchitecturesAllowed=x64
;SetupIconFile=../../../../resources/app.ico
AppMutex=Infinium_instance
UninstallDisplayIcon={app}\{#MyAppExeName}


[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked
Name: "desktopicon\common"; Description: "For all users"; GroupDescription: "{cm:AdditionalIcons}"; Flags: exclusive
Name: "desktopicon\user"; Description: "For the current user only"; GroupDescription: "{cm:AdditionalIcons}";  Flags: exclusive unchecked


[Registry]
Root: HKCR; Subkey: ".dbl"; ValueType: string; ValueName: ""; ValueData: "InfiniumWalletDataFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "InfiniumWalletDataFile"; ValueType: string; ValueName: ""; ValueData: "Infinium Wallet's Data File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "InfiniumWalletDataKyesFile"; ValueType: string; ValueName: ""; ValueData: "Infinium Wallet's Keys File"; Flags: uninsdeletekey

Root: HKCR; Subkey: "InfiniumWalletDataFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\infinium.exe,0"
Root: HKCR; Subkey: "InfiniumWalletDataKyesFile\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\infinium.exe,0"

Root: HKCR; Subkey: "Infinium"; ValueType: string; ValueName: "URL Protocol"; ValueData: ""
Root: HKCR; Subkey: "Infinium\shell\open\command"; ValueType: string; ValueName: ""; ValueData: "{app}\infinium.exe --deeplink-params=%1"


[Files]

Source: "{#BinariesPath}\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs ignoreversion overwritereadonly replacesameversion
Source: "../../../../src/gui/qt-daemon/layout/html/*"; DestDir: "{app}\html"; Flags: ignoreversion recursesubdirs ignoreversion overwritereadonly replacesameversion
Source: "{#BinariesPath}\vc_redist.x64.exe"; DestDir: {tmp}; Flags: deleteafterinstall
Source: "..\..\..\..\resources\installer_bg_*.bmp"; Excludes: "*313.bmp"; Flags: dontcopy
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon\common
Name: "{userdesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon\user


[Run]
Filename: {app}\vc_redist.x64.exe; Parameters: "/install /quiet /norestart";  StatusMsg: Installing VC++ 2017 Redistributables...
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent shellexec

[UninstallDelete]
;This works only if it is installed in default location
Type: filesandordirs; Name: "{pf64}\{#MyAppName}"
;This works if it is installed in custom location
Type: files; Name: "{app}\*"; 
Type: filesandordirs; Name: "{app}"

; Choose the right wizard background image based on current windows font scale
; s.a.: https://stackoverflow.com/questions/26543603/inno-setup-wizardimagefile-looks-bad-with-font-scaling-on-windows-7
[Code]
function GetScalingFactor: Integer;
begin
  if WizardForm.Font.PixelsPerInch >= 144 then Result := 150
    else
  if WizardForm.Font.PixelsPerInch >= 120 then Result := 125
    else Result := 100;
end;

procedure LoadEmbededScaledBitmap(Image: TBitmapImage; NameBase: string);
var
  FileName: String;
begin
  ExtractTemporaryFile(NameBase);
  FileName := ExpandConstant('{tmp}\' + NameBase);
  Image.Bitmap.LoadFromFile(FileName);
  DeleteFile(FileName);
end;

procedure InitializeWizard;
begin
  { If using larger scaling, load the correct size of images }
  if GetScalingFactor = 125 then begin
    LoadEmbededScaledBitmap(WizardForm.WizardBitmapImage,  'installer_bg_191x385.bmp');
    LoadEmbededScaledBitmap(WizardForm.WizardBitmapImage2, 'installer_bg_191x385.bmp');
  end else if GetScalingFactor = 150 then begin
    LoadEmbededScaledBitmap(WizardForm.WizardBitmapImage,  'installer_bg_246x457.bmp');
    LoadEmbededScaledBitmap(WizardForm.WizardBitmapImage2, 'installer_bg_246x457.bmp');
  end;

end;

