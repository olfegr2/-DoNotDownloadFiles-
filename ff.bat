REM Last-�� ActivityView

@ECHO OFF

REM �������, ��࠭��� 䠩� � ����஢�� DOS-866 �� ���뫨
CHCP 866

REM ������ �� �୮� - ���ਣ���... ����� ��, 堪��� � �� ⠪��
COLOR A

CLS


REM ----------------------------------------------------------------------------------------
REM �஢�ઠ �� ����稥 �ࠢ ����������� 
FOR /F "tokens=1,2*" %%V IN ('bcdedit') DO SET adminTest=%%V
	IF (%adminTest%)==(�⪠����) GOTO errNoAdmin
	IF (%adminTest%)==(Access) GOTO errNoAdmin
REM ----------------------------------------------------------------------------------------


REM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

REM �� �롮� �㭪� 1 ��祣� �ᮡ� ���宣� �ந����, ��� ���짮��⥫�, �� ������.
REM �� ���� 㤠���� ��࠭���� ����� � ࠧ���� ���� ����� � �஢������ � ����ன�� �� ���� (ᯨ᮪\�᪨�� � �.�.)

REM �� �롮� �.�. 2-3
REM 1. �� ��ࢮ� ��१���㧪� ����-���� ���������� ����� Windows �.�. ����, ��᫥ ���, ����� �������� �ணࠬ� (� �.�. � ��⮧���㧪�)
REM    ��-�� 㤠����� 䠩��� ��⨬���樨 ����᪠ Prefetch � SuperFetch
REM 2. �㤥� 㤠���� ���ଠ�� � ����᪥ �ணࠬ� � ०��� ᮢ���⨬��� ��� � ����᪥ �� ����� �����������
REM    �� �� - �᫨ ���짮��⥫� ⠪�� �����砫 ��� 祣�-� � ����⠭���������� �����祭��� �⮣� ������
REM    ��� ������ � 㡥�� �� �ਯ� 㤠����� ������ �� ...AppCompatFlags\Layers
REM 3. �㤥� 㤠���� ����������� �� �⮣� ������ ���ଠ�� � �ந�����⥫쭮�� � �訡���
REM    ��, �᫨ � ⥪�騩 ������ � ������ �� ��ଠ�쭮 � ��� �� ���� "�������஢��� � 稭���", � ⮦� ��祣� ���譮��

REM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

REM ----------------------------------------------------------------------------------------
REM ���� �롮� ���짮��⥫�

ECHO.
ECHO �� ��易⥫쭮!
ECHO �� ����⥫쭮 ������� �� �ணࠬ�� � ����� 䠩�, �᫨ �� ����� � ⥪�⮢�� ।����, � ��᫥ �����襭�� - ��१���㧨����
ECHO.
ECHO.

REM ����� ���ଠ樨 ��⠭����, � �㤥� ⠪� �⮡ࠦ����� � �⨫��� NirSoft
ECHO 1 - ���⪠ �᭮���� ����� � ॥���

REM ������� ��, �� 㤠���� ����. 
REM (���� ��� ���ଠ�� �� �⨫�� NirSoft �ய����)
REM �� �⮬:
REM 1. ������� ���������� ᫥����� ����㧪� �� � ����, ��᫥ ���, ����� �������� �ணࠬ� (��-�� 㤠����� Perfect � SuperFetch)
REM 2. �������� ᢥ����� � ࠭�� �������� �訡��� (Minidump)
REM 3. � ���� "���" ������� ᯨ᮪ ࠭�� ����饭��� �ணࠬ�
REM 4. �㤥� ��饭 ᯨ᮪ �� �ணࠬ�, ��� ������ ���짮��⥫� ����� "����᪠�� � ०��� ᮢ���⨬��� ��� �� ����� �����������". 
REM	  (���� �㤥� �������� ��� ��� ᮢ���⨬���� ������)
ECHO 2 - ���⪠ ��� ����� � ॥���, 䠩��� Perfect � Minidump

