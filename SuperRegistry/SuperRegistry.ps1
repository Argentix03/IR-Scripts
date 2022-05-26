clear
write-host "
   _____                       _____            _     _              
  / ____|                     |  __ \          (_)   | |             
 | (___  _   _ _ __   ___ _ __| |__) |___  __ _ _ ___| |_ _ __ _   _ 
  \___ \| | | | '_ \ / _ \ '__|  _  // _ \/ _` | / __| __| '__| | | |
  ____) | |_| | |_) |  __/ |  | | \ \  __/ (_| | \__ \ |_| |  | |_| |
 |_____/ \__,_| .__/ \___|_|  |_|  \_\___|\__, |_|___/\__|_|   \__, |
              | |                          __/ |                __/ |
              |_|                         |___/                |___/ 
			 
			 " -ForegroundColor Magenta
			  
$ErrorActionPreference = "stop"
##################################################################################3
function Check-Administrator  
{  
    [OutputType([bool])]
    param()
    process {
        [Security.Principal.WindowsPrincipal]$user = [Security.Principal.WindowsIdentity]::GetCurrent();
        return $user.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator);
    }
}

if(-not (Check-Administrator))
{
    Write-Error "This script must be executed as Administrator.";
    exit 1;
}
####################################################################################################################################################################
$chaking_file1=Test-Path -Path Registry_Vaule_Missing.txt -PathType Leaf
$chaking_file2=Test-Path -Path Registry_Path_Missing.txt -PathType Leaf
$chaking_file3=Test-Path -Path Registry.txt -PathType Leaf
$chaking_file4=Test-Path -Path DB.txt -PathType Leaf
if ($chaking_file1 -eq "True"){
	write-host "[INF] File Exists - Registry_Vaule_Missing.txt - Need to be Deleted " -ForegroundColor Yellow
	
}elseif ($chaking_file1 -eq "False") {
	write-host "[INF] File DONT Exists - Registry_Vaule_Missing.txt " -ForegroundColor blue
}

if ($chaking_file2 -eq "True"){
	write-host "[INF] File Exists - Registry_Path_Missing.txt - Need to be Deleted" -ForegroundColor Yellow
	
}else {
	write-host "[INF] File DONT Exists - Registry_Path_Missing.txt " -ForegroundColor blue
}	
if ($chaking_file3 -eq "True"){
	write-host "[IMPORTED FILE] File Exists - Registry.txt " -ForegroundColor Green
	
}else{
	write-host "[IMPORTED FILE] File DONT Exists - Registry.txt" -ForegroundColor blue
	exit 1;
}if ($chaking_file4 -eq "True"){
	write-host "[IMPORTED FILE] File Exists - DB.txt " -ForegroundColor Green
	
}else{
	write-host "[IMPORTED FILE] File DONT Exists - DB.txt" -ForegroundColor blue
	exit 1;
}

$Userinput = Read-Host "Do you want to Deletd the Registry File?[Y/n]"
if ($Userinput -eq "Y") {
	rm -r Registry_Vaule_Missing.txt
	rm -r Registry_Path_Missing.txt
	clear
	write-host "
   _____                       _____            _     _              
  / ____|                     |  __ \          (_)   | |             
 | (___  _   _ _ __   ___ _ __| |__) |___  __ _ _ ___| |_ _ __ _   _ 
  \___ \| | | | '_ \ / _ \ '__|  _  // _ \/ _` | / __| __| '__| | | |
  ____) | |_| | |_) |  __/ |  | | \ \  __/ (_| | \__ \ |_| |  | |_| |
 |_____/ \__,_| .__/ \___|_|  |_|  \_\___|\__, |_|___/\__|_|   \__, |
              | |                          __/ |                __/ |
              |_|                         |___/                |___/ 
			 
			 " -ForegroundColor Magenta
}else{
	
}
####################################################################################################################################################################
Read-Host "Press any key to continue..."
$Userinput=Read-Host "GPO LCP:"

