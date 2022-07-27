# .bashrc

if [ "$PS1" ]; then
	echo "Here in .bashrc"
        echo "Based on Shelley Melchior and Steve Stegall"
  PS1="[\H \w]\$ "
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export GIT_SSH=$HOME/.ssh-mine/ssh-mine.sh

# For vi 
TERM=xterm

# Set aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias ls='ls --color=never'
alias lc='ls --color=auto'
alias la='ls -la'
alias ll='ls -l'
alias llc='ls -l --color=auto'
alias llt='ls -lrt --color=auto'
#alias clean='rm *~'


alias dag="cd /lfs/h2/emc/da/noscrub/dagmar.merkova"
alias rzdm="ssh igenkova@emcrzdm.ncep.noaa.gov"
alias mygit='cd /lfs/h2/emc/obsproc/noscrub/$USER/GIT'
alias gits='cd /lfs/h2/emc/obsproc/noscrub/$USER/GIT'
alias trigs='cd /lfs/h2/emc/obsproc/noscrub/$USER/Trigs.KEEP'
alias uts='cd /lfs/h2/emc/obsproc/noscrub/$USER/Utils/'
alias gba='git --no-pager branch -a'

alias sihist='cd /lfs/h1/ops/prod/dcom/ingest_hist'
alias oplogs='cd /lfs/h1/ops/prod/output'
alias inst='cd /u/$USER/INSTALL'
alias noscrub='cd /lfs/h2/emc/obsproc/noscrub/$USER'
alias ns='cd /lfs/h2/emc/obsproc/noscrub/$USER'
alias nsda='cd /lfs/h2/emc/da/noscrub/$USER'
alias ptmp='cd /lfs/h2/emc/ptmp/$USER'
alias stmp='cd /lfs/h2/emc/stmp/$USER'

alias sinv='/u/shelley.melchior/bin/sinv'
alias binv='/u/shelley.melchior/bin/binv'
alias qqq='qstat -tu $USER -w'
alias qq='qstat -u $USER'
alias qqa='qstat'
alias emacs='emacs -nw --color=never'

# From Steve.Stegal's .bashrc
# aliases
alias cancom='cd /lfs/h1/ops/canned/com'
alias candcom='cd /lfs/h1/ops/canned/dcom'
alias to='vi /u/$USER/to' 
alias hh='history'
#alias cdgitwkspc='cd /lfs/h2/emc/obsproc/noscrub/Steve.Stegall/gitwkspc'
#alias cdgitstatic='cd /lfs/h2/emc/obsproc/noscrub/Steve.Stegall/gitstatic'
alias grso='git remote show origin' # RETHINK :)
alias cdpbs_ex='cd /apps/docs/samples/intel/'
alias go_chkdat='/lfs/h2/emc/obsproc/noscrub/iliana.genkova/Utils/GO_CHKDAT/go_chkdat'

# prevent escaping of command line vars, i.e. cd $COMROOT (with tab)
shopt -u progcomp

# modules
#module load intel craype cray-mpich #Steve.Stegal
module load craype/2.7.8
module load intel/19.1.3.304         #Shelley.Melchior
module load cray-mpich/8.1.4         #Shelley.Melchior #unable to load
module load envvar/1.0
module load PrgEnv-intel/8.1.0
module load prod_envir/2.0.4        #Steve.Stegal
#module load prod_envir/2.0.5         #Shelley.Melchior
module load libjpeg                  #required by next line: prod_util/2.0.8
module load prod_util/2.0.8
module load git/2.29.0
module load cfp/2.0.4
module load w3nco/2.4.1
module load bufr/11.5.0
export DEBUFR=$(which debufr.x)
module load w3emc/2.9.1
#module load w3emc/2.7.3 #Shelley's version
module load bacio/2.4.1
# From Shelley.Melchior
module load util_shared/1.4.0
module load grib_util/1.2.2
module load hdf5/1.10.6
module load netcdf/4.7.4

# modules
module load PrgEnv-intel/8.1.0
module load craype/2.7.8
module load intel/19.1.3.304
module load cray-mpich/8.1.12 #cray-mpich/8.1.4
#module load intel craype cray-mpich
module load prod_envir/2.0.5
module load prod_util/2.0.8
module load git/2.29.0
module load cfp/2.0.4
module load w3nco/2.4.1
module load bufr/11.5.0
#module load w3emc/2.7.3 #higher version exist
module load bacio/2.4.1
module load util_shared/1.4.0
#module load grib_util/1.2.2     ##CANNOT LOAD MODULE
module load hdf5/1.10.6
module load netcdf/4.7.4
#module use /apps/ops/test/nco/modulefiles/core
#module load bufr_dump/2.0.0a
module use /apps/ops/test/nco/modulefiles/compiler/intel/19.1.3.304
#module load bufr_dump/2.0.0

module use /apps/ops/test/nco/modulefiles/compiler/intel/19.1.3.304
#module load bufr_dump/2.0.0


export bufr_util_ROOT=/lfs/h2/emc/obsproc/noscrub/jeff.ator/bufr_util.v1.1.0
module use -a /lfs/h2/emc/obsproc/noscrub/jeff.ator/NCEPLIBS-bufr-VLab/modulefiles
module load bufr_util/1.1.0

# utilities
export PATH=$PATH:/u/jack.woollen/bin
export PATH=$PATH:/u/diane.stokes/bin
#export PATH=$PATH:/u/$USER/INSTALL/bin
export PATH=$PATH:/apps/ops/prod/libs/intel/19.1.3.304/bufr/11.5.0/bin #/lfs/h2/emc/obsproc/noscrub/$USER/NCEPLIBS-bufr/bin
#
# sshKeys location: /u/sshKeys/$USER
# DCOMROOT=/lfs/h1/ops/canned/dcom
# COMROOT=/lfs/h1/ops/canned/com


