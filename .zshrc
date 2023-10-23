# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
 source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#eval "$(starship init zsh)"

# Customize to your needs...

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export NODE_OPTIONS=--openssl-legacy-provider

# useful only for Mac OS Silicon M1, 
# still working but useless for the other platforms
docker() {
 if [[ `uname -m` == "arm64" ]] && [[ "$1" == "run" || "$1" == "build" ]]; then
    /usr/local/bin/docker "$1" --platform linux/amd64 "${@:2}"
  else
     /usr/local/bin/docker "$@"
  fi
}

alias sls="serverless"
alias envExec="envkey-source -wc -- "

# Created by `pipx` on 2022-04-13 07:44:44
export PATH="$PATH:/Users/ops/Library/Python/3.9/bin"

# Created by `pipx` on 2022-04-13 07:44:47
export PATH="$PATH:/Users/ops/.local/bin"
export PATH="$HOME/.tmuxifier/bin:$PATH"


#export XDG_CONFIG_HOME='~/.config'

export FZF_DEFAULT_COMMAND='fd'
alias dcr=/usr/local/bin/docker-compose run --rm

alias gc=git commit -m
alias vim="stty stop '' -ixoff ; nvim"




# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:/Users/ops/.foundry/bin"

export PATH="$PATH:/Users/ops/.foundry/bin"

export PATH="$PATH:/Users/ops/.foundry/bin"

export EDITOR="/opt/homebrew/bin/nvim"

autoload -U compinit
compinit -i

bindkey -s '^F' "~/.local/bin/tmux-sessionizer\n"

source ~/.config/fzf/shell/completion.zsh
source ~/.config/fzf/shell/key-bindings.zsh

export PATH="$PATH:/Users/ops/.huff/bin"


alias gco="git checkout"
alias gm="git merge"
alias gs="git status"
alias gb="git branch"
alias gc="git commit -m"
alias ga="git add"
alias gw="git worktree"

alias v="nvim"

alias d='/Users/ops/.config/bin/d'
alias b='/Users/ops/.config/bin/b'
alias ft='forge test'
alias fb='forge build'




alias tn="tmux new -s (pwd | sed 's/.*\///g')"

export PATH="$PATH:/Users/ops/.bifrost/bin"

eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# bit
export PATH="$PATH:/Users/ops/bin"
export FZF_TMUX_OPTS="-p 55%,60%"


# eval "$(starship init zsh)"


# bit end
#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
  local reply
  local si=$IFS
  IFS=$'
' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
  IFS=$si
  _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###



# fnm
export PATH="/Users/ops/Library/Application Support/fnm:$PATH"
eval "`fnm env`"
