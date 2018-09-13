#!/bin/bash
# How to set up Sean's working environment

set -x
# setup
cd

# vim
sudo yum -y install vim git ctags
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -Ls https://raw.githubusercontent.com/seanw2020/.dotfiles/master/.vimrc -o ~/.vimrc
echo "" | vim +PluginInstall +qall

# tmux
sudo yum install -y tmux
curl -Ls https://raw.githubusercontent.com/seanw2020/.dotfiles/master/.tmux.conf -o ~/.tmux.conf
curl -Ls https://raw.githubusercontent.com/seanw2020/.dotfiles/master/seancolors.tmuxtheme -o ~/.tmux/seancolors.tmuxtheme


# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# kubectl
#echo "source <(kubectl completion bash)" >> ~/.bashrc

# zsh
sudo yum install -y zsh

# oh-my-zsh
wget --no-check-certificate http://install.ohmyz.sh -O - | sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
zsh -c "autoload -U compinit && compinit"
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k

# finalize
curl -Ls https://raw.githubusercontent.com/seanw2020/.dotfiles/master/.zshrc -o ~/.zshrc
chsh -s /bin/zsh

set +x

