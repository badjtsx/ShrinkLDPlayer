# ShrinkLDPlayer

## Pre-Requisites

VMware workstation, specifically the ```vmware-vdiskmanager.exe``` file.

## Instructions on shrinking LDPlayer instances

> [!NOTE]
> If you have changed the directories mentioned below from their default installations, please ensure that you update the commands accordingly.

1. Launch the LDPlayer instance you want to shrink
2. In "Settings > Other settings > ADB debugging" choose "Open local connetion"
3. Without closing the launcher, open cmd/powershell
4. Change directory to where LDPlayer is installed using ```cd C:\LDPlayer\LDPlayer9```
5. Run the command ```adb devices``` (cmd) or ```.\adb devices``` (powershell). If the output lists a device (emulator-5556   device) then you're good to go if not make sure step 2 is done and the LDPlayer instance is Launched
6. Run "```adb shell```" (cmd) or "```.\adb shell```" (powershell)
7. Go into superuser using ```su```
8. Change directory to sdcard using ```cd /sdcard```
9. Create a file filled with zeros using ```dd if=/dev/zero of=fillfile bs=1048576 count=1024```
10. Exit out of shell session using ```exit```
11. Exit the ADB session using ```exit```
12. Delete the created file using ```adb shell rm /sdcard/fillfile``` (cmd) or ```.\adb shell rm /sdcard/fillfile``` (powershell)
13. Shut down LDPlayer
14. Look for where the instance is saved. ```C:\LDPlayer\LDPlayer9\vms``` (You can tell which is which by the name of the folders (leidian0, leidian1 etc) and the ID in LDMultiPLayer)
15. Inside of that instance folder there will be three vmdk files, we'll have to shrink the sdcard.vmdk one using ```vmware-vdiskmanager.exe``` which is available in the vmware workstation directory (C:\Program Files (x86)\VMware\VMware Workstation)
16. Open cmd or powershell and change directory to where ```vmware-vdiskmanager.exe``` is and run ```vmware-vdiskmanager.exe -k "C:\LDPlayer\LDPlayer9\vms\leidian1\sdcard.vmdk"``` (cmd) or ```.\vmware-vdiskmanager.exe -k "C:\LDPlayer\LDPlayer9\vms\leidian1\sdcard.vmdk"``` (powershell)

The vmdk should shrink. If you think it did not shrink enough try repeating the steps again.
