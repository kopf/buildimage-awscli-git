FROM ubuntu:latest

COPY add_key.sh /tmp/add_key.sh

RUN apt-get update && \
    apt-get install -y curl git ca-certificates unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    # Docker apt registry:
    install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    /tmp/add_key.sh && \
    apt-get update && \
    apt-get install -y docker-ce-cli docker-compose-plugin && \
    # awscli:
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    # cleanup:
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf ./aws*
