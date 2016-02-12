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

upload_to_db () {

curl -X POST https://content.dropboxapi.com/2/files/upload \
--header "Authorization: Bearer "$AUTH_CODE"" \
--header "Dropbox-API-Arg: {\"path\": \"$path_to_add\",\"mode\": \"add\",\"autorename\": true,\"mute\": false}" \
--header "Content-Type: application/octet-stream" \
--data-binary @"$file"
}

AUTH_CODE="Please_insert_dropbox_token_here"
username="imapbox"
time_to_sleep=600

while true
do

cd /home/$username/Temporary_Storage
offlineimap && munpack /home/$username/mail/INBOX/new/*

cd /home/$username/mail/INBOX/new

for file in *;
do
rm $file
done

cd /home/$username/Temporary_Storage

for file in *;
do

filename=$(echo $file | cut -c1-7)
extension="${file##*.}"

if [ "$filename" = "EEE2037" ] && [ "$extension" = "pdf" ];
then 
path_to_add="/lecture_notes/EEE2037/"$file""

result=$(upload_to_db | grep "server_modified")
if [ "$result" = "" ];
then
echo "Error - Not deleting "$file" from Temporary"
else
rm $file
result=""
fi


elif [ "$filename" = "EEE2038" ] && [ "$extension" = "pdf" ];
then 
path_to_add="/lecture_notes/EEE2038/"$file""

result=$(upload_to_db | grep "server_modified")
if [ "$result" = "" ];
then
echo "Error - Not deleting "$file" from Temporary"
else
rm $file
result=""
fi

elif [ "$filename" = "EEE2039" ] && [ "$extension" = "pdf" ];
then
path_to_add="/lecture_notes/EEE2039/"$file""

result=$(upload_to_db | grep "server_modified")
if [ "$result" = "" ];
then
echo "Error - Not deleting "$file" from Temporary"
else
rm $file
result=""
fi

elif [ "$filename" = "EEE2040" ] && [ "$extension" = "pdf" ];
then 
path_to_add="/lecture_notes/EEE2040/"$file""

result=$(upload_to_db | grep "server_modified")
if [ "$result" = "" ];
then
echo "Error - Not deleting "$file" from Temporary"
else
rm $file
result=""
fi

elif [ "$filename" = "German_" ] && [ "$extension" = "pdf" ];
then 
path_to_add="/lecture_notes/German/"$file""

result=$(upload_to_db | grep "server_modified")
if [ "$result" = "" ];
then
echo "Error - Not deleting "$file" from Temporary"
else
rm $file
result=""
fi

else mv $file /home/$username/Safe_Storage

fi 

done

sleep "$time_to_sleep"

done
