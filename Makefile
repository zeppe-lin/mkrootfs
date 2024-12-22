.POSIX:

include config.mk

all install uninstall clean:
	cd src && $(MAKE) $@
	cd man && $(MAKE) $@
	cd completions && $(MAKE) $@

.PHONY: all install uninstall clean
