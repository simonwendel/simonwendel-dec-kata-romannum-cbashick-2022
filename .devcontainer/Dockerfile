FROM ubuntu:18.04

RUN apt-get update && apt-get install -y intercal git curl
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g bats bats-support bats-assert