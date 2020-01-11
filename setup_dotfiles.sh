#!/bin/sh
echo "setup dotfiles" 
ln -fs $(pwd)/.gitconfig $HOME/.gitconfig 
ln -fs $(pwd)/.tmux.conf $HOME/.tmux.conf 
ln -s $(pwd)/.vim $HOME/.vim
ln -fs $(pwd)/.vimrc $HOME/.vimrc
ln -fs $(pwd)/.zshrc $HOME/.zshrc

