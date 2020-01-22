# Updating these folders

TODO - Move this into the README

## Updating general information

The Resty5 bundler is based on the OpenResty bundler, with added external libraries, lua-resty
modules and patchs.

Since OpenResty is regularly updated, and there are often many changes to the files that we change,
creating patches for these files for each distribution becomes tedious and error-prone.

Instead we have created a two-step patching process that should always (or almost always) work,
with any incremental changes automatically re-addded back to the base patching process.

## How the OpenResty bundler patching process works

We generate the Resty5 bundler by:

1. Patching the OpenResty bundler scripts that we change with insertion points (which always works)
2. Replacing the insert points with static / dynamically-generated code
3. When the insertion points are on different lines in the new version, successful patching results 
in automatic copying of the new versions files for next time

## Scripts that this bundler changes

Pre-download, the bundler changes the following files in the OpenResty folder:

- [openresty]/util/configure
- [openresty]/util/mirror-tarballs

Post-download, depending on the version, additional patches are applied.  These can be found in the
libs sub-folder.

## The OpenResty bundler patching process in more detail 

Using name = (configure|mirror-tarballs)

Building the new files:

- A 'build' folder is created for each file here: bundler/patches/[name]/build (1)
- The unmodified scripts are found here: bundler/patches/[name]/[name].1 (2)
- The modified scripts (with insertion points) are found here: bundler/patches/[name]/[name].2 (3)
- The new OpenResty bundler is downloaded, and the latest scripts are copied to 1 (4)
- A patch is dynamically generated from 2 to 3, applied to 4 (5)
- The dynamically-generated components are inserted into 5 to give the new version (6)
- All the files 4-6 can be found in 1
- File 6 can be found here: bundler/patches/[name]/build/[name].3

Patching OpenResty:

- [openresty]/util/[name] is copied to [openresty]/util/[name].orig (if it doesn't exist) (7)
- File 6 is copied to [openresty]/util/[name]

After patching OpenResty:

- Then the OpenResty bundler is run as normal
- Additional patches are applied after running the bundler (e.g. on libs and README.md)

## Files used in the patching process

- bundler/util/gen-[name]

## Possible issues when adding new libs

- mirror-tarballs deletes files at the bottom - this can delete files that are used by external libraries (e.g. .pm + util for OpenSSL)
