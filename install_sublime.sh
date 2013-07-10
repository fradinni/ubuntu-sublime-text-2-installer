#!/bin/sh
echo
echo ======================================
echo == Sublime Text 2 - Ubuntu Installer =
echo ======================================
echo
echo Installing Sublime Text 2...
echo --------------------------------------
echo Downloading linux archive

DEV=0

if [ -d "./sublime_installer_tmp" ]; then
	echo "Temporary installation directory already exists."
else
	echo -n "Create temporary installation directory: [./sublime_installer_tmp]... "
	mkdir ./sublime_installer_tmp
	if [ -d "./sublime_installer_tmp" ]; then
		echo "[OK]"
	fi
fi
echo

#Go into temp install dir
cd ./sublime_installer_tmp

#Download linux archive file
ARCH=`uname -m`
echo -n "Architecture: "
if [ ${ARCH} = "x86_64" ]; then
	echo "64bits."
	if [ ${DEV} -eq 0 ]; then
		if [ ! -f "./Sublime Text 2.0.2 x64.tar.bz2" ]; then
			wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2%20x64.tar.bz2
		fi
	fi
else
	echo "32bits."
	if [ ${DEV} -eq 0 ]; then
		if [ ! -f "./Sublime Text 2.0.2.tar.bz2" ]; then
			wget http://c758482.r82.cf2.rackcdn.com/Sublime%20Text%202.0.2.tar.bz2
		fi
	fi
fi

#Extract archive
tar -xvjf ./*.bz2

#Test if Sublime Text 2 is extracted
if [ ! -d "./Sublime Text 2" ]; then
	echo "Unable to find extracted Sublime Text 2 directory."
	echo "Exit."
	exit 1
fi

#Copy files to /usr/lib/Sublime Text 2
if [ ${DEV} -eq 0 ]; then
	cp -r ./Sublime\ Text\ 2 /usr/lib/Sublime\ Text\ 2
fi

#Make symlink from Sublime Text 2 binary file to /usr/bin/sublime
if [ ${DEV} -eq 0 ]; then
	ln -s /usr/lib/Sublime\ Text\ 2/sublime_text /usr/bin/subl
fi

#Create .desktop file
DESK_FILE=./sublime.desktop
touch ${DESK_FILE}
echo "[Desktop Entry]" > ${DESK_FILE}
echo "Version=1.0" >> ${DESK_FILE}
echo "Name=Sublime Text 2" >> ${DESK_FILE}
echo "# Only KDE 4 seems to use GenericName, so we reuse the KDE strings." >> ${DESK_FILE}
echo "# From Ubuntu's language-pack-kde-XX-base packages, version 9.04-20090413." >> ${DESK_FILE}
echo "GenericName=Sublime Text" >> ${DESK_FILE}
echo "" >> ${DESK_FILE}
echo "Exec=sublime %f %U" >> ${DESK_FILE}
echo "Terminal=false" >> ${DESK_FILE}
echo "" >> ${DESK_FILE}
echo "Icon=/usr/lib/Sublime Text 2/Icon/48x48/sublime_text.png" >> ${DESK_FILE}
echo "Type=Application" >> ${DESK_FILE}
echo "Categories=TextEditor;IDE;Development" >> ${DESK_FILE}
echo "X-Ayatana-Desktop-Shortcuts=NewWindow" >> ${DESK_FILE}
echo "" >> ${DESK_FILE}
echo "[NewWindow Shortcut Group]" >> ${DESK_FILE}
echo "Name=New Editor" >> ${DESK_FILE}
echo "Exec=sublime -n" >> ${DESK_FILE}
echo "TargetEnvironment=Unity" >> ${DESK_FILE}
echo "" >> ${DESK_FILE}

#Move desktp file to /usr/share/applications
if [ ${DEV} -eq 0 ]; then
	mv ./sublime.desktop /usr/share/applications/sublime.desktop
fi

cd ..
rm -Rf sublime_installer_tmp/

echo 
echo "Installation done."
cd ..
echo "Press [Enter] to exit and launch Sublime Text 2..."
read end
subl &

exit 0
