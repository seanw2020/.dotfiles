#!/bin/bash
# How to set up Sean's working environment

# setup
cd

# Make back ups and uninstall (note: keeping .vim to avoid re-downloading plugins)
chsh -s $(which bash)
\mv -f ~/.vimrc ~/.vim.rc.%RANDOM%
\mv -f ~/.fzf ~/.fzf.old.%RANDOM%
\mv -f ~/.zshrc ~/.zshrc.old.%RANDOM%
\mv -f ~/zsh-syntax-highlighting/ ~/zsh-syntax-highlighting.old.%RANDOM%
\mv -f ~/.tmux ~/.tmux.old.%RANDOM%
\mv -f ~/.tmux.conf ~/.tmux.conf.old.%RANDOM%
yes | sh ~/.oh-my-zsh/tools/uninstall.sh
\mv -f ~/.oh-my-zsh ~/.oh-my-zsh.old.%RANDOM%

# vim
sudo yum -y install vim git ctags
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
curl -Ls https://raw.githubusercontent.com/seanw2020/.dotfiles/master/.vimrc -o ~/.vimrc
echo "" | vim +PluginInstall +qall

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
yes | ~/.fzf/install

# kubectl
#echo "source <(kubectl completion bash)" >> ~/.bashrc

# zsh
sudo yum install -y zsh

# oh-my-zsh
# Don't enter zsh prompt after install: https://github.com/robbyrussell/oh-my-zsh/issues/5873
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
  echo "Could not install Oh My Zsh" >/dev/stderr
  exit 1
}
zsh -c "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
zsh -c "autoload -U compinit && compinit"
zsh -c "git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
curl -Ls https://raw.githubusercontent.com/seanw2020/.dotfiles/master/.zshrc -o ~/.zshrc
chsh -s /bin/zsh

# tmux
sudo yum install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -Ls https://raw.githubusercontent.com/seanw2020/.dotfiles/master/.tmux.conf -o ~/.tmux.conf
tmux source-file ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh
