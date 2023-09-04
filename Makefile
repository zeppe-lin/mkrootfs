.POSIX:

include config.mk

all:

install:
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man7
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	sed "s/@VERSION@/${VERSION}/" mkrootfs > \
		${DESTDIR}${PREFIX}/sbin/mkrootfs
	sed "s/@VERSION@/${VERSION}/" mkrootfs.config.5 > \
		${DESTDIR}${MANPREFIX}/man5/mkrootfs.config.5
	sed "s/@VERSION@/${VERSION}/" mkrootfs.release.7 > \
		${DESTDIR}${MANPREFIX}/man7/mkrootfs.release.7
	sed "s/@VERSION@/${VERSION}/" mkrootfs.8 > \
		${DESTDIR}${MANPREFIX}/man8/mkrootfs.8
	chmod 0755 ${DESTDIR}${PREFIX}/sbin/mkrootfs
	chmod 0644 ${DESTDIR}${MANPREFIX}/man5/mkrootfs.config.5
	chmod 0644 ${DESTDIR}${MANPREFIX}/man7/mkrootfs.release.7
	chmod 0644 ${DESTDIR}${MANPREFIX}/man8/mkrootfs.8

uninstall:
	rm -f ${DESTDIR}${PREFIX}/sbin/mkrootfs
	rm -f ${DESTDIR}${MANPREFIX}/man5/mkrootfs.config.5
	rm -f ${DESTDIR}${MANPREFIX}/man7/mkrootfs.release.7
	rm -f ${DESTDIR}${MANPREFIX}/man8/mkrootfs.8

install-bashcomp:
	mkdir -p ${DESTDIR}${BASHCOMPDIR}
	cp -f bash_completion ${DESTDIR}${BASHCOMPDIR}/mkrootfs

uninstall-bashcomp:
	rm -f ${DESTDIR}${BASHCOMPDIR}/mkrootfs

clean:
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all install uninstall install-bashcomp uninstall-bashcomp clean dist
