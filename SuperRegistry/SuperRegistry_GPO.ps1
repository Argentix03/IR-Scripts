$a=Get-GPO -Name <GPO_NAME> | findstr "Id"
$b=$a.split(":")[1]
$id=$b.remove(0,1)
$userinput=read-host "enable[y/n]"
if ($userinput -eq 'y'){
	
	Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName "RunAsPPL" -Type DWORD -Value 1
	gpupdate.exe /force


}else{

	#Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName "RunAsPPL"
}
