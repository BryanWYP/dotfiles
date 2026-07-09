export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

export ZSH="$XDG_CONFIG_HOME/zsh/.oh-my-zsh"
ZSH_THEME="crunch"

plugins=(
  git
  zsh-autosuggestions
  extract
  zsh-syntax-highlighting
  z
)

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

if [[ -n "$SSH_CONNECTION" ]]; then
  export EDITOR='vim'
fi

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5795ff,bg=gray,bold,underline"
alias ssh="TERM=xterm-256color ssh"

if [[ -f "$HOME/.fzf.zsh" ]]; then
  source "$HOME/.fzf.zsh"
fi

if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

alias vi="nvim"
alias zr="nvim ~/.zshrc"

alias tm="tmux"
alias tml="tmux ls"
alias tma="tmux attach -t"
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias lg="lazygit"
alias python="python3"
alias init_github="git config --local user.name 'BryanWYP' && git config --local user.email 'wyp1536481268@foxmail.com'"
alias init_gitlab="git config --local user.name 'BryanWu' && git config --local user.email 'wyp1536481268@foxmail.com'"
alias init_gitcode="git config --local user.name 'Bryan_Wu' && git config --local user.email 'wyp1536481268@foxmail.com'"
alias sjtu-vpn="ssh proxy -N"

export HF_ENDPOINT="https://hf-mirror.com"

