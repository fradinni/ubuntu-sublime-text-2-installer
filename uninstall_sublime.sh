#!/bin/bash
echo
echo ======================================
echo == Sublime Text 2 - Ubuntu Installer =
echo ======================================
echo
echo Uninstalling Sublime Text 2...
echo --------------------------------------

echo "-> Kill process..."
killall subl > /dev/null 2>&1
killall sublime > /dev/null 2>&1

echo "-> Remove desktop shortcut..."
rm /usr/share/applications/sublime.desktop > /dev/null 2>&1

echo "-> Remove bin..."
rm /usr/bin/sublime > /dev/null 2>&1
rm /usr/bin/subl > /dev/null 2>&1

echo "-> Remove application files..."
rm -Rf /usr/lib/Sublime\ Text\ 2

echo "-> Remove application config..."
rm -Rf ${HOME}/.config/sublime-text-2 > /dev/null 2>&1

echo "Sublime Text 2 was uninstalled."
echo
echo "Press [Enter] to exit..."
read end
exit 0


