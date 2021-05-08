FROM debian:buster

RUN \
  echo "deb http://deb.debian.org/debian buster-backports main" | \
    tee -a /etc/apt/sources.list.d/debian-backports.list \
  && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      git \
      emacs/buster-backports \
      ripgrep \
      w3m \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/

COPY . ~/.emacs.d/
