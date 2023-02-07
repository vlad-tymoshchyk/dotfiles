FROM ubuntu:20.04

# temp
# RUN add-apt-repository ppa:spvkgn/exa
# RUN apt-get install --yes curl tree nodejs npm python2 python3 python3-neovim cargo direnv exa zsh
# temp

RUN apt-get update
RUN apt-get upgrade --yes
RUN apt-get install --yes sudo

RUN addgroup --gid 1000 vtymoshchyk
RUN adduser --gecos vtymoshchyk --gid 1000 --uid 1000 --disabled-password vtymoshchyk
RUN passwd -d vtymoshchyk
RUN usermod -aG sudo vtymoshchyk
RUN chown -R vtymoshchyk:vtymoshchyk /home/vtymoshchyk

USER vtymoshchyk
WORKDIR home/vtymoshchyk

RUN sudo apt-get install --yes software-properties-common
RUN sudo apt-add-repository --yes --update ppa:ansible/ansible
RUN sudo apt-get install --yes ansible
RUN sudo apt-get install --yes git

# clone dotfiles
RUN git clone https://github.com/vlad-tymoshchyk/dotfiles.git

COPY --chown=vtymoshchyk:vtymoshchyk . /home/vtymoshchyk/dotfiles/setup/

RUN sudo ansible-playbook -v --become --become-user=vtymoshchyk ~/dotfiles/setup/core-setup.yml

WORKDIR home/vtymoshchyk/dotfiles/setup

CMD ["bash"]

