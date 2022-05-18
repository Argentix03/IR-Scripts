clear
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
}else{
	
}
####################################################################################################################################################################
Read-Host "Press any key to continue..."
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
	$x=Get-ItemProperty -Path $RegistryPath -Name $RegistryName
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
	$x=Get-ItemProperty -Path $RegistryPath -Name $RegistryName
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

foreach($line in Get-Content Registry_Vaule_Missing.txt) {
	try{
	$Inputstring = $line
	$CharArray = $InputString.Split(",")
	$Registry_Vaule=$CharArray[1]
	
	foreach($line in Get-Content DB.txt) {
	$Inputstring = $line
	$CharArray = $InputString.Split(" ")
	$DB_Vaule = $CharArray[-5]
	if ($Registry_Vaule -eq $DB_Vaule){
		write-host "[INF] Success add the Vaule= $Registry_Vaule" -ForegroundColor Green
		Invoke-Expression $InputString >> testing.txt
	}
	}
	
	}Catch {write-host "Need to be added manually >>> $Inputstring" -ForegroundColor Cyan} 
	
}
rm -r testing.txt
}elseif ($Userinput -eq "n") {
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
		$x=Get-ItemProperty -Path $RegistryPath -Name $RegistryName
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
	
}
####################################################################################################################################################################
$Userinput = Read-Host "Programer[Y/n]"
if ($Userinput -eq "Y") {
	foreach($line in Get-Content DB_Deleted.txt) {
		
		
			Try {
			Invoke-Expression $line
			}
		
		Catch [System.Management.Automation.PSArgumentException]{write-host ""-NoNewline}
		Catch [System.Management.Automation.ItemNotFoundException]{write-host "" -NoNewline}
		Catch {write-host "" -NoNewline}
	
	}
	write-host "Done!" -ForegroundColor Gree

	}
####################################################################################################################################################################	
