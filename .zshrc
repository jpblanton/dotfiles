source ~/.bashrc
# zsh built in vi mode
# bindkey -v
# view git branch on prompt
# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='%/ $(git_branch_name) %n %# '

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
