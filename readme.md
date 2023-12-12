This is a small repo for installing my preferred shell configuration.

```
curl -sS https://raw.githubusercontent.com/danpalo/danshell/main/install.sh | sh
```

Optionally, if you also want to immediately activate the starship settings, you could try something like this:

```
if [ $(basename "$SHELL") = "zsh" ]; then
  if [ -f "$HOME/bin/starship" ]; then
    eval "$($HOME/bin/starship init zsh)"
  else
    eval "$(starship init zsh)"
  fi
fi
if [ $(basename "$SHELL") = "bash" ]; then
  if [ -f "$HOME/bin/starship" ]; then
    eval "$($HOME/bin/starship init bash)"
  else
    eval "$(starship init bash)"
  fi
fi
```

However, that may not always work, so it's probably best to just restart your shell.