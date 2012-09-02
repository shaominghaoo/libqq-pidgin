mkdir -pv m4
glibtoolize
aclocal
aclocal -I m4
automake --add-missing --copy
autoconf


