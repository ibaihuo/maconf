# 加载oh-my-zsh
ZSH=$HOME/.oh-my-zsh

# 主题配置
ZSH_THEME="renewjoy"
#ZSH_THEME="rkj"

# 插件配置
plugins=(git svn python)

source $ZSH/oh-my-zsh.sh

#历史纪录条目数量
export HISTSIZE=1000

#注销后保存的历史纪录条目数量
export SAVEHIST=1000

#历史纪录文件
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
hash -d github='/Users/renewjoy/Documents/github.renewjoy/'

# 在mac下支持中文，否则显示乱码
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

###############################
# 环境变量配置
###############################

# for anaconda3
export PATH="/opt/anaconda3/bin:$PATH"

# for spark
export PATH="/opt/spark/bin:$PATH"

# for java
# export JAVA_HOME=/opt/jdk
# export PATH=${JAVA_HOME}/bin:$PATH

# 几个自定义的命令
export PATH=~/bin:$PATH

# for golang
export GOROOT=/usr/local/go
export GOPATH=~/Programs/Golang
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# for z(jump directory)
export PATH=${PATH}:/usr/local/etc/profile.d/
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles
