ln -s vimrc ~/.vimrc 
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
vim +BundleInstall +qa
echo "Make a folder for swap, undo, and backup in:"
echo "  ~/.local/share/vim/undo on Linux"
echo "  ~/Library/Vim/undo on OS X"
