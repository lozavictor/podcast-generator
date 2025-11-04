FROM ubuntu:latest

# 1) system deps
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git \
    python3-yaml \
    && rm -rf /var/lib/apt/lists/*

# 2) copy your files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# 3) make entrypoint executable
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
