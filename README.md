# Xperia 10 II Nethunter Installation (Kernel compilation method)

## Prerequisites
Unlocked Bootloader
ADB installed

## LOS 20
First of all, install LineageOS 20 by following this [instructions](https://github.com/lineageos-on-pdx201/releases) (thanks Mashopy).
Turn on the phone and finalize installation before proceeding

## Magisk
Install Magisk following [this](https://github.com/topjohnwu/Magisk/releases/) method

## Kernel compile
Build the docker container and follow [this](https://www.kali.org/docs/nethunter/porting-nethunter-kernel-builder/) to build the kernel using the automated kernel builder

### Patch application
Follow the aforementioned guide on kali.org to install every patch available for this kernel (4.14.19).
Remember to commit every time you make a change

### Kernel configuration
Change the kernel config according to the guide and remember to do it so from the **build.sh** menu and not from `make menuconfig` because your `.config` will be deleted.

## Nethunter APK
- Create Nethunter APK from the `build.sh` menu.
- Flash it as a **Magisk module** not from recovery
- Launch Nethunter and finalize installation

## Flash kernel
- Install [Kernel Flasher](https://github.com/capntrips/KernelFlasher) to your
phone.
- Create Anykernel .img-dtb from the `buil.sh` menu. Copy it to the phone.
- Flash it through Kernel Flasher.

## Test it
Open Nethunter and test:
- USB HID
- WIFI
- Bluetooth
- etc...
