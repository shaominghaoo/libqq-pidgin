For Gentoo users, see [GentooBuild](GentooBuild.md)

First you need a Pidgin or LibPurple building environment.

See Instructions in Links below:
http://developer.pidgin.im/wiki/Installing%20Pidgin#Compiling
http://developer.pidgin.im/wiki/BuildingWinPidgin

Then checkout svn code, run
```
./autogen.sh
```
to auto generate configure script and Makefile.in

Then , invoke
```
./configure CFLAGS="-g3 -O0"
```

**set `CFLAGS` when you want to debug ;)**

if not errors report, run `make`

if not errors report, switch to root and run `make install`

Ubuntu users may want to invoke `sudo make install`

Then start your pidgin and enjory ;)