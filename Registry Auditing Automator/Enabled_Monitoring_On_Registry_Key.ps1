try{
    auditpol /SET /subcategory:"Registry" /success:enable /failure:enable | Out-Null
}
catch [System.SystemException]{ write-host "High Permissions Required! Re-Run the script with a privileged user..." -ForegroundColor DarkRed }
$count_Success=0
$count_False=0
foreach($line in Get-Content registry.txt) {
	$linewithouspasificstring=$line -replace ":",""
	"REG QUERY $linewithouspasificstring | $line" | Out-File -FilePath Test_Registry_Key.txt -Append
}
foreach($line in Get-Content Test_Registry_Key.txt) {
	$fertparm_for_testing_registry_key=$line.split("|")[0]
	$secdparm_to_enable__registry_key=$line.split("|")[1]
	$a=Invoke-Expression $fertparm_for_testing_registry_key 
	echo $a.Length
	if ( $a.Length -eq 0 ){
		write-host "Error system was unable to find the specified registry key or value $line" -ForegroundColor red
		"$fertparm_for_testing_registry_key" | Out-File -FilePath Error.txt -Append
		$count_False+=1
	}else{
		write-host "$line" -ForegroundColor Green
		$secdparm_to_enable__registry_key.remove(0, 1) | Out-File -FilePath OK.txt -Append
		$count_Secsess +=1
	}
}
clear
foreach($line in Get-Content OK.txt) {
	write-host "$line" -ForegroundColor green
	$line= $line.remove(0,1)
	$line= $line.remove($line.Length - 1,1)
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
clear
write-host "The script Success to enable monitoring on $count_Success registry Key" -ForegroundColor green 
write-host "The script Faile to enable monitoring on $count_False registry Key" -ForegroundColor RED 
$FileToDelete1= "Test_Registry_Key.txt"
$FileToDelete2 = "OK.txt"
$FileToDelete3 = "Error.txt"
if (Test-Path -Path $FileToDelete1) {
	Remove-Item -Path $FileToDelete
}
if (Test-Path -Path $FileToDelete2) {
	Remove-Item -Path $FileToDelete2
}
if (Test-Path -Path $FileToDelete3) {
	Remove-Item -Path $FileToDelete2
}
