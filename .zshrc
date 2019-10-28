export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"

eval "$(rbenv init -)"

source ~/.zplug/init.zsh

# Load theme file
zplug 'dracula/zsh', as:theme

zplug "zsh-users/zsh-syntax-highlighting", defer:2

# completion
zplug "lib/completion", from:oh-my-zsh

# git
zplug 'plugins/git', from:oh-my-zsh

# lsa, ll, etc
zplug 'plugins/common-aliases', from:oh-my-zsh

zplug 'plugins/tmux', from:oh-my-zsh

# history
zplug "lib/history", from:oh-my-zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

alias ls='exa --group-directories-first'
alias la='exa -ahl --git --time-style=iso --group-directories-first'
alias ll='exa -hl --git --time-style=iso --group-directories-first'

function git(){hub "$@"}

export PROMPT="%{$fg_bold[yellow]%}${HOST} $PROMPT"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kaku-junichi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kaku-junichi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kaku-junichi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kaku-junichi/google-cloud-sdk/completion.zsh.inc'; fi
