# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
 
# Colors definitions.
# In this file we define some alias for all the colors we can use 
# to format the bash output. Just making it look good
if [ -f ~/.bash_colors ]; then
    . ~/.bash_colors
fi

# Git prompt
if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
  GIT_PS1_SHOWUPSTREAM="verbose"
fi

# Git completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
 
# display current git branch in terminal
parse_git_branch() {
   git rev-parse --abbrev-ref HEAD 2> /dev/null
}
 
format_git_branch() {
   parse_git_branch | sed -e 's/* \(.*\)/(\1) /' 
}
 
parse_current_package_version() {
  grep "version" package.json 2> /dev/null | head -1 | awk -F: '{ print $2 }' | sed 's/[\",]//g' | tr -d '[[:space:]]' | sed -e 's/\(.*\)/ 📦  \1/' 
}
 
parse_current_node_version() {
  node --version 2> /dev/null | sed -e 's/\(.*\)/ ⚙️  \1/' 
}
 
parse_current_npm_version() {
  npm --version 2> /dev/null 
}
 
USR="\[$BCyan\]\u\[$Color_Off\]"
HST="\[$BYellow\]\h\[$Color_Off\]"
FLD="\[$BRed\]\W\[$Color_Off\]"
BRC="\[$BPurple\]\$(format_git_branch)\[$Color_Off\]"
PKG="\[$Bold\]\$(parse_current_package_version)\[$Color_Off\]\[$BGreen\]\$(parse_current_node_version) (\$(parse_current_npm_version))\[$Color_Off\]"

export PS1="\$ [\d \A] $FLD $BRC$PKG \n\$ "

export HISTSIZE=10000
export HISEFILESIZE=10000

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

