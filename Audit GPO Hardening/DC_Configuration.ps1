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
write-host "DC Configuration " -ForegroundColor Magenta
	write-host "Account Logon" -ForegroundColor Cyan
	$one1=auditpol /get /subcategory:"Kerberos Authentication Service"
	$one2=$one1 | findstr "Success and Failure"
	$one3=$one2.Length
	if ($one3 -eq 61){
		write-host "Kerberos Authentication Service is On Event ID = 4772-4768" -ForegroundColor green
	}else{
		write-host "Kerberos Authentication Service is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Kerberos Authentication Service' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Kerberos Authentication Service' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
	}

	$one1=auditpol /get /subcategory:"Kerberos Service Ticket Operations"
	$one2=$one1 | findstr "Success and Failure"
	$one3=$one2.Length
	if ($one3 -eq 61){
		write-host "Kerberos Service Ticket Operations is On Event ID = 4769" -ForegroundColor green
	}else{
		write-host "Kerberos Service Ticket Operations is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Kerberos Service Ticket Operations' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Kerberos Service Ticket Operations' /success:disable /failure:disable" >> Need_to_Be_Disable.txt

		
	}

	$one1=auditpol /get /subcategory:"Credential Validation"
	$one2=$one1 | findstr "Success and Failure"
	$one3=$one2.Length
	if ($one3 -eq 61){
		write-host "Credential Validation is On Event ID = 4776" -ForegroundColor green
	}else{
		write-host "Credential Validation is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Credential Validation' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Credential Validation' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
	}

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
		write-host "User Account Management is On Event ID = 4724, 4738" -ForegroundColor green
	}else{
		write-host "User Account Management is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'User Account Management' /success:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'User Account Management' /success:disable" >> Need_to_Be_Disable.txt
	}

	$one1=auditpol /get /subcategory:"Computer Account Management"
	$one2=$one1 | findstr "Success"
	$one3=$one2.Length
	if ($one3 -eq 49){
		write-host "Computer Account Management is On Event ID = 4742" -ForegroundColor green
	}else{
		write-host "Computer Account Management is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Computer Account Management' /success:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Computer Account Management' /success:disable" >> Need_to_Be_Disable.txt
	}

	write-host "Directory Service" -ForegroundColor Cyan
	$one1=auditpol /get /subcategory:"Directory Service Changes"
	$one2=$one1 | findstr "Success"
	$one3=$one2.Length
	if ($one3 -eq 49){
		write-host "Directory Service Changes is On Event ID = 5136" -ForegroundColor green
	}else{
		write-host "Directory Service Changes is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Directory Service Changes' /success:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Directory Service Changes' /success:disable" >> Need_to_Be_Disable.txt
	}

	write-host "Detailed Tracking" -ForegroundColor Cyan
	$one1=auditpol /get /subcategory:"RPC Events"
	$one2=$one1 | findstr "Failure"
	$one3=$one2.Length
	if ($one3 -eq 49){
		write-host "RPC Events is On Event ID = 5012" -ForegroundColor green
	}else{
		write-host "RPC Events is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'RPC Events' /failure:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'RPC Events' /failure:disable" >> Need_to_Be_Disable.txt
	}

	write-host "Logon/Logoff" -ForegroundColor Cyan
	$one1=auditpol /get /subcategory:"Account Lockout"
	$one2=$one1 | findstr "Success"
	$one3=$one2.Length
	if ($one3 -eq 49){
		write-host "Account Lockout is On Event ID = 4740" -ForegroundColor green
	}else{
		write-host "Account Lockout is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Account Lockout' /success:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Account Lockout' /success:disable" >> Need_to_Be_Disable.txt
	}

	$one1=auditpol /get /subcategory:"Logoff"
	$one2=$one1 | findstr "Success"
	$one3=$one2.Length
	if ($one3 -eq 49){
		write-host "Logoff is On Event ID = 4647" -ForegroundColor green
	}else{
		write-host "Logoff is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Logoff' /success:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Logoff' /success:disable" >> Need_to_Be_Disable.txt
	}

	$one1=auditpol /get /subcategory:"Logon"
	$one2=$one1 | findstr "Success and Failure"
	$one3=$one2.Length
	if ($one3 -eq 61){
		write-host "Logon is On Event ID = 4624,4625" -ForegroundColor green
	}else{
		write-host "Logon is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Logon' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Logon' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
	}

	$one1=auditpol /get /subcategory:"Other Logon/Logoff Events"
	$one2=$one1 | findstr "Success and Failure"
	$one3=$one2.Length
	if ($one3 -eq 61){
		write-host "Other Logon/Logoff Events is On Event ID = 4649, 4778-4779, 4800-4803, 5378, 5632-5633" -ForegroundColor green
	}else{
		write-host "Other Logon/Logoff Events is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Other Logon/Logoff Events' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Other Logon/Logoff Events' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
	}

	write-host "Object Access" -ForegroundColor Cyan
	$one1=auditpol /get /subcategory:"Handle Manipulation"
	$one2=$one1 | findstr "Success"
	$one3=$one2.Length
	if ($one3 -eq 49){
		write-host "Handle Manipulation is On Event ID = 4690" -ForegroundColor green
	}else{
		write-host "Handle Manipulation is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Handle Manipulation' /success:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Handle Manipulation' /success:disable" >> Need_to_Be_Disable.txt
	}

	$one1=auditpol /get /subcategory:"Other Object Access Events"
	$one2=$one1 | findstr "Success and Failure"
	$one3=$one2.Length
	if ($one3 -eq 61){
		write-host "Other Object Access Events is On Event ID = 4656, 4658, 4660, 4663, 4698" -ForegroundColor green
	}else{
		write-host "Other Object Access Events is Off" -ForegroundColor red
		echo "auditpol /SET /subcategory:'Other Object Access Events' /success:enable /failure:enable" >> Need_to_Be_Enable.txt
		echo "auditpol /SET /subcategory:'Other Object Access Events' /success:disable /failure:disable" >> Need_to_Be_Disable.txt
	}

