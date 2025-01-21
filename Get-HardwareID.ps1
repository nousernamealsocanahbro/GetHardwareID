Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
Write-Host("Make sure you're connected to the internet and running as administrator or the script will fail")
Set-Location C:\ # for easier access
$SerialNumber = (Get-CimInstance Win32_BIOS).SerialNumber
$ComputerName = (Get-CimInstance Win32_ComputerSystem).Name
Install-PackageProvider -Name NuGet -Force | Out-Null 
Install-Script -Name Get-WindowsAutoPilotInfo -Force
Get-WindowsAutoPilotInfo.ps1 -OutputFile "$ComputerName-$SerialNumber-hash.csv"
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned