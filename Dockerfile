FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-distutils \
    python3-pip \
    git

# Upgrade pip to ensure it's the latest version
RUN python3.10 -m pip install --upgrade pip

# Install PyYAML using pip for python3.10
RUN python3.10 -m pip install PyYAML

# Copy necessary files
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