REM ��. �.2 + ������� ࠭�� ����ᠭ�� ����� ��ୠ��� Windows
ECHO 3 - ���⪠ ��� �����, 䠩��� Perfect � ��ୠ��� Windows

ECHO ��� ������ ENTER ��� ��室�
ECHO.
SET /p doset="�롥�� ����⢨�: " 
ECHO.
REM ----------------------------------------------------------------------------------------


REM ----------------------------------------------------------------------------------------
REM �஢�ઠ �롮� ���짮��⥫�. �᫨ �� 1 � �� 2 � �� 3 - ��室
IF %doset% NEQ 1 (
	IF %doset% NEQ 2 (
		IF %doset% NEQ 3 EXIT
	)
)
REM ----------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM ���⪠ ��� ��ୠ��� Windows, �᫨ ���짮��⥫� ��ࠫ � ���� 3. �஢���� ���砫�, �⮡ � ����� �� ��⠫��� �맮��� wevtutil
REM �⨫��� NirSoft - LastActivityView
IF %doset% EQU 3 (
	ECHO.
	ECHO ������� ���� �������� Windows
	FOR /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
	ECHO.
	ECHO �믮�����
	ECHO.
)
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM ShellBag. ����� ����᪠ �ਫ������ � ����㯠 � ������, �易���� � "�����窮�"
REM �⨫��� NirSoft - LastActivityView, ExecutedProgramsList, ShellBagsView
ECHO.
ECHO ������� ������� ShellBag - ॥���
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\BagMRU" /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Bags" /f
ECHO.
REM ------------------------------------------------------------------------------------------

REM ------------------------------------------------------------------------------------------
REM Explorer. ����� ����᪠ �ਫ������ �易���� � "�஢�������"
ECHO.
ECHO ������� ������� Explorer - ॥���
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM ComDlg32. ����� �������� "������\��࠭���" � "��᫥���� ���� ���饭��"
REM �⨫��� NirSoft - LastActivityView
ECHO.
ECHO ������� ������� OpenSave � LastVisited - ॥���
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\FirstFolder" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /va /f
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy" /va /f
REM (�⨫��� NirSoft - OpenSaveFilesView)
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU"
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM �᫨ ���짮��⥫� ��ࠫ � ���� �� 1 �.�. 2 ��� 3
IF %doset% NEQ 1 (	
	REM UserAssist. ���⪠ ᯨ᮪� ����饭��� �ணࠬ� � ���� "���"
	REM �⨫��� NirSoft - UserAssistView
	ECHO.	
	ECHO ������� ������� UserAssist - ॥���
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
	REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"
	ECHO.
)


REM ------------------------------------------------------------------------------------------
REM AppCompatCache
ECHO.
ECHO ������� ������� AppCompatCache - ॥���
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\AppCompatCache" /va /f
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM DiagnosedApplications. �������⨪� ��祪 ����� � �ਫ������ �� Windows
ECHO.
ECHO ������� ������� DiagnosedApplications - ॥���
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications"
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM ����祭�� SID - �����䨪��� ������᭮�� ⥪�饣� ���짮��⥫� 
FOR /F "tokens=2" %%i IN ('whoami /user /fo table /nh') DO SET usersid=%%i
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM Search. ����� ���᪠ 
ECHO.
ECHO ������� ������� Search - ॥���
	REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps" /f
	REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps"
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM BAM. 
REM �� ����, �� ��१���㧪� ������� ᠬ�.  
REM �� ����� ᤥ���� �⤥��� bat � ����᪠��, ���ਬ��, ��᫥ ࠡ��� � portable-�ਫ�����ﬨ
ECHO.
ECHO ������� ������� �㦡� Background Activity Moderator - ॥���
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam\UserSettings\%usersid%" /va /f
REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\UserSettings\%usersid%" /va /f
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM AppCompatFlags
ECHO.
ECHO ������� ������� AppCompatFlags - ॥���
REM �⨫��� NirSoft - ExecutedProgramsList
REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /va /f

