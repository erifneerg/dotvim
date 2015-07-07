ln -s ~/dotvim/vimrc ~/.vimrc 
ln -s ~/dotvim ~/.vim
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > NeoInstall.sh
sh ./NeoInstall.sh
echo "Make a folder for swap, undo, and backup in:"
echo "  ~/.local/share/vim/undo on Linux"
echo "  ~/Library/Vim/undo on OS X"
