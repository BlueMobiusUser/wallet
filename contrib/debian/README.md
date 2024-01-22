
Debian
====================
This directory contains files used to package bluemobiusd/bluemobius-qt
for Debian-based Linux systems. If you compile bluemobiusd/bluemobius-qt yourself, there are some useful files here.

## bluemobius: URI support ##


bluemobius-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install bluemobius-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your bluemobius-qt binary to `/usr/bin`
and the `../../share/pixmaps/bluemobius128.png` to `/usr/share/pixmaps`

bluemobius-qt.protocol (KDE)

