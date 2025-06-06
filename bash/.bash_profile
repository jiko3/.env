#!/bin/bash
#export TERM=xterm-color
export TERM=xterm-256color
export CLICOLOR=1
export GREP_OPTIONS='--color=auto'
# export LSCOLORS=Exfxcxdxbxegedabagacad
export LSCOLORS=gxfxcxdxbxegedabagacad # Dark lscolor scheme
# Don't put duplicate lines in your bash history
export HISTCONTROL=ignoredups
# increase history limit (100KB or 5K entries)
export HISTFILESIZE=100000
export HISTSIZE=5000


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
LS_COLORS='di=32:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LS_COLORS
# -jiko

# Readline, the line editing library that bash uses, does not know
# that the terminal escape sequences do not take up space on the
# screen. The redisplay code assumes, unless told otherwise, that
# each character in the prompt is a `printable' character that
# takes up one character position on the screen. 

# You can use the bash prompt expansion facility (see the PROMPTING
# section in the manual page) to tell readline that sequences of
# characters in the prompt strings take up no screen space. 

# Use the \[ escape to begin a sequence of non-printing characters,
# and the \] escape to signal the end of such a sequence.
# Define some colors first:
RED='\[\e[1;31m\]'
BOLDYELLOW='\[\e[1;33m\]'
GREEN='\[\e[0;32m\]'
BLUE='\[\e[1;34m\]'
DARKBROWN='\[\e[1;33m\]'
DARKGRAY='\[\e[1;30m\]'
CUSTOMCOLORMIX='\[\e[1;30m\]'
DARKCUSTOMCOLORMIX='\[\e[1;32m\]'
LIGHTBLUE="\[\033[1;36m\]"
PURPLE='\[\e[1;35m\]' #git branch
# EG: GREEN="\[\e[0;32m\]" 
#PURPLE='\[\e[1;35m\]'
#BLUE='\[\e[1;34m\]'
NC='\[\e[0m\]' # No Color
#PS1="\[\033[1;34;40m[\033[1;31;40m\u@\h:\w\033[1;34;40m]\033[1;37;40m $\033[0;37;0m\] "
#PS1="${CUSTOMCOLORMIX}\\u@\h: \\W]\\$ ${NC}"

# PS1 (shell prompt)
# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

#function parse_git_dirty {
#  git diff --quiet HEAD &>/dev/null
#  [[ $? == 1 ]] && echo "⚡"
#}

#function parse_git_branch {
#  local branch=$(__git_ps1 "%s")
#  [[ $branch ]] && echo "[$branch$(parse_git_dirty)]"
#}

#PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\$(parse_git_branch)\[\033[00m\]\$"

PS1="${LIGHTBLUE}\\u ${BOLDYELLOW}[\\W] ${PURPLE}\$(parse_git_branch)${DARKCUSTOMCOLORMIX}$ ${NC}"
#PS1="${DARKCUSTOMCOLORMIX}\\u@\h:\\W]${PURPLE}\$(parse_git_branch)${DARKCUSTOMCOLORMIX}$ ${NC}"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

list_detailed_more()
{
	ls -lah $1 | more
}

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch

parse_svn_branch() {
 parse_svn_url | sed -e 's#^'"$(parse_svn_repository_root)"'##g' | awk -F / '{print "(svn::"$1 "/" $2 ")"}'
}
export -f parse_svn_branch

parse_svn_url() {
 svn info 2>/dev/null | grep -e '^URL*' | sed -e 's#^URL: *\(.*\)#\1#g '
}
export -f parse_svn_url

parse_svn_repository_root() {
 svn info 2>/dev/null | grep -e '^Repository Root:*' | sed -e 's#^Repository Root: *\(.*\)#\1\/#g '
}
export -f parse_svn_repository_root

# Safe rm procedure
safe_rm()
{
    # Cycle through each argument for deletion
    for file in $*; do
        if [ -e $file ]; then

            # Target exists and can be moved to Trash safely
            if [ ! -e ~/.Trash/$file ]; then
                mv $file ~/.Trash

            # Target exists and conflicts with target in Trash
            elif [ -e ~/.Trash/$file ]; then

                # Increment target name until 
                # there is no longer a conflict
                i=1
                while [ -e ~/.Trash/$file.$i ];
                do
                    i=$(($i + 1))
                done

                # Move to the Trash with non-conflicting name
                mv $file ~/.Trash/$file.$i
            fi

        # Target doesn't exist, return error
        else
            echo "rm: $file: No such file or directory";
        fi
    done
}

