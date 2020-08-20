alias jupy="jupyter notebook"
alias wpssh="ssh -i ~/AWS-stuff/wordpress.pem ec2-user@3.133.220.113"
alias ..="cd .."
alias py3=python3
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"

# Create a new directory and enter it
function mk() {
  mkdir -p "$@" && cd "$@"
}
