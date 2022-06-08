#echo "auditpol /SET /subcategory:'Kerberos Authentication Service' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
#echo "auditpol /SET /subcategory:'Kerberos Authentication Service' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
$FileToDelete = "Need_to_Be_Disable.txt"
$FileToDelete2 = "Need_to_Be_Enable.txt"

if (Test-Path -Path $FileToDelete) {
	Remove-Item -Path $FileToDelete
}
if (Test-Path -Path $FileToDelete2) {
	Remove-Item -Path $FileToDelete2
}
clear
write-host "Missing EDR Configuration" -ForegroundColor Magenta
write-host "Detailed Tracking" -ForegroundColor Cyan
$one1=auditpol /get /subcategory:"Process Creation"
$one2=$one1 | findstr "Success and Failure"
$one3=$one2.Length
if ($one3 -eq 61){
	write-host "Process Creation is On Event ID = 4688" -ForegroundColor green
}else{
	write-host "Process Creation is Off" -ForegroundColor red
	echo "auditpol /SET /subcategory:'Process Creation' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
	echo "auditpol /SET /subcategory:'Process Creation' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
}

$one1=auditpol /get /subcategory:"Process Termination"
$one2=$one1 | findstr "Success"
$one3=$one2.Length
if ($one3 -eq 49){
	write-host "Process Termination is On Event ID = 4689" -ForegroundColor green
}else{
	write-host "Process Termination is Off" -ForegroundColor red
	echo "auditpol /SET /subcategory:'Process Termination' /success:enable" >> Need_to_Be_Enable.txt
	echo "auditpol /SET /subcategory:'Process Termination' /success:disable" >> Need_to_Be_Disable.txt
}

write-host "Object Access" -ForegroundColor Cyan
$one1=auditpol /get /subcategory:"Registry"
$one2=$one1 | findstr "Success and Failure"
$one3=$one2.Length
if ($one3 -eq 61){
	write-host "Registry is On Event ID = 4657-4670" -ForegroundColor green
}else{
	write-host "Registry is Off" -ForegroundColor red
	echo "auditpol /SET /subcategory:'Registry' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
	echo "auditpol /SET /subcategory:'Registry' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
}

write-host "Powershell Script Auditing" -ForegroundColor Cyan
$one1=reg query HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging /f EnableScriptBlockLogging
$one2=$one1 | findstr "0x1"
$one3=$one2.Length
if ($one3 -eq 48){
	write-host "Powershell Script Block Auditing is On" -ForegroundColor green
}else{
	write-host "Powershell Script Block Auditing is Off" -ForegroundColor red
	echo "Get-Item -Path 'HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging' | Remove-Item -Force" >> Need_to_Be_Disable.txt
}
write-host "Command Line Auditing" -ForegroundColor Cyan
$one1=reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit /f ProcessCreationIncludeCmdLine_Enabled
$one2=$one1 | findstr "0x1"
$one3=$one2.Length
if ($one3 -eq 61){
	write-host "Command Line Auditing is On" -ForegroundColor green
}else{
	write-host "Command Line Auditing is Off" -ForegroundColor red
	echo "New-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit' -Name ProcessCreationIncludeCmdLine_Enabled -Value 1 -PropertyType 'DWORD'" >> Need_to_Be_Enable.txt
	echo "Remove-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit' -Name 'ProcessCreationIncludeCmdLine_Enabled'" >> Need_to_Be_Disable.txt
}

