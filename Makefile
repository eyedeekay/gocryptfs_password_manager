
install:
	install -m755 bin/gpm /usr/bin/
	install -m755 bin/gpm-emit /usr/bin/
	install -m755 bin/gpm-c /usr/bin/
	install -m755 bin/cookieget /usr/bin/
	install -m755 bin/github /usr/bin/
	install etc/gpm.conf /etc/

deb:
	checkinstall --default \
		--nodoc \
		--deldoc=yes \
		--backup=no \
		--install=no \
		--pkgname=gocryptfs_password_manager \
		--pkgversion=0.1 \
		--pkglicense=gpl3 \
		--pakdir=../ \
		--requires="gocryptfs, bash, srm" \
		--maintainer="problemsolver@openmailbox.org"
