# DPM (Dynamic Pane Manager)

DPM is a dynamic pane manager for Tmux.

Please visit [moedev.org](https://moedev.org) if you want to see more interesting projects


## Installation

Please use TPM (Tmux Plugin Manager) to install this plugin (check more details about TPM [here](https://github.com/tmux-plugins/tpm)):

Add add the following to `~/.tmux.conf`, then press `Ctrl + b` followed by `Shift + i` to install it (assuming default prefix key):

```
set -g @plugin 'moedev-org/tmux-dpm'
```

You might want to add the line below to `~/.tmux.conf`:

```
set -s escape-time 0 
```

Please check the following links if you want to know why:

* https://unix.stackexchange.com/a/25638
* https://stackoverflow.com/a/13843382


## Key bindings

By default, the prefix for DPM is `Meta` key. You could customize the prefix key in your `.tmux.conf`. For example, to use `Ctrl` + `z` as your DPM prefix, add the following to your `~/.tmux.conf`:

```
set -g @dpm-prefix "C-z"
```

Here are all the key bindings available:

* `prefix` + `Enter` Create a new pane in current directory
* `prefix` + `d` Kill pane
* `prefix` + `Space` Focus selected pane

* `prefix` + `m` Switch to Master layout
* `prefix` + `f` Switch to Fullscreen layout
* `prefix` + `v` Switch to Even Vertical layout

* `prefix` + `<` Switch to previous pane (counterclockwise)
* `prefix` + `>` Switch to next pane (clockwise)
* `prefix` + `,` Rotate pane (counterclockwise)
* `prefix` + `.` Rotate pane (clockwise)

* `prefix` + `h` `j` `k` `l` Move focus left/down/up/right 


## Similar Projects

* https://github.com/saysjonathan/dwm.tmux
* https://github.com/jabirali/tmux-tilish

## License

[MIT License](/LICENSE)
