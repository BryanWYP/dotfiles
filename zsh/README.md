# zsh

Layout:
- `~/.zshrc` -> `dotfiles/zsh/zshrc`
- `~/.config/zsh` -> `dotfiles/zsh`
- `config/general.zsh`: shared config for all machines
- `machines/<hostname>/public.zsh`: machine-specific tracked config
- `machines/<hostname>/secret.zsh`: machine-specific secret config, ignored by Git

On a new machine:
1. Create the two symlinks above.
2. Install oh-my-zsh and required plugins.
3. Create `machines/<hostname>/public.zsh` for non-secret host config.
4. Create `machines/<hostname>/secret.zsh` locally for tokens, proxies, and other secrets.

Note: the old commented macOS-specific block from the previous single-file zshrc was not auto-migrated. Move it manually into that machine's `public.zsh` if you still need it.
