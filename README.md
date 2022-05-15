# IR-Scripts

## Virustotal_RetroHunt_Integration.py
This script will help you run over the results from RetroHunt hash file 

### Requirement:

Hash file

API file 
### Usage

Parameters:

-l -The limet(for free accuont 4 request per minutes) the scripts will calculate automatics the time between the request

-p -The path to the hash file

-b -The buffer from the file

```powershell
python VT_RH.py -h
```
```powershell
python VT_RH.py -l 10 -p "C:\hash.txt"
```
```powershell
python VT_RH.py -l 10 -p "C:\hash.txt" -b "buffer_name:"
```
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/VT2.png)

Example Hash file from the RetroHunt scan:

![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/VT5.png)

Example API file:

![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/VT6.png)


## Audit_GPO_Hardning.ps1
 This script will help you to preforme hardning to the event viewer events
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/main.png)

 for example input edr in the input section 
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/edr.png)

 the result will show you if the system monitor the important parts for a system that has a EDR solution
 if you want to enable monitoring press y and the script will enable it for you 

![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/edr1.png)

### Usage

```powershell
./Audit_GPO_Hardning.ps1
```


## Enabled_Monitoring_CLI.ps1
 The following script will enable auditing for registry paths most used by attackers in known TTPs.

### Requirement:

1.Registry file

2.Run-as Administrator with Full permissions.

3.Make sure the paths in the text file are:

A.No Empty Lines.

B.HKLM:\full\path.

B1.HKCU:\full\path.

### Usage

 The script was tested and audites all registry paths found in the **'registry.txt'** file.
 Please do make sure to run the script as follows:
  1.  Run-as Administrator with Full permissions.
  2.  Make sure the paths in the text file are:
  **A. No Empty Lines.
  B1. HKLM:\full\path
  B2. HKCU:\full\path**
  3.  Make sure to execute the script from the same folder as the text file.

![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/registry_main.png)

 The result from the script:
 Everyone Success  ReadKey, TakeOwnership - The script was able to add the path to the event viewer monitoring.
 An Error Occured - RegistryKey Does not exist - This path does not exist in the system.

![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/registry_Result.png)

## EventViewer.ps1
This script will halp you to identify if your Event Viewer was compromise
Stage 1 - EventLog API
Stage 1 will let you know if attacker was deleted the Threads.
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/EventV_stage1.png)

Stage 2 - EventLog MAX size and Retention
Stage 2 will let you know if attacker was messing with the size and Retention of Security, System, Application logs.
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/EventV_stage2.png)





