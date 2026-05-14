# Usage: hop <socket_name> <session_name>
hop() {
    tmux detach-client -E "tmux -L $1 attach-session -t $2"
}
