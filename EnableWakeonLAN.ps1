set-executionpolicy -executionpolicy Bypass -Force
if (-not ((Get-WmiObject win32_bios).Manufacturer -like "Dell*")){
Write-host "Command must be run against a Dell computer" exit 1
}
if (-not (Get-Module -ListAvailable -Name DellSMBios)){
Install-Module -Name DellBiosProvider -Force
}
Import-Module DellBiosProvider
if(Test-Path dellsmbios:\PowerManagement\WakeOnLan){
Set-Item -Path dellsmbios:\PowerManagement\WakeOnLan LANOnly
}
else{
Write-host "Computer does not support WakeOnLAN"
}