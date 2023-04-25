OVERVIEW
--------
This directory contains mkrootfs, an utility that makes root
filesystem of Zeppe-Lin distribution for chroot installation.


REQUIREMENTS
------------
**Build time**:
- POSIX sh(1p), make(1p) and "mandatory utilities"
- pod2man(1pm) to build man pages

**Runtime**:
- POSIX sh(1p) and "mandatory utilities"
- pkgmk to build packages
- pkgutils to install packages
- pkgman to orchestrate package building and installation
- revdep to check rootfs tarball for missing libraries
- tar(1) to prepare the rootfs tarball
- gnupg(1) is optional, used to sign rootfs tarball


INSTALL
-------
The shell commands `make && make install` should build and install
this package.


LICENSE
-------
mkrootfs is licensed through the GNU General Public License v3 or
later <http://gnu.org/licenses/gpl.html>.
Read the COPYING file for copying conditions.
Read the COPYRIGHT file for copyright notices.
