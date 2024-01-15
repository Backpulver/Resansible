# Use Ubuntu as the base image
FROM ubuntu:latest

# Install Python, Pip, and SSH (for Ansible)
RUN apt-get update && \
    apt-get install -y python3 python3-pip openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Ansible via pip
RUN pip3 install ansible

# Copy your Ansible playbooks and scripts into the container
COPY Ansible/ /Ansible/
COPY resansible.sh .

# Make the script executable
RUN chmod +x resansible.sh

# Set a default command or entrypoint
CMD ["tail", "-f", "/dev/null"]
