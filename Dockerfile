FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y python3 python3-pip openssh-client && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install ansible

COPY Ansible/ /Ansible/
COPY resansible.sh .

RUN chmod +x resansible.sh

CMD ["tail", "-f", "/dev/null"]
