#!/bin/bash

echo "Installing usefull packages with apt-get..."
sudo apt-get install git python2.7 python2.7-dev python-pip pinta gimp > /dev/null;
pip install --upgrade pip > /dev/null;

echo "Downloading and installing Sublime Text..."
wget https://download.sublimetext.com/sublime-text_build-3126_amd64.deb
sudo dpkg -i sublime-text_build-3126_amd64.deb
mv ~/.local/share/applications/sublime_text.desktop ~/.local/share/applications/sublime_text.desktop.old
cp /usr/share/applications/sublime_text.desktop ~/.local/share/applications/sublime_text.desktop
sudo update-desktop-database


echo "Downloading and installing Rstudio v1.0.143..."
wget https://download1.rstudio.org/rstudio-1.0.143-amd64.deb 
sudo apt-get install libjpeg62 r-base # Dependency of rstudio
sudo dpkg -i rstudio-1.0.143-amd64.deb > /dev/null


echo "Downloading and installing MongoDB..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6
echo "deb [ arch=amd64,arm64 ] http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.4.list
sudo apt-get update
sudo apt-get install -y mongodb-org

echo "Downloading and installing RoboMongo IDE..."
wget https://download.robomongo.org/1.0.0/linux/robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz
tar -xvzf robomongo-1.0.0-linux-x86_64-89f24ea.tar.gz
chmod +x robomongo-1.0.0-linux-x86_64-89f24ea/bin/robomongo
sudo mkdir /usr/local/bin/robomongo-1.0.0
sudo mv  robomongo-1.0.0-linux-x86_64-89f24ea/* /usr/local/robomongo-1.0.0
echo export PATH=/usr/local/robomongo-1.0.0/bin:$PATH >> ~/.bashrc


echo "Downloading and installing Dropbox..."
wget https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.10.28_amd64.deb
sudo dpkg -i dropbox_2015.10.28_amd64.deb > /dev/null


echo "Downloading and installing Spotify..."
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client


echo "Downloading and installing QtCreator..."
wget http://download.qt.io/official_releases/qt/5.8/5.8.0/qt-opensource-linux-x64-5.8.0.run
chmod +x qt-opensource-linux-x64-5.8.0.run
./qt-opensource-linux-x64-5.8.0.run


echo "Downloading and installing Pycharm 2017.1..."
wget https://download-cf.jetbrains.com/python/pycharm-community-2017.1.1.tar.gz
tar -xvzf community_images.tar.gz
./pycharm-community-2017.1.1/bin/pycharm.sh


echo "Installing other dependencies... boost, etc"
sudo apt-get install libboost-dev libboost-filesystem-dev


echo "Downloading and installing OpenCV and opencv_contrib"
mkdir ~/opencv
git clone https://github.com/daveselinger/opencv.git ~/opencv/opencv-3.1.0/
cd ~/opencv/opencv-3.1.0/ && git checkout 3.1.0-with-cuda8 

cd ..
git clone https://github.com/opencv/opencv_contrib opencv_contrib
cd opencv_contrib && git checkout 3.1.0

# After compiling
sudo ln -s ~/opencv/opencv-3.1.0/3rdparty/ippicv/unpack/ippicv_lnx/lib/intel64/libippicv.a /usr/local/lib/

