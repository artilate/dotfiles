#Prompt
PS1="%F{green}%B%~/%b%f "

#Exports 
export PATH="$HOME/.local/bin/:$PATH"

# Aliases
alias ls='ls --color=auto'
alias cd..="cd .."
# History
HISTSIZE=500
SAVEHIST=1000
HISTFILE=.cache/zsh_history

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

