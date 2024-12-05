@echo off
setlocal EnableDelayedExpansion

:: Get the IP address using PowerShell
for /f "delims=" %%i in ('powershell -NoProfile -Command "(Test-Connection -ComputerName (hostname) -Count 1).IPV4Address.IPAddressToString"') do set ip_address=%%i

:: Get the username (email) using the environment variable
set username=%USERNAME%

:: Define the server URL
set serverUrl=http://10.1.7.122:5000/capture-details

:: Prepare the data to send
set data={"ip":"%ip_address%","userAgent":"%username%","email":"%username%"}

:: Send the data to the server using PowerShell
powershell -NoProfile -Command "$data = [PSCustomObject]@{ip='%ip_address%'; userAgent='%username%'; email='%username%'}; $json = $data | ConvertTo-Json; Invoke-RestMethod -Uri '%serverUrl%' -Method Post -ContentType 'application/json' -Body $json"

echo Details captured successfully and sent to the server.
pause
