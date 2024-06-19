# check signature settings
Get-MailboxMessageConfiguration -id charles.mcgregor-shaw@careflight.org | select *sig*
 
# Blank out signature value
Set-MailboxMessageConfiguration -id charles.mcgregor-shaw@careflight.org -SignatureHtml $null -SignatureText $null
 
# set values to use signature to none
Set-MailboxMessageConfiguration -id charles.mcgregor-shaw@careflight.org -AutoAddSignature $false -AutoAddSignatureOnMobile $false -AutoAddSignatureOnReply $false -UseDefaultSignatureOnMobile $false