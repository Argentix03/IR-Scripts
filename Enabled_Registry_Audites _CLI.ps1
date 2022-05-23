clear
write-host "
    ___             ___ __  _                ___        __  ___            _ __             _            
   /   | __  ______/ (_) /_(_)___  ____ _   ( _ )      /  |/  /___  ____  (_) /_____  _____(_)___  ____ _
  / /| |/ / / / __  / / __/ / __ \/ __ `/  / __ \/|   / /|_/ / __ \/ __ \/ / __/ __ \/ ___/ / __ \/ __ `/
 / ___ / /_/ / /_/ / / /_/ / / / / /_/ /  / /_/  <   / /  / / /_/ / / / / / /_/ /_/ / /  / / / / / /_/ / 
/_/  |_\__,_/\__,_/_/\__/_/_/ /_/\__, /   \____/\/  /_/  /_/\____/_/ /_/_/\__/\____/_/  /_/_/ /_/\__, /  
                                /____/                                                          /____/   
			by The Room" -ForegroundColor Cyan
echo ""
write-host "The script was tested and audites all registry paths found in the 'registry.txt' file.
Please do make sure to run the script as follows:
1.  Run-as Administrator with Full permissions.
2.  Make sure the paths in the text file are:
   A. No Empty Lines.
   B1. HKLM:\full\path
   B2. HKCU:\full\path
3.  Make sure to execute the script from the same folder as the text file." -ForegroundColor Yellow
Read-Host "Press any key to continue..."
try{
    auditpol /SET /subcategory:"Registry" /success:enable /failure:enable
}
catch [System.SystemException]{ write-host "High Permissions Required! Re-Run the script with a privileged user..." -ForegroundColor DarkRed }
$count=0
foreach($line in Get-Content registry.txt) {
	$count+=1
}
write-host "The script loaded registry paths = $count" -ForegroundColor blue
Start-Sleep -s 2
	foreach($line in Get-Content registry.txt) {
		try {
		write-host "Path = $line" -ForegroundColor green 
		$path = $line 
		$user = 'Everyone' 
		$auditRules = 'ReadKey,TakeOwnership' 
		$inheritType = 'None' 
		$propagationFlags = 'None' 
		$auditType = 'Success' 
		$rule = New-Object System.Security.AccessControl.RegistryAuditRule($user,$auditRules,$inheritType,$propagationFlags,$auditType) 
		$acl = Get-Acl $path -Audit -ErrorAction SilentlyContinue
		$acl.AddAuditRule($rule) 
		Set-Acl -AclObject $acl -Path $path  
		Start-Sleep -Seconds 1 
		write-host (get-acl $line -audit).AuditToString -ForegroundColor magenta 
		}
			catch {
    Write-Host "An Error Occured - RegistryKey Does not exist" -ForegroundColor darkRED
	continue
}
	}

write-host "Done!" -ForegroundColor green

