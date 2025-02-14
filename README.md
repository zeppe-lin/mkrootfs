OVERVIEW
========

This repository contains mkrootfs, an utility that makes root
filesystem of Zeppe-Lin distribution for chroot installation.


REQUIREMENTS
============

Build time
----------
  * POSIX sh(1p), make(1p) and "mandatory utilities"

Runtime
-------
  * POSIX sh(1p) and "mandatory utilities"
  * GNU getopt(1) to parse command-line options
  * pkgmk to build packages
  * pkgutils to install packages
  * pkgman to orchestrate package building and installation
  * revdep to check rootfs tarball for missing libraries
  * tar(1) to prepare the rootfs tarball


INSTALL
=======

The shell command `make install` should install this package.

See `config.mk` file for configuration parameters.


DOCUMENTATION
=============

Online documentation
--------------------

Manual pages:
- [mkrootfs.8][1]
- [mkrootfs.config.5][2]
- [mkrootfs.release.7][3]

[1]: https://zeppe-lin.github.io/mkrootfs.8.html
[2]: https://zeppe-lin.github.io/mkrootfs.config.5.html
[3]: https://zeppe-lin.github.io/mkrootfs.release.7.html


LICENSE
=======

mkrootfs is licensed through the GNU General Public License v3 or
later <http://gnu.org/licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.
