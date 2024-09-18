#!/bin/bash

echo "Installing Homebrew..."
curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
echo "eval \"\$($(brew --prefix)/bin/brew shellenv)\"" >>~/.bashrc

echo "Installing Homebrew packages..."
brew install gcc helix ripgrep lazygit gitui zoxide eza yazi ffmpegthumbnailer unar jq poppler fd fzf bat
brew install ruby jesseduffield/lazydocker/lazydocker

echo "Setting up Helix..."
cat ~/.config/helix/languages.toml <<EOF
[[language]]
name = "go"
auto-format = true
formatter = { command = "goimports" }
EOF

exec bash
