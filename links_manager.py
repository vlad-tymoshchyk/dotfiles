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
    ('~/.config/nvim/init.vim', '~/dotfiles/home/.vimrc'),
    ('~/.config/alacritty', '~/dotfiles/config/alacritty'),
    ('~/.config/i3', '~/dotfiles/config/i3'),
    ('~/.config/i3blocks', '~/dotfiles/config/i3blocks'),
    ('~/.config/ranger', '~/dotfiles/config/ranger'),
    ('~/.config/tmuxinator', '~/dotfiles/config/tmuxinator'),
    ('~/.config/zathura', '~/dotfiles/config/zathura'),
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
    if (os.path.exists(src)):
        if (os.path.exists(dest)):
            if(os.path.islink(dest) and os.readlink(dest) == src):
                print(' - Correct: ', dest)
            else:
                print(' - File exists: ', dest)
        else:
            print('Created:', dest)
            os.symlink(src, dest)
    else:
        print('Source does not exist:', src)
