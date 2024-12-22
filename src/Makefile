.POSIX:

include $(CURDIR)/../config.mk

BIN8 = mkrootfs

all: $(BIN8)

$(BIN8):
	sed "s/@VERSION@/$(VERSION)/" $@.in > $@ && chmod 0755 $@

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/sbin
	cp -f $(BIN8) $(DESTDIR)$(PREFIX)/sbin
	chmod 0755 $(DESTDIR)$(PREFIX)/sbin/$(BIN8)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/sbin/$(BIN8)

clean:
	rm -f $(BIN8)

.PHONY: all install uninstall clean
