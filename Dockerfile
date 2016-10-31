FROM ruby:2.2.5

RUN apt-get -qq update
RUN apt-get -qq -y install nano && \
    git clone https://github.com/scopatz/nanorc.git /root/.nano && cat /root/.nano/nanorc >> /root/.nanorc

RUN apt-get -qq -y install vim git curl

RUN curl -Ls https://gist.github.com/andkirby/389f18642fc08d1b0711d17978445f2b/raw/bashrc_ps1_install.sh | bash && \
    curl -Ls https://gist.github.com/andkirby/0e2982bee321aa611bc66385dee5f399/raw/bashrc_init_install.sh | bash

RUN echo >> /root/.bashrc && \
    echo 'alias bsh="nano ~/.bashrc && . ~/.bashrc"' >> /root/.bashrc

# Downgrade bundler
RUN gem uninstall bundler \
      --install-dir /usr/local/lib/ruby/gems/2.2.0 && \
    gem install --version 1.12.5 bundler \
      --install-dir /usr/local/lib/ruby/gems/2.2.0

ENV GEM_SPEC_CACHE=/usr/src/project/.gems/specs
ENV GIT_DISCOVERY_ACROSS_FILESYSTEM=true
WORKDIR /usr/src/project
