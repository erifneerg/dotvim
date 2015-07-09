ln -s ~/dotvim/vimrc ~/.vimrc 
ln -s ~/dotvim ~/.vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > NeoInstall.sh
sh ./NeoInstall.sh
vim +NeoBundleInstall +qall
rm ./NeoInstall.sh
echo "  Vim setup"

if [[ "$(uname)" == 'Darwin' ]]; then
  mkdir -p ~/Library/Vim/undo
  echo "  Undo folder was made"
else
  echo "Make a folder for swap, undo, and backup in:"
  echo "  ~/.local/share/vim/undo on Linux"
fi
