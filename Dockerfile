FROM ubuntu:14.04

WORKDIR /root
ENV HOME /root


RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    git \
    cmake

RUN apt-get install -y \
    zlib1g-dev libpcre3 libpcre3-dev libssl-dev

RUN curl -L https://github.com/aktau/github-release/releases/download/v0.5.2/linux-amd64-github-release.tar.bz2 \
    | tar -xj --strip-components=3 -C /usr/local/bin

ADD bin /builder

VOLUME /root/dist

ENTRYPOINT ["/bin/bash"]
CMD ["/builder/nginx"]
