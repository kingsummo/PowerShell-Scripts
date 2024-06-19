#Set Variables
$TenantAdminURL = "https://crescent-admin.sharepoint.com"
$EmailTo = "Salaudeen@crescent.com"
$AdminUserName = "Salaudeen@crescent.com"
$AdminPassword = "Password goes here"
$PercentageThreshold = 90
 
#Prepare the Credentials
$SecurePassword = ConvertTo-SecureString $AdminPassword -AsPlainText -Force
$Credential = new-object -typename System.Management.Automation.PSCredential -argumentlist $AdminUserName, $SecurePassword
  
#Connect to PnP Online
Connect-PnPOnline -Url $TenantAdminURL -Credentials $Credential
 
$CSSStyle = "<style>
table {font-family: Arial, Helvetica, sans-serif; border-collapse: collapse; width: 100%;}
table td, th {border: 1px solid #ddd; padding: 8px;}
table tr:nth-child(even){background-color: #f2f2f2;}
table tr:hover {background-color: #ddd;}
table th { padding-top: 12px; padding-bottom: 12px; text-align: left; background-color: #4CAF50; color: white;}
</style>"
 
#Collect Site usage data
$SiteStorageData = @()
ForEach($Site in (Get-PnPTenantSite))
{
    $SiteStorageData += New-Object PSObject -Property ([ordered]@{
        Title  = $Site.Title
        URL = $Site.URL
        Allocated = $Site.StorageMaximumLevel
        Used = $Site.StorageUsage
        Percentage = [math]::Round( ($Site.StorageUsage/$Site.StorageMaximumLevel*100),2)
    })
}
#Filter Sites with usage percentage exceeding given threshold
$SitesExceeding = $SiteStorageData | Where {$_.Percentage -gt $PercentageThreshold}
If($SitesExceeding -ne $Null)
{
    [string]$EmailBody = $SitesExceeding | ConvertTo-Html -Title "Crescent Inc. Storage Report" -Head $CSSStyle -PreContent "Sites Storage Report"
    #Send Email
    Send-PnPMail -To $EmailTo -Subject "Storage Report" -Body $EmailBody
}
