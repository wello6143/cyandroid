echo "Welcome to cyandroid!"
echo "brought to you by Weeb/Linux Team."
echo "licensed under MIT License, free!"
echo ""

echo "======"

echo ""
echo "Installing required packages from Termux..."
echo ""

pkg install wget proot tar aria2 -y

echo "Installing cyandroid manager tool..."

wget -O /data/data/com.termux/files/usr/bin/fedora https://git.io/JPN0O
chmod +x /data/data/com.termux/files/usr/bin/fedora

echo "Environment initialization is done!"
echo "To begin with cyandroid installation, do fedora install."
