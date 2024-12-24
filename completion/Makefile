.POSIX:

include ../config.mk

all:

lint:
	shellcheck -s bash bash_completion

install:
	mkdir -p $(DESTDIR)$(BASHCOMPDIR)
	cp -f bash_completion $(DESTDIR)$(BASHCOMPDIR)/mkrootfs

uninstall:
	rm -f $(DESTDIR)$(BASHCOMPDIR)/mkrootfs

clean:

.PHONY: all lint install uninstall clean
