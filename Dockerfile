FROM ruby:2.2.5

RUN apt-get -qq update
# vim git curl
RUN apt-get -qq -y install vim git curl
# nano
RUN apt-get -qq -y install nano && \
    git clone https://github.com/scopatz/nanorc.git /root/.nano && cat /root/.nano/nanorc >> /root/.nanorc

COPY .bashrc /root/

RUN echo >> /root/.bashrc && \
    echo 'alias bsh="nano ~/.bashrc && . ~/.bashrc"' >> /root/.bashrc

####### Enable SSH access ########
# https://docs.docker.com/engine/examples/running_ssh_service/
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:dev' | chpasswd

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE 'in users profile'
RUN echo 'export VISIBLE=now' >> /etc/profile

EXPOSE 22
# ---------
# prevent notices on SSH login
RUN touch /var/log/lastlog

RUN mv /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
COPY sshd_config /etc/ssh/sshd_config

# Set authorized_keys
COPY id_rsa.pub /root/
RUN mkdir -p /root/.ssh && \
    cat /root/id_rsa.pub >> /root/.ssh/authorized_keys && \
    rm -f /root/id_rsa.pub && \
    chmod og-xrw -R /root/.ssh

#ADD supervisord_*.ini /etc/supervisord.d/

# Entrypoint
#COPY entrypoint.sh /root/entrypoint.sh
CMD /usr/sbin/sshd -D -e
####### EOB Enable ssh access #######

# Downgrade bundler
ENV BUNDLER_VERSION=1.12.5
RUN gem uninstall bundler \
      --install-dir /usr/local/lib/ruby/gems/2.2.0 && \
    gem install --version 1.12.5 bundler \
      --install-dir /usr/local/lib/ruby/gems/2.2.0

RUN echo >> /etc/apt/sources.list && \
  echo deb http://download.virtualbox.org/virtualbox/debian xenial contrib >> /etc/apt/sources.list && \
  wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add - && \
  wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add - && \
  apt-get update && \
  apt-get install virtualbox-5.1 -y

ENV GEM_SPEC_CACHE=/usr/src/project/.gems/specs
ENV GIT_DISCOVERY_ACROSS_FILESYSTEM=true

WORKDIR /usr/src/project
