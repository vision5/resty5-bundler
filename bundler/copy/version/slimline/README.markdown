Name
====

Resty5 (Slimline) - High-performance web application framework (based on OpenResty)

Table of Contents
=================

* [Name](#name)
* [Description](#description)
* [Compatability with OpenResty](#compatability-with-openresty)
* [Differences to OpenResty](#differences-to-openresty)
* [Version features](#version-features)
* [Status](#status)
* [Documentation](#documentation)
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

Version features
================

This bundle includes:

- All the OpenResty components
- Almost all the lua-resty-*** modules available on Github
- The latest sources for bzip, openssl, pcre and zlib

When Resty5 is compiled, by default the supplied sources are used rather than the system libraries
as shared libraries that are loaded at run time.

Status
======

- The OpenResty code and the bundled libraries for the slimline version are production-ready. 
- This bundler is usable for the simplest version of this code (slimline), though is not yet of high quality.
- This bundler is not ready for use for any other version of Resty5.

[Back to TOC](#table-of-contents)

Documentation
=============

The OpenResty documentation can be found here: https://github.com/openresty/openresty

Documentation for each of the lua-resty-xxx modules can be found on their respective 
Github pages or websites. Google is your friend here (for now). We will add a full list later.

For now there is no documentation specific to Resty5 that is different from the above.
When that changes, we will add it here.

[Back to TOC](#table-of-contents)

Report Bugs
===========

You're very welcome to report issues on GitHub:

https://github.com/vision5/resty5-bundler/issues

[Back to TOC](#table-of-contents)

TODO
====

- Update this README
- Add autoreconf to the 

[Back to TOC](#table-of-contents)

Copyright & License
===================

The bundle itself is licensed under the 2-clause BSD license.

(Resty5) Copyright (c) 2019, Vision5 <contact@5.vision> 
(OpenResty) Copyright (c) 2011-2019, Yichun "agentzh" Zhang (章亦春) <agentzh@gmail.com>, OpenResty Inc.

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
