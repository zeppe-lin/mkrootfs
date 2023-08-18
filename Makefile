.POSIX:

include config.mk

BIN8 = mkrootfs
MAN5 = mkrootfs.config.5
MAN7 = mkrootfs.release.7
MAN8 = mkrootfs.8

all:  ${BIN8} ${MAN5} ${MAN7} ${MAN8}

%: %.in
	sed -e "s|@HOMEPAGE@|${HOMEPAGE}|" \
	    -e "s|@BUGTRACKER@|${BUGTRACKER}|" \
	    -e "s|@VERSION@|${VERSION}|" \
	    -e "/^@COPYRIGHT & COPYING.BANNER@/{" \
	    -e   "r ${CURDIR}/COPYRIGHT" \
	    -e   "r ${CURDIR}/COPYING.BANNER" \
	    -e   "d" \
	    -e "}" $< > $@

%: %.pod
	pod2man -r "${NAME} ${VERSION}" -c ' ' -n $(basename $@) \
		-s $(subst .,,$(suffix $@)) $< > $@

install: all
	mkdir -p ${DESTDIR}${PREFIX}/sbin
	mkdir -p ${DESTDIR}${MANPREFIX}/man5
	mkdir -p ${DESTDIR}${MANPREFIX}/man7
	mkdir -p ${DESTDIR}${MANPREFIX}/man8
	cp -f ${BIN8} ${DESTDIR}${PREFIX}/sbin/
	cp -f ${MAN5} ${DESTDIR}${MANPREFIX}/man5/
	cp -f ${MAN7} ${DESTDIR}${MANPREFIX}/man7/
	cp -f ${MAN8} ${DESTDIR}${MANPREFIX}/man8/
	cd ${DESTDIR}${PREFIX}/sbin    && chmod 0755 ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && chmod 0644 ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man7 && chmod 0644 ${MAN7}
	cd ${DESTDIR}${MANPREFIX}/man8 && chmod 0644 ${MAN8}

uninstall:
	cd ${DESTDIR}${PREFIX}/sbin    && rm -f ${BIN8}
	cd ${DESTDIR}${MANPREFIX}/man5 && rm -f ${MAN5}
	cd ${DESTDIR}${MANPREFIX}/man7 && rm -f ${MAN7}
	cd ${DESTDIR}${MANPREFIX}/man8 && rm -f ${MAN8}

install-bashcomp:
	mkdir -p ${DESTDIR}${BASHCOMPDIR}
	cp -f bash_completion ${DESTDIR}${BASHCOMPDIR}/mkrootfs

uninstall-bashcomp:
	rm -f ${DESTDIR}${BASHCOMPDIR}/mkrootfs

clean:
	rm -f ${BIN8} ${MAN5} ${MAN7} ${MAN8}
	rm -f ${DIST}.tar.gz

dist: clean
	git archive --format=tar.gz -o ${DIST}.tar.gz --prefix=${DIST}/ HEAD

.PHONY: all install uninstall install-bashcomp uninstall-bashcomp clean dist
