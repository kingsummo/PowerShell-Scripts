get-aduser -filter * -Properties * | select displayname, status, title, samaccountname, userprincipalname, canonicalName, department, manager, vendor, lastlogon, whencreated 

Export certain attributes

Get-ADUser -filter * -Properties LastLogonDate,lastlogon | select name, lastlogon,LastLogonDate | export-csv -path c:\temp\lastlogin.csv

Export LastLogin
