typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Use powerline
USE_POWERLINE="true"
ZSH_THEME="powerlevel10k/powerlevel10k"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
    source /usr/share/zsh/manjaro-zsh-config
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
    source /usr/share/zsh/manjaro-zsh-prompt
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

bindkey ',' autosuggest-accept

# -------------------------------------------
# My own config
alias l="lvim"
alias n="nvim"
alias nclean="nvim --clean"
eval $(thefuck --alias)


PATH="/home/ljl/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/ljl/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/ljl/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/ljl/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/ljl/perl5"; export PERL_MM_OPT;

# --------------
# Path
export LLVM_DIR=/home/ljl/Documents/ThirdParty/taichi-llvm-15
# export PATH="/home/ljl/Documents/ThirdParty/clang10/bin:$PATH"

# >>> xmake >>>
[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile
# <<< xmake <<<

# 1 新建会话
alias tnew="tmux new -s "
alias tn="tmux new -s "
# 2 分离会话(ctrl+b d)
alias tdetach="tmux detach"
# 3 列出会话(ctrl+b s)
alias tlist="tmux ls"
alias tls="tmux ls"
# 4 接入会话
alias tattach="tmux attach -t "
alias ta="tmux attach -t "
# 5 杀死指定会话
alias tkill="tmux kill-session -t "
# 6 杀死全部会话
alias tkillall="tmux kill-server"
# 7 切换会话
alias tswitch="tmux switch -t "
# 8 重命名会话(ctrl+b $)
alias trename="tmux rename-session -t "
# 9 窗口上下划分窗格
alias tsplitud="tmux split-window"
# 10 窗口左右划分窗格
alias tsplitlr="tmux split-window -h"
# 11 光标到上方窗格
alias tmoveu="tmux select-pane -U"
# 12 光标到下方窗格
alias tmoved="tmux select-pane -D"
# 13 光标到上方窗格
alias tmovel="tmux select-pane -L"
# 14 光标到上方窗格
alias tmover="tmux select-pane -R"
# 15 交换窗格位置(当前窗格上移)
alias tswapu="tmux swap-pane -U"
# 16 交换窗格位置(当前窗格下移)
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

# DOOM emacs
export PATH="$HOME/.emacs.d/bin:$PATH"
alias em="emacsclient -c -a 'nvim'"

# Texlive -tlmgr
alias tlmgr='/usr/share/texmf-dist/scripts/texlive/tlmgr.pl --usermode'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Conda
export PATH="/opt/anaconda/bin:$PATH"

# tmuxinator
export EDITOR="nvim"
alias mux=tmuxinator
