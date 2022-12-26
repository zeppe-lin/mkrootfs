.POSIX:

# mkrootfs version
VERSION = 0.2.1

all:  mkrootfs mkrootfs.8 mkrootfs.config.5 mkrootfs.release.7

%: %.in
	sed "s/@VERSION@/${VERSION}/g" $^ > $@

%: %.pod
	pod2man --nourls -r ${VERSION} -c ' ' \
		-n $(basename $@) -s $(subst .,,$(suffix $@)) $< > $@

check:
	@podchecker *.pod
	@grep -Eiho "https?://[^\"\\'> ]+" *.* | httpx -silent -fc 200 -sc

install:
	mkdir -p ${DESTDIR}/usr/sbin
	mkdir -p ${DESTDIR}/usr/share/man/man5
	mkdir -p ${DESTDIR}/usr/share/man/man7
	mkdir -p ${DESTDIR}/usr/share/man/man8
	cp -f mkrootfs ${DESTDIR}/usr/sbin/
	chmod +x ${DESTDIR}/usr/sbin/mkrootfs
	cp -f mkrootfs.config.5  ${DESTDIR}/usr/share/man/man5/
	cp -f mkrootfs.release.7 ${DESTDIR}/usr/share/man/man7/
	cp -f mkrootfs.8         ${DESTDIR}/usr/share/man/man8/

uninstall:
	rm -f ${DESTDIR}/usr/sbin/mkrootfs
	rm -f ${DESTDIR}/usr/share/man/man5/mkrootfs.config.5
	rm -f ${DESTDIR}/usr/share/man/man7/mkrootfs.release.7
	rm -f ${DESTDIR}/usr/share/man/man8/mkrootfs.8

clean:
	rm -f mkrootfs mkrootfs.config.5 mkrootfs.release.7 mkrootfs.8

.PHONY: all install uninstall clean
