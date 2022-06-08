$a=Get-GPO -Name <scriptname> | findstr "Id"
$b=$a.split(":")[1]
$id=$b.remove(0,1)
echo $id
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -ValueName DisableEmailScanning -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName RunAsPPL -Value 1 -Type "DWORD" 
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -ValueName EnumerateAdministrators -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" -ValueName AlwaysInstallElevated -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName NoAutorun -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" -ValueName AllowBasic -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -ValueName AllowBasic -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -ValueName fAllowToGetHelp -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName NoDriveTypeAutoRun -Value 255 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -ValueName NC_AllowNetBridge_NLA -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" -ValueName NoAutoplayfornonVolume -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -ValueName DisableIPSourceRouting -Value 2 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName DisableDomainCreds -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -ValueName RequireSecuritySignature -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -ValueName AllowLocalIPsecPolicyMerge -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Download" -ValueName RunInvalidSignatures -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext" -ValueName VersionCheckEnabled -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -ValueName AllowLocalPolicyMerge -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName PasswordManagerEnabled -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName LocalAccountTokenFilterPolicy -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\FVE" -ValueName MinimumPIN -Value 10 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -ValueName NC_ShowSharedAccessUI -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName BackgroundModeEnabled -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -ValueName fAllowUnsolicited -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\policies\Microsoft\office\16.0\common\officeupdate" -ValueName hideenabledisableupdates -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName LmCompatibilityLevel -Value 5 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -ValueName NC_StdDomainUserSetLocation -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\policies\Microsoft\office\16.0\common\officeupdate" -ValueName enableautomaticupdates -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -ValueName SecurityLayer -Value 2 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\lanmanworkstation" -ValueName AllowInsecureGuestAuth -Value 0bEnableFlash -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Adobe\Adobe Acrobat\11.0\FeatureLockDown" -ValueName bEnableFlash -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Adobe\Adobe Acrobat\11.0\FeatureLockDown" -ValueName bDisableJavaScript -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Adobe\Acrobat\2017\FeatureLockDown" -ValueName bDisableJavaScript -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName RestrictAnonymousSAM -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName LimitBlankPasswordUse -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName AllowOutdatedPlugins -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName DefaultPluginsSetting -Value 3 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest" -ValueName UseLogonCredential -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -ValueName DisableEmailScanning -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName ConsentPromptBehaviorUser -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" -ValueName EnableControlledFolderAccess -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName RestrictAnonymous -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\FVE" -ValueName UseAdvancedStartup -Value 4 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" -ValueName DisableIPSourceRouting -Value 2 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" -ValueName DisableNotifications -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" -ValueName DisableNotifications -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -ValueName DisableNotifications -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName BlockThirdPartyCookies -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft Services\AdmPwd" -ValueName AdmPwdEnabled -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\mrxsmb10" -ValueName Start -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -ValueName DisablePasswordChange -Value 0 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" -ValueName RestrictNullSessAccess -Value 1 -Type "DWORD"
	#Set-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -ValueName DisableIOAVProtection -Value 0 -Type "DWORD"
	gpupdate.exe /force
	
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -ValueName DisableEmailScanning  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName RunAsPPL  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI" -ValueName EnumerateAdministrators  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer" -ValueName AlwaysInstallElevated  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName NoAutorun  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Client" -ValueName AllowBasic  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -ValueName AllowBasic  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -ValueName fAllowToGetHelp  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -ValueName NoDriveTypeAutoRun
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -ValueName NC_AllowNetBridge_NLA  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" -ValueName NoAutoplayfornonVolume  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" -ValueName DisableIPSourceRouting  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName DisableDomainCreds  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters" -ValueName RequireSecuritySignature  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -ValueName AllowLocalIPsecPolicyMerge  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Download" -ValueName RunInvalidSignatures  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Ext" -ValueName VersionCheckEnabled  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -ValueName AllowLocalPolicyMerge  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName PasswordManagerEnabled  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName LocalAccountTokenFilterPolicy  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\FVE" -ValueName MinimumPIN 
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -ValueName NC_ShowSharedAccessUI  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName BackgroundModeEnabled  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services" -ValueName fAllowUnsolicited  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\policies\Microsoft\office\16.0\common\officeupdate" -ValueName hideenabledisableupdates  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName LmCompatibilityLevel 
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\Network Connections" -ValueName NC_StdDomainUserSetLocation  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\policies\Microsoft\office\16.0\common\officeupdate" -ValueName enableautomaticupdates  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -ValueName SecurityLayer  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows\lanmanworkstation" -ValueName AllowInsecureGuestAuth -Value 0bEnableFlash 
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Adobe\Adobe Acrobat\11.0\FeatureLockDown" -ValueName bEnableFlash  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Adobe\Adobe Acrobat\11.0\FeatureLockDown" -ValueName bDisableJavaScript  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Adobe\Acrobat\2017\FeatureLockDown" -ValueName bDisableJavaScript  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName RestrictAnonymousSAM  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName LimitBlankPasswordUse  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName AllowOutdatedPlugins  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName DefaultPluginsSetting 
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest" -ValueName UseLogonCredential  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\Windows Defender\Scan" -ValueName DisableEmailScanning  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName ConsentPromptBehaviorUser  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\Software\Policies\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" -ValueName EnableControlledFolderAccess  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Control\Lsa" -ValueName RestrictAnonymous  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\FVE" -ValueName UseAdvancedStartup
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" -ValueName DisableIPSourceRouting  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile" -ValueName DisableNotifications  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile" -ValueName DisableNotifications  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile" -ValueName DisableNotifications  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Google\Chrome" -ValueName BlockThirdPartyCookies  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Policies\Microsoft Services\AdmPwd" -ValueName AdmPwdEnabled  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\mrxsmb10" -ValueName Start  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\Netlogon\Parameters" -ValueName DisablePasswordChange  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" -ValueName RestrictNullSessAccess  
	Remove-GPRegistryValue -Guid $id -Key "HKLM\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" -ValueName DisableIOAVProtection  

