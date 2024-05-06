# tmux-setup
fundamental tmux configurations for local setup

## usage
- clone the repository to whever you want in your local file system
- create hardlink of the files in the repository to the default paths expected.

### Notes on Mac
- `~/.tmux.conf` is written for Ctrl key bindings. If you are using Mac, consider configuring iterm2
to send Cmd key hexcode signals as Ctrl

Example;
Suppose you are in this project directory:

```sh
ln tmux-sessionizer.sh ~/.local/bin/tmux-sessionizer.sh
ln .tmux.conf ~/.tmux.conf
```
