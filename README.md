# login-background
# Change the login background in gnome-shell
# just run the script and follow the instructions
# A demo login-background.png file is already given

On Ubuntu 17.10 the Vanilla GNOME login screen was changed to a modified Ubuntu Version which doesn't work with this !

however selecting gnome-shell.css in gdm3.css alternatives brings back Vanilla GNOME login screen and so this works !

```sudo update-alternatives --config gdm3.css```
