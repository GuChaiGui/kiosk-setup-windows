@echo off

:: create new kiosk user 
:ADD_USER
set /p user="Enter an user name ( press enter to default name ): "
IF "%user%"=="" (SET user=kiosk)

set /p psd="Enter a password ( press enter to default password ): "
IF "%psd%"=="" (SET psd=Kiosk75008)

net user %user% %psd% /add

IF ERRORLEVEL 2 (
	ECHO "Try another one."
	GOTO :ADD_USER
)
IF ERRORLEVEL 0 (
    ECHO "%user% is created. The password is %psd% ."
    GOTO :NEXT
)



:NEXT
:: Set user as an admin
net localgroup "Administrateurs" %user% /add

:: Create a user profile in C:\Users\ file without logging in as the user
runas /env /profile /user:LAPTOP-DEV2\%user% cmd.exe

:: Config auto login in registry
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "AutoAdminLogon" /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultUserName" /t REG_SZ /d "%user%" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "DefaultPassword" /t REG_SZ /d "%psd%" /f


:: Config auto open the app in shell:startup
if not exist "C:\Users\%user%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" mkdir "C:\Users\%user%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
xcopy /s /h "C:\kiosk\winscript\kioskapp.lnk" "C:\Users\%user%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

:: reboot
SET /P yesno=Do you want to Reboot this machine? [Y/N]:
IF "%yesno%"=="y" GOTO Confirmation
IF "%yesno%"=="Y" GOTO Confirmation
IF "%yesno%"=="n" GOTO End
IF "%yesno%"=="N" GOTO End
    
:Confirmation
    
ECHO System is going to Reboot now
    
shutdown.exe /r 
    
GOTO EOF
:End
    
ECHO System Reboot cancelled
    
TIMEOUT 5 >nul
    
:EOF
exit