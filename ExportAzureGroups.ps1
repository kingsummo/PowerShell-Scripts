Connect-AzureAD
 
$user = Read-Host "Enter the email of the user"
$usermemberships = Get-AzureADUsermembership -ObjectId $user
# Write-Output is much better than write-host
Write-Output $usermemberships.displayname | Sort
 
# best to disconnect when done to not hit AzureAD Session limit by always running connect-azuread
disconnect-azuread
 
# or use the oneliner
# (Get-AzureADUsermembership -ObjectId (Read-Host "Joshua.Somerfield@corp.nexon.com.au")).displayname | sort