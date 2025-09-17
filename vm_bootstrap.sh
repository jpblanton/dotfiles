#!/bin/bash
dotfilesDir="${HOME}/dotfiles"

function linkDotfile {
  dest="${HOME}/${1}"
  dateStr=$(date +%Y-%m-%d-%H%M)

  if [ -h ~/${1} ]; then
    # Existing symlink 
    echo "Removing existing symlink: ${dest}"
    rm ${dest} 
	  
  elif [ -f "${dest}" ]; then
    # Existing file
    echo "Backing up existing file: ${dest}"
    mv ${dest}{,.${dateStr}}
		
  elif [ -d "${dest}" ]; then
    # Existing dir
    echo "Backing up existing dir: ${dest}"
    mv ${dest}{,.${dateStr}}
  fi
	
  echo "Creating new symlink: ${dest}"
  ln -s ${dotfilesDir}/${1} ${dest}
}

linkDotfile .aliases
linkDotfile .bash_profile
linkDotfile .bashrc
linkDotfile .exports
linkDotfile .functions
linkDotfile .gitconfig
linkDotfile .gitignore
linkDotfile .pythonrc
linkDotfile .tmux.conf
linkDotfile .vimrc
linkDotfile .zshrc
linkDotfile .pylintrc
linkDotfile dtime.py
linkDotfile now.py
source ~/.bashrc

sudo apt update && sudo apt upgrade
sudo apt -y install zsh vim
curl -fsSL test.docker.com -o get-docker.sh && sh get-docker.sh
sudo usermod -aG docker ${USER}
curl -L git.io/antigen > ~/antigen.zsh
chsh -s /bin/zsh
export PYTHONSTARTUP=~/.pythonrc