if ($Userinput -eq "lcp") {
	foreach($line in Get-Content Registry.txt) {
	$count+=1
}
echo "------------------------------------------------"
write-host "[INF] The script loaded $count Registry Paths" -ForegroundColor Green

$Registry_Key_Found=0
$Registry_Vaule_Missing=0
$Registry_Path_Missing=0


foreach($line in Get-Content Registry.txt) {
	$Inputstring = $line
	$CharArray = $InputString.Split(",")
	$RegistryPath = $CharArray[0] -replace "`t|`n|`r",""
	$RegistryName = $CharArray[1] -replace "`t|`n|`r",""
	Try 
	{
	Get-ItemProperty -Path "Registry::$RegistryPath" -Name $RegistryName | Out-Null
	$Registry_Key_Found+=1
	}
		
	Catch [System.Management.Automation.PSArgumentException]
	{
	$Registry_Vaule_Missing+=1
	}
	Catch [System.Management.Automation.ItemNotFoundException]
	{
	$Registry_Path_Missing+=1
	}
}
write-host "[INF]Total of Registry Key Found $Registry_Key_Found" -ForegroundColor blue
write-host "[INF]Total of Registry Vaule Missing  $Registry_Vaule_Missing" -ForegroundColor Yellow
write-host "[INF]Total of Registry Key Missing $Registry_Path_Missing" -ForegroundColor Red
####################################################################################################################################################################
echo "------------------------------------------------"
foreach($line in Get-Content Registry.txt) {
	$Inputstring = $line
	$CharArray = $InputString.Split(",")
	$RegistryPath = $CharArray[0] -replace "`t|`n|`r",""
	$RegistryName = $CharArray[1] -replace "`t|`n|`r",""
	Try 
	{
	Get-ItemProperty -Path "Registry::$RegistryPath" -Name $RegistryName | Out-Null
	write-host "[OK] Registry Vaule Found" -ForegroundColor Green -NoNewline 
	write-host ">>>"-NoNewline
	write-host "Vaule=$RegistryName" -ForegroundColor blue
	}
		
	Catch [System.Management.Automation.PSArgumentException]
	{
	write-host "[!] Registry Vaule Missing" -ForegroundColor Yellow -NoNewline
	write-host ">>>"-NoNewline
	write-host "Key=$RegistryPath Vaule=$RegistryName" -ForegroundColor blue
	"$RegistryPath,$RegistryName" >> Registry_Vaule_Missing.txt
	}
	Catch [System.Management.Automation.ItemNotFoundException]
	{
	write-host "[*] Registry Key itself is missing" -ForegroundColor Red -NoNewline
	write-host ">>>"-NoNewline
	write-host "Key=$RegistryPath" -ForegroundColor blue -NoNewline
	write-host " Vaule=$RegistryName" -ForegroundColor Cyan
	"$RegistryPath,$RegistryName" >> Registry_Path_Missing.txt
	}
}
####################################################################################################################################################################
$Userinput = Read-Host "Do you want to Enable it[Y/n]"
if ($Userinput -eq "Y") {
#Yellow
foreach($line in Get-Content Registry_Vaule_Missing.txt) {
	try{
	$Inputstring = $line
	$CharArray = $InputString.Split(",")
	$Registry_Vaule=$CharArray[1]
	
	$CharArray_for_deleted = $InputString.Split(":")
    $fullpath=$CharArray_for_deleted[-1]
	$filter1=$fullpath.Split(",")
    $pathwithoutpsic=$filter1[0]
    $filter2=$pathwithoutpsic.Split("\")
    $registry_Key_name=$filter2[-1]
    $hulf_Path=$pathwithoutpsic.Replace($registry_Key_name,'')
    $vauletoreflace=$filter2[0]
    $paths=$hulf_Path.Replace($vauletoreflace,'')
	
	foreach($line in Get-Content DB.txt) {
	$Inputstring = $line
	$CharArray = $InputString.Split(" ")
	$DB_Vaule = $CharArray[-5]
	if ($Registry_Vaule -eq $DB_Vaule){
		write-host "[INF] Success add the Vaule= $Registry_Vaule" -ForegroundColor Green
		Invoke-Expression $InputString >> testing.txt
		echo "Get-Item -Path HKLM:$paths$registry_Key_name | Remove-ItemProperty -Name $Registry_Vaule" >> DB_Deleted.txt
	}
	}
	
	}Catch {write-host "Need to be added Value manually >>> $Inputstring" -ForegroundColor Cyan} 
	
}
###############################################
#Yellow
foreach($line in Get-Content Registry_Path_Missing.txt) {
	try{
	$Inputstring = $line
	$CharArray = $InputString.Split(":")
    $fullpath=$CharArray[-1]
	$filter1=$fullpath.Split(",")
    $pathwithoutpsic=$filter1[0]
    $filter2=$pathwithoutpsic.Split("\")
    $registry_Key_name=$filter2[-1]
    $hulf_Path=$pathwithoutpsic.Replace($registry_Key_name,'')
    $vauletoreflace=$filter2[0]
    $paths=$hulf_Path.Replace($vauletoreflace,'')
	echo "Remove-Item -Path HKLM:$paths$registry_Key_name" >> DB3_Deleted.txt
	New-Item -Path HKLM:$paths -Name $registry_Key_name	>> testing.txt
    write-host "[INF] Success add the Key= $registry_Key_name" -ForegroundColor Green
	}Catch {write-host "Need to be added the Key manually >>> HKLM:$paths$registry_Key_name" -ForegroundColor Cyan} 
	
}
	rm -r testing.txt
	rm -r Registry_Vaule_Missing.txt
	rm -r Registry_Path_Missing.txt
}elseif ($Userinput -eq "n") {
    echo ""
}
else{write-host "Invalid input try to input y or n" -ForegroundColor darkred}
####################################################################################################################################################################
$Userinput = Read-Host "ReRun for make sure[Y/n]"
if ($Userinput -eq "Y") {
foreach($line in Get-Content Registry.txt) {
	$Inputstring = $line
	$CharArray = $InputString.Split(",")
	$RegistryPath = $CharArray[0] -replace "`t|`n|`r",""
	$RegistryName = $CharArray[1] -replace "`t|`n|`r",""
	Try 
	{
	Get-ItemProperty -Path "Registry::$RegistryPath" -Name $RegistryName | Out-Null 
	write-host "[OK] Registry Vaule Found" -ForegroundColor Green -NoNewline 
	write-host ">>>"-NoNewline
	write-host "Vaule=$RegistryName" -ForegroundColor blue
	}
		
	Catch [System.Management.Automation.PSArgumentException]
	{
	write-host "[!] Registry Vaule Missing" -ForegroundColor Yellow -NoNewline
	write-host ">>>"-NoNewline
	write-host "Key=$RegistryPath Vaule=$RegistryName" -ForegroundColor blue
	"$RegistryPath,$RegistryName" >> Registry_Vaule_Missing.txt
	}
	Catch [System.Management.Automation.ItemNotFoundException]
	{
	write-host "[*] Registry Key itself is missing" -ForegroundColor Red -NoNewline
	write-host ">>>"-NoNewline
	write-host "Key=$RegistryPath" -ForegroundColor blue -NoNewline
	write-host " Vaule=$RegistryName" -ForegroundColor Cyan
	"$RegistryPath,$RegistryName" >> Registry_Path_Missing.txt
	}
}	
	
}else{
	
}
$Userinput = Read-Host "Fix the Yellow[Y/n]"
if ($Userinput -eq "Y") {
	foreach($line in Get-Content Registry_Path_Missing.txt) {
	try{
	$Inputstring = $line
	$CharArray = $InputString.Split(":")
    $fullpath=$CharArray[-1]
	$filter1=$fullpath.Split(",")
    $pathwithoutpsic=$filter1[0]
    $filter2=$pathwithoutpsic.Split("\")
    $registry_Key_name=$filter2[-1]
    $hulf_Path=$pathwithoutpsic.Replace($registry_Key_name,'')
    $vauletoreflace=$filter2[0]
    $paths=$hulf_Path.Replace($vauletoreflace,'')
	echo "Remove-Item -Path HKLM:$paths$registry_Key_name" >> DB3_Deleted.txt
	New-Item -Path HKLM:$paths -Name $registry_Key_name	>> testing.txt
    write-host "[INF] Success add the Key= $registry_Key_name" -ForegroundColor Green
	}Catch {write-host "Need to be added the Key manually >>> HKLM:$paths$registry_Key_name" -ForegroundColor Cyan} 
}
	
}else{
	
}
$Userinput = Read-Host "Show lest Result[Y/n]"
if ($Userinput -eq "Y") {
	foreach($line in Get-Content Registry.txt) {
	$Inputstring = $line
	$CharArray = $InputString.Split(",")
	$RegistryPath = $CharArray[0] -replace "`t|`n|`r",""
	$RegistryName = $CharArray[1] -replace "`t|`n|`r",""
	Try 
	{
	Get-ItemProperty -Path "Registry::$RegistryPath" -Name $RegistryName | Out-Null 
	write-host "[OK] Registry Vaule Found" -ForegroundColor Green -NoNewline 
	write-host ">>>"-NoNewline
	write-host "Vaule=$RegistryName" -ForegroundColor blue
	}
		
	Catch [System.Management.Automation.PSArgumentException]
	{
	write-host "[!] Registry Vaule Missing" -ForegroundColor Yellow -NoNewline
	write-host ">>>"-NoNewline
	write-host "Key=$RegistryPath Vaule=$RegistryName" -ForegroundColor blue
	}
	Catch [System.Management.Automation.ItemNotFoundException]
	{
	write-host "[*] Registry Key itself is missing" -ForegroundColor Red -NoNewline
	write-host ">>>"-NoNewline
	write-host "Key=$RegistryPath" -ForegroundColor blue -NoNewline
	write-host " Vaule=$RegistryName" -ForegroundColor Cyan
	}
}
}else{
	
	
}


$Userinput = Read-Host "Undo[Y/n]"
if ($Userinput -eq "Y" -OR $Userinput -eq "y" ) {
	foreach($line in Get-Content DB_Deleted.txt) {
		
			Try {
			Invoke-Expression $line
			}
			Catch [System.Management.Automation.PSArgumentException]{write-host ""-NoNewline}
			Catch [System.Management.Automation.ItemNotFoundException]{write-host "" -NoNewline}
			Catch {write-host "" -NoNewline}
	
	}
	foreach($line in Get-Content DB3_Deleted.txt) {
		Try {
		Invoke-Expression $line
		}
		Catch [System.Management.Automation.PSArgumentException]{write-host ""-NoNewline}
		Catch [System.Management.Automation.ItemNotFoundException]{write-host "" -NoNewline}
		Catch {write-host "" -NoNewline}
		
	}
		rm -r DB3_Deleted.txt
		rm -r DB_Deleted.txt
		write-host "Done!" -ForegroundColor Gree 
		
}else{
		write-host "Done!" -ForegroundColor Gree 
	}
	

}elseif ($Userinput -eq "gpo"){
	write-host gpo
}

else{
	write-host "lcp or gpo!" -ForegroundColor Red
}
