
## Enabled_Monitoring_CLI.ps1
 The following script will enable auditing for registry paths most used by attackers in known TTPs.

### Requirement

The script was tested and audites all registry paths found in the **'registry.txt'** file.
Please do make sure to run the script as follows:

1.Registry file

2.Run-as Administrator with Full permissions.

3.Make sure the paths in the text file are:

A.No Empty Lines.

B.HKLM:\full\path.

B1.HKCU:\full\path.

4.Make sure to execute the script from the same folder as the text file.


### Usage

```powershell
./Enabled_Monitoring_CLI.ps1
```
![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/registry_main.png)

 The result from the script:
 Everyone Success  ReadKey, TakeOwnership - The script was able to add the path to the event viewer monitoring.
 An Error Occured - RegistryKey Does not exist - This path does not exist in the system.

![a](https://github.com/ghosts621/IR-Scripts/blob/main/image/registry_Result.png)
