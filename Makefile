#
# Makefile: create Zeppelin rootfs tarball
#

ROOTFS_DIR = $(CURDIR)/rootfs-$(shell date +%Y%m%d)-$(shell uname -m)
ROOTFS_TXZ = $(CURDIR)/rootfs-$(shell date +%Y%m%d)-$(shell uname -m).tar.xz
PACKAGES   = $(shell pkgman --config=pkgman.conf list | grep -v 'not found')
EMAIL     ?= alexandr.savca89@gmail.com

all:
	@cat README

NEED_ROOT_PRIVILEGES:
	[ "`id -u`" = 0 ]

rootfs: NEED_ROOT_PRIVILEGES
	mkdir -p $(ROOTFS_DIR)/var/lib/pkg
	touch $(ROOTFS_DIR)/var/lib/pkg/db
	install -o pkgmk -d $(CURDIR)/{srcs,pkgs,logs}
	pkgman --root=$(ROOTFS_DIR) --config=pkgman.conf install \
		-d --group --margs="-cf $(CURDIR)/pkgmk.conf" $(PACKAGES)

revdep: NEED_ROOT_PRIVILEGES
	chroot $(ROOTFS_DIR) revdep

tar.xz: NEED_ROOT_PRIVILEGES
	(cd $(ROOTFS_DIR) ; tar -cJf $(ROOTFS_TXZ) . ; sync)

sign:
	gpg --sign --default-key $(EMAIL) $(ROOTFS_TXZ)

clean:  NEED_ROOT_PRIVILEGES
	rm -rf $(ROOTFS_DIR) $(ROOTFS_TXZ) $(ROOTFS_TXZ).gpg

rmall:  clean
	rm -rf $(CURDIR)/{distfiles,packages,logs}

# End of file.
