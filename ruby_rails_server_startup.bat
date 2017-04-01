----redminstart.bat-----
@ECHO OFF
cd /D "D:\redmine3"
start cmd /k bundle exec rails server webrick -e production -b 127.0.0.1


-----redminstart.vbs------
Dim WinScriptHost
Set WinScriptHost = CreateObject("WScript.Shell")
WinScriptHost.Run Chr(34) & "D:\redmine3\redminstart.bat" & Chr(34), 0,True
Set WinScriptHost = Nothing
