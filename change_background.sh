#! /bin/sh


workdir=$PWD
gst=/usr/share/gnome-shell/gnome-shell-theme.gresource
mkdir theme

for r in `gresource list $gst`; do
        gresource extract $gst $r >$workdir${r/#\/org\/gnome\/shell/}
done


echo "Extracted gnome-shell theme to the theme dir"

read a

echo "Please copy the login-background.png to the theme dir and press enter"

read a

if [ ! -e "theme/login-background.png" ]
   echo "Please try again"
fi

sed 's/noise-texture.png/login-background.png/' < theme/gnome-shell.css > gnome-shell.css

cd theme

echo '<?xml version="1.0" encoding="UTF-8"?>
<gresources>
  <gresource prefix="/org/gnome/shell/theme">' > gnome-shell-theme.gresource.xml


for i in *; do echo "    <file>$i</file>"; done >> gnome-shell-theme.gresource.xml

echo '  </gresource>
</gresources>' >> gnome-shell-theme.gresource.xml

echo "Compiling the theme again"

glib-compile-resources gnome-shell-theme.gresource.xml

echo "Installing the theme please enter the password"

sudo mv /usr/share/gnome-shell/gnome-shell-theme.gresource /usr/share/gnome-shell/gnome-shell-theme.gresource.bak
sudo cp gnome-shell-theme.gresource /usr/share/gnome-shell/gnome-shell-theme.gresource

