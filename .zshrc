export ZSH="$HOME/.config/oh-my-zsh"
export ZSH_THEME="mh"
export ZSH_COMPDUMP="${ZDOTDIR:-${ZSH}}/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

HISTFILE="$HOME/.cache/zsh_history"
export PAGER=nvimpager

plugins=(git)

fonction FontTest()
{
    echo -e "\e[1mbold\e[0m"
    echo -e "\e[3mitalic\e[0m"
    echo -e "\e[3m\e[1mbold italic\e[0m"
    echo -e "\e[4munderline\e[0m"
    echo -e "\e[9mstrikethrough\e[0m"
}

source $ZSH/oh-my-zsh.sh

alias dev="cd $HOME/.h/Dev"
alias devel="cd $HOME/.h/Devel"

alias vi="nvim"
alias vim="nvim"
alias nvi="nvim"

alias ls="lsd --icon=never"
alias cat="bat"

alias open="xdg-open"

. $HOME/.cargo/env

