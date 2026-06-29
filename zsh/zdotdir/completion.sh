autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# How it works: +commands[git] returns 1 if git exists in your $PATH and 0 if it does not. The arithmetic evaluation (( ... )) treats 1 as success (true) and 0 as failure (false).
if (( $+commands[limactl] )); then
  source <(limactl completion zsh)
fi
