#echo "auditpol /SET /subcategory:'Kerberos Authentication Service' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
#echo "auditpol /SET /subcategory:'Kerberos Authentication Service' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
clear
write-host "Endpoint & Server Configuration" -ForegroundColor Magenta
write-host "Account Management" -ForegroundColor Cyan
$one1=auditpol /get /subcategory:"Security Group Management"
$one2=$one1 | findstr "Success and Failure"
$one3=$one2.Length
if ($one3 -eq 61){
	write-host "Security Group Management is On Event ID = 4728-4731, 4733-4737" -ForegroundColor green
}else{
	write-host "Security Group Management is Off" -ForegroundColor red
	echo "auditpol /SET /subcategory:'Security Group Management' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
	echo "auditpol /SET /subcategory:'Security Group Management' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
}

$one1=auditpol /get /subcategory:"User Account Management"
$one2=$one1 | findstr "Success"
$one3=$one2.Length
if ($one3 -eq 49){
	write-host "User Account Management is On Event ID = 4737,4728" -ForegroundColor green
}else{
	write-host "User Account Management is Off" -ForegroundColor red
	echo "auditpol /SET /subcategory:'User Account Management' /success:enable" >> Need_to_Be_Enable.txt
	echo "auditpol /SET /subcategory:'User Account Management' /success:disable" >> Need_to_Be_Disable.txt
}

write-host "Policy Change" -ForegroundColor Cyan
$one1=auditpol /get /subcategory:"Audit Policy Change"
$one2=$one1 | findstr "Success"
$one3=$one2.Length
if ($one3 -eq 49){
	write-host "Audit Policy Change is On Event ID = 4742" -ForegroundColor green
}else{
	write-host "Audit Policy Change is Off" -ForegroundColor red
	echo "auditpol /SET /subcategory:'Audit Policy Change' /success:enable" >> Need_to_Be_Enable.txt
	echo "auditpol /SET /subcategory:'Audit Policy Change' /success:disable" >> Need_to_Be_Disable.txt
}

$Userinput_for_enable = Read-Host "Do You want Enable all(y/n)"
if ($Userinput_for_enable -eq "y" -OR $Userinput_for_enable -eq "Y"){
		$FileToDelete2 = "Need_to_Be_Enable.txt"
		if (Test-Path -Path $FileToDelete2) {
					foreach($line in Get-Content Need_to_Be_Enable.txt) {
					Invoke-Expression $line #| Out-Null 
					}
					clear
							write-host "Account Management" -ForegroundColor Cyan
							$one1=auditpol /get /subcategory:"Security Group Management"
							$one2=$one1 | findstr "Success and Failure"
							$one3=$one2.Length
							if ($one3 -eq 61){
								write-host "Security Group Management is On Event ID = 4728-4731, 4733-4737" -ForegroundColor green
							}else{
								write-host "Security Group Management is Off" -ForegroundColor red
							}

							$one1=auditpol /get /subcategory:"User Account Management"
							$one2=$one1 | findstr "Success"
							$one3=$one2.Length
							if ($one3 -eq 49){
								write-host "User Account Management is On Event ID = 4737,4728" -ForegroundColor green
							}else{
								write-host "User Account Management is Off" -ForegroundColor red
							}

							write-host "Policy Change" -ForegroundColor Cyan
							$one1=auditpol /get /subcategory:"Audit Policy Change"
							$one2=$one1 | findstr "Success"
							$one3=$one2.Length
							if ($one3 -eq 49){
								write-host "Audit Policy Change is On Event ID = 4742" -ForegroundColor green
							}else{
								write-host "Audit Policy Change is Off" -ForegroundColor red
							}
					
				
				$Userinput_for_enable = Read-Host "Do You want disable all(y/n)"
					if ($Userinput_for_enable -eq "y" -OR $Userinput_for_enable -eq "Y"){
							foreach($line in Get-Content Need_to_Be_Disable.txt) {
										Invoke-Expression $line | Out-Null 
										}
										clear
										write-host "Account Management" -ForegroundColor Cyan
										$one1=auditpol /get /subcategory:"Security Group Management"
										$one2=$one1 | findstr "Success and Failure"
										$one3=$one2.Length
										if ($one3 -eq 61){
											write-host "Security Group Management is On Event ID = 4728-4731, 4733-4737" -ForegroundColor green
										}else{
											write-host "Security Group Management is Off" -ForegroundColor red
										}

										$one1=auditpol /get /subcategory:"User Account Management"
										$one2=$one1 | findstr "Success"
										$one3=$one2.Length
										if ($one3 -eq 49){
											write-host "User Account Management is On Event ID = 4737,4728" -ForegroundColor green
										}else{
											write-host "User Account Management is Off" -ForegroundColor red
										}

										write-host "Policy Change" -ForegroundColor Cyan
										$one1=auditpol /get /subcategory:"Audit Policy Change"
										$one2=$one1 | findstr "Success"
										$one3=$one2.Length
										if ($one3 -eq 49){
											write-host "Audit Policy Change is On Event ID = 4742" -ForegroundColor green
										}else{
											write-host "Audit Policy Change is Off" -ForegroundColor red
										}
										write-host "Done to disable all" -ForegroundColor red
										$FileToDelete = "Need_to_Be_Disable.txt"
										$FileToDelete2 = "Need_to_Be_Enable.txt"

										if (Test-Path -Path $FileToDelete) {
											Remove-Item -Path $FileToDelete
										}
										if (Test-Path -Path $FileToDelete2) {
											Remove-Item -Path $FileToDelete2
										}
										exit
									
						
					}else {
							clear
							write-host "No disable was made" -ForegroundColor green
							write-host "Account Management" -ForegroundColor Cyan
							$one1=auditpol /get /subcategory:"Security Group Management"
							$one2=$one1 | findstr "Success and Failure"
							$one3=$one2.Length
							if ($one3 -eq 61){
								write-host "Security Group Management is On Event ID = 4728-4731, 4733-4737" -ForegroundColor green
							}else{
								write-host "Security Group Management is Off" -ForegroundColor red
							}

							$one1=auditpol /get /subcategory:"User Account Management"
							$one2=$one1 | findstr "Success"
							$one3=$one2.Length
							if ($one3 -eq 49){
								write-host "User Account Management is On Event ID = 4737,4728" -ForegroundColor green
							}else{
								write-host "User Account Management is Off" -ForegroundColor red
							}

							write-host "Policy Change" -ForegroundColor Cyan
							$one1=auditpol /get /subcategory:"Audit Policy Change"
							$one2=$one1 | findstr "Success"
							$one3=$one2.Length
							if ($one3 -eq 49){
								write-host "Audit Policy Change is On Event ID = 4742" -ForegroundColor green
							}else{
								write-host "Audit Policy Change is Off" -ForegroundColor red
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


