# .bash_profile

### Get user aliases and functions

if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

### ALIASES (keep most of them here)

alias l.='ls -d .* --color=tty'
alias ll='ls -Falh'
alias ls='ls --color=tty'
alias llk='ls -Fal --block-size 1'
alias lsr='ls -lSrh'
alias ltr='ls -ltrh'
alias lta='ls -ltrha'
alias ldir='ls -hld */'

alias h='history'
alias grep='grep --color'
alias q='exit'
alias vi='vim'


### EXPORTS

export PATH=$HOME/bin:/usr/X11R6/bin:/sbin:/usr/sbin:$PATH


### BASH COMMANDS AND CONTROLS

# Make Bash append rather than overwrite the history on disk:
shopt -s histappend

# Don't put duplicate lines in the history.
export HISTCONTROL="ignoredups"

# Ignore some controlling instructions
export HISTIGNORE="[   ]*:&:bg:fg:exit"

# Whenever displaying the prompt, write the previous line to disk
export PROMPT_COMMAND="history -a"

# lines of history to keep
export HISTFILESIZE=4000
export HISTSIZE=4000

# Whenever displaying the prompt, write the previous line to disk:
PROMPT_COMMAND='history -a'

# Don't wait for job termination notification
set -o notify

# pager, e.g., for man
export PAGER='less'
#export PAGER='less -X' # e.g., would not clear man after q



### COMMAND PROMPT

#[\u@\h:\w]\$

# check if git completion if available
declare -f  __git_ps1 > /dev/null
git_ok=$?

# set prompt and enable 
if [ $git_ok -eq 0 ]; then
    export GIT_PS1_SHOWDIRTYSTATE=1
    export GIT_PS1_SHOWCOLORHINTS=1
    PS1='\[\033[42m\033[37m\]\h\[\033[0m\]:\[\033[33m\]\w\[\033[0m\]$(__git_ps1 " (%s)")$ '
else
    PS1='\[\033[42m\033[37m\]\h\[\033[0m\]:\[\033[33m\]\w\[\033[0m\]$ '
fi


### CMSSW

# cmslpc.fnal.gov
if [[ `hostname -s` = cmslpc* ]]
then
    source /uscmst1/prod/sw/cms/shrc uaf
    source /uscmst1/prod/grid/gLite_SL5.sh
    
    alias mc='. $HOME/bin/mc-wrapper.sh'
fi


#lxplus.cern.ch
if [[ `hostname -s` = lxplus* ]]
then
    export ORACLE_CERN=/afs/cern.ch/project/oracle
    if [ -r $ORACLE_CERN/script/profile_oracle.sh ]; then
       source $ORACLE_CERN/script/profile_oracle.sh
    fi

    #setoraenv -s 10203
    #export LD_LIBRARY_PATH=.:/afs/cern.ch/project/oracle/@sys/10203/lib:$LD_LIBRARY_PATH
    setoraenv -s 11203
    export LD_LIBRARY_PATH=.:/afs/cern.ch/project/oracle/@sys/11203/lib:$LD_LIBRARY_PATH

    # setup WLCG tools
    source /afs/cern.ch/cms/LCG/LCG-2/UI/cms_ui_env.sh

    # setup CAF env
    source /afs/cern.ch/cms/caf/setup.sh

    # my eos area
    export EOSCMS_HOME=/eos/cms/store/caf/user/khotilov

    alias cmsrel='scram project CMSSW'
    alias cmsenv='eval `scram runtime -sh`'
fi

# TAMU Brazos cluster
if [[ `hostname -s` =~ ^(hurr|brazos)$ ]] 
then
    umask 022
  
    export VO_CMS_SW_DIR=/home/hepxadmin/cmssw
    export SCRAM_ARCH=slc5_amd64_gcc462
    source $VO_CMS_SW_DIR/cmsset_default.sh
  
    source ~hepxadmin/gLite/gLite-UI/etc/profile.d/grid_env.sh

    # kerberos config on Brazos:
    export KRB5_CONFIG=/home/hepxadmin/krb5.conf

    source $HOME/rpm/share/mc/bin/mc.sh
fi

# TAMU Brazos cluster
if [[ `hostname -s` = hepcms* ]] 
then
    export VO_CMS_SW_DIR=/home/cmssw/cms/
    #export SCRAM_ARCH=slc5_amd64_gcc461
    source $VO_CMS_SW_DIR/cmsset_default.sh
    source ~cmssw/cms/cmsset_default.sh

    export CVSROOT=':gserver:cmssw.cvs.cern.ch:/local/reps/CMSSW' 
fi

#export SCRAM_ARCH=slc5_amd64_gcc462

