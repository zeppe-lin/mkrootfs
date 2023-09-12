.POSIX:

include config.mk

all:

install:
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man7
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	sed "s/@VERSION@/${VERSION}/" mkrootfs \
		> ${DESTDIR}${PREFIX}/sbin/mkrootfs
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

install_bashcomp:
	mkdir -p ${DESTDIR}${BASHCOMPDIR}
	cp -f bash_completion ${DESTDIR}${BASHCOMPDIR}/mkrootfs

uninstall_bashcomp:
	rm -f ${DESTDIR}${BASHCOMPDIR}/mkrootfs

clean:
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all install uninstall install_bashcomp uninstall_bashcomp clean dist
