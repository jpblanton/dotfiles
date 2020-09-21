sudo apt-get update
sudo apt-get -y install vim-nox cmake python3-dev build-essential tmux
sudo apt-get -y install npm nodejs golang-go
ln -sv ~/dotfiles/.vimrc ~/.vimrc
vim -E -c PluginInstall -c q -c q
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --all

for file in ~/dotfiles/.[^.]*;
	do ln -sv $file "~/${file##*/}";
	do echo "${file##*/}";
done
