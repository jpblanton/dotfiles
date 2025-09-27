source ~/.bashrc
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# zsh built in vi mode
# bindkey -v
# view git branch on prompt
# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
if [ -n "$SSH_CLIENT" ]; then
    prompt='%F{cyan}%n@%m %~ $(git_branch_name) # '
else
    prompt='%n@%m %~ $(git_branch_name) # '
fi

# loading antigen
source ~/antigen.zsh

# load oh-my-zsh
antigen use oh-my-zsh

# improved vi mode
antigen bundle jeffreytse/zsh-vi-mode
antigen bundle git

#antigen theme robbyrussell

# tell antigen that I'm done
antigen apply

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

. "$HOME/.local/bin/env"
