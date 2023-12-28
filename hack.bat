@echo off 

netsh advfirewall firewall add rule name="Open SMB" dir=in action=allow protocol=TCP localport=445
sc start lanmanserver
netsh advfirewall set allprofiles state on
netsh advfirewall firewall add rule name="SMTP" dir=in action=allow protocol=TCP localport=25
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
netsh advfirewall firewall add rule name="Remote Desktop" dir=in protocol=TCP localport=3389 action=allow
sc start TermService

pause
