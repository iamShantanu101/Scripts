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
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - || OwnError "Unable To Fetch Google Repository :("
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list || OwnError "Unable To Add Google Repository :("

#NodeJs Repository
clear
echo "Install Repository For NodeJs..."
curl -sL https://deb.nodesource.com/setup_9.x | sudo -E bash -

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
sudo add-apt-repository -y ppa:openjdk-r/ppa || OwnError "Unable to add openjdk ppa"
sudo apt-get update
sudo apt-get install -y openjdk-7-jdk openjdk-7-jre icedtea-7-plugin

#Install Common Softwares
clear
echo "Installing Git Vim Filezilla Google-Chrome Skype Oracle-Jdk Opera"
sudo apt-get -y install git-core openssh-server shutter pv vim vlc curl filezilla google-chrome-stable sni-qt sni-qt:i386 libasound2-plugins:i386 ubuntu-restricted-extras p7zip-full p7zip-rar nodejs libcurl4-gnutls-dev libxml2 libxml2-dev libxslt1-dev libglib2.0-dev ruby ruby-dev phpunit || OwnError "Installation Failed :("

# Install diodon and diodon-plugins
sudo add-apt-repository -y ppa:diodon-team/stable
sudo apt-get update
sudo apt-get install -y diodon


# Install Skype
echo "Installing Skype"
skype_setup='skypeforlinux-64.deb'
if [ -f $skype_setup ] 
then	
    sudo dpkg -i skypeforlinux-64.deb
else
    wget https://repo.skype.com/latest/skypeforlinux-64.deb &&  sudo dpkg -i skypeforlinux-64.deb 
fi    

# Install phpcs
sudo curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar

# Install zoom
echo Installing zoom
zoom_setup='zoom_amd64.deb'
if [ -f $zoom_setup ]
then
   sudo dpkg -i zoom_amd64.deb
else
   wget https://zoom.us/client/latest/zoom_amd64.deb && sudo dpkg -i zoom_amd64.deb 
fi   

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
