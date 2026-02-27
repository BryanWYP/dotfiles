.PHONY: gitconf zsh nvim custom tmux font kitty xdg-dirs root-config

export XDG_DATA_HOME = $(HOME)/.local/share
export XDG_CONFIG_HOME = $(HOME)/.config
export XDG_CACHE_HOME = $(HOME)/.cache
export XDG_STATE_HOME = $(HOME)/.local/state

xdg-dirs:
	@echo "Checking and creating XDG directories if needed..."
	@mkdir -p "$(XDG_DATA_HOME)" \
	          "$(XDG_CONFIG_HOME)" \
	          "$(XDG_CACHE_HOME)" \
	          "$(XDG_STATE_HOME)"
	@echo "All XDG directories are ready."

gitconf:
	mkdir -p $(XDG_CONFIG_HOME)/git
	ln -sfn $(PWD)/gitconfig $(XDG_CONFIG_HOME)/git/config

zsh:
	@if [ "$$(basename $$SHELL)" != "zsh" ]; then \
		echo "Current shell is not zsh. Changing default shell to zsh..."; \
		chsh -s "$$(command -v zsh)"; \
	else \
		echo "Current shell is already zsh."; \
	fi
	mkdir -p $(XDG_STATE_HOME)/zsh
	mkdir -p $(XDG_CACHE_HOME)/zsh
	ln -sfn $(PWD)/zsh $(XDG_CONFIG_HOME)/zsh
	ln -sf $(PWD)/zsh/zshrc $(HOME)/.zshrc
	ln -sfn $(PWD)/zsh/.zshenv ~/.zshenv

nvim:
	@if ! command -v nvim >/dev/null 2>&1; then \
		echo "Neovim not installed. Downloading AppImage..."; \
		mkdir -p $(HOME)/.local/bin; \
		curl -L -o $(HOME)/.local/bin/nvim https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.appimage; \
		chmod +x $(HOME)/.local/bin/nvim; \
		echo "Neovim downloaded mapping to $(HOME)/.local/bin/nvim."; \
		echo "Please ensure $(HOME)/.local/bin is in your PATH in zshrc."; \
	else \
		echo "Neovim is already installed."; \
	fi


custom:
	if [ -f custom.sh ]; then \
		./custom.sh; \
	fi

tmux:
	ln -sfn $(PWD)/tmux $(XDG_CONFIG_HOME)/tmux
	git clone https://github.com/tmux-plugins/tpm $(PWD)/tmux/plugins/tpm
	ln -sf $(PWD)/tmux/tmux.conf $(XDG_CONFIG_HOME)/tmux/.tmux.conf
	# ln -sf $(PWD)/tmux/tmux.conf $(HOME)/.tmux.conf



font:
	mkdir -p $(XDG_CONFIG_HOME)/fontconfig
	ln -sfn $(PWD)/fonts.conf $(XDG_CONFIG_HOME)/fontconfig/fonts.conf


kitty:
	ln -sfn $(PWD)/kitty $(XDG_CONFIG_HOME)/kitty

root-config:
	ln -sf $(PWD)/zsh/zshrc $(HOME)/.zshrc
