#!/bin/bash
# How to set up Sean's working environment

# setup
cd

# Make back ups and uninstall (note: keeping .vim to avoid re-downloading plugins)
chsh -s $(which bash)
\mv -f ~/.vimrc ~/.vim.rc.$RANDOM
\mv -f ~/.fzf ~/.fzf.old.$RANDOM
\mv -f ~/.tmux ~/.tmux.old.$RANDOM
\mv -f ~/.tmux.conf ~/.tmux.conf.old.$RANDOM
yes | sh ~/.oh-my-zsh/tools/uninstall.sh
\mv -f ~/.zshrc ~/.zshrc.old.$RANDOM
\mv -f ~/zsh-syntax-highlighting/ ~/zsh-syntax-highlighting.old.$RANDOM
echo
read -p "If it was installed, myenv is now uninstalled. Press Enter to (re)-install. This will do a 'tmux kill-server'"

# vim
sudo yum -y install vim git ctags
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 2>/dev/null
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
# https://github.com/tmux-plugins/tpm/issues/6
tmux kill-server 2>/dev/null
sudo yum install -y tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
curl -Ls https://raw.githubusercontent.com/seanw2020/.dotfiles/master/.tmux.conf -o ~/.tmux.conf
tmux start-server # start a server but don't attach to it
tmux source-file ~/.tmux.conf # may be unnecessary
tmux new-session -d # create a new session but don't attach to it either
~/.tmux/plugins/tpm/scripts/install_plugins.sh # install the plugins
tmux kill-server # killing the server is required to load the plugins

# enable tmux mouse and keyboard support. The commands changed on 2.1 and higher
yum install -y bc
ver=$(tmux -V | awk '{print $2}') # Get tmux version
if [[ $(bc <<< "$ver >= 2.1") == 1 ]]; then
  sed -i 's/MOUSE_COMMAND/set -g mouse on/g' ~/.tmux.conf
  sed -i 's/VIM_COMMAND/bind-key -T copy-mode-vi C-h select-pane -L\nbind-key -T copy-mode-vi C-j select-pane -D\nbind-key -T copy-mode-vi C-k select-pane -U\nbind-key -T copy-mode-vi C-l select-pane -R\nbind-key -T copy-mode-vi C-\ select-pane -l/g' ~/.tmux.conf
else
  sed -i 's/MOUSE_COMMAND/setw -g mode-mouse on; set -g mouse-select-pane on; set -g mouse-resize-pane on; set -g mouse-select-window on; set -g mouse-utf on/g' ~/.tmux.conf
  sed -i 's/VIM_COMMAND//g' ~/.tmux.conf
fi
