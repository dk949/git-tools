include config.mk
all:

clean:

install: all
	mkdir -p ${DESTDIR}${PREFIX}/bin/
	install git-create ${DESTDIR}${PREFIX}/bin/git-create
	install git-ignore ${DESTDIR}${PREFIX}/bin/git-ignore
	install git-remind ${DESTDIR}${PREFIX}/bin/git-remind
	install git-rmsubmodule ${DESTDIR}${PREFIX}/bin/git-rmsubmodule
	install git-sync ${DESTDIR}${PREFIX}/bin/git-sync
	install git-toolsconfig ${DESTDIR}${PREFIX}/bin/git-toolsconfig
	install git-view ${DESTDIR}${PREFIX}/bin/git-view
	install git-open-remote ${DESTDIR}${PREFIX}/bin/git-open-remote
	install git-nuke ${DESTDIR}${PREFIX}/bin/git-nuke
	install git-get-default ${DESTDIR}${PREFIX}/bin/git-get-default

uninstall:
	rm -f ${DESTDIR}${PREFIX}/bin/vimv
	rm -f ${DESTDIR}${PREFIX}/bin/git-create
	rm -f ${DESTDIR}${PREFIX}/bin/git-ignore
	rm -f ${DESTDIR}${PREFIX}/bin/git-remind
	rm -f ${DESTDIR}${PREFIX}/bin/git-rmsubmodule
	rm -f ${DESTDIR}${PREFIX}/bin/git-sync
	rm -f ${DESTDIR}${PREFIX}/bin/git-toolsconfig
	rm -f ${DESTDIR}${PREFIX}/bin/git-view
	rm -f ${DESTDIR}${PREFIX}/bin/git-open-remote
	rm -f ${DESTDIR}${PREFIX}/bin/git-nuke
	rm -f ${DESTDIR}${PREFIX}/bin/git-get-default

.PHONY: all clean install uninstall
