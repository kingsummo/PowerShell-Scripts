THIS IS ONLY FOR O365 GROUPS

$CSVPath = "C:\Temp\AllGroupMembers.csv"
 
#Connect to Exchange Online
Connect-ExchangeOnline -ShowBanner:$False
 
#Remove the CSV file if exists
If(Test-Path $CSVPath) { Remove-Item $CSVPath}
 
#Get All Office 365 Groups
$O365Groups=Get-UnifiedGroup
ForEach ($Group in $O365Groups) 
{ 
    Write-Host "Group Name:" $Group.DisplayName -ForegroundColor Green
    Get-UnifiedGroupLinks -Identity $Group.Id -LinkType Members | Select DisplayName,PrimarySmtpAddress
 
    #Get Group Members and export to CSV
    Get-UnifiedGroupLinks -Identity $Group.Id -LinkType Members | Select-Object @{Name="Group Name";Expression={$Group.DisplayName}},`
         @{Name="User Name";Expression={$_.DisplayName}}, PrimarySmtpAddress | Export-CSV $CSVPath -NoTypeInformation -Append
}
  
#Disconnect Exchange Online
Disconnect-ExchangeOnline -Confirm:$False
