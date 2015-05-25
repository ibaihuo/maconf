# 加载oh-my-zsh
ZSH=$HOME/.oh-my-zsh

# 主题配置
ZSH_THEME="renewjoy"
#ZSH_THEME="rkj"

# 插件配置
plugins=(git svn python)

source $ZSH/oh-my-zsh.sh

#关于历史纪录的配置 {{{
#历史纪录条目数量
export HISTSIZE=1000
#注销后保存的历史纪录条目数量
export SAVEHIST=1000
#历史纪录文件
#export HISTFILE=~/.zhistory
#以附加的方式写入历史纪录
setopt INC_APPEND_HISTORY
#如果连续输入的命令相同，历史纪录中只保留一个
#setopt HIST_IGNORE_DUPS      
#为历史纪录中的命令添加时间戳      
setopt EXTENDED_HISTORY      

#启用 cd 命令的历史纪录，cd -[TAB]进入历史路径
setopt AUTO_PUSHD
#相同的历史路径只保留一个
#asetopt PUSHD_IGNORE_DUPS

setopt INTERACTIVE_COMMENTS      
     
#禁用 core dumps
limit coredumpsize 0

# Emacs风格 键绑定
bindkey -e

# #自动补全功能 {{{
# setopt AUTO_LIST
# setopt AUTO_MENU
# #开启此选项，补全时会直接选中菜单项
# #setopt MENU_COMPLETE

# autoload -U compinit
# compinit

# #自动补全缓存
# #zstyle ':completion::complete:*' use-cache on
# #zstyle ':completion::complete:*' cache-path .zcache
# #zstyle ':completion:*:cd:*' ignore-parents parent pwd

# #自动补全选项
# zstyle ':completion:*:match:*' original only
# zstyle ':completion::prefix-1:*' completer _complete
# zstyle ':completion:predict:*' completer _complete
# zstyle ':completion:incremental:*' completer _complete _correct
# zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

# #路径补全
# zstyle ':completion:*' expand 'yes'
# zstyle ':completion:*' squeeze-shlashes 'yes'
# zstyle ':completion::complete:*' '\\'

# zstyle ':completion:*' menu select
# zstyle ':completion:*:*:default' force-list always

# #彩色补全菜单 
# export ZLSCOLORS="${LS_COLORS}"
# zmodload zsh/complist
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

# #修正大小写
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
# #错误校正      
# zstyle ':completion:*' completer _complete _match _approximate
# zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:approximate:*' max-errors 1 numeric

# #kill 命令补全      
# compdef pkill=kill
# compdef pkill=killall
# zstyle ':completion:*:*:kill:*' menu yes select
# zstyle ':completion:*:*:*:*:processes' force-list always
# zstyle ':completion:*:processes' command 'ps -au$USER'

# #补全类型提示分组 
# zstyle ':completion:*:matches' group 'yes'
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:options' description 'yes'
# zstyle ':completion:*:options' auto-description '%d'
# zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
# zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
# zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'
# #}}}

# ##行编辑高亮模式 {{{
# # Ctrl+@ 设置标记，标记和光标点之间为 region
# zle_highlight=(region:bg=magenta #选中区域 
#               special:bold      #特殊字符
#               isearch:underline)#搜索时使用的关键字
# #}}}

# ##空行(光标在行首)补全 "cd " {{{
# user-complete(){
#    case $BUFFER in
#        "" )                       # 空行填入 "cd "
#            BUFFER="cd "
#            zle end-of-line
#            zle expand-or-complete
#            ;;
#        "cd --" )                  # "cd --" 替换为 "cd +"
#            BUFFER="cd +"
#            zle end-of-line
#            zle expand-or-complete
#            ;;
#        "cd +-" )                  # "cd +-" 替换为 "cd -"
#            BUFFER="cd -"
#            zle end-of-line
#            zle expand-or-complete
#            ;;
#        * )
#            zle expand-or-complete
#            ;;
#    esac
# }
# zle -N user-complete
# bindkey "\t" user-complete
# #}}}

# 使用emacsclient 的时候，如果emacs --daemon没有启动，下面这行自动启动
export ALTERNATE_EDITOR=""

# 设置默认编辑器
export EDITOR='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t'

# 定义别名
#alias -g e='emacs -nw'
alias -g e='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t'
 
#命令别名 {{{
# 下面是非人性化的设置，当你在一台没有进行如下设置的机器上，误删除文件就明白了
# alias -g cp='cp -i'
# alias -g mv='mv -i'
# alias -g rm='rm -i'

export CLICOLOR=1
alias -g ls='ls -F'
alias -g ll='ls -l'
alias -g la='ls -a'
alias -g grep='grep --color=auto'

# 路径配置
hash -d github='/home/renewjoy/Documents/github/'

# 在mac下支持中文，否则显示乱码
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

###############################
# 环境变量配置
###############################

# for dse
export PATH=$PATH:/opt/dse/bin
export DSE_HOME=/opt/dse

# for redis
export PATH=$PATH:/usr/local/redis/bin

# for svn
export PATH=$PATH:/usr/local/svn/bin
export EDITOR=vim

# for nodejs
export PATH=$PATH:/usr/local/nodejs/bin

# 添加mongo
export PATH=$PATH:~/bin/mongo/bin
export PATH=$PATH:~/bin/redis/src

# for anaconda
export PATH="/opt/anaconda/bin:$PATH"

# for spark
export PATH="/opt/spark/bin:$PATH"

# for java
export JAVA_HOME=/opt/jdk
export PATH=${JAVA_HOME}/bin:$PATH

# android adt
export PATH="/opt/adt/sdk/platform-tools:$PATH"
# for android tools
export PATH="/opt/adt/sdk/tools:$PATH"
# for apache ant
export PATH="/opt/ant/bin:$PATH"

export PATH=~/bin:$PATH

# export PATH=$PATH:/home/renewjoy/bin/Sencha/Cmd/5.0.3.324

# for golang
export GOROOT=/usr/local/go
export GOPATH=~/Programs/Golang
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# for z(jump directory)
export PATH=${PATH}:/usr/local/etc/profile.d/
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# for swift
alias swift='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift'

# rvm使用环境
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
