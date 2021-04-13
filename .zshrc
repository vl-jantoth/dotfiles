# source  ~/.zshcomp
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

source ~/bin/ht.sh

bindkey -e
#export AWS_ASSUME_ROLE_TTL=1h
#export AWS_SESSION_TTL=12h

export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.9/site-packages

powerline-daemon -q
# source /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
source /usr/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh
# Bash history completion bound to arrow keys (down, up)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
#bindkey -e
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

#alias ll='ls -al'
#alias ll='ls  -Gg --color'
#alias ls='ls  -Gg --color'
#
alias rec='cd ~/Documents/recordings/course5'
alias hc='cd ~/Documents/sbx/helmfile-course'
alias wo='cd ~/Documents/work'
alias sb='cd ~/Documents/sbx'
alias di='cd ~/Documents/sbx/aws-eks-devopsinuse'
alias ml='cd ~/Documents/sbx/ml'

alias viberkill='kill -9 $(ps -ef | pgrep viber)'
alias ll='ls -l'

# alias xjira='_xjira(){ ~/venv3_main_env/bin/python ~/bin/jira-hours.py -l https://jira.zoomint.com -u jan.toth -j "$1" -d "$2";}; _xjira'

setopt interactivecomments
bindkey '^[[3~' delete-char 
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey "\E[1~" beginning-of-line
bindkey "\E[4~" end-of-line
bindkey -e

#export KUBECONFIG=/etc/rancher/k3s/k3s.yaml

#export PATH=$PATH:/usr/local/go/bin:/home/jantoth/go/bin
# export PATH=$PATH:~/Documents/gocode

# export GOROOT="/usr/local/go"
#export GOPATH=~/Documents/golib
#export PATH=$PATH:$GOPATH/bin
#export GOPATH=$GOPATH:~/Documents/gocode
export VBOX_USB=usbfs

export EDITOR=vim

alias w='ip a show wlp1s0'
alias e='ip a show enp0s31f6'
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# neofetch --uptime_shorthand on --ascii_distro Plasma

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
[ -f /opt/miniconda3/etc/profoile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

[ -z "$TMUX" ] && export TERM=xterm-256color
alias tmux='tmux -2'

export BROWSER=/usr/bin/chromium

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias kp='keepassxc ~/Documents/sbx/aws_data/cloudinuse-custom.kdbx'

# dotfiles status
# dotfiles add .vimrc
# dotfiles commit -m "Add vimrc"
# dotfiles add .bashrc
# dotfiles commit -m "Add bashrc"
# dotfiles push