$Userinput_for_enable = Read-Host "Do You want Enable all(y/n)"
if ($Userinput_for_enable -eq "y" -OR $Userinput_for_enable -eq "Y"){
		$FileToDelete2 = "Need_to_Be_Enable.txt"
		if (Test-Path -Path $FileToDelete2) {
					foreach($line in Get-Content Need_to_Be_Enable.txt) {
					Invoke-Expression $line #| Out-Null 
					}
					clear
						write-host "DC Configuration " -ForegroundColor Magenta
						write-host "Account Logon" -ForegroundColor Cyan
						$one1=auditpol /get /subcategory:"Kerberos Authentication Service"
						$one2=$one1 | findstr "Success and Failure"
						$one3=$one2.Length
						if ($one3 -eq 61){
							write-host "Kerberos Authentication Service is On Event ID = 4772-4768" -ForegroundColor green
						}else{
							write-host "Kerberos Authentication Service is Off" -ForegroundColor red
						}

						$one1=auditpol /get /subcategory:"Kerberos Service Ticket Operations"
						$one2=$one1 | findstr "Success and Failure"
						$one3=$one2.Length
						if ($one3 -eq 61){
							write-host "Kerberos Service Ticket Operations is On Event ID = 4769" -ForegroundColor green
						}else{
							write-host "Kerberos Service Ticket Operations is Off" -ForegroundColor red
						}

						$one1=auditpol /get /subcategory:"Credential Validation"
						$one2=$one1 | findstr "Success and Failure"
						$one3=$one2.Length
						if ($one3 -eq 61){
							write-host "Credential Validation is On Event ID = 4776" -ForegroundColor green
						}else{
							write-host "Credential Validation is Off" -ForegroundColor red
						}

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
							write-host "User Account Management is On Event ID = 4724, 4738" -ForegroundColor green
						}else{
							write-host "User Account Management is Off" -ForegroundColor red
						}

						$one1=auditpol /get /subcategory:"Computer Account Management"
						$one2=$one1 | findstr "Success"
						$one3=$one2.Length
						if ($one3 -eq 49){
							write-host "Computer Account Management is On Event ID = 4742" -ForegroundColor green
						}else{
							write-host "Computer Account Management is Off" -ForegroundColor red
						}

						write-host "Directory Service" -ForegroundColor Cyan
						$one1=auditpol /get /subcategory:"Directory Service Changes"
						$one2=$one1 | findstr "Success"
						$one3=$one2.Length
						if ($one3 -eq 49){
							write-host "Directory Service Changes is On Event ID = 5136" -ForegroundColor green
						}else{
							write-host "Directory Service Changes is Off" -ForegroundColor red
						}

						write-host "Detailed Tracking" -ForegroundColor Cyan
						$one1=auditpol /get /subcategory:"RPC Events"
						$one2=$one1 | findstr "Failure"
						$one3=$one2.Length
						if ($one3 -eq 49){
							write-host "RPC Events is On Event ID = 5012" -ForegroundColor green
						}else{
							write-host "RPC Events is Off" -ForegroundColor red
						}

						write-host "Logon/Logoff" -ForegroundColor Cyan
						$one1=auditpol /get /subcategory:"Account Lockout"
						$one2=$one1 | findstr "Success"
						$one3=$one2.Length
						if ($one3 -eq 49){
							write-host "Account Lockout is On Event ID = 4740" -ForegroundColor green
						}else{
							write-host "Account Lockout is Off" -ForegroundColor red
						}

						$one1=auditpol /get /subcategory:"Logoff"
						$one2=$one1 | findstr "Success"
						$one3=$one2.Length
						if ($one3 -eq 49){
							write-host "Logoff is On Event ID = 4647" -ForegroundColor green
						}else{
							write-host "Logoff is Off" -ForegroundColor red
						}

						$one1=auditpol /get /subcategory:"Logon"
						$one2=$one1 | findstr "Success and Failure"
						$one3=$one2.Length
						if ($one3 -eq 61){
							write-host "Logon is On Event ID = 4624,4625" -ForegroundColor green
						}else{
							write-host "Logon is Off" -ForegroundColor red
						}

						$one1=auditpol /get /subcategory:"Other Logon/Logoff Events"
						$one2=$one1 | findstr "Success and Failure"
						$one3=$one2.Length
						if ($one3 -eq 61){
							write-host "Other Logon/Logoff Events is On Event ID = 4649, 4778-4779, 4800-4803, 5378, 5632-5633" -ForegroundColor green
						}else{
							write-host "Other Logon/Logoff Events is Off" -ForegroundColor red
						}

						write-host "Object Access" -ForegroundColor Cyan
						$one1=auditpol /get /subcategory:"Handle Manipulation"
						$one2=$one1 | findstr "Success"
						$one3=$one2.Length
						if ($one3 -eq 49){
							write-host "Handle Manipulation is On Event ID = 4690" -ForegroundColor green
						}else{
							write-host "Handle Manipulation is Off" -ForegroundColor red
						}

						$one1=auditpol /get /subcategory:"Other Object Access Events"
						$one2=$one1 | findstr "Success and Failure"
						$one3=$one2.Length
						if ($one3 -eq 61){
							write-host "Other Object Access Events is On Event ID = 4656, 4658, 4660, 4663, 4698" -ForegroundColor green
						}else{
							write-host "Other Object Access Events is Off" -ForegroundColor red
						}
				
				$Userinput_for_enable = Read-Host "Do You want disable all(y/n)"
					if ($Userinput_for_enable -eq "y" -OR $Userinput_for_enable -eq "Y"){
							foreach($line in Get-Content Need_to_Be_Disable.txt) {
										Invoke-Expression $line | Out-Null 
										}
											clear
											write-host "DC Configuration " -ForegroundColor Magenta
											write-host "Account Logon" -ForegroundColor Cyan
											$one1=auditpol /get /subcategory:"Kerberos Authentication Service"
											$one2=$one1 | findstr "Success and Failure"
											$one3=$one2.Length
											if ($one3 -eq 61){
												write-host "Kerberos Authentication Service is On Event ID = 4772-4768" -ForegroundColor green
											}else{
												write-host "Kerberos Authentication Service is Off" -ForegroundColor red
											}

											$one1=auditpol /get /subcategory:"Kerberos Service Ticket Operations"
											$one2=$one1 | findstr "Success and Failure"
											$one3=$one2.Length
											if ($one3 -eq 61){
												write-host "Kerberos Service Ticket Operations is On Event ID = 4769" -ForegroundColor green
											}else{
												write-host "Kerberos Service Ticket Operations is Off" -ForegroundColor red
											}

											$one1=auditpol /get /subcategory:"Credential Validation"
											$one2=$one1 | findstr "Success and Failure"
											$one3=$one2.Length
											if ($one3 -eq 61){
												write-host "Credential Validation is On Event ID = 4776" -ForegroundColor green
											}else{
												write-host "Credential Validation is Off" -ForegroundColor red
											}

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
												write-host "User Account Management is On Event ID = 4724, 4738" -ForegroundColor green
											}else{
												write-host "User Account Management is Off" -ForegroundColor red
											}

											$one1=auditpol /get /subcategory:"Computer Account Management"
											$one2=$one1 | findstr "Success"
											$one3=$one2.Length
											if ($one3 -eq 49){
												write-host "Computer Account Management is On Event ID = 4742" -ForegroundColor green
											}else{
												write-host "Computer Account Management is Off" -ForegroundColor red
											}

											write-host "Directory Service" -ForegroundColor Cyan
											$one1=auditpol /get /subcategory:"Directory Service Changes"
											$one2=$one1 | findstr "Success"
											$one3=$one2.Length
											if ($one3 -eq 49){
												write-host "Directory Service Changes is On Event ID = 5136" -ForegroundColor green
											}else{
												write-host "Directory Service Changes is Off" -ForegroundColor red
											}

											write-host "Detailed Tracking" -ForegroundColor Cyan
											$one1=auditpol /get /subcategory:"RPC Events"
											$one2=$one1 | findstr "Failure"
											$one3=$one2.Length
											if ($one3 -eq 49){
												write-host "RPC Events is On Event ID = 5012" -ForegroundColor green
											}else{
												write-host "RPC Events is Off" -ForegroundColor red
											}

											write-host "Logon/Logoff" -ForegroundColor Cyan
											$one1=auditpol /get /subcategory:"Account Lockout"
											$one2=$one1 | findstr "Success"
											$one3=$one2.Length
											if ($one3 -eq 49){
												write-host "Account Lockout is On Event ID = 4740" -ForegroundColor green
											}else{
												write-host "Account Lockout is Off" -ForegroundColor red
											}

											$one1=auditpol /get /subcategory:"Logoff"
											$one2=$one1 | findstr "Success"
											$one3=$one2.Length
											if ($one3 -eq 49){
												write-host "Logoff is On Event ID = 4647" -ForegroundColor green
											}else{
												write-host "Logoff is Off" -ForegroundColor red
											}

											$one1=auditpol /get /subcategory:"Logon"
											$one2=$one1 | findstr "Success and Failure"
											$one3=$one2.Length
											if ($one3 -eq 61){
												write-host "Logon is On Event ID = 4624,4625" -ForegroundColor green
											}else{
												write-host "Logon is Off" -ForegroundColor red
											}

											$one1=auditpol /get /subcategory:"Other Logon/Logoff Events"
											$one2=$one1 | findstr "Success and Failure"
											$one3=$one2.Length
											if ($one3 -eq 61){
												write-host "Other Logon/Logoff Events is On Event ID = 4649, 4778-4779, 4800-4803, 5378, 5632-5633" -ForegroundColor green
											}else{
												write-host "Other Logon/Logoff Events is Off" -ForegroundColor red
											}

											write-host "Object Access" -ForegroundColor Cyan
											$one1=auditpol /get /subcategory:"Handle Manipulation"
											$one2=$one1 | findstr "Success"
											$one3=$one2.Length
											if ($one3 -eq 49){
												write-host "Handle Manipulation is On Event ID = 4690" -ForegroundColor green
											}else{
												write-host "Handle Manipulation is Off" -ForegroundColor red
											}

											$one1=auditpol /get /subcategory:"Other Object Access Events"
											$one2=$one1 | findstr "Success and Failure"
											$one3=$one2.Length
											if ($one3 -eq 61){
												write-host "Other Object Access Events is On Event ID = 4656, 4658, 4660, 4663, 4698" -ForegroundColor green
											}else{
												write-host "Other Object Access Events is Off" -ForegroundColor red
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
							write-host "DC Configuration " -ForegroundColor Magenta
								write-host "Account Logon" -ForegroundColor Cyan
								$one1=auditpol /get /subcategory:"Kerberos Authentication Service"
								$one2=$one1 | findstr "Success and Failure"
								$one3=$one2.Length
								if ($one3 -eq 61){
									write-host "Kerberos Authentication Service is On Event ID = 4772-4768" -ForegroundColor green
								}else{
									write-host "Kerberos Authentication Service is Off" -ForegroundColor red
								}

								$one1=auditpol /get /subcategory:"Kerberos Service Ticket Operations"
								$one2=$one1 | findstr "Success and Failure"
								$one3=$one2.Length
								if ($one3 -eq 61){
									write-host "Kerberos Service Ticket Operations is On Event ID = 4769" -ForegroundColor green
								}else{
									write-host "Kerberos Service Ticket Operations is Off" -ForegroundColor red
								}

								$one1=auditpol /get /subcategory:"Credential Validation"
								$one2=$one1 | findstr "Success and Failure"
								$one3=$one2.Length
								if ($one3 -eq 61){
									write-host "Credential Validation is On Event ID = 4776" -ForegroundColor green
								}else{
									write-host "Credential Validation is Off" -ForegroundColor red
								}

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
									write-host "User Account Management is On Event ID = 4724, 4738" -ForegroundColor green
								}else{
									write-host "User Account Management is Off" -ForegroundColor red
								}

								$one1=auditpol /get /subcategory:"Computer Account Management"
								$one2=$one1 | findstr "Success"
								$one3=$one2.Length
								if ($one3 -eq 49){
									write-host "Computer Account Management is On Event ID = 4742" -ForegroundColor green
								}else{
									write-host "Computer Account Management is Off" -ForegroundColor red
								}

								write-host "Directory Service" -ForegroundColor Cyan
								$one1=auditpol /get /subcategory:"Directory Service Changes"
								$one2=$one1 | findstr "Success"
								$one3=$one2.Length
								if ($one3 -eq 49){
									write-host "Directory Service Changes is On Event ID = 5136" -ForegroundColor green
								}else{
									write-host "Directory Service Changes is Off" -ForegroundColor red
								}

								write-host "Detailed Tracking" -ForegroundColor Cyan
								$one1=auditpol /get /subcategory:"RPC Events"
								$one2=$one1 | findstr "Failure"
								$one3=$one2.Length
								if ($one3 -eq 49){
									write-host "RPC Events is On Event ID = 5012" -ForegroundColor green
								}else{
									write-host "RPC Events is Off" -ForegroundColor red
								}

								write-host "Logon/Logoff" -ForegroundColor Cyan
								$one1=auditpol /get /subcategory:"Account Lockout"
								$one2=$one1 | findstr "Success"
								$one3=$one2.Length
								if ($one3 -eq 49){
									write-host "Account Lockout is On Event ID = 4740" -ForegroundColor green
								}else{
									write-host "Account Lockout is Off" -ForegroundColor red
								}

								$one1=auditpol /get /subcategory:"Logoff"
								$one2=$one1 | findstr "Success"
								$one3=$one2.Length
								if ($one3 -eq 49){
									write-host "Logoff is On Event ID = 4647" -ForegroundColor green
								}else{
									write-host "Logoff is Off" -ForegroundColor red
								}

								$one1=auditpol /get /subcategory:"Logon"
								$one2=$one1 | findstr "Success and Failure"
								$one3=$one2.Length
								if ($one3 -eq 61){
									write-host "Logon is On Event ID = 4624,4625" -ForegroundColor green
								}else{
									write-host "Logon is Off" -ForegroundColor red
								}

								$one1=auditpol /get /subcategory:"Other Logon/Logoff Events"
								$one2=$one1 | findstr "Success and Failure"
								$one3=$one2.Length
								if ($one3 -eq 61){
									write-host "Other Logon/Logoff Events is On Event ID = 4649, 4778-4779, 4800-4803, 5378, 5632-5633" -ForegroundColor green
								}else{
									write-host "Other Logon/Logoff Events is Off" -ForegroundColor red
								}

								write-host "Object Access" -ForegroundColor Cyan
								$one1=auditpol /get /subcategory:"Handle Manipulation"
								$one2=$one1 | findstr "Success"
								$one3=$one2.Length
								if ($one3 -eq 49){
									write-host "Handle Manipulation is On Event ID = 4690" -ForegroundColor green
								}else{
									write-host "Handle Manipulation is Off" -ForegroundColor red
								}

								$one1=auditpol /get /subcategory:"Other Object Access Events"
								$one2=$one1 | findstr "Success and Failure"
								$one3=$one2.Length
								if ($one3 -eq 61){
									write-host "Other Object Access Events is On Event ID = 4656, 4658, 4660, 4663, 4698" -ForegroundColor green
								}else{
									write-host "Other Object Access Events is Off" -ForegroundColor red
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


