for file in ~/.{aliases,functions,exports}; do
	    [ -r "$file" ] && [ -f "$file" ] && source "$file";
    done;
    unset file;
export PATH_TO_PROJECTS="$HOME/Projects"

if [ -n "$VIRTUAL_ENV" ]; then
	    source $VIRTUAL_ENV/bin/activate;
fi
export PATH="$PATH:/opt/mssql-tools/bin"
# not sure what these are about
#. "$HOME/.cargo/env"

#. "$HOME/.local/bin/env"
