.PHONY: server git xdg-dirs zsh nvim tmux font kitty xdg-dirs root-config fzf lazygit

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

git:
	git config --global user.email "1536481268@qq.com"
	git config --global user.name "BryanWYP"

zsh:
	mkdir -p $(XDG_STATE_HOME)/zsh
	mkdir -p $(XDG_CACHE_HOME)/zsh

	@# 1. 判断并修改默认 shell 为 zsh
	@if [ "$$(basename $$SHELL)" != "zsh" ]; then \
		echo "Current shell is not zsh. Changing default shell to zsh..."; \
		chsh -s "$$(command -v zsh)"; \
	else \
		echo "Current shell is already zsh."; \
	fi
	@# 2. 判断并安装 oh-my-zsh (非交互式安装，不更改shell设置，不跳转进入zsh)
	@if [ ! -d "$(XDG_CONFIG_HOME)/zsh/.oh-my-zsh" ]; then \
		echo "Oh-My-Zsh not found. Installing Oh-My-Zsh..."; \
		env KEEP_ZSHRC=yes CHSH=no RUNZSH=no sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; \
	else \
		echo "Oh-My-Zsh is already installed."; \
	fi
	@# 3. 判断并安装 zsh-autosuggestions 插件
	@if [ ! -d "$(XDG_CONFIG_HOME)/zsh/.oh-my-zsh/plugins/zsh-autosuggestions" ]; then \
		echo "Installing zsh-autosuggestions..."; \
		git clone https://github.com/zsh-users/zsh-autosuggestions $(XDG_CONFIG_HOME)/zsh/.oh-my-zsh/plugins/zsh-autosuggestions; \
	else \
		echo "zsh-autosuggestions is already installed."; \
	fi
	@# 4. 判断并安装 zsh-syntax-highlighting 插件
	@if [ ! -d "$(XDG_CONFIG_HOME)/zsh/.oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then \
		echo "Installing zsh-syntax-highlighting..."; \
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $(XDG_CONFIG_HOME)/zsh/.oh-my-zsh/plugins/zsh-syntax-highlighting; \
	else \
		echo "zsh-syntax-highlighting is already installed."; \
	fi

	ln -sfn $(PWD)/zsh $(XDG_CONFIG_HOME)/zsh
	ln -sf $(PWD)/zsh/zshrc $(HOME)/.zshrc
	ln -sfn $(PWD)/zsh/.zshenv ~/.zshenv

nvim:
	@if ! command -v nvim >/dev/null 2>&1; then \
		echo "Neovim not installed. Downloading AppImage..."; \
		mkdir -p $(HOME)/.local/bin; \
		sudo curl -L -o /usr/local/bin/nvim https://github.com/neovim/neovim/releases/download/v0.11.4/nvim-linux-x86_64.appimage; \
		sudo chmod +x /usr/local/bin/nvim; \
		echo "Neovim downloaded mapping to /usr/local/bin/nvim."; \
		echo "Please ensure /usr/local/bin is in your PATH in zshrc."; \
	else \
		echo "Neovim is already installed."; \
	fi
	@if [ ! -d "$(XDG_CONFIG_HOME)/nvim" ]; then \
		git clone git@github.com:BryanWYP/mystart.nvim.git $(XDG_CONFIG_HOME)/nvim; \
	else \
		echo "nvim config has been ready."; \
	fi
	@if ! command -v ctags >/dev/null 2>&1; then \
		echo "Try to install ctags."; \
		sudo apt install universal-ctags; \
		mkdir -p $(HOME)/.cache/tags; \
	else \
		echo "ctags has been installed."; \
	fi


fzf:
	@if ! command -v fzf >/dev/null 2>&1; then \
		echo "fzf not found. Installing fzf..."; \
		if [ ! -d "$(HOME)/.fzf" ]; then \
			git clone --depth 1 https://github.com/junegunn/fzf.git $(HOME)/.fzf; \
		fi; \
		$(HOME)/.fzf/install --all; \
	else \
		echo "fzf is already installed."; \
	fi

tmux:
	ln -sfn $(PWD)/tmux $(XDG_CONFIG_HOME)/tmux
	git clone https://github.com/tmux-plugins/tpm $(PWD)/tmux/plugins/tpm
	ln -sf $(PWD)/tmux/tmux.conf $(XDG_CONFIG_HOME)/tmux/.tmux.conf
	# ln -sf $(PWD)/tmux/tmux.conf $(HOME)/.tmux.conf
	
lazygit:
	echo "[WARN]: You need to install lazygit manually"

server: xdg-dir szsh nvim tmux fzf lazygit

# Mac or front configuration setting

font:
	mkdir -p $(XDG_CONFIG_HOME)/fontconfig
	ln -sfn $(PWD)/fonts.conf $(XDG_CONFIG_HOME)/fontconfig/fonts.conf


kitty:
	ln -sfn $(PWD)/kitty $(XDG_CONFIG_HOME)/kitty
