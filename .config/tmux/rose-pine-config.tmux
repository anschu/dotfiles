set -g @rose_pine_host 'on' # Enables hostname in the status bar
set -g @rose_pine_date_time '%a %d.%b %H:%M' # It accepts the date UNIX command format (man date for info)
set -g @rose_pine_user 'on' # Turn on the username component in the statusbar

# set -g @rose_pine_only_windows 'on' # Leaves only the window module, for max focus and space
set -g @rose_pine_disable_active_window_menu 'on' # Disables the menu that shows the active window on the left

set -g @rose_pine_default_window_behavior 'on' # Forces tmux default window list behaviour
# set -g @rose_pine_show_current_program 'on' # Forces tmux to show the current running program as window name
# set -g @rose_pine_show_pane_directory 'on' # Forces tmux to show the current directory as 
# Previously set -g @rose_pine_window_tabs_enabled

# Example values for these can be:
set -g @rose_pine_left_separator ' ' # The strings to use as separators are 1-space padded
set -g @rose_pine_right_separator ' ' # Accepts both normal chars & nerdfont icons
set -g @rose_pine_field_separator ' | ' # Again, 1-space padding, it updates with prefix + I

# These are not padded
set -g @rose_pine_session_icon '' # Changes the default icon to the left of the session name
set -g @rose_pine_current_window_icon '' # Changes the default icon to the left of the active window name
set -g @rose_pine_folder_icon '' # Changes the default icon to the left of the current directory folder
set -g @rose_pine_username_icon '' # Changes the default icon to the right of the hostname
set -g @rose_pine_hostname_icon '󰒋' # Changes the default icon to the right of the hostname
set -g @rose_pine_date_time_icon '󰃰' # Changes the default icon to the right of the date module
set -g @rose_pine_window_status_separator "  " # Changes the default icon that appears between window names

# Very beta and specific opt-in settings, tested on v3.2a, look at issue #10
# set -g @rose_pine_prioritize_windows 'on' # Disables the right side functionality in a certain window count / terminal width
# set -g @rose_pine_width_to_hide '80' # Specify a terminal width to toggle off most of the right side functionality
# set -g @rose_pine_window_count '6' # Specify a number of windows, if there are more than the number, do the same as width_to_hide
