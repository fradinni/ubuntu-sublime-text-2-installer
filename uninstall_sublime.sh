#!/bin/bash
echo
echo ======================================
echo == Sublime Text 2 - Ubuntu Installer =
echo ======================================
echo
echo Uninstalling Sublime Text 2...
echo --------------------------------------

killall sublime
rm /usr/share/applications/sublime.desktop
rm /usr/bin/sublime
rm -Rf /usr/lib/Sublime\ Text\ 2
rm -Rf ${HOME}/.config/sublime-text-2

echo "Sublime Text 2 was removed."
echo
echo "Press [Enter] to exit..."
read end
exit 0


