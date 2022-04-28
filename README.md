# IR-Scripts

## Audit_GPO_Hardning.ps1
This script will help you to preforme hardning to the event viewer events
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/main.png)

for example input edr in the input section 
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/edr.png)
the result will show you if the system monitor the important parts for a system that has a EDR solution
if you want to enable monitoring press y and the script will enable it for you 
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/edr1.png)


## Enabled_Monitoring_CLI.ps1
The following script will enable auditing for registry paths most used by attackers in known TTPs.
The script was tested and audites all registry paths found in the 'registry.txt' file.
Please do make sure to run the script as follows:
  1.  Run-as Administrator with Full permissions.
  2.  Make sure the paths in the text file are:
      A. No Empty Lines.
      B1. HKLM:\full\path
      B2. HKCU:\full\path
