File Type: ps1

#bitlocker_get_encryption_status Description : bitlocker_get_encryption_status 

if(manage-bde -status -protectionaserrorlevel){
manage-bde -status
Write-host "Bitlocker is not active on this computer" -ForegroundColor Yellow
}
else{

manage-bde -status
Write-host "Bitlocker is active on this computer" -ForegroundColor Yellow
}