License Type: Exchange Plan 2
Enable-Mailbox AccountsPayable@corp.nexon.com.au -Archive
Enable-Mailbox AccountsPayable@corp.nexon.com.au -AutoExpandingArchive
Start-ManagedFolderAssistant -Identity AccountsPayable@corp.nexon.com.au

Note: Make sure retention policy is set in EAC


get-mailboxLocation –user ccavill@climatech.net.au | fl mailboxGuid,mailboxLocationType
