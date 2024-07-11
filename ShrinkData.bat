@echo on
setlocal

set LDPlayerPath=C:\LDPlayer\LDPlayer9\vms\leidian

set /p InstanceID="Enter the instance ID you want to edit: "

set VMDKPath=%LDPlayerPath%%InstanceID%\data.vmdk

"C:\Program Files (x86)\VMware\VMware Workstation\vmware-vdiskmanager.exe" -k "%VMDKPath%"

pause
