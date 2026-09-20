FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.14 \
    python3-pip \
    python3-pipx \
    git 

RUN pipx install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
