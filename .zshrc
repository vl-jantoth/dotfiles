# source  ~/.zshcomp
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

source ~/bin/ht.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

bindkey -e
#export AWS_ASSUME_ROLE_TTL=1h
#export AWS_SESSION_TTL=12h

export PYTHONPATH=$PYTHONPATH:/usr/lib/python3.9/site-packages
export BROWSER=/usr/bin/chromium
export VBOX_USB=usbfs
export EDITOR=vim

powerline-daemon -q

# Edit file: /usr/lib/python3.9/site-packages/powerline_gitstatus/segments.py
# ...
# return self.build_segments(formats, branch[:6], detached, tag, behind, ahead, staged, unmerged, changed, untracked, stashed)
# ...

# source /usr/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh
source /usr/lib/python3.9/site-packages/powerline/bindings/zsh/powerline.zsh
# Bash history completion bound to arrow keys (down, up)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
#bindkey -e
LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

alias kp='keepassxc ~/Documents/sbx/aws_data/cloudinuse-custom.kdbx'
alias rec='cd ~/Documents/recordings/course5'
alias hc='cd ~/Documents/sbx/helmfile-course'
alias wo='cd ~/Documents/work'
alias sb='cd ~/Documents/sbx'
alias di='cd ~/Documents/sbx/aws-eks-devopsinuse'
alias ml='cd ~/Documents/sbx/ml'
alias viberkill='kill -9 $(ps -ef | pgrep viber)'
alias ll='ls -l'
alias w='ip a show wlp1s0'
alias e='ip a show enp0s31f6'
alias d='dragon-drag-and-drop -a -x'

setopt interactivecomments

bindkey '^[[3~' delete-char 
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey "\E[1~" beginning-of-line
bindkey "\E[4~" end-of-line
bindkey -e

#autoload -U compinit
#zstyle ':completion:*' menu select
#zmodload zsh/complist
#compinit

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

# [[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
# [ -f /opt/miniconda3/etc/profoile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh

[ -z "$TMUX" ] && export TERM=xterm-256color
alias tmux='tmux -2'


alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# dotfiles status
# dotfiles add .vimrc
# dotfiles commit -m "Add vimrc"
# dotfiles add .bashrc
# dotfiles commit -m "Add bashrc"
# dotfiles push


#alias k=kubectl
#complete -F __start_kubectl k

#autoload -Uz compinit
#compinit


# Start tmux when terminal lunched
# The following lines were added by compinstall

#zstyle ':completion:*' menu select
#

zstyle ':completion:*' menu select completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/jantoth/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
# End of lines configured by zsh-newuser-install
# source <(kubectl completion zsh)
#
plugins=(
    git 
    kubectl
    zsh-autosuggestions
    zsh-syntax-highlighting
    archlinux
)


source <(kubectl completion zsh)
alias k=kubectl
complete -F __start_kubectl k
