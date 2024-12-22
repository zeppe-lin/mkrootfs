.POSIX:

include config.mk

SUBDIRS = src man extra/bashcomp

all install uninstall clean:
	$(MAKE) $(SUBDIRS) TARGET=$@

$(SUBDIRS):
	cd $@ && $(MAKE) $(TARGET)

.PHONY: all install uninstall clean $(SUBDIRS)
