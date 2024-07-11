@echo on
cd C:\LDPlayer\LDPlayer9

adb devices
adb shell "su -c 'cd /data && dd if=/dev/zero of=fillfile bs=1048576 count=10000'"

adb shell rm /data/fillfile

pause
