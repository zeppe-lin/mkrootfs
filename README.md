ABOUT
-----
This directory contains _mkrootfs_, an utility that makes root
filesystem of _Zeppe-Lin_ distribution for chroot installation.

REQUIREMENTS
------------
Build time:
  * POSIX sh(1p), make(1p) and "mandatory utilities"
  * pod2man(1pm) to build man pages

Runtime:
  * POSIX sh(1p) and "mandatory utilities"
  * [pkgman][1] and [pkgmk][2]
  * tar(1)
  * gnupg(1) is optional, used to sign rootfs tarball

Tests:
  * podchecker(1pm) to check PODs for errors
  * curl(1) to check URLs for response codes

INSTALL
-------
The shell commands `make && make install` should build and install
this package.

The shell command `make check` should start some tests.

LICENSE
-------
_mkrootfs_ is licensed through the GNU General Public License v3 or
later <http://gnu.org/licenses/gpl.html>.
Read the _COPYING_ file for copying conditions.
Read the _COPYRIGHT_ file for copyright notices.

[1]: https://github.com/zeppe-lin/pkgman
[2]: https://github.com/zeppe-lin/pkgmk

<!-- vim:sw=2:ts=2:sts=2:et:cc=72:tw=70
End of file. -->
