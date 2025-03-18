PS1='\[\e[0;32m\]\u\[\e[m\]@\h\[\e[1;34m\]:\w\[\e[m\]\[\e[1;32m\] \$ \[\e[m\]\[\e[1;37m\]'
alias ls="ls -GF --color"
alias ll="ls -GFalh --color"
#LS_COLORS='di=93:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
LS_COLORS='di=32:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS
PATH=~/bin:~/util_scripts:$PATH
export PATH
LD_LIBRARY_PATH=~/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
