###############################################
# Zero Shell Configuration                    #
# sources .zsh_history for completions        #
#                                             #
###############################################



# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam2

# Setopts
setopt histignorealldups sharehistory
setopt path_dirs
setopt no_beep
setopt auto_cd
setopt print_exit_value

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Functions
extract () {
    # A check for flags on compressed files.
    if [ -f $1 ] ; then
	case $1 in
	    *.tar.bz2)
		tar -xvjf $1
		;;
	    *.tar.gz)
		tar -xvzf $1
		;;
	    *.bz2)
		bunzip2 $1
		;;
	    *.rar)
		unrar x $1
		;;
	    *.gz)
		gunzip $1
		;;
	    *.tar)
		tar -xf $1
		;;
	    *.tbz2)
		tar -xvjf $1
		;;
	    *.tgz)
		tar -xvzf $1
		;;
	    *.zip)
		unzip $1
		;;
	    *.Z)
		uncompress $1
		;;
	    *)
		echo "$1 is not valid for extraction"
		;;
	esac
    else
	echo "$1 is not a valid file"
    fi
}

psgrep () {
    #Finds process numbers
    if [ ! -z $1 ] ; then
	echo "Grepping for processes matching $1..."
	ps aux | grep $1 | grep -v grep
    else
	echo "!! Need name to grep for"
    fi
}

dls () {
	# directory ls
	echo $(ls -l | grep "^d" | awk '{ print $9 }' | tr -d "/")
}

killit() {
    #Kills process that match a regexp in the argv
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

# crun -- compile and run .c program
crun() {
  local cprog=$1; shift
  local n=$@[(i)--]
  gcc -o ${cprog%.*} $cprog $@[1,n-1] && ./${cprog%.*} $@[n+1,-1]
}

clean_empty() {
    rm -i (.L0) *.bak(.)
}

widthcheck() {
    echo ${(l:79::-:)}
}

Newest() {
    echo "Newest Directory"
    ls -ld *(/om[1])
    echo ${(l:$COLUMNS::-:)}
}
# Use modern completion system
autoload -Uz compinit
compinit

# Exports

export EDITOR="emacs"

# Aliases

alias "grep"="grep --color=auto -i"
alias kxt="~/killxdots/kxt"
alias w3m="emacs -nw -f w3m"
alias ccolors="~/consolecolor/ccolors"
alias gcm="git commit -m"
alias gpom="git push origin master"

# These depend on /etc/sudoers reading
# %user_name ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown
alias off="sudo /sbin/poweroff"
alias reboot="sudo /sbin/reboot"
alias shutdown="sudo /sbin/shutdown"
