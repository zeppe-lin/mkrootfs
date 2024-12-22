.POSIX:

include config.mk

all install uninstall clean:
	cd src && $(MAKE) $@
	cd man && $(MAKE) $@
	cd extra/bashcomp && $(MAKE) $@

.PHONY: all install uninstall clean
