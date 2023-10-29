bind-key -n -N 'Toggle popup window' C-t if-shell -F '#{==:#{session_name},popup}' {
    detach-client
} {
    display-popup -d '#{pane_current_path}' -xC -yC -w 80% -h 80% -E 'tmux attach-session -t popup || tmux new-session -s popup'
}

bind-key -N 'Recreate popup window' t if-shell -F '#{==:#{session_name},popup}' {
    detach-client 
    kill-session -t popup
} {
    display-popup -d '#{pane_current_path}' -xC -yC -w 80% -h 80% -E 'tmux kill-session -t popup > /dev/null ; tmux new-session -s popup'
}

