#!/bin/bash
######################################################################
## Filename:      init_config.sh
##                
## Copyright (C) 2013, 2015,  renewjoy
## Version:       
## Author:        renewjoy <oyea9le@gmail.com>
## Created at:    Sat Jun 15 22:51:46 2013
##                
## Modified by:   renewjoy <oyea9le@gmail.com>
## Modified at:   Tue Feb  3 17:29:18 2015
## Description:   初始化配置文件
##                
######################################################################

# 注意：会强制删除当前的配置文件，请备份

# 当前绝对路径
working_dir=`pwd`

# emacs
rm -rf ~/.emacs ~/.emacs.d
ln -s ${working_dir}/emacs/emacs ~/.emacs
ln -s ${working_dir}/emacs/emacs.d ~/.emacs.d

# zsh
rm -rf ~/.zshrc ~/.oh-my-zsh
ln -s ${working_dir}/zsh/zshrc ~/.zshrc
ln -s ${working_dir}/zsh/oh-my-zsh ~/.oh-my-zsh

# git
rm -rf ~/.gitconfig
ln -s ${working_dir}/git/gitconfig ~/.gitconfig
