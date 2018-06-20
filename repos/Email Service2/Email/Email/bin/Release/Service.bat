@echo off
cd C:\Windows\Microsoft.NET\Framework\v4.0.30319
installutil.exe "C:\Users\Lenovo\source\repos\Email Service2\Email\Email\bin\Release\Email.exe"
TIMEOUT /T 5
sc start "EmailService"
TIMEOUT /T 45
sc stop "EmailService"
cd C:\Windows\Microsoft.NET\Framework\v4.0.30319
installutil.exe -u "C:\Users\Lenovo\source\repos\Email Service2\Email\Email\bin\Release\Email.exe"