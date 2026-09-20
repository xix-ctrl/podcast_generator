FROM ubuntu:latest
#switch to bash command with restrictions
#e - exit immediately if exit with non-zero status
#u treat unset variables as an error
#o pipefail - return value of a pipeline is the status of the last command
#c reads commands from the following string
SHELL ["/bin/bash", "-euo", "pipefail", "-c"]

RUN apt-get update && apt-get install -y \
    python3.14 \
    python3-pip \
    git 

RUN pip3 install PyYAML

COPY feed.py /usr/bin/feed.py

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
