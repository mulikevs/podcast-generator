FROM ubuntu:latest

# Update and install dependencies
RUN apt-get update && apt-get install -y \
   python3 \
   python3-dev \
   python3-pip \
   python3-venv \
   git

# Create a virtual environment
RUN python3 -m venv /venv

# Activate the virtual environment
RUN source /venv/bin/activate

# Install PyYAML
RUN pip install PyYAML

# Copy necessary files
COPY feed.py /usr/bin/feed.py  # Consider using a different location within your application
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script is executable
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]
