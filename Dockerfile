FROM ruby:2.2.5-slim

RUN apt-get -qq update
RUN apt-get -qq -y install \
    vim nano \
    git curl

RUN curl -Ls https://gist.github.com/andkirby/389f18642fc08d1b0711d17978445f2b/raw/bashrc_ps1_install.sh | bash && \
    curl -Ls https://gist.github.com/andkirby/0e2982bee321aa611bc66385dee5f399/raw/bashrc_init_install.sh | bash
