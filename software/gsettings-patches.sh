#!/bin/sh

[ -z "$tmppath" ] && eval "$(curl -s "https://raw.githubusercontent.com/Rob9315/installscripts/master/setdefaults.sh")"

# set terminal font if not already set
[ -z "$termfont" ] && read -p "Please input your preferred Terminal Font (when in doubt, pick Monospace)"$'\n'"> " termfont

# get active profile id
term_active_profile=$(gsettings get org.gnome.Terminal.ProfilesList default)
term_active_profile=${term_active_profile:1:-1}

# terminal settings
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ font "$termfont 11"
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ use-theme-colors true
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$term_active_profile/ login-shell true
# touchpad settings
gsettings set org.gnome.desktop.peripherals.touchpad edge-scrolling-enabled false
gsettings set org.gnome.desktop.peripherals.touchpad send-events 'enabled'
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.peripherals.touchpad tap-to-click true
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing false
# mouse settings
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll false
# shortcuts
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left "['<Shift><Control><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right "['<Shift><Control><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-left "['<Control><Alt>Left']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-right "['<Control><Alt>Right']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up "['<Shift><Control><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down "['<Shift><Control><Alt>Down']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up "['<Control><Alt>Up']"
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down "['<Control><Alt>Down']"
# disable hot corner
gsettings set org.gnome.desktop.interface enable-hot-corners false || gsettings set org.gnome.shell enable-hot-corners false
