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
