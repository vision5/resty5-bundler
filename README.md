Name
====

Resty5 (Bundler) - Bundler for the Resty web applications server (based on OpenResty)

Table of Contents
=================

* [Name](#name)
* [Description](#description)
* [Compatability with OpenResty](#compatability-with-openresty)
* [Differences to OpenResty](#differences-to-openresty)
* [Usage](#usage)
* [Status](#status)
* [Notes for developers](#notes-for-developers)
* [Report Bugs](#report-bugs)
* [TODO](#todo)
* [Copyright & License](#copyright--license)

Description
===========

Resty5 is a very high-performance web application framework that extends the functions
and features of the highly popular [OpenResty](https://github.com/openresty/openresty) 
application server.

Compatability with OpenResty
===========================

Yes! Right now Resty5 is just OpenResty packaged together with most of the best third-party
lua-resty-xxx modules. In the future we expect to add non-Lua modules, but our goal is to always 
maintain backwards-compatability with OpenResty, such that everything that works on OpenResty will 
also work on Resty5 (even if the reverse is not always true).

[Back to TOC](#table-of-contents)

Differences to OpenResty
========================

1. Many more Lua modules are bundled in by default
2. The bundler is very flexible, and can be easily configured to include different modules
3. The bundler always includes the latest releases of all packages
4. The configure script has options for all the included modules

[Back to TOC](#table-of-contents)

Usage
=====

```
bin/resty5-bundle [version]
```

Currently the only version that is working is 'slimline', but we will be adding more capabilities
to 'beefy' soon.

The bundler works in the 'build' folder, with the final packages being moved to the 'src' folder.

[Back to TOC](#table-of-contents)

Status
======

- This bundler is usable for the simplest version of this code (slimline)
- This bundler is not yet ready for use for any other version of Resty5
- The OpenResty code and the bundled libraries for the slimline version are production-ready

[Back to TOC](#table-of-contents)

Notes for developers
====================

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

## Configuration options

- Config files are stored in the etc dir
- Lua module configs are for all versions, and references are to Github repos
- C lib configs are for each version, and with sources downloaded from separate sites

[Back to TOC](#table-of-contents)

Report Bugs
===========

You're very welcome to report issues on GitHub:

https://github.com/vision5/resty5-bundler/issues

[Back to TOC](#table-of-contents)

TODO
====

- Finish all the slimline documentation
- Move the versions
- Add all the list of modules to bundler README
- Add the list of included modules in each bundle
- Rewrite the bundler in Perl (using Shell5)
- Better way of handling the config of libs + versions?
- Change the server name to Resty5 instead of openresty
- Document about the bundler/util, including the gen functions

[Back to TOC](#table-of-contents)

Copyright & License
===================

Packages that are downloaded and packaged together by the Resty5 bundler each have their own license.
See their respective packages for details.

The Resty5 bundler is licensed under the 2-clause BSD license.

Copyright (c) 2019-2020, Vision5 <contact@5.vision>

This module is licensed under the terms of the BSD license.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are
met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

[Back to TOC](#table-of-contents)
