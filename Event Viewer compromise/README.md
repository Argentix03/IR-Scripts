## EventViewer.ps1
This script will halp you to identify if your Event Viewer was compromise

### Requirement
1.Run-as Administrator with Full permissions.

### Usage
```powershell
./EventViewer.ps1
```
### Stage1 - EventLog API
Stage 1 will let you know if attacker was deleted the Threads.
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/EventV_stage1.png)

### Stage2 - EventLog MAX size and Retention
Stage 2 will let you know if attacker was messing with the size and Retention of Security, System, Application logs.
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/EventV_stage2.png)
