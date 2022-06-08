clear
write-host "
    ___             ___ __  _                ___        __  ___            _ __             _            
   /   | __  ______/ (_) /_(_)___  ____ _   ( _ )      /  |/  /___  ____  (_) /_____  _____(_)___  ____ _
  / /| |/ / / / __  / / __/ / __ \/ __ `/  / __ \/|   / /|_/ / __ \/ __ \/ / __/ __ \/ ___/ / __ \/ __ `/
 / ___ / /_/ / /_/ / / /_/ / / / / /_/ /  / /_/  <   / /  / / /_/ / / / / / /_/ /_/ / /  / / / / / /_/ / 
/_/  |_\__,_/\__,_/_/\__/_/_/ /_/\__, /   \____/\/  /_/  /_/\____/_/ /_/_/\__/\____/_/  /_/_/ /_/\__, /  
                                /____/                                                          /____/   
			by ghosts621 & NordicWolfSlayer#1337" -ForegroundColor Cyan
echo ""
write-host "The following script will enable Auditing & Monitoring for the Event Viewer" -ForegroundColor blue
write-host "[1] EDR - for stations with missing EDR on it" -ForegroundColor Yellow
write-host "[2] DC - for dc server" -ForegroundColor Yellow
write-host "[3] PC - for Endpoint & Server" -ForegroundColor Yellow
$Userinput = Read-Host "1 , 2 , 3: "
if ($Userinput -eq 1) {
	
	.\Missing_EDR_Configuration.ps1

}elseif ($Userinput -eq 2) {
	
	.\DC_Configuration.ps1
	
}elseif ($Userinput -eq 3) {
	
	.\Endpoint_AND_Server_Configuration.ps1
	
}else{
	clear
	write-host "Help Menu" -ForegroundColor blue
	write-host "[1] EDR - for stations with missing EDR on it" -ForegroundColor Yellow
	write-host "[2] DC - for dc server" -ForegroundColor Yellow
	write-host "[3] PC - for Endpoint & Server" -ForegroundColor Yellow
}