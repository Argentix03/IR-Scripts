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
write-host "The following script will enable Auditing & Monitoring for the Event Viewer" -ForegroundColor blue
write-host "edr - for stations with edr on it" -ForegroundColor Yellow
write-host "dc - for dc server" -ForegroundColor Yellow
write-host "server - for Endpoint & Server" -ForegroundColor Yellow
$Userinput = Read-Host "What's your case?(edr,dc,server)"
if ($Userinput -eq "DC" -OR $Userinput -eq "dc" ) {
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
	$Userinput_for_enable = Read-Host "Do You want Enable all the Features(y/n)"
	if ($Userinput_for_enable -eq "y" -OR $Userinput_for_enable -eq "Y"){
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
		auditpol /SET /subcategory:"Kerberos Authentication Service" /success:enable /failure:enable
		write-host "Kerberos Authentication Service is On" -ForegroundColor green
		auditpol /SET /subcategory:"Kerberos Service Ticket Operations" /success:enable /failure:enable
		write-host "Kerberos Service Ticket Operations is On" -ForegroundColor green
		auditpol /SET /subcategory:"Credential Validation" /success:enable /failure:enable
		write-host "Credential Validation is On" -ForegroundColor green
		auditpol /SET /subcategory:"Security Group Management" /success:enable /failure:enable
		write-host "Security Group Management is On" -ForegroundColor green
		auditpol /SET /subcategory:"User Account Management" /success:enable
		write-host "User Account Management is On" -ForegroundColor green
		auditpol /SET /subcategory:"Computer Account Management" /success:enable
		write-host "Computer Account Management is On" -ForegroundColor green
		auditpol /SET /subcategory:"Directory Service Changes" /success:enable
		write-host "Directory Service Changes is On" -ForegroundColor green
		auditpol /SET /subcategory:"RPC Events" /failure:enable
		write-host "RPC Events is On" -ForegroundColor green
		auditpol /SET /subcategory:"Logoff" /success:enable
		write-host "Logoff is On" -ForegroundColor green
		auditpol /SET /subcategory:"Logon" /success:enable /failure:enable
		write-host "Logon is On" -ForegroundColor green
		auditpol /SET /subcategory:"Other Logon/Logoff Events" /success:enable /failure:enable
		write-host "Other Logon/Logoff Events is On" -ForegroundColor green
		auditpol /SET /subcategory:"Handle Manipulation" /success:enable
		write-host "Handle Manipulation is On" -ForegroundColor green
		auditpol /SET /subcategory:"Other Object Access Events" /success:enable /failure:enable
		write-host "Other Object Access Events is On" -ForegroundColor green
		write-host "Done!" -ForegroundColor green
	}else {write-host "No change was made" -ForegroundColor green}
}
#############################################################################################################################3
elseif ($Userinput -eq "server") {
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
		write-host "Endpoint & Server Configuration" -ForegroundColor Magenta
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
		$Userinput_for_enable = Read-Host "Do you want to enable all the Features(y/n)"
	if ($Userinput_for_enable -eq "y" -OR $Userinput_for_enable -eq "Y"){
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
		auditpol /SET /subcategory:"Security Group Management" /success:enable /failure:enable
		write-host "Security Group Management is On" -ForegroundColor green
		auditpol /SET /subcategory:"User Account Management" /success:enable
		write-host "User Account Management is On" -ForegroundColor green
		auditpol /SET /subcategory:"Audit Policy Change" /success:enable
		write-host "Audit Policy Change is On" -ForegroundColor green
		write-host "Done!" -ForegroundColor green
	}else {write-host "No change was made" -ForegroundColor green}
	
}
#############################################################################################################################
elseif ($Userinput -eq "EDR" || $Userinput -eq "edr") {
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
		
		$Userinput_for_enable = Read-Host "Do You want Enable all the Features(y/n)"
	if ($Userinput_for_enable -eq "y" || $Userinput_for_enable -eq "Y"){
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
		auditpol /SET /subcategory:"Process Creation" /success:enable /failure:enable
		write-host "Process Creation is On" -ForegroundColor green
		auditpol /SET /subcategory:"Process Termination" /success:enable
		write-host "Process Termination is On" -ForegroundColor green
		auditpol /SET /subcategory:"Registry" /success:enable /failure:enable
		write-host "Registry is On" -ForegroundColor green
		#auditpol /SET /subcategory:"User Account Management" /success:enable
		#write-host "Powershell Script Block Auditing is On" -ForegroundColor green
		write-host "Done!" -ForegroundColor green
	}else {write-host "No change was made" -ForegroundColor green}
		
		
}
else{write-host "Invalid input try to input 'edr' or 'dc' or 'server'" -ForegroundColor darkred}
