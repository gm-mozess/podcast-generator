FROM ubuntu:latest

# Update package list and install required packages in a single layer
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    git \
    python3.12-venv
    

# Create virtual environment and install packages
RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip && pip install PyYAML

# Copy files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh


ENTRYPOINT ["/entrypoint.sh"]