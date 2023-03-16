.POSIX:

include config.mk

BIN8 = mkrootfs
MAN5 = mkrootfs.config.5
MAN7 = mkrootfs.release.7
MAN8 = mkrootfs.8

all:  ${BIN8} ${MAN5} ${MAN7} ${MAN8}

%: %.in
	sed "s/@VERSION@/${VERSION}/g" $< > $@

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

clean:
	rm -f ${BIN8} ${MAN5} ${MAN7} ${MAN8}

.PHONY: all install uninstall clean
