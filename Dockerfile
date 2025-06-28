FROM ubuntu:latest

# Update package list and install required packages in a single layer
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install Python packages
RUN pip3 install --upgrade pip && pip3 install PyYAML

# Copy files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]