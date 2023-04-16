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
write-host "Stage 1 - EventLog API" -ForegroundColor blue
$a = Get-WmiObject -Class win32_service -Filter "name = 'eventlog'" | select -exp Status
$q = Get-WmiObject -Class win32_service -Filter "name = 'eventlog'" | select -exp ProcessId
$w = Get-Process -Id $q | Select-Object -Property 'Threads'
$aws = $w.Threads | select -Property Id ,WaitReason
$y = $aws | select -exp WaitReason  | Measure-Object | select -exp Count
if ($a -eq 'Degraded'){
	
	write-host "Your EventLogs API was compromised" -ForegroundColor Red
	
}elseif ($y -lt 5)
{
    write-host "Your EventLogs API was compromised" -ForegroundColor Red

}elseif ($y -gt 5){
	write-host "Your EventLogs API OK" -ForegroundColor Green
}
write-host "Stage 2 - EventLog MAX size and Retention" -ForegroundColor blue
#Security
$a=REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Security" -v Retention
$b=$a[2]
$c=$b | findstr "0xffffffff"
$d=$c.Length
if ($d -eq 40){
    write-host "Your EventLogs was compromised" -ForegroundColor Red
	write-host "Your Security EventLogs was is on **Do not overwrite event**" -ForegroundColor Red
	REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Security" -v MaxSize
}else {
		write-host "Your Security EventLogs OK" -ForegroundColor green
}
#System
$a=REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\System" -v Retention
$b=$a[2]
$c=$b | findstr "0xffffffff"
$d=$c.Length
if ($d -eq 40){
    write-host "Your EventLogs was compromised" -ForegroundColor Red
	write-host "Your System EventLogs is on **Do not overwrite event**" -ForegroundColor Red
	REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\System" -v Retention
	REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\System" -v MaxSize
}else {
		write-host "Your System EventLogs OK" -ForegroundColor green
}
#Application
$a=REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" -v Retention
$b=$a[2]
$c=$b | findstr "0xffffffff"
$d=$c.Length
if ($d -eq 40){
    write-host "Your EventLogs was compromised" -ForegroundColor Red
	write-host "Your Application EventLogs was is on **Do not overwrite event**" -ForegroundColor Red
	REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" -v Retention
	REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventLog\Application" -v MaxSize
}else {
		write-host "Your Application EventLogs OK" -ForegroundColor green
}

write-host "More informations" -ForegroundColor Yellow
Get-eventLog -List
