.POSIX:

include config.mk

BIN8 = mkrootfs
MAN5 = mkrootfs.config.5
MAN7 = mkrootfs.release.7
MAN8 = mkrootfs.8

all: mkrootfs

mkrootfs:
	cd src && sed "s/@VERSION@/${VERSION}/" $@.in > $@ && chmod 0755 $@

install: all
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man7
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	cd src && cp -f ${BIN8} ${DESTDIR}${PREFIX}/sbin
	cd man && cp -f ${MAN5} ${DESTDIR}${MANPREFIX}/man5
	cd man && cp -f ${MAN7} ${DESTDIR}${MANPREFIX}/man7
	cd man && cp -f ${MAN8} ${DESTDIR}${MANPREFIX}/man8
	cd ${DESTDIR}${PREFIX}/sbin    && chmod 0755 ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && chmod 0644 ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man7 && chmod 0644 ${MAN7}
	cd ${DESTDIR}${MANPREFIX}/man8 && chmod 0644 ${MAN8}

uninstall:
	cd ${DESTDIR}${PREFIX}/sbin    && rm -f ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && rm -f ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man7 && rm -f ${MAN7}
	cd ${DESTDIR}${MANPREFIX}/man8 && rm -f ${MAN8}

install_bashcomp:
	mkdir -p ${DESTDIR}${BASHCOMPDIR}
	cp -f extra/bash_completion ${DESTDIR}${BASHCOMPDIR}/mkrootfs

uninstall_bashcomp:
	rm -f ${DESTDIR}${BASHCOMPDIR}/mkrootfs

clean:
	cd src && rm -f ${BIN8}
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all ${BIN8} install uninstall install_bashcomp uninstall_bashcomp clean dist