function github() {
  #call from a local repo to open the repository on github in browser
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi
  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git//}
  echo $giturl
  open $giturl
}


#bash git completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

      ###############################
      ##         Aliases           ##
      ###############################

###################
###### osx ########
###################

alias reload='source ~/.bash_profile && source ~/.bashrc'
alias versions="python --version && ruby -v && rails -v && node --version && mongo --version && postgres --version"
alias ls='ls -hp -GF --color'
alias ll='pwd && ls -GFalh --color'
alias la='ls -GFalh --color'
alias l='ls -CF'
alias cll="clear; ls -lAh"
alias ..="cd .."
alias ..2="cd ../../"
alias ..3="cd ../../../"
alias back='cd -'
alias ~='cd ~'
alias o='open'
alias bp='mate ~/.bash_profile'
alias trash='safe_rm'
alias grep='grep -H -n'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias cwd='pwd | tr -d "\r\n" | pbcopy' #copy working directory
alias where="pwd"
alias h='history'
alias ppath="echo $PATH | tr ':' '\n'" #print path
alias untar="tar -xvf"
alias rtags="find . -name '*.rb' | xargs /usr/bin/ctags -R -a -f TAGS"
json() { echo $* | python -mjson.tool; }

###################
## applications ##
###################
alias idle27="python -m idlelib.idle"
alias tedit="open -a /Applications/TextEdit.app/Contents/MacOS/TextEdit"
alias chrome="open -a /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias mongod="mongod --dbpath ~/data/db"

###################
## ruby on rails ##
###################
alias sassw='sass --watch'
alias sassdefault='sass --watch stylesheets/sass:stylesheets/compiled'
alias coffeed='coffee --nodejs --debug'
alias coffeedefault='coffee -lo javascripts/ -w coffeescripts/ &'
alias home="cd ~; clear; ls -lAh"
alias gemdoc='gem environment gemdir'/doc
alias gemlist='gem list | grep -v "^( |$)"'
alias gemuninstallall='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias be="bundle exec"
alias bers="bundle exec rake spec"
alias bess="bundle exec spec spec"
alias bigrake="rake db:drop && rake db:create && rake db:migrate && rake db:schema:dump && rake db:test:prepare"
alias startc="bundle exec thin --timeout 0 -R config.ru start"


###################
##    Node.js    ##
###################
alias nodels='npm ls'
alias nlink='npm link'
alias loco='lcm server'

##################
## Repositories ##
##################
alias repos='ls -la ~/workspace/repository'
repo() { cd ~/workspace/repository/$*; } #jump to repo
alias workspace='cd ~/workspace/'

<<UNKNOWN
ALIASES
alias pcurl='curl --proxy localhost:8888'
alias hibernate="sudo pmset -a hibernatemode 5; sudo shutdown -s now && sudo pmset -a hibernatemode 3"
alias stop='kill -2'
UNKNOWN

<<HOWTO
INSTALLING TEXTMATE BUNDLES
Instead of running "osascript script.scpt" you can run "arch -i386 osascript script.scpt" 
This forces osascript to run in i386 mode which will work with the Scripting Addition.

Install Less TextMate plugin 
$ git clone http://github.com/appden/less.tmbundle.git $ open less.tmbundle
HOWTO

###############################
##            Path           ##
###############################
PATH=/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH
PATH=$PATH:~/bin
export PATH

#GCC stuff
#export CC=/usr/bin/gcc-4.0
#export CXX=/usr/bin/g++-4.0

#postresql
export PATH=$PATH:/Library/PostgreSQL/9.1/bin/
export DYLD_LIBRARY_PATH=/usr/local/mysql/lib:$DYLD_LIBRARY_PATH

#python27
PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/
PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/mechanize-0.2.5-py2.7.egg
PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/python_Levenshtein-0.10.2-py2.7-macosx-10.6-x86_64.egg
PYTHONPATH=$PYTHONPATH:/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/html2text-3.101-py2.7.egg

#python32
#PATH="/Library/Frameworks/Python.framework/Versions/3.2/bin:${PATH}"
export PYTHONPATH
export PATH

# {{{
# Node Completion - Auto-generated, do not touch.
# shopt -s progcomp
# for f in $(command ls ~/.node-completion); do
#   f="$HOME/.node-completion/$f"
#   test -f "$f" && . "$f"
# done
# }}}

. ~/.nvm/nvm.sh

[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion

