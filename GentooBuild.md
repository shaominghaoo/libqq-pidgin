#Build libqq-pidgin by emerge

# Introduction #
This is a guide to use qq 2010 protocol in pidgin for gentoo based linux system.

**In general, packages are trying to provide a stable version for daily usage. To support debug/development of libqq-pidgin, please check [AboutBuilding](AboutBuilding.md) for details.**

There is two ways that you can do this.

# The first way #

Thanks for Havanna from gentoo-china-overlay project to merge our ebuild into gentoo-china. So gentoo based users can easily use layman and gentoo-china overlay to install pidgin-qq.

```
layman -a gentoo-china
```

```
emerge -avt pidgin-qq
```

emerge pidgin-qq, which just build the libqq.so with 2010 protocol and install it to the pidgin's lib loading path.


---


# 2nd, Enhanced pidgin ebuild #

Enhanced pidgin ebuild will use libqq-pidgin source code from the _vanilla branch_(which tends to keep the files/folder layout as much as possible from the original qq folder in pidgin and tends to keep code stable) to replace the old broken qq protocol source code.

These ebuilds add a **`qq2010`** new USE by enable by default.

Updated ebuilds are located at a commiter's personal overlay https://github.com/cchalpha/GC-Overlay

Checkout and setup the overlay by the way similar to which already described above or just download the ebuild file to your local portage tree.

Currently, just the [r9999](https://code.google.com/p/libqq-pidgin/source/detail?r=9999) reversion ebuild is provided, which uses the latest vanilla branch source code.

To use it, firstly you need to unmask the keyword by

```
echo "net-im/pidgin **" >> /etc/portage/package.keywords
```

then emerge it, default USE should be good.
```
emerge -1avt =net-im/pidgin-2.7.11-r9999
```

ebuilds which use vanilla\_tags or source tarball with tags(which tend to be more stable) will be provided soon.