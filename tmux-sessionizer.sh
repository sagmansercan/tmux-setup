if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~ \
        -mindepth 1 -maxdepth 3 -type d \
        -not -path "*/Library/*" \
        -not -path "*/.local/*" \
        -not -path "*/.cache/*" \
        -not -path "*/.config/*" \
        -not -path "*/.gradle/*" \
        -not -path "*/.bun/*" \
        -not -path "*/.minikube/*" \
        -not -path "*/.kube/*" \
        -not -path "*/.vscode/*" \
        -not -path "*/.rustup/*" \
        -not -path "*/.cargo/*" \
        -not -path "*/.oh-my-zsh/*" \
        -not -path "*/.snowsql/*" \
        -not -path "*/Music/*" \
        -not -path "*/Movies/*" \
        -not -path "*/Pictures/*" \
        | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name
