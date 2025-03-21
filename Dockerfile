FROM ubuntu:24.04

# Author label
LABEL maintainer="Yucheng Zhang <Yucheng.Zhang@tufts.edu>"

# Help message
LABEL description="This container contains code-server."

# Set environment variables
ENV PATH=/opt/code-server/bin:$PATH 

# Install some rpms
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y --no-install-recommends build-essential wget git ca-certificates locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cd /opt \
    && wget https://github.com/coder/code-server/releases/download/v4.19.1/code-server-4.19.1-linux-amd64.tar.gz \
    && tar -xvf code-server-4.19.1-linux-amd64.tar.gz && mv code-server-4.19.1-linux-amd64 code-server \
    && chmod +x /opt/code-server/bin/* \
    && rm /opt/code-server-4.19.1-linux-amd64.tar.gz
