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

# improved vi mode
antigen bundle jeffreytse/zsh-vi-mode

# tell antigen that I'm done
antigen apply
