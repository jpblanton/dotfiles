# install python 3.7 first
# installing vim
sudo yum -y update
sudo yum install ncurses-devel
sudo yum install gcc openssl-devel bzip2-devel libffi-devel
cd /usr/src
sudo wget https://www.python.org/ftp/python/3.7.9/Python-3.7.9.tgz
sudo tar xzf Python-3.7.9.tgz
cd Python-3.7.9
sudo ./configure --enable-optimizations
sudo make altinstall
sudo rm /usr/src/Python-3.7.9.tgz
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
