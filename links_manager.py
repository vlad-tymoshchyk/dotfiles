#!/usr/bin/env python3
import os
import sys

commands = {
    'CHECK': [ 'check', 'ch' ],
    'REMOVE': [ 'rm' ],
    'CREATE': [ 'create' ],
}


if len(sys.argv) > 1:
    arg = sys.argv[1]
    if arg in [a for sub in commands for a in commands[sub]]:
        for prop in commands:
            if arg in commands[prop]:
                command = prop
    else:
        print('Unknown command:', arg)
        sys.exit()
else:
    command = 'CHECK'

#  print(command)
#  sys.exit()

LINKS = [
    ('~/.vimrc', '~/dotfiles/home/.vimrc'),
    ('~/.zshrc', '~/dotfiles/home/.zshrc'),
    ('~/.tmux.conf', '~/dotfiles/home/.tmux.conf'),
    ('~/.gitconfig', '~/dotfiles/home/.gitconfig'),
    ('~/.gitignore_global', '~/dotfiles/home/.gitignore_global'),
    ('~/sandboxes', '~/dotfiles/sandboxes'),
    ('~/.config/nvim', '~/dotfiles/nvim'),
    ('~/.config/alacritty', '~/dotfiles/config/alacritty'),
    ('~/.config/i3', '~/dotfiles/config/i3'),
    ('~/.config/i3blocks', '~/dotfiles/config/i3blocks'),
    ('~/.config/tmuxinator', '~/dotfiles/tmuxinator'),
    ('~/.config/zathura', '~/dotfiles/config/zathura'),
    ('~/.local/share/fonts', '~/dotfiles/local/fonts'),
]

LINKS = [
    (
        os.path.expanduser(link[0]),
        os.path.expanduser(link[1])
    )
    for link in LINKS
]

if len(sys.argv) > 1:
    command = sys.argv[1]
    if command == 'rm':
        print('Removing...')
        for link in LINKS:
            dest, src = link
            if os.path.exists(dest):
                os.remove(dest)
                print('Removed:', dest)
            else:
                print('No file...', dest)
        sys.exit()

if command == 'CHECK':
    print('Checking symbolic links...')
for link in LINKS:
    dest, src = link
    if os.path.exists(src):
        if os.path.exists(dest):
            if os.path.islink(dest):
               if os.readlink(dest) == src:
                   print(' - Correct: ', dest)
               else:
                   print(' - Link destination is not correct: ', os.readlink(dest), src)
            else:
                print(' - File exists and is not a link: ', dest)
        else:
            print('Created:', dest)
            os.symlink(src, dest)
    else:
        print('Source does not exist:', src)
