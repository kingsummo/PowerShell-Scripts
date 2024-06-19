$Result=@() 
$mailboxes = Get-Mailbox -ResultSize Unlimited
$totalmbx = $mailboxes.Count
$i = 1 
$mailboxes | ForEach-Object {
$i++
$mbx = $_
$mbs = Get-MailboxStatistics -Identity $mbx.UserPrincipalName | Select LastLogonTime
if ($mbs.LastLogonTime -eq $null){
$lt = "Never Logged In"
}else{
$lt = $mbs.LastLogonTime }
 
Write-Progress -activity "Processing $mbx" -status "$i out of $totalmbx completed"
 
$Result += New-Object PSObject -property @{ 
Name = $mbx.DisplayName
UserPrincipalName = $mbx.UserPrincipalName
LastLogonTime = $lt }
}
 
$Result | Export-CSV "C:\temp\O365-LastLogon-Info.csv" -NoTypeInformation -Encoding UTF8