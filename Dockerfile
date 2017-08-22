FROM ubuntu:16.04

RUN apt-get update && apt-get install -y curl python
RUN curl -1 -sS "https://static.userify.com/installer.sh" | sh
RUN apt-get clean && rm -rf /var/lib/apt/lists
