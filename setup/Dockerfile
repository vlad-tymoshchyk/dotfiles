FROM ubuntu-base

# RUN sudo ansible-playbook ./dotfiles/setup/local.yml --tags nodejs

RUN sudo ansible-playbook -v --become --become-user=vtymoshchyk dotfiles/setup/local.yml --skip-tags core-setup,dotfiles-setup,oaeoueoueoeo

CMD ["zsh"]
