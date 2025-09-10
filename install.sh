#!/bin/bash
# Dotfiles installation script

DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/.dotfiles_backup"

# Create backup directory
mkdir -p $BACKUP_DIR

# Function to backup and link
backup_and_link() {
    local source_file="$1"
    local target_file="$2"
    
    if [ -f "$target_file" ] || [ -L "$target_file" ]; then
        mv "$target_file" "$BACKUP_DIR/"
    fi
    
    ln -sf "$source_file" "$target_file"
    echo "Linked: $source_file -> $target_file"
}

# Install dotfiles
backup_and_link "$DOTFILES_DIR/bash/.bashrc" "$HOME/.bashrc"
backup_and_link "$DOTFILES_DIR/bash/.bash_profile" "$HOME/.bash_profile"
backup_and_link "$DOTFILES_DIR/bash/.bash_aliases" "$HOME/.bash_aliases"
backup_and_link "$DOTFILES_DIR/git/.gitconfig" "$HOME/.gitconfig"
backup_and_link "$DOTFILES_DIR/git/.gitignore_global" "$HOME/.gitignore_global"
backup_and_link "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"
backup_and_link "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"

# Fish shell configuration
if command -v fish >/dev/null 2>&1; then
    mkdir -p "$HOME/.config/fish"
    backup_and_link "$DOTFILES_DIR/fish/config.fish" "$HOME/.config/fish/config.fish"
    
    # Fish functions
    mkdir -p "$HOME/.config/fish/functions"
    for func in $DOTFILES_DIR/fish/functions/*.fish; do
        backup_and_link "$func" "$HOME/.config/fish/functions/$(basename $func)"
    done
fi

# Kubernetes aliases
backup_and_link "$DOTFILES_DIR/kubernetes/kubectl_aliases" "$HOME/.kubectl_aliases"

# Add kubectl aliases to bashrc if not already present
if ! grep -q "kubectl_aliases" "$HOME/.bashrc"; then
    echo "source ~/.kubectl_aliases" >> "$HOME/.bashrc"
fi

# Make scripts executable
chmod +x $DOTFILES_DIR/scripts/*.sh

echo "Dotfiles installation completed!"
echo "Backup files are stored in: $BACKUP_DIR"
echo "Please restart your shell or run: source ~/.bashrc"
