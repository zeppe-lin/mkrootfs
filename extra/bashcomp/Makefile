include $(CURDIR)/../../config.mk

all:

install:
	mkdir -p $(DESTDIR)$(BASHCOMPDIR)
	cp -f bash_completion $(DESTDIR)$(BASHCOMPDIR)/mkrootfs

uninstall:
	rm -f $(DESTDIR)$(BASHCOMPDIR)/mkrootfs

clean:

.PHONY: all install uninstall clean
