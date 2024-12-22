.POSIX:

include config.mk

all install uninstall clean:
	cd src && $(MAKE) $@
	cd man && $(MAKE) $@
	cd completion && $(MAKE) $@

.PHONY: all install uninstall clean
