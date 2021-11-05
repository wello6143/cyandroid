#!/data/data/com.termux/files/usr/bin/bash

DIR=~/.fedora

case "$1" in
	install)
		IMAGE=https://download.fedoraproject.org/pub/fedora/linux/releases/34/Container/aarch64/images/Fedora-Container-Base-34-1.2.aarch64.tar.xz
		
		# Create a directory for cyandroid
		echo "fedora rootfs will be installed under directory .fedora"
		mkdir $DIR
		cd $DIR
		echo ""

		# Get base image for installation
		echo "Getting fedora base image, please do not kill the installation unless error messages are spawned."
		echo "Please wait, this may take a while..."
		/data/data/com.termux/files/usr/bin/aria2c $IMAGE -o fedora.tar.xz -x 16 -q

		# Extract base image
		echo "Extracting base image..."
		/data/data/com.termux/files/usr/bin/tar xvf fedora.tar.xz --strip-components=1 --exclude json --exclude VERSION
		/data/data/com.termux/files/usr/bin/tar xpf layer.tar
		
		# Finish the installation
		chmod +w .
		echo "Reclaiming disk space..."
		rm fedora.tar.xz
		rm layer.tar
		
		# Quick fix DNS resolver
		
		echo "nameserver 1.1.1.1" > ~/.fedora/etc/resolv.conf
		
		# Finalizing
		echo "Installation completed! Fire it up with fedora start."
		echo ""
		echo "Enjoy!"
		;;
	uninstall)
		chmod -R 777 ~/.fedora
	    rm -rf ~/.fedora
	    echo "Successfully uninstalled cyandroid!"
	    exit 0
	    ;;
	start)
		if [ -d $DIR ]
		then
			unset LD_PRELOAD && proot --link2symlink -0 -r ~/.fedora -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login
		else
			echo "error: cyandroid is not installed, cannot start."
			echo "Maybe fedora install instead?"
			exit 2
		fi
		;;
	*)
	    echo "Usage: fedora {install|uninstall|start}"
	    exit 2
	    ;;
esac


