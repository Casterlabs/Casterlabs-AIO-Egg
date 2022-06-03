# This gives us Java8
FROM       --platform=$TARGETOS/$TARGETARCH openjdk:11.0.15-jre-buster

# Install NodeJS and NPM and Yarn
RUN        curl -sL "https://deb.nodesource.com/setup_16.x" | bash -
RUN        curl -sS "https://dl.yarnpkg.com/debian/pubkey.gpg" | apt-key add -
RUN        echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN        apt update -qq
RUN        apt install -qq --no-install-recommends nodejs yarn
RUN        apt upgrade -qq -y
RUN        rm -rf /var/lib/apt/lists/*

# Install Go
ARG        TARGETARCH
RUN        curl -sL "https://go.dev/dl/go1.18.2.linux-$TARGETARCH.tar.gz" | tar -xz -C /usr/local
ENV        GOROOT /usr/local/go
ENV		   GOPATH /home/container/go
ENV		   PATH $PATH:$GOROOT/bin:$GOPATH/bin

# :^)
LABEL      author="Casterlabs" maintainer="support@casterlabs.co"
LABEL      org.opencontainers.image.source="https://github.com/Casterlabs/Casterlabs-AIO-Egg"
LABEL      org.opencontainers.image.licenses=MIT

# Setup the user account
RUN        useradd -d /home/container -m container

USER       container
ENV        USER=container
ENV        HOME=/home/container
WORKDIR    /home/container

# Run the container entry
COPY       ./entry.sh /entry.sh
CMD        [ "/bin/bash", "/entry.sh" ]