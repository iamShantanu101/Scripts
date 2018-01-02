#!/bin/bash
#Error Handling
OwnError()
{
#Redirect All STDIN 2 STDOUT
echo "$@" >&2
exit 1
}
# Unhide Startup
sudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop
#Update The Cache
clear
echo "Updating Cache..."
sudo apt-get update || OwnError "Updating Cache Failed :("
# Install Apt-Add-Repository Python Tool
sudo apt-get install python-software-properties || OwnError "Unable To Install Python Software Properties :("
#Google Repository
clear
echo "Install Repository For Google..."
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
 || OwnError "Unable To Fetch Google Repository :("
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
 || OwnError "Unable To Add Google Repository :("

#NodeJs Repository
clear
echo "Install Repository For NodeJs..."
sudo add-apt-repository -y ppa:chris-lea/node.js || OwnError "Unable To NodeJs Repository :("
#Shutter Repository
clear
echo "Install Repository For Shutter..."
sudo add-apt-repository -y ppa:shutter/ppa || OwnError "Unable To Add Shutter Repository :("
#Update The Cache
clear
echo "Updating Cache..."
sudo apt-get update || OwnError "Updating Cache Failed :("

# openjdk install
echo "Adding ppa for openjdk install"
sudo add-apt-repository ppa:openjdk-r/ppa
sudo apt-get update
sudo apt-get install -y openjdk-7-jdk openjdk-7-jre icedtea-7-plugin

#Install Common Softwares
clear
echo "Installing Git Vim Filezilla Google-Chrome Skype Oracle-Jdk Opera"
sudo apt-get -y install git-core openssh-server shutter pv vim vlc curl filezilla google-chrome-stable sni-qt sni-qt:i386 libasound2-plugins:i386 ubuntu-restricted-extras p7zip-full p7zip-rar gnome-terminal:i386 gnome-terminal nodejs libcurl4-gnutls-dev libxml2 libxml2-dev libxslt1-dev libglib2.0-dev ruby ruby-dev || OwnError "Installation Failed :("

# Install diodon and diodon-plugins
sudo add-apt-repository ppa:diodon-team/stable
sudo apt-get update
sudo apt-get install diodon


# Install Skype
echo "Installing Skype"
wget https://repo.skype.com/latest/skypeforlinux-64.deb &&  dpkg -i skypeforlinux-64.deb 

#Install SASS
clear
echo "Install SASS"
sudo gem install sass
#Install Compass
clear
echo "Install Compass"
sudo gem install compass
#Install Grunt CLI
clear
echo "Install Grunt"
sudo npm install -g grunt-cli

echo "All Task Susscessfully Finished........"