$Userinput_for_enable = Read-Host "Do You want Enable all(y/n)"
if ($Userinput_for_enable -eq "y" -OR $Userinput_for_enable -eq "Y"){
		$FileToDelete2 = "Need_to_Be_Enable.txt"
		if (Test-Path -Path $FileToDelete2) {
					foreach($line in Get-Content Need_to_Be_Enable.txt) {
					Invoke-Expression $line #| Out-Null 
					}
					New-Item -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Force | Out-Null # powershell
					Set-ItemProperty -Path "HKLM:\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging" -Name "EnableScriptBlockLogging" -Value 1 -Force | Out-Null # powershell
					clear
					write-host "Missing EDR Configuration" -ForegroundColor Magenta
					write-host "Detailed Tracking" -ForegroundColor Cyan
					$one1=auditpol /get /subcategory:"Process Creation"
					$one2=$one1 | findstr "Success and Failure"
					$one3=$one2.Length
					if ($one3 -eq 61){
						write-host "Process Creation is On Event ID = 4688" -ForegroundColor green
					}else{
						write-host "Process Creation is Off" -ForegroundColor red
					}

					$one1=auditpol /get /subcategory:"Process Termination"
					$one2=$one1 | findstr "Success"
					$one3=$one2.Length
					if ($one3 -eq 49){
						write-host "Process Termination is On Event ID = 4689" -ForegroundColor green
					}else{
						write-host "Process Termination is Off" -ForegroundColor red
					}

					write-host "Object Access" -ForegroundColor Cyan
					$one1=auditpol /get /subcategory:"Registry"
					$one2=$one1 | findstr "Success and Failure"
					$one3=$one2.Length
					if ($one3 -eq 61){
						write-host "Registry is On Event ID = 4657-4670" -ForegroundColor green
					}else{
						write-host "Registry is Off" -ForegroundColor red
					}

					write-host "Powershell Script Auditing" -ForegroundColor Cyan
					$one1=reg query HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging /f EnableScriptBlockLogging
					$one2=$one1 | findstr "0x1"
					$one3=$one2.Length
					if ($one3 -eq 48){
						write-host "Powershell Script Block Auditing is On" -ForegroundColor green
					}else{
						write-host "Powershell Script Block Auditing is Off" -ForegroundColor red
						
					}
					write-host "Command Line Auditing" -ForegroundColor Cyan
					$one1=reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit /f ProcessCreationIncludeCmdLine_Enabled
					$one2=$one1 | findstr "0x1"
					$one3=$one2.Length
					if ($one3 -eq 61){
						write-host "Command Line Auditing is On" -ForegroundColor green
					}else{
						write-host "Command Line Auditing is Off" -ForegroundColor red
					}
				
				$Userinput_for_enable = Read-Host "Do You want disable all(y/n)"
					if ($Userinput_for_enable -eq "y" -OR $Userinput_for_enable -eq "Y"){
							foreach($line in Get-Content Need_to_Be_Disable.txt) {
										Invoke-Expression $line | Out-Null 
										}
										$FileToDelete = "Need_to_Be_Disable.txt"
										$FileToDelete2 = "Need_to_Be_Enable.txt"
										if (Test-Path -Path $FileToDelete) {
											Remove-Item -Path $FileToDelete
										}
										if (Test-Path -Path $FileToDelete2) {
											Remove-Item -Path $FileToDelete2
										}
											clear
											write-host "Missing EDR Configuration" -ForegroundColor Magenta
											write-host "Detailed Tracking" -ForegroundColor Cyan
											$one1=auditpol /get /subcategory:"Process Creation"
											$one2=$one1 | findstr "Success and Failure"
											$one3=$one2.Length
											if ($one3 -eq 61){
												write-host "Process Creation is On Event ID = 4688" -ForegroundColor green
											}else{
												write-host "Process Creation is Off" -ForegroundColor red
											}

											$one1=auditpol /get /subcategory:"Process Termination"
											$one2=$one1 | findstr "Success"
											$one3=$one2.Length
											if ($one3 -eq 49){
												write-host "Process Termination is On Event ID = 4689" -ForegroundColor green
											}else{
												write-host "Process Termination is Off" -ForegroundColor red
											}

											write-host "Object Access" -ForegroundColor Cyan
											$one1=auditpol /get /subcategory:"Registry"
											$one2=$one1 | findstr "Success and Failure"
											$one3=$one2.Length
											if ($one3 -eq 61){
												write-host "Registry is On Event ID = 4657-4670" -ForegroundColor green
											}else{
												write-host "Registry is Off" -ForegroundColor red
											}

											write-host "Powershell Script Auditing" -ForegroundColor Cyan
											$one1=reg query HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging /f EnableScriptBlockLogging
											$one2=$one1 | findstr "0x1"
											$one3=$one2.Length
											if ($one3 -eq 48){
												write-host "Powershell Script Block Auditing is On" -ForegroundColor green
											}else{
												write-host "Powershell Script Block Auditing is Off" -ForegroundColor red
											}
											write-host "Command Line Auditing" -ForegroundColor Cyan
											$one1=reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit /f ProcessCreationIncludeCmdLine_Enabled
											$one2=$one1 | findstr "0x1"
											$one3=$one2.Length
											if ($one3 -eq 61){
												write-host "Command Line Auditing is On" -ForegroundColor green
											}else{
												write-host "Command Line Auditing is Off" -ForegroundColor red
											}
										write-host "Done to disable all" -ForegroundColor red
										exit
									
						
					}else {
							clear
							write-host "No disable was made" -ForegroundColor green
							write-host "Missing EDR Configuration" -ForegroundColor Magenta
							write-host "Detailed Tracking" -ForegroundColor Cyan
							$one1=auditpol /get /subcategory:"Process Creation"
							$one2=$one1 | findstr "Success and Failure"
							$one3=$one2.Length
							if ($one3 -eq 61){
								write-host "Process Creation is On Event ID = 4688" -ForegroundColor green
							}else{
								write-host "Process Creation is Off" -ForegroundColor red
							}

							$one1=auditpol /get /subcategory:"Process Termination"
							$one2=$one1 | findstr "Success"
							$one3=$one2.Length
							if ($one3 -eq 49){
								write-host "Process Termination is On Event ID = 4689" -ForegroundColor green
							}else{
								write-host "Process Termination is Off" -ForegroundColor red
							}

							write-host "Object Access" -ForegroundColor Cyan
							$one1=auditpol /get /subcategory:"Registry"
							$one2=$one1 | findstr "Success and Failure"
							$one3=$one2.Length
							if ($one3 -eq 61){
								write-host "Registry is On Event ID = 4657-4670" -ForegroundColor green
							}else{
								write-host "Registry is Off" -ForegroundColor red
							}
							write-host "Powershell Script Auditing" -ForegroundColor Cyan
							$one1=reg query HKLM\SOFTWARE\Wow6432Node\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging /f EnableScriptBlockLogging
							$one2=$one1 | findstr "0x1"
							$one3=$one2.Length
							if ($one3 -eq 48){
								write-host "Powershell Script Block Auditing is On" -ForegroundColor green
							}else{
								write-host "Powershell Script Block Auditing is Off" -ForegroundColor red
							}
							write-host "Command Line Auditing" -ForegroundColor Cyan
							$one1=reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit /f ProcessCreationIncludeCmdLine_Enabled
							$one2=$one1 | findstr "0x1"
							$one3=$one2.Length
							if ($one3 -eq 61){
								write-host "Command Line Auditing is On" -ForegroundColor green
							}else{
								write-host "Command Line Auditing is Off" -ForegroundColor red
							}
							
						}
		}else {
			write-host "You are all set :)" -ForegroundColor green
			exit
			
		}

}else {
	write-host "OK Bay Bay" -ForegroundColor green
	exit
}
$FileToDelete = "Need_to_Be_Disable.txt"
$FileToDelete2 = "Need_to_Be_Enable.txt"

if (Test-Path -Path $FileToDelete) {
	Remove-Item -Path $FileToDelete
}
if (Test-Path -Path $FileToDelete2) {
	Remove-Item -Path $FileToDelete2
}


















