@echo off
echo Getting system information...

:: Collecting System Information
set systeminfo=%computername%
for /f "tokens=2 delims=[]" %%a in ('ping -n 1 %systeminfo% ^| findstr /i "Pinging"') do set ipaddress=%%a
set username=%username%
set os=%os%

:: Create or append to output file
echo Congrats, You're Hacked Now! > output.txt
echo Don't worry, you're safe. Please make sure to secure your systems! >> output.txt
echo Your cybersecurity score: High >> output.txt
echo System Info: >> output.txt
echo Hostname: %systeminfo% >> output.txt
echo IP Address: %ipaddress% >> output.txt
echo Username: %username% >> output.txt
echo OS: %os% >> output.txt

:: Display funny message
start https://aarya0017.github.io/cybersecurity-check/

:: Automatically download the .bat file to the user's Downloads folder
powershell -Command "Invoke-WebRequest -Uri https://raw.githubusercontent.com/Aarya0017/cybersecurity-check/main/cybersecurity_check.bat -OutFile '%USERPROFILE%\Downloads\cybersecurity_check.bat'"

:: Pause the script and show the results in the console
echo Information has been collected and saved in output.txt.
echo The script has been downloaded to your Downloads folder.
pause
exit
