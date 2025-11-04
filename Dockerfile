FROM ubuntu:latest

# system deps
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# upgrade pip AND tell Ubuntu it's okay
RUN python3 -m pip install --upgrade pip --break-system-packages

# install pyyaml
RUN python3 -m pip install --break-system-packages pyyaml

# copy your files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# make entrypoint executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
