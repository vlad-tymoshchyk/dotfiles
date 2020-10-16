#!/usr/bin/env python3
import os

LINKS = [
    ('~/.vimrc', '~/dotfiles/.vimrc'),
    ('~/.zshrc', '~/dotfiles/.zshrc'),
    ('~/.tmux.conf', '~/dotfiles/.tmux.conf'),
    ('~/.config/nvim/init.vim', '~/dotfiles/.vimrc'),
    ('~/.config/i3', '~/dotfiles/i3'),
    ('~/.config/i3blocks', '~/dotfiles/i3blocks'),
    ('~/.config/ranger', '~/dotfiles/ranger'),
    ('~/.config/tmuxinator', '~/dotfiles/tmuxinator'),
]

LINKS = [
    (
        os.path.expanduser(link[0]),
        os.path.expanduser(link[1])
    )
    for link in LINKS
]

print('Checking symbolic links...')
for link in LINKS:
    dest, src = link
    if (os.path.exists(src)):
        if (os.path.exists(dest)):
            if(os.path.islink(dest) and os.readlink(dest) == src):
                print(' - Correct: ', dest)
            else:
                print(' - Not correct: ', dest)
    else:
        print('Source does not exist:', src)
