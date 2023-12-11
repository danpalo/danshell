#!/bin/sh

CONFIG_DIR=~/.config/
CONFIG_FILE=$CONFIG_DIR/starship.toml
ZSHRC_FILE=~/.zshrc
BASHRC_FILE=~/.bashrc
STARSHIP_INIT_LINE_ZSH='eval "$(starship init zsh)"'
STARSHIP_INIT_LINE_BASH='eval "$(starship init bash)"'

if [ -w "/usr/local/bin" ]; then
	INSTALL_BIN=/usr/local/bin
	STARSHIP_INIT_LINE_ZSH='eval "$(starship init zsh)"'
	STARSHIP_INIT_LINE_BASH='eval "$(starship init bash)"'
else
	mkdir -p ~/bin
	INSTALL_BIN=~/bin
	STARSHIP_INIT_LINE_ZSH='eval "$(~/bin/starship init zsh)"'
	STARSHIP_INIT_LINE_BASH='eval "$(~/bin/starship init bash)"'
fi

curl -sS https://starship.rs/install.sh | sh -s -- -y -b $INSTALL_BIN

mkdir -p $CONFIG_DIR
curl -sS https://raw.githubusercontent.com/danpalo/danshell/main/starship.toml -o $CONFIG_DIR/starship.toml

if [ $(basename "$SHELL") = "zsh" ]; then
    if ! grep -qF "$STARSHIP_INIT_LINE_ZSH" $ZSHRC_FILE; then
        echo "\n$STARSHIP_INIT_LINE_ZSH" >> $ZSHRC_FILE
    fi
fi

if [ $(basename "$SHELL") = "bash" ]; then
    if ! grep -qF "$STARSHIP_INIT_LINE_BASH" $BASHRC_FILE; then
        echo "\n$STARSHIP_INIT_LINE_BASH" >> $BASHRC_FILE
    fi
fi
