#!/data/data/com.termux/files/usr/bin/bash

DIR=~/.sarchile

case "$1" in
	install)
		IMAGE=https://github.com/Weeb-Linux/sarchile/releases/download/base/base.tar.gz
		
		# Create a directory for sarchile
		echo "sarchile rootfs will be installed under directory .sarchile"
		mkdir $DIR
		cd $DIR
		echo ""

		# Get base image for installation
		echo "Getting sarchile base image, please do not kill the installation unless error messages are spawned."
		echo "Please wait, this may take a while..."
		/data/data/com.termux/files/usr/bin/aria2c $IMAGE -o sarchile.tar.gz -x 16 -q

		# Extract base image
		echo "Extracting base image..."
		/data/data/com.termux/files/usr/bin/tar xf sarchile.tar.gz > /dev/null 2>&1 # hide all hard link error
																					# because we are not using root
																					# this is expected and totally fine

		# Finish the installation
		chmod +w .
		echo "Reclaiming disk space..."
		rm sarchile.tar.gz

		# Fix directories permission

		chmod -R 755 $DIR/etc
		chmod -R 755 $DIR/usr
		chmod -R 755 $DIR/var

		# Fix resolv.conf duplicate

		mv $DIR/etc/resolvconf.conf $DIR/etc/resolv.conf

		# Finalizing
		echo "Installation completed! Fire it up with smgr start."
		echo ""
		echo "We highly suggest you to immediately update the sarchile to even with Arch repository"
		echo "by executing pacman -Syyu"
		echo ""
		echo "Enjoy!"
		;;
	uninstall)
		chmod -R 777 ~/.sarchile
	    rm -rf ~/.sarchile
	    echo "Successfully uninstalled sarchile!"
	    exit 0
	    ;;
	start)
		if [ -d $DIR ]
		then
			unset LD_PRELOAD && proot --link2symlink -0 -r ~/.sarchile -b /dev/ -b /sys/ -b /proc/ -b /storage/ -b $HOME -w $HOME /bin/env -i HOME=/root TERM="$TERM" LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/bash --login
		else
			echo "error: sarchile is not installed, cannot start."
			echo "Maybe smgr install instead?"
			exit 2
		fi
		;;
	*)
	    echo "Usage: smgr {install|uninstall|start}"
	    exit 2
	    ;;
esac