REM �᫨ ���짮��⥫� ��ࠫ � ���� �� 1 �.�. 2 ��� 3
IF %doset% NEQ 1 (
	REM ���᮪ �ணࠬ�, ��� ������ ����� "०�� ᮢ���⨬���" ��� "����᪠�� �� ���� �����������"
	REM �⨫��� NirSoft - AppCompatibilityView
	REG DELETE  "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /va /f
)
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM ����� "����஢����" ��᪮� � �.�. � TrueCrypt
ECHO.
ECHO ������� ������� MountedDevices - ॥���
ECHO.
REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f
REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2"
ECHO.
REM ------------------------------------------------------------------------------------------


REM ------------------------------------------------------------------------------------------
REM ���⪠ ᯨ᪮� ����ண� ���室�
ECHO.
REM �⨫��� NirSoft - JumpListsView, RecentFilesView
ECHO ������� ������� Recent - 䠩����� ��⥬�
DEL /f /q %APPDATA%\Microsoft\Windows\Recent\*.*
DEL /f /q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*.*
DEL /f /q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*.*
ECHO �믮�����
ECHO.
REM ------------------------------------------------------------------------------------------

REM ------------------------------------------------------------------------------------------
ECHO.
ECHO ������� ������� Panther - 䠩����� ��⥬�
DEL /f /q %systemroot%\Panther\*.*
ECHO �믮�����
ECHO.
REM ------------------------------------------------------------------------------------------

REM ------------------------------------------------------------------------------------------
ECHO.
ECHO ������� ������� AppCompat - 䠩����� ��⥬�
DEL /f /q %systemroot%\appcompat\Programs\*.dll
DEL /f /q %systemroot%\appcompat\Programs\*.exe
DEL /f /q %systemroot%\appcompat\Programs\*.txt
DEL /f /q %systemroot%\appcompat\Programs\*.xml
DEL /f /q %systemroot%\appcompat\Programs\Install\*.txt
DEL /f /q %systemroot%\appcompat\Programs\Install\*.xml
DEL /f /q %systemroot%\appcompat\Programs\Install\*.dll
DEL /f /q %systemroot%\appcompat\Programs\Install\*.exe
ECHO �믮�����
ECHO.
REM ----


REM ------------------------------------------------------------------------------------------
IF %doset% NEQ 1 (
	ECHO.
	REM Prefetch. �������� 䠩���, ��⨬�������� ����� �ਫ������. Windows � ᫥���騩 ࠧ ����㧨��� ���������
	REM �⨫��� NirSoft - LastActivityView, ExecutedProgramsList
	ECHO ������� ������� Prefetch - 䠩����� ��⥬�
	DEL /f /q %systemroot%\Prefetch\*.pf
	DEL /f /q %systemroot%\Prefetch\*.ini
	DEL /f /q %systemroot%\Prefetch\*.7db
	DEL /f /q %systemroot%\Prefetch\*.ebd
	DEL /f /q %systemroot%\Prefetch\*.bin
	REM SuperFetch. �������� ��� ��⨬���樨 SuperFetch
	DEL /f /q %systemroot%\Prefetch\*.db
	REM Trace. �������� 䠩��� ����஢��
	DEL /f /q %systemroot%\Prefetch\ReadyBoot\*.fx
	ECHO �믮�����
	ECHO.

	ECHO.
	ECHO ������� ������� Minidump - 䠩����� ��⥬�
	REM �������� ������ �訡��
	REM �⨫��� NirSoft - LastActivityView
	DEL /f /q %systemroot%\Minidump\*.*
	ECHO �믮�����
)
ECHO.
REM ------------------------------------------------------------------------------------------


PAUSE
EXIT

:do_clear
ECHO ���⪠ ��ୠ�� %1
wevtutil.exe cl %1
GOTO :eof

:errNoAdmin
COLOR 4
ECHO ����室��� �������� ��� �ਯ� �� ����� �����������
ECHO.
PAUSE