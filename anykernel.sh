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
device.name1=stone
device.name2=rock
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

KERNEL_VERSION=""
if [ -f "${AKHOME}/Image.gz" ] && gzip -t "${AKHOME}/Image.gz" 2>/dev/null; then
  gzip -dc "${AKHOME}/Image.gz" > "${AKHOME}/.Image.version.tmp" 2>/dev/null
  KERNEL_VERSION="$(strings "${AKHOME}/.Image.version.tmp" 2>/dev/null | grep -m1 -E 'Linux version.*#' | awk '{print $3}')"
  rm -f "${AKHOME}/.Image.version.tmp"
fi

ui_print "- ${KERNEL_VERSION}"

flash_boot

## End boot install
