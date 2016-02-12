#!/bin/bash
#   Copyright (C) {2016}  {Dionyssios Frangopoulos}
#
#   Imapbox
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.

#To be placed in /home/pi and executed with elevated privileges.

apt-get install offlineimap mpack curl bash -y
adduser imapbox

mv Imapbox_Deamon.sh /home/imapbox
mv .offlineimaprc /home/imapbox
cd /home/imapbox
mkdir Temporary_Storage 
mkdir Safe_Storage
mkdir Email
cd ..

chown -R imapbox imapbox/
chgrp -R imapbox imapbox/
chmod -r 700 imapbox

raspi-config



