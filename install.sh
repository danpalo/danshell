#!/bin/sh

CONFIG_DIR=~/.config/
CONFIG_FILE=$CONFIG_DIR/starship.toml
ZSHRC_FILE=~/.zshrc
BASHRC_FILE=~/.bashrc
STARSHIP_INIT_LINE_ZSH='eval "$(starship init zsh)"'
STARSHIP_INIT_LINE_BASH='eval "$(starship init bash)"'

curl -sS https://starship.rs/install.sh | sh -s -- -y

mkdir -p $CONFIG_DIR

if [ ! -f $CONFIG_FILE ]; then
	starship preset tokyo-night -o ~/.config/starship.toml
fi

if [ "$SHELL" = "/bin/zsh" ] || [ "$SHELL" = "/usr/bin/zsh" ]; then
    if ! grep -qF "$STARSHIP_INIT_LINE_ZSH" $ZSHRC_FILE; then
        echo "\n$STARSHIP_INIT_LINE_ZSH" >> $ZSHRC_FILE
    fi
fi

if [ "$SHELL" = "/bin/bash" ] || [ "$SHELL" = "/usr/bin/bash" ]; then
    if ! grep -qF "$STARSHIP_INIT_LINE_BASH" $BASHRC_FILE; then
        echo "\n$STARSHIP_INIT_LINE_BASH" >> $BASHRC_FILE
    fi
fi
