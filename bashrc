# append to the history file, don't overwrite it
###################################################################################################
shopt -s histappend

export PATH=/Applications:$PATH
export PATH=/Applications/MAMP/Library/bin:$PATH
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin:/usr/local/mysql/bin

export NODE_ENV=development

# show the git branch that im on in a specific folder
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="[\[\e[33m\]\u@\H \[\e[32m\]\w\[\e[0m\]]\$(parse_git_branch)\n[\[\e[31m\]\!\[\e[0m\]] > "

# sets up the color scheme for list export
export TERM="xterm-color"
# PS1="\[\033[01;32m\]\u@\h\[\033[01;34m\] \w \$\[\033[00m\] "
export PS1="[\[\e[33m\]\u@\H \[\e[32m\]\w\[\e[0m\]]\n[\[\e[31m\]\!\[\e[0m\]] > "

###################################################################################################
# aliases that make the ls command more usable
###################################################################################################
alias ll='ls -al'   #lists all files, including hidden files, uses long list format
alias la='ls -A'    #lists all files except for hidden files
alias l='ls -CF'    #lists all files by column, appending indicator to entries

# alias for TextEdit app # Example$ te mhs.log
alias te='open -a TextEdit'

export GDK_NATIVE_WINDOWS=true # workaround for 9.10 - http://bit.ly/T8MIc
