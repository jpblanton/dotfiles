# install python 3.7 first
# installing vim
# this should check if it's on centOS - mostly useful for AWS instances so far
sudo yum -y update
sudo yum -y install gcc openssl-devel bzip2-devel libffi-devel
sudo yum -y install ncurses-devel cmake
cd /usr/src
sudo wget https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz
sudo tar xzf Python-3.7.9.tgz
cd Python-3.7.9
sudo ./configure --enable-optimizations --enable-shared
sudo make altinstall
sudo rm /usr/src/Python-3.7.9.tgz
echo "python 3.7 installed"
cd ~
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-cscope --enable-multibyte \
	    --with-python3-command=python3.7 \
	    --enable-python3interp \
	    --with-python3-config-dir=/usr/local/lib/python3.7/config-3.7m-x86_64-linux-gnu \
	    --enable-fail-if-missing
sudo make
sudo make install

# look up how to loop through these again & link that way is better
ln -sv ~/dotfiles/.vimrc ~/.vimrc
ln -sv ~/dotfiles/.bashrc ~/.bashrc
