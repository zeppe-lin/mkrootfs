OVERVIEW
========

The `mkrootfs` utility creates a root filesystem of Zeppe-Lin
distribution, suitable for chroot installation.


REQUIREMENTS
============

Build-time
----------
  * POSIX `sh(1p)`, `make(1p)` and "mandatory utilities"
  * `scdoc(1)` to build manual pages

Runtime
-------
  * POSIX `sh(1p)` and "mandatory utilities"
  * GNU `getopt(1)` to parse command-line options
  * `pkgmk(8)` to build packages
  * `pkgadd(8)` and `pkgrm(8)` to install and remove packages
  * `pkgman(1)` to orchestrate package building and installation
  * `revdep(1)` to check rootfs tarball for missing libraries
  * `tar(1)` to prepare the rootfs tarball


INSTALL
=======

To install this package, run:

    make install

See `config.mk` file for configuration parameters.


DOCUMENTATION
=============

See `/man` directory for manual pages.


LICENSE
=======

`mkrootfs` is licensed through the
[GNU General Public License v3 or later](http://gnu.org/licenses/gpl.html).

See `COPYING` for license terms and `COPYRIGHT` for notices.
