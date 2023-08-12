#!/bin/bash

# Install zsh
sudo apt update -y && sudo apt upgrade -y && sudo apt install zsh -y
sudo chsh -s /bin/zsh root
git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git /etc/oh-my-zsh
sudo cp /etc/oh-my-zsh/templates/zshrc.zsh-template /etc/skel/.zshrc
sudo sed -i 's|$HOME/.oh-my-zsh|/etc/oh-my-zsh|g' /etc/skel/.zshrc
sudo sed -i '5a export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/oh-my-zsh"' /etc/skel/.zshrc
sudo sed -i '/^ZSH_THEME=.*/c ZSH_THEME="ys"' /etc/skel/.zshrc
sudo sed -i "s/^# zstyle ':omz:update' mode disabled/zstyle ':omz:update' mode disabled/" /etc/skel/.zshrc
echo 'alias ll="ls -lahF --color --time-style=long-iso"' >> /etc/skel/.zshrc
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git /etc/oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/zsh-users/zsh-completions /etc/oh-my-zsh/custom/plugins/zsh-completions
sudo sed -i '/^plugins=.*/c plugins=(git zsh-syntax-highlighting zsh-autosuggestions)' /etc/skel/.zshrc
sudo sed -i '6a fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src' /etc/skel/.zshrc
sudo sed -i '/^SHELL=.*/c SHELL=/bin/zsh' /etc/default/useradd
