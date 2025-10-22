.PHONY: gitconf zsh vim custom tmux font kitty xdg-dirs root-config

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
	mkdir -p $(XDG_STATE_HOME)/zsh
	mkdir -p $(XDG_CACHE_HOME)/zsh
	ln -sfn $(PWD)/zsh $(XDG_CONFIG_HOME)/zsh
	ln -sf $(PWD)/zsh/zshrc $(HOME)/.zshrc
	ln -sfn $(PWD)/zsh/.zshenv ~/.zshenv

vim:
	mkdir -p $(XDG_CONFIG_HOME)/vim
	# ln -sfn $(PWD)/vim/vimrc $(XDG_CONFIG_HOME)/vim/.vimrc
	ln -sfn $(PWD)/vim/vimrc $(HOME)/.vimrc
	# if vim-plug has not been installed, run the command below
	# curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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
	ln -sfnd /home/bryan/.config $(HOME)/.config
	ln -sfnd /home/bryan/.local $(HOME)/.local
	ln -sf $(PWD)/zsh/zshrc $(HOME)/.zshrc
