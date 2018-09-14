#!/bin/bash
# How to set up Sean's working environment

# setup
cd

# Make back ups and uninstall (note: keeping .vim to avoid re-downloading plugins)
chsh -s $(which bash)
\mv -f ~/.vimrc ~/.vim.rc.$RANDOM 2>/dev/null
\mv -f ~/.fzf ~/.fzf.old.$RANDOM 2>/dev/null
\mv -f ~/.tmux ~/.tmux.old.$RANDOM 2>/dev/null
\mv -f ~/.tmux.conf ~/.tmux.conf.old.$RANDOM 2>/dev/null
yes | sh ~/.oh-my-zsh/tools/uninstall.sh 2>/dev/null
\mv -f ~/.zshrc ~/.zshrc.old.$RANDOM 2>/dev/null
\mv -f ~/zsh-syntax-highlighting/ ~/zsh-syntax-highlighting.old.$RANDOM 2>/dev/null
rm -rfv ~/fish-kubectl-completions 2>/dev/null
echo
read -p "If it was installed, myenv is now uninstalled. This will do a 'tmux kill-server'. Press Enter to (re)-install."

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
zsh -c 'git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions'
zsh -c 'autoload -U compinit && compinit'
zsh -c 'git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search'
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
curl -Ls https://raw.githubusercontent.com/seanw2020/.dotfiles/master/.zshrc -o ~/.zshrc
# This must go last in .zshrc. Details https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
zsh -c 'echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc'


# fish
sudo yum -y install fish
mkdir -p ~/.config/fish/completions
cd ~/.config/fish
git clone https://github.com/evanlucas/fish-kubectl-completions
ln -s ../fish-kubectl-completions/kubectl.fish completions/

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
sudo yum install -y bc
ver=$(tmux -V | awk '{print $2}') # Get tmux version
if [[ $(bc <<< "$ver >= 2.1") == 1 ]]; then
  sed -i 's/MOUSE_COMMAND/set -g mouse on/g' ~/.tmux.conf
  sed -i 's/VIM_COMMAND/bind-key -T copy-mode-vi C-h select-pane -L\nbind-key -T copy-mode-vi C-j select-pane -D\nbind-key -T copy-mode-vi C-k select-pane -U\nbind-key -T copy-mode-vi C-l select-pane -R\nbind-key -T copy-mode-vi C-\\ select-pane -l/g' ~/.tmux.conf
else
  sed -i 's/MOUSE_COMMAND/setw -g mode-mouse on; set -g mouse-select-pane on; set -g mouse-resize-pane on; set -g mouse-select-window on; set -g mouse-utf on/g' ~/.tmux.conf
  sed -i 's/VIM_COMMAND//g' ~/.tmux.conf
fi

# Fonts
cat <<'EOF'
------------
Note: Fonts
------------
To use the new icons in vim, install a compatible nerd-font.
1. Download a nerd-font (eg in step #2) and install it on your computer (e.g., Windows: Control Panel > Fonts)
2. https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/FiraCode.zip
3. Set your terminal program (e.g., Putty, MobaXTerm, etc.) to use the new font.
   Putty: Configuration > Window > Appearance > (tick) Allow selection of variable-pitch fonts > Change
          Configuration > Connection > Data > Terminal-type string > xterm-256color
   MobaXTerm: Settings > Configuration > Font 
              (pick a session) > Right-click > Edit Session > Terminal Settings > Terminal font settings > Font

Note: You'll get an error when running tmux if your version is too old to support the CPU module'
EOF

# What's next?
cat <<'EOF'
What's next?"

General                                         Commands
-----------                                     --------
Command completion, including kubectl           zsh
Cool, err more productive, vim plugins          vim
Tmux powerline styles                           tmux

vim                                             Commands
-----------                                     --------
NERDTree                                        F1
Fuzzy search                                    :FZF

tmux                                            Commands
----                                            --------
Prefix (avoids CTRL+B conflict in vim)          Ctrl+A
Navigate between tmux and vim                   Ctrl+h Ctrl+j Ctrl+k Ctrl+l 

zsh                                             Commands
----                                            --------
command completion                              ls -l[Enter] then ls
kubernetes command completion                   kubectl get [Tab][Tab]

fish                                            Commands
----                                            --------
command completion                              ls -l[TAB][TAB][TAB]
kubernetes command completion                   kubectl get [Tab][Tab] 
EOF
