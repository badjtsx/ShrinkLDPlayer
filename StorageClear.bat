@echo on
cd C:\LDPlayer\LDPlayer9

adb devices
adb shell "su -c 'cd /sdcard && dd if=/dev/zero of=fillfile bs=1048576 count=1024'"

adb shell rm /sdcard/fillfile

pause
