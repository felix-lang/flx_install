#define MyAppName "Felix"
#define MyAppVersion "2016.07.12-rc1"
#define MyAppPublisher "The Felix Developers"
#define MyAppURL "http://felix-lang.org/"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{864188DF-1CBE-4B0B-BF18-877ADAE2DD94}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={sd}\{#MyAppName}
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputDir=.
OutputBaseFilename=flx_setup
Compression=lzma
SolidCompression=yes
DisableWelcomePage=no
ChangesEnvironment=yes
ArchitecturesAllowed=x64
ArchitecturesInstallIn64BitMode=x64
UsePreviousAppDir=no

[Tasks]
Name: modifypath; Description: Add application directory to your path

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "win32binary\build\release\*"; Excludes: ".DS_Store"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
Name: "{group}\Felix Web Server"; Filename: "{app}\host\bin\flx_web.exe"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Registry]
Root: HKLM; Subkey: "SYSTEM\CurrentControlSet\Control\Session Manager\Environment"; ValueType: string; ValueName: "FLX_INSTALL_DIR"; ValueData: "{app}"; Flags: preservestringtype uninsdeletevalue

[Code]
const 
    ModPathName = 'modifypath'; 
    ModPathType = 'system'; 

function ModPathDir(): TArrayOfString; 
begin 
    setArrayLength(Result, 1) 
    Result[0] := ExpandConstant('{app}\host\bin'); 
end; 
#include "modpath.iss"
