Import-Module GroupPolicy
# Run first

Get-GPO -All | Sort-Object displayname | Where-Object { If ( $_ | Get-GPOReport -ReportType XML | Select-String -NotMatch "<LinksTo>" ) {$_.DisplayName } }
# Run second