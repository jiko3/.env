#!/bin/sh
#This is a script to build a convience enviroment
cd $(pwd)
RSYNC=$(which rsync)

if [ $? -eq 0 ] 
then
	COPY_TOOL=$RSYNC
	RSYNC="Y"
else 
	COPY_TOOL=$(which cp)
	RSYNC="N"
fi

echo "using $COPY_TOOL to copy files"
if [ "$RSYNC" = "Y" ]
then
	$COPY_TOOL -av --delete vim/colors ~/.vim
else
	$COPY_TOOL vim/colors ~/.vim
fi

ln -sf `pwd`/vim/.vimrc ~/.vimrc
rm -rf ~/.vim
ln -sf `pwd`/vim/.vim ~/.vim
ln -sf `pwd`/tmux/.tmux.conf ~/.tmux.conf
ln -sf `pwd`/bash/.bashrc ~/.bashrc
ln -sf `pwd`/bash/.bash_profile ~/.bash_profile
ln -sf `pwd`/bash/.inputrc ~/.inputrc
ln -sf `pwd`/ssh ~/.ssh
ln -sf `pwd`/git/.gitconfig ~/.gitconfig
rm -rf ~/bin
ln -sf `pwd`/bin ~/bin
rm -rf ~/util_scripts
ln -sf `pwd`/util_scripts ~/util_scripts

uname -a | grep -i "ubuntu" > /dev/null
if [ $? -eq 0 ]
then
    sudo apt-get update
    sudo apt-get install -y -q python-pip python-dev build-essential 
    sudo pip install --upgrade pip 
    sudo pip install --upgrade virtualenv 
    sudo pip install --upgrade pycscope
    sudo apt-get install -y -q vim
    sudo apt-get install -y -q git
    sudo apt-get install -y -q tig
    sudo apt-get install -y -q exuberant-ctags
    sudo apt-get install -y -q cscope
    sudo apt-get install -y -q cmake
    sudo apt-get install -y -q g++
    sudo apt-get install -y -q sqlite3
    sudo apt-get install -y -q libsqlite3-dev
    sudo apt-get install -y -q qt4-dev-tools
    sudo apt-get install -y -q libqscintilla2-dev
else
    echo "other linux distrubution"
fi

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#build codequery
temp_dir=$(mktemp -d)
cd $temp_dir
git clone https://github.com/ruben2020/codequery.git
cd codequery
mkdir build
cd build
cmake -G "Unix Makefiles" ..
make
sudo make install

vim +PluginInstall +qall
vim +PlugInstall +qall
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer
############################
#  install python packages #
############################
sudo pip install flake8

cd ~

export PATH=`pwd`/bin:`pwd`/util_scripts:$PATH
