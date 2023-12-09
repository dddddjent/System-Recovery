# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
USE_POWERLINE="true"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    docker
    git
)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -------------------------------------------
# User configuration

# zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey ',' autosuggest-accept

alias l="lvim"
alias n="nvim"
alias nclean="nvim --clean"
alias lla="ll -a"
eval $(thefuck --alias)

# tmux
alias tnew="tmux new -s "
alias tn="tmux new -s "
alias tdetach="tmux detach"
alias tlist="tmux ls"
alias tls="tmux ls"
alias tattach="tmux attach -t "
alias ta="tmux attach -t "
alias tkill="tmux kill-session -t "
alias tkillall="tmux kill-server"
alias tswitch="tmux switch -t "
alias trename="tmux rename-session -t "
alias tsplitud="tmux split-window"
alias tsplitlr="tmux split-window -h"
alias tmoveu="tmux select-pane -U"
alias tmoved="tmux select-pane -D"
alias tmovel="tmux select-pane -L"
alias tmover="tmux select-pane -R"
alias tswapu="tmux swap-pane -U"
alias tswapd="tmux swap-pane -D"

# FZF
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow \
    --glob "!{.git,node_modules,.cache,.idea,.pytest_cache,__pycache__,build}/*"\
    --glob "!**/{.git,.cache,.idea,__pycache__,.pytest_cache}/**"\
    --glob "!**/{build,Build,cmake-build*,android-build,build-*}/**"\
    --glob "!*.{o}"\
    --glob "!**/.vs/**"\
    2> /dev/null'
# export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND "
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

# Texlive -tlmgr
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# tmuxinator
export EDITOR="nvim"
alias mux=tmuxinator
#alias s = "mux s $(tmuxinator list -n | tail -n +2 | fzf --prompt='Project: ' -m -1 -q '$1')"
s() {
  local selected_project
  selected_project=$(tmuxinator list -n | tail -n +2 | fzf --prompt='Project: ' -m -1 -q "$1")
  if [ -n "$selected_project" ]; then
    mux s "$selected_project"
  fi
}
# setopt noflowcontrol

alias p='export http_proxy=socks5://127.0.0.1:1090 \
export https_proxy=socks5://127.0.0.1:1090'
alias p_unset='unset http_proxy \
unset https_proxy'

# >>> xmake >>>
test -f "/home/ljl/.xmake/profile" && source "/home/ljl/.xmake/profile"
# <<< xmake <<<
if [ -n "$PYTHONPATH" ]; then
    export PYTHONPATH='/usr/lib/python3.11/site-packages/pdm/pep582':$PYTHONPATH
else
    export PYTHONPATH='/usr/lib/python3.11/site-packages/pdm/pep582'
fi
alias vactivate='$(pdm venv activate)'

# pnpm
export PNPM_HOME="/home/ljl/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
