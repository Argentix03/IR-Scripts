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
                                              B2. HKCU:\full\path"
try{
    auditpol /SET /subcategory:"Registry" /success:enable /failure:enable
}
catch [System.SystemException]{ write-host "High Permissions Required! Re-Run the script with a privileged user..." -ForegroundColor DarkRed }
$count=0
foreach($line in Get-Content registry.txt) {
	$count+=1
}
write-host "The script loaded registry paths = $count" -ForegroundColor blue
foreach($line in Get-Content registry.txt) {
	write-host "Path = $line" -ForegroundColor green
	try{
		$path = $line
		$user = 'Everyone'
		$auditRules = 'ReadKey,TakeOwnership'
		$inheritType = 'None'
		$propagationFlags = 'None'
		$auditType = 'Success'
		$rule = New-Object System.Security.AccessControl.RegistryAuditRule($user,$auditRules,$inheritType,$propagationFlags,$auditType)
		$acl = Get-Acl $path -Audit
		$acl.AddAuditRule($rule)
		Set-Acl -AclObject $acl -Path $path
		Start-Sleep -Seconds 1
		write-host (get-acl $line -audit).AuditToString -ForegroundColor magenta
	}
	catch [System.SystemException]{ write-host "RegistryKey Does not exist" -ForegroundColor red }
}
write-host "Done!" -ForegroundColor green

