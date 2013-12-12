#!/bin/bash
cd .

CF_DIR=`pwd`

#更新配置的子模块到最新版本
# hide this when useless now
#git submodule init
#git submodule update
#git submodule -q foreach git pull -q origin master

#.bash_profile
ln -si $CF_DIR/aliases/bash_profile ~/.bash_profile

# jump tool
ln -si $CF_DIR/aliases/markrc ~/.markrc

ln -si $CF_DIR/aliases/zshrc ~/.zshrc

#alias
ALIASES_DIR="$CF_DIR/aliases"
ALIASES_FILES=`ls $ALIASES_DIR/*aliases`
for f in $ALIASES_FILES
do
    F_NAME=`basename $f`
    ln -si $f ~/"."$F_NAME
done

#dir_colors
#ln -si dircolors.256dark ~/.dir_colors

# hide this when use MobaXterm ,it's color is good enough 
#ln -si $CF_DIR/dircolors-solarized/dircolors.256dark .dir_colors

#completion
COMPLETION_DIR="$CF_DIR/completions"
ALIASES_FILES=`ls $COMPLETION_DIR/*completion`
for f in $ALIASES_FILES
do
    F_NAME=`basename $f`
    ln -si $f ~/"."$F_NAME
done

#自动安装配置vim
# hide this because don't use k-vim
#sh -x $CF_DIR/k-vim/install.sh

# set the vim related 
VIM_PATH="$CF_DIR/vim/vim.tar"
tar -xvsf $VIM_PATH -C ~/
ln -si ~/.vim/vimrc ~/.vimrc

#bin
ln -si $CF_DIR/bin ~/bin

if [ ! -d ~/tmp ]
then
    mkdir ~/tmp
fi

#vim bk and undo dir
if [ ! -d ~/bak/vimbk ]
then
    mkdir -p ~/bak/vimbk
fi

if [ ! -d ~/bak/vimundo ]
then
    mkdir -p ~/bak/vimundo
fi

#configs
  #for ssh
# hide this unneccessary
:<<BLOCK
if [ -d ~/.ssh ]
then
    mkdir -p ~/.ssh
fi
ln -si $CF_DIR/config/ssh-config ~/.ssh/config

#for tmux
#ln -si $CF_DIR/config/tmux-config ~/.tmux.conf
ln -si $CF_DIR/config/tmux.conf ~/.tmux.conf

#for git
ln -si $CF_DIR/config/git-config ~/.gitconfig
BLOCK
