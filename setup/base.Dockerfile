FROM ubuntu:20.04

RUN apt-get update && \
  apt-get upgrade --yes && \
  apt-get install --yes software-properties-common git sudo && \
  apt-add-repository --yes --update ppa:ansible/ansible && \
  apt-get install --yes ansible

# temp
RUN add-apt-repository ppa:spvkgn/exa
RUN apt-get install --yes curl tree nodejs npm python2 python3 python3-neovim cargo direnv exa zsh
# temp

RUN addgroup --gid 1000 vtymoshchyk
RUN adduser --gecos vtymoshchyk --gid 1000 --uid 1000 --disabled-password vtymoshchyk
RUN passwd -d vtymoshchyk
RUN usermod -aG sudo vtymoshchyk

USER vtymoshchyk
WORKDIR home/vtymoshchyk

# clone dotfiles
RUN git clone https://github.com/vlad-tymoshchyk/dotfiles.git

COPY --chown=vtymoshchyk:vtymoshchyk . ./dotfiles/setup/

RUN sudo ansible-playbook -v --become --become-user=vtymoshchyk --tags core-setup,dotfiles-setup dotfiles/setup/local.yml

CMD ["bash"]
