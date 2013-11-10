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

locate() {
    find / -name "$1" 2>/dev/null
}

internetquery() {
    ping -q -w 1 -c 1 $(ip r | grep default | cut -d ' ' -f 3) \
               > /dev/null && echo "Internet up" || echo "No Internet"
}
# Use modern completion system
autoload -Uz compinit
compinit

# Exports

export EDITOR="emacs"

# Aliases

alias enox="emacs -nw"
alias grep="grep --color=auto -i"
alias kxt="~/killxdots/kxt"
alias w3m="emacs -nw -f w3m" #Doesn't work on darthsideous/
alias ccolors="~/consolecolor/ccolors"
alias gcm="git commit -m"
alias gpom="git push origin master"
alias gst='git status'
alias gdiff='git diff'


# These depend on /etc/sudoers reading
# %users  ALL=(ALL:ALL) ALL
# %users  ALL=NOPASSWD: /usr/bin/xset, /usr/bin/shutdown, /sbin/reboot, /sbin/poweroff, /bin/systemctl
# %sudo   ALL=NOPASSWD: /usr/bin/xset, /usr/bin/systemctl, /sbin/reboot, /sbin/poweroff, /usr/bin/killall, /usr/bin/pkill
alias off="sudo /sbin/poweroff"
alias reboot="sudo /sbin/reboot"
alias shutdown="sudo /sbin/shutdown"


# Awk Alias for speedy cli pipes.
alias -g A1="| awk '{print \$1}'"
alias -g A2="| awk '{print \$2}'"
alias -g A3="| awk '{print \$3}'"
alias -g A4="| awk '{print \$4}'"
alias -g A5="| awk '{print \$5}'"
alias -g A6="| awk '{print \$6}'"
alias -g A7="| awk '{print \$7}'"
alias -g A8="| awk '{print \$8}'"
alias -g A9="| awk '{print \$9}'"

# Quick Edit of often Used Startup Files
alias Ez='$EDITOR ~/.zshrc'

# Set up specifics for different systems
if [ "$HOST" = "darthsideous" ]; then
    zsh_config="Darth Sideous"
    source ~/dotfiles/zshrcdarth
elif [ "$HOST" = "elektra" ]; then
    zsh_config="Elektra"
    source ~/dotfiles/zshrcelektra
elif [ "$HOST" = "t43" ]; then
    zsh_config="T 43"
    source ~/dotfiles/zshrct43
fi
