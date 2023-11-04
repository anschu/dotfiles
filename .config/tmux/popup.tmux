bind-key -n -N 'Toggle popup window' C-o if-shell -F '#{==:#{session_name},popup}' {
    detach-client
} {
    display-popup -d '#{pane_current_path}' -xC -yC -w 80% -h 80% -E 'tmux attach-session -t popup ; tmux set -t popup status off || tmux new-session -s popup'
}

bind-key -N 'Toggle popup window' o if-shell -F '#{==:#{session_name},popup}' {
    detach-client
} {
    display-popup -d '#{pane_current_path}' -xC -yC -w 80% -h 80% -E 'tmux attach-session -t popup ; tmux set -t popup status off || tmux new-session -s popup'
}

bind-key -N 'Recreate popup window' C-o if-shell -F '#{==:#{session_name},popup}' {
    detach-client 
    kill-session -t popup
} {
    display-popup -d '#{pane_current_path}' -xC -yC -w 80% -h 80% -E 'tmux kill-session -t popup > /dev/null ; tmux new-session -s popup'
}

bind-key -N 'Recreate popup window' C-p if-shell -F '#{==:#{session_name},popup}' {
    detach-client 
    kill-session -t popup
} {
    display-popup -d '#{pane_current_path}' -xC -yC -w 80% -h 80% -E 'tmux kill-session -t popup > /dev/null ; tmux new-session -s popup'
}

