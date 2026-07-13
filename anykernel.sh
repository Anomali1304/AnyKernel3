### AnyKernel3 Ramdisk Mod Script
## osm0sis @ xda-developers

### AnyKernel setup
# global properties
properties() { '
kernel.string=
do.devicecheck=1
do.modules=0
do.systemless=0
do.cleanup=1
do.cleanuponabort=1
device.name1=moon
device.name2=
supported.versions=
supported.patchlevels=
supported.vendorpatchlevels=
'; } # end properties

### AnyKernel install

# boot shell variables
BLOCK=boot
IS_SLOT_DEVICE=1
RAMDISK_COMPRESSION=auto
PATCH_VBMETA_FLAG=auto

# import functions/variables and setup patching - see for reference (DO NOT REMOVE)
. tools/ak3-core.sh;

## Start boot install

split_boot

# Baca versi kernel dari hasil split (sudah terdekompresi)
KERNEL_VERSION=""
if [ -f "$SPLITIMG/kernel" ]; then
    KERNEL_VERSION=$(strings "$SPLITIMG/kernel" 2>/dev/null | grep -E -m1 'Linux version.*#' | awk '{print $3}')
fi

if [ -n "$KERNEL_VERSION" ]; then
    ui_print "- $KERNEL_VERSION"
else
    ui_print "- Kernel version not found"
fi

flash_boot

## End boot install
