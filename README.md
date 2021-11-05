# cyandroid

This is a downstream fork from sarchile but for deploying Fedora Linux on Android which is also using help from proot and Termux.

The reasons why I made this fork are...

* I want to experiment with Fedora Linux aarch64 on my Android phone along sarchile.
* According to [Arch Wiki](https://wiki.archlinux.org/title/Frequently_asked_questions#Why_would_I_not_want_to_use_Arch?), Arch Linux is only targeted for amd64 architecture so sarchile is heavily depends on Arch Linux ARM team for aarch64 variant. Arch Linux ARM team unofficially port Arch Linux to ARM devices and development itself is usually slow. Meanwhile, Fedora Linux is targeted for both amd64 and aarch64 architecture.

The name cyandroid is made off from cyan, the current Fedora theme color and an**droid**.

The current script will help you to install Fedora 34. Official Fedora 35 aarch64 container image hasn't been built until this time but Fedora 35 aarch64 repositories are ready so you may want upgrade to 35 right after installation.

cyandroid is not a product of Weeb/Linux, nor do I suggest you to use this over [termux-fedora](https://github.com/nmilosev/termux-fedora).

## Installation

Just like sarchile installation (copied from sarchile wiki): 

Execute this command on Termux (optional, but recommended):
```
termux-setup-storage
```
Tap Allow if you're prompted to grant Termux access to Phone's internal storage.

Install curl package on Termux:
```
pkg install curl -y
```

Initialize system and install cyandroid management script:
```
curl -Lso- https://git.io/JPN0w | bash
```

Start cyandroid installation:
```
fedora install
```
