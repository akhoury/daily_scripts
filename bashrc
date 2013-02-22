# append to the history file, don't overwrite it
###################################################################################################
shopt -s histappend

export PATH=$ICECAST_DIR:$PATH
export TZ=America/New_York
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin:/usr/local/mysql/bin
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

# will clear all the content of the .log files, without deleting the files, just the tail won't bitch
# alias clearlogs='for FILE in `find $LOG_DIR -name "*.log"`; do > $FILE; done' 

### start icecast
alias start_icecast='sudo icecast -b -c $ICECAST_DIR/../etc/icecast.xml'
alias stop_icecast='sudo killall icecast'
####################################################################################################

#### cdups - a simple bash script that helps u cd up N directories in one command
alias cdup='. $HOME/cdup.sh'

####icecast
export ICECAST_DIR=/usr/local/Cellar/icecast/2.3.2/bin

export GDK_NATIVE_WINDOWS=true # workaround for 9.10 - http://bit.ly/T8MIc
