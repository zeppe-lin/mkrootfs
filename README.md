OVERVIEW
========

This repository contains mkrootfs, an utility that makes root
filesystem of Zeppe-Lin distribution for chroot installation.


REQUIREMENTS
============

Build time
----------
  * POSIX sh(1p), make(1p) and "mandatory utilities"
  * scdoc to build man pages

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

Refer to the human-readable man pages located in the `/man` directory.


LICENSE
=======

mkrootfs is licensed through the GNU General Public License v3 or
later <http://gnu.org/licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.
