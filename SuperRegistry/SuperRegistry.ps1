$ErrorActionPreference = "stop"

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

foreach($line in Get-Content Registry.txt) {
	$count+=1
}
write-host "[INF] The script loaded $count Registry Paths" -ForegroundColor blue
foreach($line in Get-Content Registry.txt) {
	$Inputstring = $line
	$CharArray = $InputString.Split(",")
	$RegistryPath = $CharArray[0] -replace "`t|`n|`r",""
	$RegistryName = $CharArray[1] -replace "`t|`n|`r",""
	Try 
	{$x=Get-ItemProperty -Path $RegistryPath -Name $RegistryName
	write-host "[OK] $RegistryName Registry Key Found" -ForegroundColor Green}
		
	Catch [System.Management.Automation.PSArgumentException]
	{write-host "[!] $RegistryPath Registry Key Property missing - Not exist at path" -ForegroundColor Red}
	Catch [System.Management.Automation.ItemNotFoundException]
	{write-host "[*] $RegistryName Registry Key itself is missing" -ForegroundColor Yellow}
}
