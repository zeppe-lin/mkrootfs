.POSIX:

include config.mk

all:  mkrootfs mkrootfs.8 mkrootfs.config.5 mkrootfs.release.7

%: %.in
	sed "s/@VERSION@/${VERSION}/g" $< > $@

%: %.pod
	pod2man --nourls -r ${VERSION} -c ' ' \
		-n $(basename $@) -s $(subst .,,$(suffix $@)) $< > $@

check:
	@echo "=======> Check PODs for errors"
	@podchecker *.pod
	@echo "=======> Check URLs for response code"
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | xargs -P10 -I{} \
		curl -o /dev/null -sw "[%{http_code}] %{url}\n" '{}'

install: all
	mkdir -p ${DESTDIR}/usr/sbin
	mkdir -p ${DESTDIR}/usr/share/man/man5
	mkdir -p ${DESTDIR}/usr/share/man/man7
	mkdir -p ${DESTDIR}/usr/share/man/man8
	cp -f mkrootfs           ${DESTDIR}/usr/sbin/
	cp -f mkrootfs.config.5  ${DESTDIR}/usr/share/man/man5/
	cp -f mkrootfs.release.7 ${DESTDIR}/usr/share/man/man7/
	cp -f mkrootfs.8         ${DESTDIR}/usr/share/man/man8/
	chmod 0755 ${DESTDIR}/usr/sbin/mkrootfs
	chmod 0644 ${DESTDIR}/usr/share/man/man5/mkrootfs.config.5
	chmod 0644 ${DESTDIR}/usr/share/man/man7/mkrootfs.release.7
	chmod 0644 ${DESTDIR}/usr/share/man/man8/mkrootfs.8

uninstall:
	rm -f ${DESTDIR}/usr/sbin/mkrootfs
	rm -f ${DESTDIR}/usr/share/man/man5/mkrootfs.config.5
	rm -f ${DESTDIR}/usr/share/man/man7/mkrootfs.release.7
	rm -f ${DESTDIR}/usr/share/man/man8/mkrootfs.8

clean:
	rm -f mkrootfs mkrootfs.config.5 mkrootfs.release.7 mkrootfs.8

.PHONY: all install uninstall clean
