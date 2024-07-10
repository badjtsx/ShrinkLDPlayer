# ShrinkLDPlayer

## Pre-Requisites

VMware workstation, specifically the ```vmware-vdiskmanager.exe``` file.

# Instructions

> [!NOTE]
> 1. If you have changed the directories mentioned below from their default installations (```C:\LDPlayer\LDPlayer9``` and ```C:\Program Files (x86)\VMware\VMware Workstation```), please refer to the [Manual version](#manual-version) of the instructions and ensure that you update the commands accordingly.
> 2. You can also [Edit the batch files](#editing-batch-files) and replace directories with your own.
> 3. If you have not changed the directories, please refer to the [Batch (.bat) files version](#batch-bat-files-version).

## Batch (.bat) files version

> - Please note, this process only applies if you have installed the programs in their default installation locations.
> - The vmdk should shrink by 1GB. If you want to shrink it more, you can increase the count in Clear.bat from 1024 (1GB) to a bigger number (You can go overboard, it won't delete files you never deleted).

1. Launch the LDPlayer instance you want to shrink.
2. In "Settings > Other settings > ADB debugging" choose "Open local connection".
3. Without closing the emulator, run ```StorageClear.bat```. 
4. Figure out the ID of the LDPlayer instance you want to shrink by going to LDMultiPlayer and checking the IDs.
![Screenshot (161)](https://github.com/badjtsx/ShrinkLDPlayer/assets/90721515/2c298fe9-5182-40b0-965c-7e8b0410ee4d)
6. Close LDPlayer completely and run ```Shrink.bat```, it'll ask for the ID acquired in the previous step. 

If you get any errors, maybe try the manual version.


## Manual version

> - You can also refer to [Editing batch files](#editing-batch-files) to make your own batch files
> - The vmdk should shrink by 1GB. If you want to shrink it more, you can increase the count in Clear.bat from 1024 (1GB) to a bigger number (You can go overboard, it won't delete files you never deleted).

1. Launch the LDPlayer instance you want to shrink.
2. In "Settings > Other settings > ADB debugging" choose "Open local connetion".
3. Without closing the emulator, open cmd/powershell.
4. Change directory to where LDPlayer is installed using ```cd C:\LDPlayer\LDPlayer9```.
5. Run the command ```adb devices``` (cmd) or ```.\adb devices``` (powershell). If the output lists a device (emulator-5556   device) then you're good to go if not make sure step 2 is done and the LDPlayer instance is Launched.
6. Run ```adb shell``` (cmd) or ```.\adb shell``` (powershell).
7. Go into superuser using ```su```.
8. Change directory to sdcard using ```cd /sdcard```.
9. Create a file filled with zeros using ```dd if=/dev/zero of=fillfile bs=1048576 count=1024```.
10. Exit out of shell session using ```exit``` (Not necessary).
11. Exit the ADB session using ```exit``` (Not necessary).
12. Delete the created file using ```adb shell rm /sdcard/fillfile``` (cmd) or ```.\adb shell rm /sdcard/fillfile``` (powershell).
13. Shut down LDPlayer.
14. Look for where the instance is saved. ```C:\LDPlayer\LDPlayer9\vms``` by default (You can tell which instance is which by the name of the folders (leidian0, leidian1 etc) and the ID in LDMultiPLayer).
15. Inside of that instance folder there will be three vmdk files, we'll have to shrink the sdcard.vmdk one using ```vmware-vdiskmanager.exe``` which is available in the vmware workstation directory ```C:\Program Files (x86)\VMware\VMware Workstation```.
16. Open cmd or powershell and change directory to where ```vmware-vdiskmanager.exe``` is and run ```vmware-vdiskmanager.exe -k "C:\LDPlayer\LDPlayer9\vms\leidian1\sdcard.vmdk"``` (cmd) or ```.\vmware-vdiskmanager.exe -k "C:\LDPlayer\LDPlayer9\vms\leidian1\sdcard.vmdk"``` (powershell).

Refer to [Editing Batch files](#editing-batch-files) to make your own batch files.

## Editing Batch files

> Instead of following the steps in the [Manual version](#manual-version), you can edit the paths in the batch files and use the [Batch (.bat) files version](#batch-bat-files-version) instead.

### StorageClear.bat file 
* Replace ```C:\LDPlayer\LDPlayer9``` with the path to your LDPlayer installation (if there are spaces dont forget the double quotes (ex: ```C:\Path to\LDPlayer``` would be  ```"C:\Path to\LDPlayer"```).
* You can replace 1024 in ```count=1024``` with a bigger number to clear more space (You can go overboard, it won't delete files you never deleted).

### Shrink.bat file
* For VMWare you should replace ```"C:\Program Files (x86)\VMware\VMware Workstation\vmware-vdiskmanager.exe"``` with the path to your ```vmware-vdiskmanager.exe``` file.
*  For LDPlayer you should replace ```C:\LDPlayer\LDPlayer9\vms\leidian``` with the path to your LDPlayer vms (NOTE: \LDPlayer\LDPlayer9\vms\leidian is unchangeable. This means that, say you installed LDPlayer in your downloads folder, your path should be ```C:\Users\YOUR-USERNAME\Downloads\LDPlayer\LDPlayer9\vms\leidian``` (of course YOUR-USERNAME should be replaced with your username)).
* Make sure to set the LDPlayer path with no double quotes since it is getting added in the end.
