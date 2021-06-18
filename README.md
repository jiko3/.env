# .env


Some plugin can be installed only if package has been updated.
After they are updated, just install.sh again

1. sudo apt install curl
2. sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   ps.
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
   "     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


The ycmd server SHUT DOWN: YcmRestartServer
-> should go to ycmd folder, and then sh install.sh to find Err Msg
1. cmake version
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | sudo tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null
    sudo apt-add-repository 'deb https://apt.kitware.com/ubuntu/ bionic main'
2. vim version
    sudo add-apt-repository ppa:jonathonf/vim
    sudo apt-get update
    sudo apt-get install vim
3. C++ version
    sudo apt-get install g++-8
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 700 --slave /usr/bin/g++ g++ /usr/bin/g++-7
    sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800 --slave /usr/bin/g++ g++ /usr/bin/g++-8
