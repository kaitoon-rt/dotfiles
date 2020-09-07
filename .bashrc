[ -z "$TMUX" ] && command -v tmux > /dev/null && TERM=xterm-256color && { tmux attach -d || exec tmux new-session && exit;}
#[[ $TERM != "screen" ]] && TERM=xterm-256color && { tmux attach -d || exec tmux new-session && exit;}

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

alias less='less -r'
alias ls='ls -F --color --show-control-chars'
alias ll='ls -l'
alias gs='git status '
alias gss='git status -s'
alias gp='git pull -r'
alias gh='git push '
alias gho='git push -u origin '
alias up='git push '
alias upo='git push -u origin '
alias ga='git add '
alias gaa='git add -A'
alias gb='git branch '
alias gc='git commit '
alias gcm='git commit -m '
alias gd='git diff'
alias go='git checkout '
alias gob='git checkout -b'
alias gk='gitk --all&'
alias gx='gitx --all'
alias got='git '
alias get='git '
alias g='git '
alias gm='git merge '
alias gr='git reset '
alias gdf='git clean -f'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#[ -z "$TMUX"  ] && { tmux attach || exec tmux new-session && exit;}


# conda3
#export PATH="/mnt/host/c/tools/miniconda3/Scripts/:$PATH"
export PATH="/home/rapolt/miniconda3/Scripts/:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rapolt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rapolt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rapolt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rapolt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export TERM=xterm-256color

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/mnt/c/Windows/System32/:$PATH"
export BROWSER=wslview

export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=60%
--border
--margin=10%,5%
--multi
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--color fg:255,hl:84,fg+:255,bg+:236,hl+:215
--color info:141,prompt:84,spinner:212,pointer:212,marker:212
--prompt='∼ ' --pointer='▶' --marker='✓'
"

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
fi


function _conda_auto_activate() {
  if [ -e ".condaauto" ]; then
    echo ".condaauto file found"
    ENV=$(head -n 1 .condaauto)

    # Check to see if already activated to avoid redundant activating
    if [[ $PATH == *"$ENV"* ]]; then
      echo "Conda env '$ENV' already activated."
    else
      conda activate $ENV
    fi
  fi
}

function chpwd() {
  echo "changiong pwd"
  _conda_auto_activate
}

export WSL_INTEROP="/run/WSL/$(pstree -np -s | grep wsl | grep -o -E '[0-9]+' | sed -n 2p)_interop"

cd() {
   builtin cd "$1"
   if [ -e ".conda_auto" ]; then
     CONDA_ENV=$(head -n 1 .conda_auto)
     if [[ $PATH != *"$CONDA_ENV"* ]]; then
       conda activate $CONDA_ENV
     fi
   else
     conda activate base
   fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
