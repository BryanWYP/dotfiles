export PATH=:/Users/bryan/venv/bin:/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/mysql/bin:$GOROOT/bin:$JAVA_HOME/bin:$HDC_PATH:/usr/local/texlive/2025/bin/universal-darwin:/usr/local/nvim-macos-arm64/bin
export HOMEBREW_NO_INSTALL_CLEANUP=TRUE
export HOMEBREW_NO_AUTO_UPDATE=1

# bun completions
[ -s "/Users/bryan/.bun/_bun" ] && source "/Users/bryan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "$HOME/.local/share/../bin/env"

alias claude-mem='/Users/bryan/.bun/bin/bun "/Users/bryan/.claude/plugins/cache/thedotmack/claude-mem/12.1.0/scripts/worker-service.cjs"'

# opencode
export PATH=/Users/bryan/.opencode/bin:$PATH