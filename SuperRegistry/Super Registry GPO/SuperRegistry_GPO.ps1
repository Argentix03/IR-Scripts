$Registry_Key_num=0
$count_Success=0
$count_Filed=0
$count_Disable=0
clear
$Policy_Name=read-host "Policy Name"
$UserInput=read-host "Enable or Disable[e|d]"
clear
$a=Get-GPO -Name $Policy_Name | findstr "Id"
$b=$a.split(":")[1]
$id=$b.remove(0,1)
foreach($line in Get-Content Enable.txt) {
	$Registry_Key_num+=1
}
write-host "Starting..." -ForegroundColor Green

if ($UserInput -eq 'e'){
	try{
		foreach($line in Get-Content Enable.txt) {
			Invoke-Expression $line | Out-Null
			$count_Success+=1	
			}
	}
	catch [UnableToRemovePolicyRegistryItem]{
		$count_Filed+=1
		continue
	}
	
}elseif ($UserInput -eq 'd'){
		foreach($line in Get-Content Disable.txt) {
		Invoke-Expression $line | Out-Null
		$count_Disable+=1
	}
}
clear
write-host "Policy Name = $Policy_Name" -ForegroundColor Green
write-host "Policy ID = $id" -ForegroundColor Green
write-host "Registry Key = $Registry_Key_num" -ForegroundColor Green
write-host "Success Add Key = $count_Success" -ForegroundColor Green
write-host "Filed Add Key = $count_Filed" -ForegroundColor Green
write-host "Disable Key = $count_Disable" -ForegroundColor Green
