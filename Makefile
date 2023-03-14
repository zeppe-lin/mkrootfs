.POSIX:

include config.mk

all:  mkrootfs mkrootfs.8 mkrootfs.config.5 mkrootfs.release.7

%: %.in
	sed "s/@VERSION@/${VERSION}/g" $< > $@

%: %.pod
	pod2man --nourls -r "mkrootfs ${VERSION}" -c ' ' \
		-n $(basename $@) -s $(subst .,,$(suffix $@)) $< > $@

check:
	@echo "=======> Check PODs for errors"
	@podchecker *.pod
	@echo "=======> Check URLs for response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.*       \
		| xargs -P10 -I{} curl -o /dev/null  \
		  -sw "[%{http_code}] %{url}\n" '{}' \
		| sort -u

install-dirs:
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man7
	mkdir -p ${DESTDIR}${MANPREFIX}/man8

install: all install-dirs
	cp -f mkrootfs           ${DESTDIR}${PREFIX}/sbin/
	cp -f mkrootfs.config.5  ${DESTDIR}${MANPREFIX}/man5/
	cp -f mkrootfs.release.7 ${DESTDIR}${MANPREFIX}/man7/
	cp -f mkrootfs.8         ${DESTDIR}${MANPREFIX}/man8/
	chmod 0755 ${DESTDIR}${PREFIX}/sbin/mkrootfs
	chmod 0644 ${DESTDIR}${MANPREFIX}/man5/mkrootfs.config.5
	chmod 0644 ${DESTDIR}${MANPREFIX}/man7/mkrootfs.release.7
	chmod 0644 ${DESTDIR}${MANPREFIX}/man8/mkrootfs.8

uninstall:
	rm -f ${DESTDIR}${PREFIX}/sbin/mkrootfs
	rm -f ${DESTDIR}${MANPREFIX}/man5/mkrootfs.config.5
	rm -f ${DESTDIR}${MANPREFIX}/man7/mkrootfs.release.7
	rm -f ${DESTDIR}${MANPREFIX}/man8/mkrootfs.8

clean:
	rm -f mkrootfs mkrootfs.config.5 mkrootfs.release.7 mkrootfs.8

.PHONY: all check install uninstall clean
