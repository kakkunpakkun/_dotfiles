export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.tfenv/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

eval "$(rbenv init -)"

source ~/.zplug/init.zsh

# Load theme file
zplug 'dracula/zsh', as:theme

zplug "zsh-users/zsh-syntax-highlighting", defer:2

# completion
zplug "zsh-users/zsh-completions"

# git
zplug 'plugins/git', from:oh-my-zsh

# lsa, ll, etc
zplug 'plugins/common-aliases', from:oh-my-zsh

zplug 'plugins/tmux', from:oh-my-zsh

# history
zplug "zsh-users/zsh-history-substring-search"

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
alias cdw='cd ~/Workspace'

function git(){hub "$@"}

# PROMPT setting
export PROMPT="%{$fg_bold[yellow]%}${HOST} %F{green}[%T]%f $PROMPT"

# directories completion
# from https://qiita.com/funyatomo/items/372f02dcd4d708d218b1
# eval `dircolors /etc/DIR_COLORS`
autoload -U colors
colors
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' list-colors "${LS_COLORS}"
#単語の入力途中でもTab補完を有効化
setopt complete_in_word
# 補完候補をハイライト
zstyle ':completion:*:default' menu select=1
# キャッシュの利用による補完の高速化
zstyle ':completion::complete:*' use-cache true
#大文字、小文字を区別せず補完する
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# 補完リストの表示間隔を狭くする
setopt list_packed

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kaku-junichi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/kaku-junichi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kaku-junichi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/kaku-junichi/google-cloud-sdk/completion.zsh.inc'; fi

# Load Git completion
# from https://medium.com/@oliverspryn/adding-git-completion-to-zsh-60f3b0e7ffbc
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit