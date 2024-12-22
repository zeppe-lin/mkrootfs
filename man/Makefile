.POSIX:

include $(CURDIR)/../config.mk

MAN5 = mkrootfs.config.5
MAN7 = mkrootfs.release.7
MAN8 = mkrootfs.8

all:

install:
	mkdir -p $(DESTDIR)$(MANPREFIX)/man5
	mkdir -p $(DESTDIR)$(MANPREFIX)/man7
	mkdir -p $(DESTDIR)$(MANPREFIX)/man8
	cp -f $(MAN5) $(DESTDIR)$(MANPREFIX)/man5
	cp -f $(MAN7) $(DESTDIR)$(MANPREFIX)/man7
	cp -f $(MAN8) $(DESTDIR)$(MANPREFIX)/man8
	cd $(DESTDIR)$(MANPREFIX)/man5 && chmod 0644 $(MAN5)
	cd $(DESTDIR)$(MANPREFIX)/man7 && chmod 0644 $(MAN7)
	cd $(DESTDIR)$(MANPREFIX)/man8 && chmod 0644 $(MAN8)

uninstall:
	cd $(DESTDIR)$(MANPREFIX)/man5 && rm -f $(MAN5)
	cd $(DESTDIR)$(MANPREFIX)/man7 && rm -f $(MAN7)
	cd $(DESTDIR)$(MANPREFIX)/man8 && rm -f $(MAN8)

clean:

.PHONY: all install uninstall clean
