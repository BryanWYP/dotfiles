# colorful
command -v lsd >/dev/null 2>&1
if [ $? -eq 0 ]; then
    alias ls="lsd --color=auto"
else
	alias ls="ls --color=auto"
fi
alias ll="ls -Al"
export LS_COLORS="$LS_COLORS:di=38;5;39" # more light blue
alias grep="grep --color=auto"
command -v bat >/dev/null 2>&1
if [ $? -eq 0 ]; then
	alias cat="bat -p --theme Dracula"
fi
# mb: start blink
# md: start blod
# me: turn off bold, blink and underline
# us: start underline
# ue: stop underline
# so: start standout
# se: stop standout
man() {
    env MANROFFOPT=-c \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;34m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[4;32m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        man "$@"
}
plugins=(
    	git
	zsh-autosuggestions
	extract
)

