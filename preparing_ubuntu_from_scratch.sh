#!/bin/bash


#echo "Adding custom aliases"
./installing_aliases.sh
source ~/.bashrc

echo "Moving to home folder"
cd ~
pwd

DIST_CODE_NAME=$(lsb_release -cs) #$(echo $(lsb_release -c) | cut -d " " -f 2)

echo "Requiring su access to download, install and update programs"
sudo apt-get update > /dev/null


echo "Installing usefull packages with apt-get..."
sudo apt-get install git python2.7 python2.7-dev python-pip pinta gimp inkscape -y > /dev/null
sudo apt-get install libboost-dev libboost-filesystem-dev -y > /dev/null
pip install --upgrade pip > /dev/null;


echo "Downloading and installing SUBLIME Text v3126..."
wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb > /dev/null
sudo dpkg -i sublime-text_build-3126_amd64.deb  > /dev/null
mv ~/.local/share/applications/sublime_text.desktop ~/.local/share/applications/sublime_text.desktop.old
cp /usr/share/applications/sublime_text.desktop ~/.local/share/applications/sublime_text.desktop
sudo update-desktop-database
rm sublime-text_build-3126_amd64.deb
sudo apt-get update > /dev/null


echo "Downloading and installing R-Language..."
sudo apt-get install libgstreamer0.10-0 libgstreamer-plugins-base0.10-0 -y > /dev/null # Dependencies
echo "deb https://cran.rediris.es/bin/linux/ubuntu $DIST_CODE_NAME/" | sudo tee -a /etc/apt/sources.list
gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
gpg -a --export E084DAB9 | sudo apt-key add -
sudo apt-get update
sudo apt-gey install r-base -y


echo "Downloading and installing Rstudio v1.0.143..."
wget https://download1.rstudio.org/rstudio-1.0.143-amd64.deb
sudo apt-get install libjpeg62 r-base -y # Dependency of rstudio
sudo dpkg -i rstudio-1.0.143-amd64.deb > /dev/null
rm rstudio-1.0.143-amd64.deb


echo "Downloading and installing MongoDB..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu $DIST_CODE_NAME/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org


echo "Downloading and installing RoboMongo IDE..."
wget https://download.robomongo.org/1.0.0/linux/robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz > /dev/null
tar -xvzf robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz
chmod +x robomongo-1.0.0-linux-x86_64-89f24ea/bin/robomongo
sudo mkdir /usr/local/bin/robomongo-1.0.0
sudo mv  robomongo-1.0.0-linux-x86_64-89f24ea/* /usr/local/bin/robomongo-1.0.0
echo export PATH=/usr/local/bin/robomongo-1.0.0/bin:$PATH >> ~/.bashrc
rm robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz
rm -r robomongo-1.0.0-linux-x86_64-89f24ea


echo "Downloading and installing Dropbox..."
wget -O delete_dropbox https://www.dropbox.com/download?plat=lnx.x86_64
tar xzf delete_dropbox
./.dropbox-dist/dropboxd &
rm delete_dropbox


echo "Downloading and installing Spotify..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client -y


echo "Downloading and installing Docker"
sudo apt-get -y install apt-transport-https ca-certificates curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update && sudo apt-get -y install docker-ce


echo "Downloading and installing Scala and SBT"
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823
sudo apt-get update & sudo apt-get install sbt


echo "Downloading and installing QtCreator..."
wget http://download.qt.io/official_releases/qt/5.8/5.8.0/qt-opensource-linux-x64-5.8.0.run
chmod +x qt-opensource-linux-x64-5.8.0.run
./qt-opensource-linux-x64-5.8.0.run && rm qt-opensource-linux-x64-5.8.0.run &


echo "Downloading and installing Skype..."
curl https://repo.skype.com/data/SKYPE-GPG-KEY | sudo apt-key add -
wget -O skype_delete.deb https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skype_delete.deb
rm skype_delete.deb


echo "Installing virtualbox"
echo "deb http://download.virtualbox.org/virtualbox/debian $DIST_CODE_NAME contrib" | sudo tee -a /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-5.1


echo "Installing VLC player and OpenShot video editor"
sudo apt-get install vlc openshot -y


echo "Installing bluetooth libraries and dependencies in order to use PYBLUEZ"
sudo apt-get install bluez libbluetooth-dev -y
sudo pip install pybluez


echo "Installing ruby and rails"
sudo apt-get update
sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev nodejs
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install 2.4.1
rbenv global 2.4.1
ruby -v
gem install bundler
rbenv rehash
sudo apt-get install -y nodejs
gem install rails -v 5.1.3
rbenv rehash
sudo apt-get install mysql-server mysql-client libmysqlclient-dev


echo "Downloading and Installing Atom Editor"
wget -O atom_deb https://atom.io/download/deb
sudo dpkg -i atom_deb
rm atom_deb


SOFT="WebStorm"; VER="2017.2.3"
echo "Downloading and installing $SOFT-$VER..."
wget -O $SOFT-IDE.tar.gz https://download-cf.jetbrains.com/webstorm/WebStorm-$VER.tar.gz
mkdir $SOFT\_$VER && tar xf $SOFT-IDE.tar.gz -C $SOFT\_$VER --strip-components 1
./$SOFT\_$VER/bin/webstorm.sh &
rm $SOFT-IDE.tar.gz


SOFT="CLion"; VER="2017.1.2"
echo "Downloading and installing $SOFT-$VER..."
wget -O $SOFT-IDE.tar.gz https://download-cf.jetbrains.com/cpp/CLion-$VER.tar.gz
mkdir $SOFT\_$VER && tar xf $SOFT-IDE.tar.gz -C $SOFT\_$VER --strip-components 1
./$SOFT\_$VER/bin/clion.sh &
rm $SOFT-IDE.tar.gz


SOFT="Pycharm"; VER="2017.2.1"
echo "Downloading and installing $SOFT-$VER..."
wget -O $SOFT-IDE.tar.gz https://download-cf.jetbrains.com/python/pycharm-professional-$VER.tar.gz
mkdir $SOFT\_$VER && tar xf $SOFT-IDE.tar.gz -C $SOFT\_$VER --strip-components 1
./$SOFT\_$VER/bin/pycharm.sh &
rm $SOFT-IDE.tar.gz


#echo "Downloading and installing OpenCV and opencv_contrib"
#mkdir ~/opencv
#git clone https://github.com/daveselinger/opencv.git ~/opencv/opencv-3.1.0/
#cd ~/opencv/opencv-3.1.0/ && git checkout 3.1.0-with-cuda8
#
#cd ..
#git clone https://github.com/opencv/opencv_contrib opencv_contrib
#cd opencv_contrib && git checkout 3.1.0
#
## After compiling
#sudo ln -s ~/opencv/opencv-3.1.0/3rdparty/ippicv/unpack/ippicv_lnx/lib/intel64/libippicv.a /usr/local/lib/
