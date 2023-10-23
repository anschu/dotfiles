#!/usr/bin/env bash
set -g mode-style "fg=#131a24,bg=#aeafb0"
set -g message-style "fg=#131a24,bg=#aeafb0"
set -g message-command-style "fg=#131a24,bg=#aeafb0"
set -g pane-border-style "fg=#aeafb0"
set -g pane-active-border-style "fg=#719cd6"
set -g status "on"
set -g status-justify "left"
set -g status-style "fg=#aeafb0,bg=#131a24"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
set -g status-left ""
set -g status-right "#{?client_prefix,,  TMUX }#[fg=#719cd6,bold]#{?client_prefix,  TMUX }"

setw -g window-status-activity-style "underscore,fg=#71839b,bg=#131a24"
setw -g window-status-separator ""
setw -g window-status-style NONE
setw -g window-status-format "#[fg=#131a24,bg=#131a24,nobold,nounderscore,noitalics]#[default] #I:#W#F  "
setw -g window-status-current-format "#[fg=#131a24,nobold,nounderscore,noitalics]#[fg=#719cd6,bold] #I:#W#F  "
