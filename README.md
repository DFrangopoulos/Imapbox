# Imapbox
A short script for the Raspberry Pi that allows you to automatically download messages from an imap server, extract attachments and upload those attachments to Dropbox.

This script was tested on a Raspberry Pi 2 running 2016-02-09-raspbian-jessie-lite. There might still be some bugs as this is a project in development, use at your own risk.

# Step 1

Copy Imapbox_Install.sh , Imapbox_Deamon.sh, .offlineimaprc to /home/pi
run "sudo sh Imapbox_Install.sh"

When prompted for a UNIX password for the new user imapbox enter a password of your choice.

Next your will be taken to the raspi-config menu, expand the filesystem and change the password for the user pi to something secure if you haven't already done so. Else just exit raspi-config.

# Step 2

run "sudo su imapbox"

run "cd imapbox"

run "nano .offlineimaprc"

Replace YOUR_EMAIL_SERVER with the email server of your email provider. For example if your email provider is some_provider.com then YOUR_EMAIL_SERVER=some_provider.com and line 14 should look like remotehost = imap._some_provider.com

Replace YOUR_EMAIL_USERNAME with your email username. For example if your email address is test123@some_provider.com : YOUR_EMAIL_USERNAME=test123.

Replace YOUR_EMAIL_PASSWORD with your email password.

CTRL+O to save the changes and CTRL+X to exit.

# Step 3

run "offlineimap"

You should be greeted by and error : "ERROR: Server SSL fingerprint 'YOUR_CERT_FINGERPRINT' for hostname 'imap.some_provider.com' does not match configured fingerprint. Please verify and set 'cert_fingerprint' accordingly if not set yet."

run "nano .offlineimaprc"

Uncomment #cert_fingerprint = YOUR_CERT_FIGERPRINT and replace YOUR_CERT_FINGERPRINT with SSL the fingerprint you were given earlier by that error.

CTRL+O to save the changes and CTRL+X to exit.

# Step 4

Time to get an authorisation token from dropbox. 

Go to developer.dropbox.com then click on create an app, choose the Dropbox API, then select App folder, and finally name your app. To finalize click on Create App.

Scroll down to "Generated access token" and click on Generate. Copy that code to the clipboard.

# Step 5

run "nano Imapbox_Deamon.sh"

On line 28 replace "Please_insert_dropbox_token_here" with your freshly generated access token.

# Step 6 

run "exit" 

You should get switched back to user pi.

run "sudo nano /etc/rc.local"

Add " runuser -l imapbox -c 'sh /home/imapbox/Imapbox_Deamon.sh &' & " on the line before exit 0.

The line should look like this :

runuser -l imapbox -c 'sh /home/imapbox/Imapbox_Deamon.sh &' &

# Additional Notes

If you look into Imapbox_Deamon.sh you can see that there are some filters for the files that are downloaded, feel free to modify those filters to better suit your needs.


