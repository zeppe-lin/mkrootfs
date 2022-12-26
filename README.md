ABOUT
-----
This directory contains *mkrootfs*, an utility written in POSIX sh(1p)
to make root filesystem of Zeppe-Lin distribution for chroot
installation.

REQUIREMENTS
------------
**Build time:**
- POSIX sh(1p), make(1p) and "mandatory utilities"
- pod2man(1pm) to build man pages

**Runtime:**
- POSIX sh(1p) and "mandatory utilities"
- pkgman(1) from [pkgman](https://github.com/zeppe-lin/pkgman)
  distribution
- pkgmk(8) from [pkgmk](https://github.com/zeppe-lin/pkgmk)
  distribution
- tar(1)
- gnupg(1) is optional, used for signing rootfs tarball

**Tests:**
- podchecker(1pm) to check PODs for errors
- httpx(1) to check URLs for non-200 response codes

LICENSE
-------
*mkrootfs* is licensed through the GNU General Public License v3 or
later <http://gnu.org/licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.

<!-- vim:sw=2:ts=2:sts=2:et:cc=72:tw=70
End of file. -->
