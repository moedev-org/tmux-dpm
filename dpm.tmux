#!/bin/sh

# Project: tmux-dpm
# Author:  moedev.org
# Licence: MIT licence

# DPM is a dynamic pane manager for Tmux.
# Please visit https://moedev.org if you want to see more interesting projects

for opt in prefix
do
    export "$opt"="$(tmux show-option -gv @dpm-$opt 2>/dev/null)"
done

bind="bind -n"
dpm_prefix="M-"

if [ -n "$prefix" ]
then
    bind="bind -rT dpm-prefix"
    dpm_prefix=""
    tmux bind -n "$prefix" switch-client -T dpm-prefix
fi

pane_init_path="#{pane_current_path}"
main_pane_size="2/3" # recommand options: ["2/3", "1/2", "1/3"]
main_pane_resize="select-layout main-vertical; run \"tmux resize-pane -t :.0 -x \$(echo \$((#{window_width}*$main_pane_size)))\""

# Create new pane in current directory
tmux ${bind} ${dpm_prefix}Enter "split-window -t :.0 -c '$pane_init_path' ; swap-pane -s :.0 -t :.1 ; $main_pane_resize"

# Kill pane
tmux ${bind} ${dpm_prefix}d \
    if-shell "[ \"\$(tmux display-message -p '#{window_panes}')\" -gt 1 ]" \
    "kill-pane -t :. ; $main_pane_resize" \
    "kill-pane -t :."

# Focus selected pane
tmux ${bind} ${dpm_prefix}Space \
    if-shell "[ \"\$(tmux display-message -p '#{window_panes}')\" -gt 1 ]" \
    "swap-pane -s :. -t :.0 ; select-pane -t :.0"

# Master layout
tmux ${bind} ${dpm_prefix}m \
    if-shell "[ \"\$(tmux display-message -p '#{window_panes}')\" -gt 1 ]" \
    "$main_pane_resize"

# Fullscreen layout
tmux ${bind} ${dpm_prefix}f resize-pane -Z

# Even vertical layout
tmux ${bind} ${dpm_prefix}v select-layout even-horizontal

# Prev pane (counterclockwise)
tmux ${bind} ${dpm_prefix}\< select-pane -t :.-

# Next pane (clockwise)
tmux ${bind} ${dpm_prefix}\> select-pane -t :.+

# Rotate (counterclockwise)
tmux ${bind} ${dpm_prefix}, "rotate-window -U ; select-pane -t 0"

# Rotate (clockwise)
tmux ${bind} ${dpm_prefix}. "rotate-window -D ; select-pane -t 0"

# Move focus left/down/up/right
tmux ${bind} ${dpm_prefix}h select-pane -L
tmux ${bind} ${dpm_prefix}j select-pane -D
tmux ${bind} ${dpm_prefix}k select-pane -U
tmux ${bind} ${dpm_prefix}l select-pane -R
