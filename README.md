ABOUT
-----
This directory contains *mkrootfs*, an utility that makes root
filesystem of Zeppe-Lin distribution for chroot installation.

REQUIREMENTS
------------
Build time:
  * POSIX sh(1p), make(1p) and "mandatory utilities"
  * pod2man(1pm) from perl distribution to build man pages

Runtime:
  * POSIX sh(1p) and "mandatory utilities"
  * pkgman(1) from [pkgman][1] distribution
  * pkgmk(8) from [pkgmk][2] distribution
  * tar(1)
  * gnupg(1) is optional, used to sign rootfs tarball

Tests:
  * podchecker(1pm) from perl distribution to check PODs for errors
  * httpx(1) to check URLs for non-200 response codes

INSTALL
-------
The shell commands `make && make install` should build and install
this package.

The shell command `make check` should start some tests.

LICENSE
-------
*mkrootfs* is licensed through the GNU General Public License v3 or
later <http://gnu.org/licenses/gpl.html>.
Read the *COPYING* file for copying conditions.
Read the *COPYRIGHT* file for copyright notices.

<!--------------------------- LINKS --------------------------------->
[1]: https://github.com/zeppe-lin/pkgman
[2]: https://github.com/zeppe-lin/pkgmk
<!------------------------------------------------------------------->

<!-- vim:sw=2:ts=2:sts=2:et:cc=72:tw=70
End of file. -->
